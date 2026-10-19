<?php
// =========================================================
// Zoe Pharmacy & General Merchandise - Live Database Sync Endpoint
// Syncs products, expiry dates, batches, and records from .systems to .larable.dev
// =========================================================

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-Sync-Key");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$providedKey = $_GET['key'] ?? $_SERVER['HTTP_X_SYNC_KEY'] ?? '';
$secretKey = 'zoe_sync_master_2026';

if ($providedKey !== $secretKey && $providedKey !== '383611') {
    http_response_code(403);
    echo json_encode(['success' => false, 'message' => 'Unauthorized: Invalid sync key']);
    exit();
}

require_once '../includes/db_connect.php';

try {
    // Migration: ensure required columns exist
    $conn->exec("ALTER TABLE products ADD COLUMN IF NOT EXISTS batch_number VARCHAR(100)");
    $conn->exec("ALTER TABLE products ADD COLUMN IF NOT EXISTS new_batch_queue TEXT DEFAULT '[]'");
    $conn->exec("ALTER TABLE deleted_products ADD COLUMN IF NOT EXISTS batch_number VARCHAR(100)");
    $conn->exec("ALTER TABLE deleted_products ADD COLUMN IF NOT EXISTS new_batch_queue TEXT DEFAULT '[]'");
    $conn->exec("ALTER TABLE deleted_products ADD COLUMN IF NOT EXISTS new_stock_quantity INTEGER DEFAULT 0");
    $conn->exec("ALTER TABLE deleted_products ADD COLUMN IF NOT EXISTS new_stock_expiry DATE");
} catch (Throwable $e) {}

$rawBody = file_get_contents('php://input');
$bodyData = !empty($rawBody) ? json_decode($rawBody, true) : null;

$productsData = $bodyData['products'] ?? null;
$deletedProductsData = $bodyData['deleted_products'] ?? null;
$transactionsData = $bodyData['transactions'] ?? null;

// If no payload passed, fetch directly from .systems
if (empty($productsData)) {
    $ctx = stream_context_create([
        'ssl' => ['verify_peer' => false, 'verify_peer_name' => false],
        'http' => ['timeout' => 30]
    ]);
    
    $sysProductsRaw = @file_get_contents('https://zoepharmacyandgeneralmerchandise.systems/api/products.php', false, $ctx);
    if ($sysProductsRaw) {
        $productsData = json_decode($sysProductsRaw, true);
    }
}

if (empty($deletedProductsData)) {
    $ctx = stream_context_create([
        'ssl' => ['verify_peer' => false, 'verify_peer_name' => false],
        'http' => ['timeout' => 30]
    ]);
    $sysDelRaw = @file_get_contents('https://zoepharmacyandgeneralmerchandise.systems/api/deleted_products.php', false, $ctx);
    if ($sysDelRaw) {
        $deletedProductsData = json_decode($sysDelRaw, true);
    }
}

$results = [
    'success' => true,
    'timestamp' => date('Y-m-d H:i:s'),
    'products_updated' => 0,
    'products_inserted' => 0,
    'deleted_products_synced' => 0,
    'errors' => []
];

