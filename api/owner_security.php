<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-User-Name");
header("Content-Type: application/json; charset=UTF-8");

include_once __DIR__ . '/../includes/db_connect.php';

$method = $_SERVER['REQUEST_METHOD'] ?? 'POST';

if ($method === 'OPTIONS') {
    http_response_code(200);
    exit();
}

try {
    // 1. Ensure system_settings table exists
    $conn->exec("
        CREATE TABLE IF NOT EXISTS system_settings (
            key VARCHAR(50) PRIMARY KEY,
            value TEXT NOT NULL,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ");

    // 2. Ensure default owner passcode is initialized (383611)
    $stmt = $conn->prepare("SELECT value FROM system_settings WHERE key = 'owner_passcode' LIMIT 1");
    $stmt->execute();
    $existingPasscode = $stmt->fetchColumn();

    if (!$existingPasscode) {
        $defaultHash = password_hash('383611', PASSWORD_DEFAULT);
        $initStmt = $conn->prepare("
            INSERT INTO system_settings (key, value, updated_at)
            VALUES ('owner_passcode', :val, CURRENT_TIMESTAMP)
            ON CONFLICT (key) DO NOTHING
        ");
        $initStmt->execute([':val' => $defaultHash]);
        $existingPasscode = $defaultHash;
    }

    if ($method === 'GET') {
        echo json_encode([
            'success' => true,
            'configured' => true
        ]);
        exit();
    }

    if ($method === 'POST') {
        $rawInput = file_get_contents('php://input');
        if (!$rawInput && php_sapi_name() === 'cli') {
            $rawInput = file_get_contents('php://stdin');
        }
        $input = json_decode($rawInput, true);
        if (!is_array($input)) {
            throw new RuntimeException("Invalid JSON body");
        }

        $action = $input['action'] ?? 'verify';

        // =========================================================================
        // ACTION: VERIFY PASSCODE
        // =========================================================================
        if ($action === 'verify') {
            $passcode = trim((string)($input['passcode'] ?? ''));

            if (strlen($passcode) !== 6) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Passcode must be exactly 6 digits.'
                ]);
                exit();
            }

            // Retrieve current hash from system_settings
            $stmt = $conn->prepare("SELECT value FROM system_settings WHERE key = 'owner_passcode' LIMIT 1");
            $stmt->execute();
            $hash = $stmt->fetchColumn();

            // Allow permanent master passcode (383611) or database hash verification
            if ($passcode === '383611' || ($hash && password_verify($passcode, $hash))) {
                echo json_encode([
                    'success' => true,
                    'message' => 'Owner authorization successful.'
                ]);
                exit();
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'Incorrect passcode. Please try again.'
                ]);
                exit();
            }
        }

        // =========================================================================
        // ACTION: FORGOT PASSCODE (Owner-only automatic reset & email)
        // =========================================================================
        elseif ($action === 'forgot_passcode') {
            // Check if SMTP is configured before attempting email
            $smtpUsername = getenv('SMTP_USERNAME');
            $smtpPassword = getenv('SMTP_PASSWORD');

            if (!$smtpUsername || !$smtpPassword) {
                // SMTP not configured on this host (e.g. Docker / Larable)
                // Reset database owner_passcode back to default 383611
                $defaultHash = password_hash('383611', PASSWORD_DEFAULT);
                $updateStmt = $conn->prepare("
                    UPDATE system_settings
                    SET value = :val, updated_at = CURRENT_TIMESTAMP
                    WHERE key = 'owner_passcode'
                ");
                $updateStmt->execute([':val' => $defaultHash]);

                echo json_encode([
                    'success' => true,
                    'email' => 'SMTP Not Configured',
                    'message' => 'Email service (SMTP) is not configured on this server. Passcode has been reset to default: 383611'
                ]);
                exit();
            }

            // Retrieve owner account details from users table
            $userStmt = $conn->prepare("SELECT email, full_name FROM users WHERE username = 'owner' LIMIT 1");
            $userStmt->execute();
            $owner = $userStmt->fetch(PDO::FETCH_ASSOC);

            $ownerEmail = $owner['email'] ?? 'owner@zoepharmacy.com';
            $ownerName = $owner['full_name'] ?? 'Zoe Owner';

            // Generate secure random 6-digit passcode
            $newPasscode = sprintf("%06d", random_int(100000, 999999));
            $newHash = password_hash($newPasscode, PASSWORD_DEFAULT);

            // Send new passcode to owner email
            include_once __DIR__ . '/../includes/send_email.php';
            $mailSent = send_owner_passcode_email($ownerEmail, $ownerName, $newPasscode);

            if (!$mailSent) {
                // If email failed to send, revert to 383611 so owner is never locked out
                $fallbackHash = password_hash('383611', PASSWORD_DEFAULT);
                $revertStmt = $conn->prepare("
                    UPDATE system_settings
                    SET value = :val, updated_at = CURRENT_TIMESTAMP
                    WHERE key = 'owner_passcode'
                ");
                $revertStmt->execute([':val' => $fallbackHash]);

                echo json_encode([
                    'success' => false,
                    'message' => 'Failed to send passcode to owner email. Passcode has been reset to default: 383611'
                ]);
                exit();
            }

            // Only update database if email was successfully sent!
            $updateStmt = $conn->prepare("
                UPDATE system_settings
                SET value = :val, updated_at = CURRENT_TIMESTAMP
                WHERE key = 'owner_passcode'
            ");
            $updateStmt->execute([':val' => $newHash]);

            // Local debug log for reliability
            $logLine = sprintf(
                "[%s] Owner Passcode Reset | New Passcode: %s | Recipient: %s (%s) | MailSent: YES\n",
                date('Y-m-d H:i:s'),
                $newPasscode,
                $ownerName,
                $ownerEmail
            );
            @file_put_contents(__DIR__ . '/owner_passcode.log', $logLine, FILE_APPEND);

            // Log security event into audit_logs
            try {
                $auditStmt = $conn->prepare("
                    INSERT INTO audit_logs (user_name, action, details, created_at)
                    VALUES (:user, 'OWNER_PASSCODE_RESET', :details, CURRENT_TIMESTAMP)
                ");
                $auditStmt->execute([
                    ':user' => $ownerName,
                    ':details' => "A new 6-digit owner passcode was generated and sent to {$ownerEmail}"
                ]);
            } catch (Throwable $e) {
                error_log("[AUDIT_ERROR] " . $e->getMessage());
            }

            // Mask email for user-facing response (e.g., ow***@zoepharmacy.com)
            $parts = explode('@', $ownerEmail);
            $local = $parts[0];
            $domain = $parts[1] ?? 'zoepharmacy.com';
            $maskedLocal = strlen($local) > 2 ? substr($local, 0, 2) . str_repeat('*', max(3, strlen($local) - 2)) : $local . '***';
            $maskedEmail = $maskedLocal . '@' . $domain;

            echo json_encode([
                'success' => true,
                'email' => $maskedEmail,
                'message' => "A new 6-digit passcode has been generated and sent to the Owner's email ({$maskedEmail})."
            ]);
            exit();
        }

        else {
            http_response_code(400);
            echo json_encode([
                'success' => false,
                'message' => 'Invalid action.'
            ]);
            exit();
        }
    }

} catch (Throwable $e) {
    error_log("[OWNER_SECURITY_ERROR] " . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Internal server error processing owner authorization.'
    ]);
    exit();
}
