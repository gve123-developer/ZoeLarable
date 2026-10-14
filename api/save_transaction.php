<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-User-Name");
header("Content-Type: application/json; charset=UTF-8");

include_once __DIR__ . '/../includes/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode([
        'success' => false,
        'error' => 'Method not allowed'
    ]);
    exit();
}

try {

    /*
    |--------------------------------------------------------------------------
    | Accept both form-data and JSON
    |--------------------------------------------------------------------------
    */

    $raw = file_get_contents("php://input");
    $jsonData = json_decode($raw, true);

    if (is_array($jsonData)) {

        $cart = $jsonData['cart'] ?? [];

        $payment_method =
            $jsonData['payment_method']
            ?? $jsonData['paymentMethod']
            ?? 'cash';

        $total_amount =
            (float)($jsonData['total'] ?? 0);

        $amount_received =
            (isset($jsonData['amount_received']) && $jsonData['amount_received'] !== '')
            ? (float)$jsonData['amount_received']
            : (
                (isset($jsonData['amountReceived']) && $jsonData['amountReceived'] !== '')
                ? (float)$jsonData['amountReceived']
                : null
            );

        $change_amount =
            (isset($jsonData['change']) && $jsonData['change'] !== '')
            ? (float)$jsonData['change']
            : null;

        $cashier_id =
            isset($jsonData['cashier_id'])
            ? (int)$jsonData['cashier_id']
            : (
                isset($jsonData['cashierId'])
                ? (int)$jsonData['cashierId']
                : null
            );

    } else {

        $rawCart = $_POST['cart'] ?? '';
        if (is_array($rawCart)) {
            $cart = $rawCart;
        } elseif (is_string($rawCart) && $rawCart !== '') {
            $cart = json_decode($rawCart, true);
            if (!is_array($cart)) {
                $cart = json_decode(stripslashes($rawCart), true);
            }
        } else {
            $cart = [];
        }

        $payment_method =
            $_POST['payment_method']
            ?? 'cash';

        $total_amount =
            (float)($_POST['total'] ?? 0);

        $amount_received =
            (isset($_POST['amount_received']) && $_POST['amount_received'] !== '')
            ? (float)$_POST['amount_received']
            : null;

        $change_amount =
            (isset($_POST['change']) && $_POST['change'] !== '')
            ? (float)$_POST['change']
            : null;

        $cashier_id =
            isset($_POST['cashier_id'])
            ? (int)$_POST['cashier_id']
            : null;
    }

    if (!is_array($cart) || empty($cart)) {
        throw new RuntimeException(
            "Cart is empty or missing"
        );
    }

    /*
    |--------------------------------------------------------------------------
    | PostgreSQL transaction
    |--------------------------------------------------------------------------
    */

    $conn->beginTransaction();

    /*
    |--------------------------------------------------------------------------
    | Resolve cashier (validate against users table to prevent FK errors)
    |--------------------------------------------------------------------------
    */

    if ($cashier_id) {
        $cCheck = $conn->prepare("SELECT id FROM users WHERE id = :id LIMIT 1");
        $cCheck->execute([':id' => $cashier_id]);
        $cashier_id = $cCheck->fetchColumn();
    }

    if (!$cashier_id) {
        $userStmt = $conn->query(
            "SELECT id
             FROM users
             ORDER BY id ASC
             LIMIT 1"
        );
        $cashier_id = $userStmt->fetchColumn();

        if (!$cashier_id) {
            throw new RuntimeException(
                "No cashier/user available"
            );
        }
    }

    /*
    |--------------------------------------------------------------------------
    | Insert transaction
    |--------------------------------------------------------------------------
    */

    $transactionStmt = $conn->prepare(
        "INSERT INTO transactions
        (
            cashier_id,
            total_amount,
            payment_method,
            amount_received,
            change_amount,
            status
        )
        VALUES
        (
            :cashier_id,
            :total_amount,
            :payment_method,
            :amount_received,
            :change_amount,
            'completed'
        )
        RETURNING id"
    );

    $transactionStmt->execute([
        ':cashier_id' => $cashier_id,
        ':total_amount' => $total_amount,
        ':payment_method' => $payment_method,
        ':amount_received' => $amount_received,
        ':change_amount' => $change_amount
    ]);

    $transaction_id =
        $transactionStmt->fetchColumn();

    /*
    |--------------------------------------------------------------------------
    | Prepared statements
    |--------------------------------------------------------------------------
    */

    $productStmt = $conn->prepare(
        "SELECT
            id,
            quantity,
            new_stock_quantity,
            expiry_date,
            new_stock_expiry,
            batch_number,
            new_batch_queue,
            cost
         FROM products
         WHERE id = :id
         FOR UPDATE"
    );

    $itemStmt = $conn->prepare(
        "INSERT INTO transaction_items
        (
            transaction_id,
            product_id,
            quantity,
            price_at_sale,
            cost_at_sale
        )
        VALUES
        (
            :transaction_id,
            :product_id,
            :quantity,
            :price_at_sale,
            :cost_at_sale
        )"
    );

    $updateStockStmt = $conn->prepare(
        "UPDATE products
         SET
            quantity = :quantity,
            new_stock_quantity = :new_stock_quantity,
            expiry_date = :expiry_date,
            new_stock_expiry = :new_stock_expiry,
            batch_number = :batch_number,
            new_batch_queue = :new_batch_queue,
            updated_at = CURRENT_TIMESTAMP
         WHERE id = :id"
    );

    /*
    |--------------------------------------------------------------------------
    | Process cart
    |--------------------------------------------------------------------------
    */

    foreach ($cart as $item) {

        $pid =
            (int)(
                $item['id']
                ?? $item['productId']
                ?? 0
            );

        $qty =
            (int)(
                $item['qty']
                ?? $item['quantity']
                ?? 0
            );

        $price =
            (float)(
                $item['price']
                ?? 0
            );

        if ($pid <= 0 || $qty <= 0) {
            throw new RuntimeException(
                "Invalid product or quantity"
            );
        }

        /*
        |--------------------------------------------------------------------------
        | Lock product row
        |--------------------------------------------------------------------------
        */

        $productStmt->execute([
            ':id' => $pid
        ]);

        $product =
            $productStmt->fetch(PDO::FETCH_ASSOC);

        if (!$product) {
            throw new RuntimeException(
                "Product ID $pid not found"
            );
        }

        $oldQty =
            (int)$product['quantity'];

        $newQty =
            (int)$product['new_stock_quantity'];

        $expiryDate = $product['expiry_date'];
        $newStockExpiry = $product['new_stock_expiry'];
        $batchNumber = $product['batch_number'] ?? null;
        $rawQueue = $product['new_batch_queue'] ?? '[]';
        $newBatchQueue = json_decode($rawQueue, true);
        if (!is_array($newBatchQueue)) {
            $newBatchQueue = [];
        }

        // Determine which batches are expired (strict check against current date)
        $todayTime = strtotime(date('Y-m-d'));

        $oldExpired = false;
        if (!empty($expiryDate)) {
            $oldTime = strtotime($expiryDate);
            if ($oldTime !== false && $oldTime < $todayTime) {
                $oldExpired = true;
            }
        }

        $newExpired = false;
        if (!empty($newStockExpiry)) {
            $newTime = strtotime($newStockExpiry);
            if ($newTime !== false && $newTime < $todayTime) {
                $newExpired = true;
            }
        }

        $sellableOld = $oldExpired ? 0 : max(0, $oldQty);
        $sellableNew = $newExpired ? 0 : max(0, $newQty);
        $totalSellable = $sellableOld + $sellableNew;

        if ($totalSellable < $qty) {
            $prodName = $product['name'] ?? "ID $pid";
            if ($totalSellable <= 0 && ($oldQty + $newQty) > 0) {
                throw new RuntimeException(
                    "Product '$prodName' is expired and cannot be sold."
                );
            }
            throw new RuntimeException(
                "Insufficient non-expired stock for '$prodName'. Requested: $qty, Available non-expired: $totalSellable"
            );
        }

        /*
        |--------------------------------------------------------------------------
        | Save transaction item
        |--------------------------------------------------------------------------
        */

        $itemStmt->execute([
            ':transaction_id' => $transaction_id,
            ':product_id' => $pid,
            ':quantity' => $qty,
            ':price_at_sale' => $price,
            ':cost_at_sale' => (float)$product['cost']
        ]);

        /*
        |--------------------------------------------------------------------------
        | FEFO (First-Expired, First-Out) Depletion Logic for Non-Expired Batches
        |--------------------------------------------------------------------------
        | Only non-expired batches can be depleted.
        | If both batches are valid:
        | - whichever expires earliest is consumed first.
        | If one batch is expired or empty:
        | - only the valid batch with stock is consumed.
        |--------------------------------------------------------------------------
        */

        $consumeFromNewFirst = false;
        if ($sellableNew > 0 && $sellableOld <= 0) {
            $consumeFromNewFirst = true;
        } elseif ($sellableNew > 0 && $sellableOld > 0) {
            if (empty($expiryDate)) {
                $consumeFromNewFirst = false;
            } elseif (empty($newStockExpiry)) {
                $consumeFromNewFirst = false;
            } else {
                $oldTime = strtotime($expiryDate);
                $newTime = strtotime($newStockExpiry);
                if ($newTime !== false && $oldTime !== false && $newTime < $oldTime) {
                    $consumeFromNewFirst = true;
                }
            }
        }

        $totalTakenFromNew = 0;
        if ($consumeFromNewFirst) {
            // New stock expires earlier or is only valid batch: consume New first, then Old
            $takeFromNew = min($qty, $sellableNew);
            $newQty -= $takeFromNew;
            $totalTakenFromNew += $takeFromNew;
            $remaining = $qty - $takeFromNew;

            if ($remaining > 0 && $sellableOld > 0) {
                $takeFromOld = min($remaining, $sellableOld);
                $oldQty -= $takeFromOld;
            }
        } else {
            // Old stock expires earlier, default FIFO, or New is expired: consume Old first, then New
            $takeFromOld = min($qty, $sellableOld);
            $oldQty -= $takeFromOld;
            $remaining = $qty - $takeFromOld;

            if ($remaining > 0 && $sellableNew > 0) {
                $takeFromNew = min($remaining, $sellableNew);
                $newQty -= $takeFromNew;
                $totalTakenFromNew += $takeFromNew;
            }
        }

        // Deduct from queued batches in order
        if ($totalTakenFromNew > 0 && !empty($newBatchQueue)) {
            $deductRem = $totalTakenFromNew;
            for ($qi = 0; $qi < count($newBatchQueue) && $deductRem > 0; $qi++) {
                $bQty = (int)($newBatchQueue[$qi]['quantity'] ?? 0);
                $sub = min($deductRem, $bQty);
                $newBatchQueue[$qi]['quantity'] = $bQty - $sub;
                $deductRem -= $sub;
            }
            $newBatchQueue = array_values(array_filter($newBatchQueue, function($b) {
                return ($b['quantity'] ?? 0) > 0;
            }));
        }

        /*
        |--------------------------------------------------------------------------
        | Auto rotation / Batch cleanup
        |--------------------------------------------------------------------------
        | If old stock is 0 and new stock remains, promote next queued batch to primary.
        | If new stock is 0, clear new_stock_expiry and queue.
        |--------------------------------------------------------------------------
        */

        if ($oldQty <= 0 && (!empty($newBatchQueue) || $newQty > 0)) {
            if (!empty($newBatchQueue)) {
                $promoted = array_shift($newBatchQueue);
                $oldQty = (int)$promoted['quantity'];
                $expiryDate = $promoted['expiryDate'] ?? null;
                $batchNumber = $promoted['batchNumber'] ?? $batchNumber;
            } else {
                $oldQty = $newQty;
                $expiryDate = $newStockExpiry;
            }

            $newQty = array_sum(array_column($newBatchQueue, 'quantity'));
            $expList = array_filter(array_column($newBatchQueue, 'expiryDate'));
            $newStockExpiry = !empty($expList) ? min($expList) : null;

            error_log("[AUTO-ROTATE] Product ID $pid promoted from next queued batch.");
        } elseif ($oldQty <= 0 && $newQty <= 0) {
            $oldQty = 0;
            $expiryDate = null;
            $batchNumber = null;
            $newQty = 0;
            $newStockExpiry = null;
            $newBatchQueue = [];
        } elseif ($newQty <= 0) {
            $newQty = 0;
            $newStockExpiry = null;
            $newBatchQueue = [];
        }

        /*
        |--------------------------------------------------------------------------
        | Update product
        |--------------------------------------------------------------------------
        */

        $expiryDate = !empty($expiryDate) ? $expiryDate : null;
        $newStockExpiry = !empty($newStockExpiry) ? $newStockExpiry : null;

        $updateStockStmt->execute([
            ':quantity' => $oldQty,
            ':new_stock_quantity' => $newQty,
            ':expiry_date' => $expiryDate,
            ':new_stock_expiry' => $newStockExpiry,
            ':batch_number' => $batchNumber,
            ':new_batch_queue' => json_encode($newBatchQueue),
            ':id' => $pid
        ]);
    }

    /*
    |--------------------------------------------------------------------------
    | Commit
    |--------------------------------------------------------------------------
    */

    $conn->commit();

    echo json_encode([
        'success' => true,
        'id' => (string)$transaction_id
    ]);

} catch (Throwable $e) {

    if (
        isset($conn) &&
        $conn instanceof PDO &&
        $conn->inTransaction()
    ) {
        $conn->rollBack();
    }

    error_log(
        "[save_transaction.php] " .
        $e->getMessage()
    );

    http_response_code(500);

    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}
?>