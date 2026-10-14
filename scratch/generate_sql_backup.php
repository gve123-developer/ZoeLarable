<?php
$jsonFile = 'c:/Users/Asus/Downloads/Website/zoe_live_database_backup.json';
$sqlFile = 'c:/Users/Asus/Downloads/Website/zoe_live_database_backup.sql';

$data = json_decode(file_get_contents($jsonFile), true);

$sql = "-- =========================================================\n";
$sql .= "-- Zoe Pharmacy & General Merchandise - Live Database Backup\n";
$sql .= "-- Generated: " . date('Y-m-d H:i:s') . "\n";
$sql .= "-- Host: https://zoepharmacyandgeneralmerchandise.systems\n";
$sql .= "-- =========================================================\n\n";

function sqlEscape($val) {
    if ($val === null) return 'NULL';
    if (is_numeric($val) && !is_string($val)) return $val;
    if (is_bool($val)) return $val ? 'TRUE' : 'FALSE';
    $val = str_replace("'", "''", (string)$val);
    return "'$val'";
}

// 1. PRODUCTS
if (!empty($data['products'])) {
    $sql .= "-- ---------------------------------------------------------\n";
    $sql .= "-- Table: products (" . count($data['products']) . " records)\n";
    $sql .= "-- ---------------------------------------------------------\n";
    foreach ($data['products'] as $p) {
        $cols = ['id', 'name', 'sku', 'description', 'quantity', 'price', 'cost', 'reorder_level', 'expiry_date', 'new_stock_quantity', 'new_stock_expiry', 'category'];
        $vals = [
            sqlEscape($p['id'] ?? null),
            sqlEscape($p['name'] ?? null),
            sqlEscape($p['sku'] ?? null),
            sqlEscape($p['description'] ?? null),
            sqlEscape($p['quantity'] ?? 0),
            sqlEscape($p['price'] ?? 0),
            sqlEscape($p['cost'] ?? 0),
            sqlEscape($p['reorder_level'] ?? 0),
            sqlEscape($p['expiry_date'] ?? null),
            sqlEscape($p['new_stock_quantity'] ?? 0),
            sqlEscape($p['new_stock_expiry'] ?? null),
            sqlEscape($p['category'] ?? null)
        ];
        $sql .= "INSERT INTO products (" . implode(', ', $cols) . ") VALUES (" . implode(', ', $vals) . ");\n";
    }
    $sql .= "\n";
}

// 2. USERS
if (!empty($data['users'])) {
    $sql .= "-- ---------------------------------------------------------\n";
    $sql .= "-- Table: users (" . count($data['users']) . " records)\n";
    $sql .= "-- ---------------------------------------------------------\n";
    foreach ($data['users'] as $u) {
        $cols = ['id', 'username', 'full_name', 'role', 'status'];
        $vals = [
            sqlEscape($u['id'] ?? null),
            sqlEscape($u['username'] ?? null),
            sqlEscape($u['full_name'] ?? null),
            sqlEscape($u['role'] ?? 'cashier'),
            sqlEscape($u['status'] ?? 'active')
        ];
        $sql .= "INSERT INTO users (" . implode(', ', $cols) . ") VALUES (" . implode(', ', $vals) . ");\n";
    }
    $sql .= "\n";
}