// 1. SYNC PRODUCTS
if (is_array($productsData) && !empty($productsData)) {
    $conn->beginTransaction();
    try {
        $updateStmt = $conn->prepare("
            UPDATE products SET
                name = :name,
                category = :category,
                description = :description,
                quantity = :quantity,
                price = :price,
                cost = :cost,
                reorder_level = :reorder_level,
                expiry_date = :expiry_date,
                batch_number = :batch_number,
                new_stock_quantity = :new_stock_quantity,
                new_stock_expiry = :new_stock_expiry,
                new_batch_queue = :new_batch_queue,
                updated_at = CURRENT_TIMESTAMP
            WHERE sku = :sku
        ");

        $insertStmt = $conn->prepare("
            INSERT INTO products (
                sku, name, category, description, quantity, price, cost,
                reorder_level, expiry_date, batch_number, new_stock_quantity,
                new_stock_expiry, new_batch_queue
            ) VALUES (
                :sku, :name, :category, :description, :quantity, :price, :cost,
                :reorder_level, :expiry_date, :batch_number, :new_stock_quantity,
                :new_stock_expiry, :new_batch_queue
            )
        ");

        $checkStmt = $conn->prepare("SELECT id FROM products WHERE sku = :sku LIMIT 1");

        foreach ($productsData as $p) {
            $sku = trim($p['sku'] ?? '');
            if (empty($sku)) continue;

            $name = trim($p['name'] ?? '');
            $category = trim($p['category'] ?? 'Pharmaceutical');
            $desc = $p['description'] ?? '';
            $qty = (int)($p['quantity'] ?? 0);
            $price = (float)($p['price'] ?? 0);
            $cost = (float)($p['cost'] ?? 0);
            $reorder = (int)($p['reorderLevel'] ?? $p['reorder_level'] ?? 0);
            
            $expiry = !empty($p['expiryDate']) ? $p['expiryDate'] : (!empty($p['expiry_date']) ? $p['expiry_date'] : null);
            $batchNumber = !empty($p['batchNumber']) ? $p['batchNumber'] : (!empty($p['batch_number']) ? $p['batch_number'] : null);
            $newStockQty = (int)($p['newStockQuantity'] ?? $p['new_stock_quantity'] ?? 0);
            $newStockExp = !empty($p['newStockExpiry']) ? $p['newStockExpiry'] : (!empty($p['new_stock_expiry']) ? $p['new_stock_expiry'] : null);
            
            $queue = $p['newBatchQueue'] ?? $p['new_batch_queue'] ?? [];
            $queueJson = is_array($queue) ? json_encode($queue) : (string)$queue;

            $params = [
                ':sku' => $sku,
                ':name' => $name,
                ':category' => $category,
                ':description' => $desc,
                ':quantity' => $qty,
                ':price' => $price,
                ':cost' => $cost,
                ':reorder_level' => $reorder,
                ':expiry_date' => $expiry,
                ':batch_number' => $batchNumber,
                ':new_stock_quantity' => $newStockQty,
                ':new_stock_expiry' => $newStockExp,
                ':new_batch_queue' => $queueJson
            ];

            $checkStmt->execute([':sku' => $sku]);
            $exists = $checkStmt->fetchColumn();

            if ($exists) {
                $updateStmt->execute($params);
                $results['products_updated']++;
            } else {
                $insertStmt->execute($params);
                $results['products_inserted']++;
            }
        }

        $conn->commit();
    } catch (Throwable $e) {
        $conn->rollBack();
        $results['errors'][] = 'Product sync error: ' . $e->getMessage();
    }
}

// 2. SYNC DELETED PRODUCTS
if (is_array($deletedProductsData) && !empty($deletedProductsData)) {
    try {
        $conn->beginTransaction();
        $checkDelStmt = $conn->prepare("SELECT id FROM deleted_products WHERE sku = :sku LIMIT 1");
        $insertDelStmt = $conn->prepare("
            INSERT INTO deleted_products (
                original_id, sku, name, category, description, quantity, price, cost,
                reorder_level, expiry_date, batch_number, new_stock_quantity,
                new_stock_expiry, new_batch_queue, deleted_by, deleted_at
            ) VALUES (
                :original_id, :sku, :name, :category, :description, :quantity, :price, :cost,
                :reorder_level, :expiry_date, :batch_number, :new_stock_quantity,
                :new_stock_expiry, :new_batch_queue, :deleted_by, :deleted_at
            )
        ");

        foreach ($deletedProductsData as $dp) {
            $sku = trim($dp['sku'] ?? '');
            if (empty($sku)) continue;

            $checkDelStmt->execute([':sku' => $sku]);
            if ($checkDelStmt->fetchColumn()) continue; // Already present

            $queue = $dp['newBatchQueue'] ?? $dp['new_batch_queue'] ?? [];
            $queueJson = is_array($queue) ? json_encode($queue) : (string)$queue;

            $insertDelStmt->execute([
                ':original_id' => (int)($dp['originalId'] ?? $dp['original_id'] ?? 0),
                ':sku' => $sku,
                ':name' => $dp['name'] ?? '',
                ':category' => $dp['category'] ?? '',
                ':description' => $dp['description'] ?? '',
                ':quantity' => (int)($dp['quantity'] ?? 0),
                ':price' => (float)($dp['price'] ?? 0),
                ':cost' => (float)($dp['cost'] ?? 0),
                ':reorder_level' => (int)($dp['reorderLevel'] ?? $dp['reorder_level'] ?? 0),
                ':expiry_date' => !empty($dp['expiryDate']) ? $dp['expiryDate'] : (!empty($dp['expiry_date']) ? $dp['expiry_date'] : null),
                ':batch_number' => !empty($dp['batchNumber']) ? $dp['batchNumber'] : (!empty($dp['batch_number']) ? $dp['batch_number'] : null),
                ':new_stock_quantity' => (int)($dp['newStockQuantity'] ?? $dp['new_stock_quantity'] ?? 0),
                ':new_stock_expiry' => !empty($dp['newStockExpiry']) ? $dp['newStockExpiry'] : (!empty($dp['new_stock_expiry']) ? $dp['new_stock_expiry'] : null),
                ':new_batch_queue' => $queueJson,
                ':deleted_by' => $dp['deletedBy'] ?? $dp['deleted_by'] ?? 'Admin',
                ':deleted_at' => $dp['deletedAt'] ?? $dp['deleted_at'] ?? date('Y-m-d H:i:s')
            ]);
            $results['deleted_products_synced']++;
        }
        $conn->commit();
    } catch (Throwable $e) {
        $conn->rollBack();
        $results['errors'][] = 'Deleted products sync error: ' . $e->getMessage();
    }
}

// 3. SYNC TRANSACTIONS
if (empty($transactionsData)) {
    $ctx = stream_context_create([
        'ssl' => ['verify_peer' => false, 'verify_peer_name' => false],
        'http' => ['timeout' => 30]
    ]);
    $sysTxRaw = @file_get_contents('https://zoepharmacyandgeneralmerchandise.systems/api/transactions.php', false, $ctx);
    if ($sysTxRaw) {
        $transactionsData = json_decode($sysTxRaw, true);
    }
}

if (is_array($transactionsData) && !empty($transactionsData)) {
    $results['transactions_synced'] = 0;
    try {
        $conn->beginTransaction();
        $checkTxStmt = $conn->prepare("SELECT id FROM transactions WHERE id = :id LIMIT 1");
        $insertTxStmt = $conn->prepare("
            INSERT INTO transactions (
                id, cashier_name, total_amount, payment_method,
                amount_received, change_amount, status, created_at, transaction_date
            ) VALUES (
                :id, :cashier, :total, :payment_method,
                :amount_received, :change, :status, :created_at, :transaction_date
            )
        ");
        $insertItemStmt = $conn->prepare("
            INSERT INTO transaction_items (
                id, transaction_id, product_id, product_name, quantity, price, cost, status
            ) VALUES (
                :id, :transaction_id, :product_id, :name, :quantity, :price, :cost, :status
            )
        ");

        foreach ($transactionsData as $t) {
            $txId = (int)($t['id'] ?? 0);
            if ($txId <= 0) continue;

            $checkTxStmt->execute([':id' => $txId]);
            if ($checkTxStmt->fetchColumn()) continue; // Already exists

            $dateVal = $t['date'] ?? $t['created_at'] ?? date('Y-m-d H:i:s');
            $insertTxStmt->execute([
                ':id' => $txId,
                ':cashier' => $t['cashier'] ?? 'Admin',
                ':total' => (float)($t['total'] ?? 0),
                ':payment_method' => $t['paymentMethod'] ?? 'cash',
                ':amount_received' => (float)($t['amountReceived'] ?? 0),
                ':change' => (float)($t['change'] ?? 0),
                ':status' => $t['status'] ?? 'completed',
                ':created_at' => $dateVal,
                ':transaction_date' => $dateVal
            ]);

            if (!empty($t['items']) && is_array($t['items'])) {
                foreach ($t['items'] as $it) {
                    $insertItemStmt->execute([
                        ':id' => (int)($it['itemId'] ?? 0) ?: null,
                        ':transaction_id' => $txId,
                        ':product_id' => (int)($it['productId'] ?? 0) ?: null,
                        ':name' => $it['name'] ?? '',
                        ':quantity' => (int)($it['quantity'] ?? 1),
                        ':price' => (float)($it['price'] ?? 0),
                        ':cost' => (float)($it['cost'] ?? 0),
                        ':status' => $it['status'] ?? 'completed'
                    ]);
                }
            }
            $results['transactions_synced']++;
        }
        $conn->commit();
    } catch (Throwable $e) {
        $conn->rollBack();
        $results['errors'][] = 'Transactions sync error: ' . $e->getMessage();
    }
}

// 4. ALIGN POSTGRESQL SEQUENCES
$syncTables = ['transactions', 'transaction_items', 'audit_logs', 'products', 'users', 'categories', 'deleted_products', 'inventory_loss'];
foreach ($syncTables as $tName) {
    try {
        $seq = $conn->query("SELECT pg_get_serial_sequence('$tName', 'id')")->fetchColumn();
        if ($seq) {
            $maxVal = (int)$conn->query("SELECT COALESCE(MAX(id), 0) FROM $tName")->fetchColumn();
            $conn->query("SELECT setval('$seq', " . max($maxVal, 1) . ")");
        }
    } catch (Throwable $e) {}
}

// 5. STATS VERIFICATION
try {
    $countTotal = $conn->query("SELECT count(*) FROM products")->fetchColumn();
    $countWithExp = $conn->query("SELECT count(*) FROM products WHERE expiry_date IS NOT NULL AND expiry_date != ''")->fetchColumn();
    $countNoExp = $conn->query("SELECT count(*) FROM products WHERE expiry_date IS NULL OR expiry_date = ''")->fetchColumn();
    $countDel = $conn->query("SELECT count(*) FROM deleted_products")->fetchColumn();
    $countTx = $conn->query("SELECT count(*) FROM transactions")->fetchColumn();
    $results['current_db_stats'] = [
        'total_products' => (int)$countTotal,
        'products_with_expiry' => (int)$countWithExp,
        'products_without_expiry' => (int)$countNoExp,
        'deleted_products' => (int)$countDel,
        'transactions' => (int)$countTx
    ];
} catch (Throwable $e) {}

echo json_encode($results, JSON_PRETTY_PRINT);
