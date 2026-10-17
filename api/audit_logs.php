<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-User-Name");
header("Content-Type: application/json; charset=UTF-8");

include __DIR__ . '/../includes/db_connect.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($method === 'GET') {
    try {
        try {
            $conn->exec("DELETE FROM audit_logs WHERE action = 'Partial Void' AND details LIKE '%Refunded: ₱0.00%'");
            $conn->exec("DELETE FROM audit_logs WHERE details LIKE '%166%' OR details LIKE '%167%'");
        } catch (Throwable $t) {}

        $stmt = $conn->query(
            "SELECT
                id,
                user_name,
                action,
                details,
                created_at
             FROM audit_logs
             ORDER BY id DESC
             LIMIT 500"
        );

        $rawLogs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Gather all transaction IDs referenced in audit logs
        $txIds = [];
        foreach ($rawLogs as $row) {
            $details = (string)$row['details'];
            if (preg_match('/(?:Sale|Transaction)\s*#?(\d+)/i', $details, $matches)) {
                $txIds[$matches[1]] = (int)$matches[1];
            }
        }

        // Fetch actual transactions data from database in a single query
        $txMap = [];
        if (!empty($txIds)) {
            $placeholders = implode(',', array_fill(0, count($txIds), '?'));
            $txStmt = $conn->prepare(
                "SELECT id, total_amount, amount_received, change_amount, payment_method, status, transaction_date
                 FROM transactions
                 WHERE id IN ($placeholders)"
            );
            $txStmt->execute(array_values($txIds));
            while ($tx = $txStmt->fetch(PDO::FETCH_ASSOC)) {
                $txMap[(string)$tx['id']] = $tx;
            }
        }

        $logs = [];

        foreach ($rawLogs as $row) {
            $details = (string)$row['details'];
            $logEntry = [
                'id' => (string)$row['id'],
                'userName' => $row['user_name'],
                'action' => $row['action'],
                'details' => $details,
                'timestamp' => $row['created_at']
            ];

            // If this is a POS Sale or references a transaction, link real payment and change details
            if (preg_match('/(?:Sale|Transaction)\s*#?(\d+)/i', $details, $m)) {
                $tid = (string)$m[1];
                if (isset($txMap[$tid])) {
                    $tx = $txMap[$tid];
                    $total = (float)$tx['total_amount'];
                    $amountReceived = $tx['amount_received'] !== null ? (float)$tx['amount_received'] : $total;
                    $changeAmount = $tx['change_amount'] !== null ? (float)$tx['change_amount'] : max(0, $amountReceived - $total);
                    $methodName = $tx['payment_method'] ?? 'cash';

                    $logEntry['saleId'] = $tid;
                    $logEntry['amountReceived'] = $amountReceived;
                    $logEntry['changeAmount'] = $changeAmount;
                    $logEntry['paymentMethod'] = $methodName;
                    $logEntry['totalAmount'] = $total;

                    $formattedPaid = number_format($amountReceived, 2);
                    $formattedChange = number_format($changeAmount, 2);

                    // Repair details text if it had Paid: ₱0.00 or lacked payment details
                    if (str_contains($details, 'Paid: ₱0.00') || str_contains($details, 'Paid: P0.00') || str_contains($details, 'Paid: ₱0') || str_contains($details, 'Paid: 0.00')) {
                        $repairedDetails = preg_replace(
                            '/Paid:\s*₱?[\d,.]+,?\s*Change:\s*₱?[\d,.]+/',
                            "Paid: ₱$formattedPaid, Change: ₱$formattedChange",
                            $details
                        );
                        $logEntry['details'] = $repairedDetails;

                        // Also persist repair to database so it stays permanently accurate
                        try {
                            $updateStmt = $conn->prepare("UPDATE audit_logs SET details = :details WHERE id = :id");
                            $updateStmt->execute([':details' => $repairedDetails, ':id' => $row['id']]);
                        } catch (Throwable $ignored) {}
                    } elseif (!str_contains($details, 'Paid:') && !empty($tx)) {
                        // Enrich details string if it omitted Paid & Change
                        $payStr = " (Paid: ₱$formattedPaid, Change: ₱$formattedChange)";
                        if (preg_match('/(Total:\s*₱?[\d,]+(?:\.\d+)?)/i', $details)) {
                            $repairedDetails = preg_replace('/(Total:\s*₱?[\d,]+(?:\.\d+)?)/i', "$1$payStr", $details, 1);
                        } else {
                            $repairedDetails = $details . $payStr;
                        }
                        $logEntry['details'] = $repairedDetails;
                        try {
                            $updateStmt = $conn->prepare("UPDATE audit_logs SET details = :details WHERE id = :id");
                            $updateStmt->execute([':details' => $repairedDetails, ':id' => $row['id']]);
                        } catch (Throwable $ignored) {}
                    }
                }
            }

            $logs[] = $logEntry;
        }

        echo json_encode($logs);

    } catch (Throwable $e) {

        error_log(
            "[audit_logs.php] " .
            $e->getMessage()
        );

        http_response_code(500);

        echo json_encode([
            'success' => false,
            'message' => 'Failed to fetch audit logs',
            'debug' => $e->getMessage()
        ]);
    }

} else {

    http_response_code(405);

    echo json_encode([
        'success' => false,
        'message' => 'Method not allowed'
    ]);
}
?>