// 3. TRANSACTIONS & TRANSACTION_ITEMS
if (!empty($data['transactions'])) {
    $sql .= "-- ---------------------------------------------------------\n";
    $sql .= "-- Table: transactions (" . count($data['transactions']) . " records)\n";
    $sql .= "-- ---------------------------------------------------------\n";
    $txItems = [];
    foreach ($data['transactions'] as $t) {
        $cols = ['id', 'cashier_name', 'total_amount', 'payment_method', 'amount_received', 'change_amount', 'status', 'created_at'];
        $vals = [
            sqlEscape($t['id'] ?? null),
            sqlEscape($t['cashier'] ?? null),
            sqlEscape($t['total'] ?? 0),
            sqlEscape($t['paymentMethod'] ?? 'cash'),
            sqlEscape($t['amountReceived'] ?? 0),
            sqlEscape($t['change'] ?? 0),
            sqlEscape($t['status'] ?? 'completed'),
            sqlEscape($t['date'] ?? null)
        ];
        $sql .= "INSERT INTO transactions (" . implode(', ', $cols) . ") VALUES (" . implode(', ', $vals) . ");\n";

        if (!empty($t['items']) && is_array($t['items'])) {
            foreach ($t['items'] as $item) {
                $item['transaction_id'] = $t['id'];
                $txItems[] = $item;
            }
        }
    }
    $sql .= "\n";

    if (!empty($txItems)) {
        $sql .= "-- ---------------------------------------------------------\n";
        $sql .= "-- Table: transaction_items (" . count($txItems) . " records)\n";
        $sql .= "-- ---------------------------------------------------------\n";
        foreach ($txItems as $it) {
            $cols = ['id', 'transaction_id', 'product_id', 'product_name', 'quantity', 'price', 'cost', 'status'];
            $vals = [
                sqlEscape($it['itemId'] ?? null),
                sqlEscape($it['transaction_id'] ?? null),
                sqlEscape($it['productId'] ?? null),
                sqlEscape($it['name'] ?? null),
                sqlEscape($it['quantity'] ?? 1),
                sqlEscape($it['price'] ?? 0),
                sqlEscape($it['cost'] ?? 0),
                sqlEscape($it['status'] ?? 'completed')
            ];
            $sql .= "INSERT INTO transaction_items (" . implode(', ', $cols) . ") VALUES (" . implode(', ', $vals) . ");\n";
        }
        $sql .= "\n";
    }
}

// 4. AUDIT_LOGS
if (!empty($data['audit_logs'])) {
    $sql .= "-- ---------------------------------------------------------\n";
    $sql .= "-- Table: audit_logs (" . count($data['audit_logs']) . " records)\n";
    $sql .= "-- ---------------------------------------------------------\n";
    foreach ($data['audit_logs'] as $a) {
        $cols = ['id', 'user_name', 'action', 'details', 'created_at'];
        $vals = [
            sqlEscape($a['id'] ?? null),
            sqlEscape($a['user_name'] ?? $a['userName'] ?? null),
            sqlEscape($a['action'] ?? null),
            sqlEscape($a['details'] ?? null),
            sqlEscape($a['created_at'] ?? $a['timestamp'] ?? null)
        ];
        $sql .= "INSERT INTO audit_logs (" . implode(', ', $cols) . ") VALUES (" . implode(', ', $vals) . ");\n";
    }
    $sql .= "\n";
}

// 5. INVENTORY LOSS
if (!empty($data['inventory_loss'])) {
    $sql .= "-- ---------------------------------------------------------\n";
    $sql .= "-- Table: inventory_loss (" . count($data['inventory_loss']) . " records)\n";
    $sql .= "-- ---------------------------------------------------------\n";
    foreach ($data['inventory_loss'] as $l) {
        $cols = ['id', 'product_id', 'quantity', 'cost_at_loss', 'reason', 'logged_at'];
        $vals = [
            sqlEscape($l['id'] ?? null),
            sqlEscape($l['product_id'] ?? null),
            sqlEscape($l['quantity'] ?? 0),
            sqlEscape($l['cost_at_loss'] ?? 0),
            sqlEscape($l['reason'] ?? null),
            sqlEscape($l['logged_at'] ?? null)
        ];
        $sql .= "INSERT INTO inventory_loss (" . implode(', ', $cols) . ") VALUES (" . implode(', ', $vals) . ");\n";
    }
    $sql .= "\n";
}

file_put_contents($sqlFile, $sql);
echo "Saved SQL backup to $sqlFile (" . filesize($sqlFile) . " bytes)\n";
