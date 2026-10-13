<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-User-Name");
header("Content-Type: application/json; charset=UTF-8");

include '../includes/db_connect.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'OPTIONS') {
    http_response_code(200);
    exit();
}

function apiError(int $code, string $message, string $debug = ''): void
{
    http_response_code($code);

    $payload = [
        'success' => false,
        'message' => $message
    ];

    if ($debug !== '') {
        $payload['debug'] = $debug;
        error_log("[products.php] $message | $debug");
    }

    echo json_encode($payload);
    exit;
}


function get_smart_supplier($name, $category = '') {
    $n = strtoupper($name ?? '');
    $cat = strtoupper($category ?? '');

    if (preg_match('/(BIOGESIC|BIOFLU|ALAXAN|NEOZEP|ENERVON|SOLMUX|MEDICOL|DECOLGEN|MYRA|REVITALICON|DIATABS|ALLERM|TUSERAN|KREMIL|CEELIN|DISUFRIN)/', $n)) return 'UNILAB';
    if (preg_match('/(BUSCOPAN|BISOLVON|DULCOLAX)/', $n)) return 'SANOFI';
    if (preg_match('/(BONAMINE|PONSTAN|PFIZER)/', $n)) return 'PFIZER';
    if (preg_match('/(BRICANYL|ASTRAZENECA)/', $n)) return 'ASTRAZENECA';
    if (preg_match('/(BONNA|BONAMIL|BONAKID|WYETH)/', $n)) return 'WYETH';
    if (preg_match('/(BIODERM|CASINO|EFFICASCENT|OMEGA|IPI)/', $n)) return 'IPI';
    if (preg_match('/(C\.Y\.GABRIEL|CY GABRIEL)/', $n)) return 'CYGABRIEL';
    if (preg_match('/(BL SOAP|BL CREAM)/', $n)) return 'BL-PH';
    if (preg_match('/(DEQUADIN|PANADOL|CALPOL|SENSODYNE)/', $n)) return 'GSK';
    if (preg_match('/(WHITE FLOWER)/', $n)) return 'HOE';
    if (preg_match('/(VICKS|SAFEGUARD)/', $n)) return 'PG';
    if (preg_match('/(BENCH)/', $n)) return 'BENCH';
    if (preg_match('/(COLGATE|PALMOLIVE)/', $n)) return 'COLGATE';
    if (preg_match('/(POTEN-CEE|ASCOF)/', $n)) return 'PASCUAL';
    if (preg_match('/(RHEA)/', $n)) return 'RHEA';
    if (strpos($cat, 'NON-PHARMACEUTICAL') !== false || strpos($n, 'SOAP') !== false || strpos($n, 'SHAMPOO') !== false) return 'GEN-MERCH';
    return 'UNILAB';
}

// GET: Fetch all products
if ($method === 'GET') {
    try {
        // Migration and cleanup
        try {
            $conn->exec("ALTER TABLE products ADD COLUMN IF NOT EXISTS batch_number VARCHAR(100)");
            $conn->exec("ALTER TABLE products ADD COLUMN IF NOT EXISTS new_batch_queue TEXT DEFAULT '[]'");
            $conn->exec("ALTER TABLE deleted_products ADD COLUMN IF NOT EXISTS batch_number VARCHAR(100)");
            $conn->exec("ALTER TABLE deleted_products ADD COLUMN IF NOT EXISTS new_batch_queue TEXT DEFAULT '[]'");
            $conn->exec("UPDATE products SET name = TRIM(REPLACE(name, '*', '')) WHERE name LIKE '%*%'");
            $conn->exec("UPDATE deleted_products SET name = TRIM(REPLACE(name, '*', '')) WHERE name LIKE '%*%'");
        } catch (Throwable $ignored) {}

        $sql = "
            SELECT
                p.id,
                p.name,
                p.sku,
                p.description,
                p.quantity,
                p.price,
                p.cost,
                p.reorder_level,
                p.expiry_date,
                p.new_stock_quantity,
                p.new_stock_expiry,
                p.batch_number,
                p.new_batch_queue,
                p.created_at,
                c.name AS category
            FROM products p
            LEFT JOIN categories c
                ON p.category_id = c.id
            ORDER BY p.id DESC
        ";

        $stmt = $conn->query($sql);

        $products = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $cat = $row['category'] ?? 'Uncategorized';
            $supplier = get_smart_supplier($row['name'], $cat);
            $createdDateCode = !empty($row['created_at']) ? date('Ymd', strtotime($row['created_at'])) : date('Ymd');
            $createdDateFull = !empty($row['created_at']) ? date('Y-m-d', strtotime($row['created_at'])) : date('Y-m-d');

            $batchNumber = $row['batch_number'] ?? '';
            if (empty($batchNumber) || strpos($batchNumber, '20261014-') === 0) {
                $batchNumber = $createdDateCode . '-' . $supplier;
                try {
                    $conn->prepare("UPDATE products SET batch_number = :bn WHERE id = :id")
                         ->execute([':bn' => $batchNumber, ':id' => $row['id']]);
                } catch (Throwable $e) {}
            }

            $rawQueue = $row['new_batch_queue'] ?? '[]';
            $queue = json_decode($rawQueue, true);
            if (!is_array($queue)) {
                $queue = [];
            }

            // Clean any legacy hardcoded 20261014 in queue
            if (!empty($queue)) {
                $queueModified = false;
                foreach ($queue as &$qItem) {
                    if (isset($qItem['batchNumber']) && strpos($qItem['batchNumber'], '20261014-') === 0) {
                        $qArr = !empty($qItem['arrivalDate']) ? date('Ymd', strtotime($qItem['arrivalDate'])) : $createdDateCode;
                        $qSup = $qItem['supplier'] ?? $supplier;
                        $qItem['batchNumber'] = $qArr . '-' . $qSup;
                        $queueModified = true;
                    }
                }
                unset($qItem);
                if ($queueModified) {
                    try {
                        $conn->prepare("UPDATE products SET new_batch_queue = :nbq WHERE id = :id")
                             ->execute([':nbq' => json_encode($queue), ':id' => $row['id']]);
                    } catch (Throwable $e) {}
                }
            }

            $newQty = (int)($row['new_stock_quantity'] ?? 0);
            if ($newQty > 0 && empty($queue)) {
                $queue = [
                    [
                        'batchNumber' => $createdDateCode . '-' . $supplier,
                        'supplier' => $supplier,
                        'quantity' => $newQty,
                        'expiryDate' => $row['new_stock_expiry'],
                        'arrivalDate' => $createdDateFull
                    ]
                ];
                try {
                    $conn->prepare("UPDATE products SET new_batch_queue = :nbq WHERE id = :id")
                         ->execute([':nbq' => json_encode($queue), ':id' => $row['id']]);
                } catch (Throwable $e) {}
            }

            // Automatic batch rotation: If Old Batch is 0 and New Batch Queue has entries, promote next batch
            $qty = (int)$row['quantity'];
            $expiry = $row['expiry_date'];
            if ($qty <= 0 && !empty($queue)) {
                $promoted = array_shift($queue);
                $qty = (int)$promoted['quantity'];
                $expiry = $promoted['expiryDate'] ?? null;
                $batchNumber = $promoted['batchNumber'] ?? $batchNumber;
                $newQty = array_sum(array_column($queue, 'quantity'));
                $expList = array_filter(array_column($queue, 'expiryDate'));
                $newExpiry = !empty($expList) ? min($expList) : null;
                try {
                    $conn->prepare("UPDATE products SET quantity = :q, expiry_date = :exp, batch_number = :bn, new_stock_quantity = :nsq, new_stock_expiry = :nse, new_batch_queue = :nbq WHERE id = :id")
                         ->execute([
                             ':q' => $qty,
                             ':exp' => $expiry,
                             ':bn' => $batchNumber,
                             ':nsq' => $newQty,
                             ':nse' => $newExpiry,
                             ':nbq' => json_encode($queue),
                             ':id' => $row['id']
                         ]);
                } catch (Throwable $e) {}
                $row['new_stock_expiry'] = $newExpiry;
            } else {
                $newQty = array_sum(array_column($queue, 'quantity'));
            }

            $products[] = [
                'id' => (string)$row['id'],
                'name' => $row['name'],
                'sku' => $row['sku'],
                'category' => $cat,
                'description' => $row['description'],
                'quantity' => $qty,
                'price' => (float)$row['price'],
                'cost' => (float)$row['cost'],
                'reorderLevel' => (int)$row['reorder_level'],
                'expiryDate' => $expiry,
                'newStockQuantity' => $newQty,
                'newStockExpiry' => $row['new_stock_expiry'],
                'batchNumber' => $batchNumber,
                'newBatchQueue' => $queue,
                'createdAt' => $row['created_at'] ?? null
            ];
        }

        echo json_encode($products);

    } catch (Throwable $e) {
        apiError(
            500,
            'Failed to fetch products',
            $e->getMessage()
        );
    }
}


// POST: Add new product
elseif ($method === 'POST') {
    try {

        $data = json_decode(
            file_get_contents("php://input"),
            true
        );

        if (!$data) {
            throw new RuntimeException("Invalid JSON body");
        }

        $category_name = trim(
            $data['category'] ?? 'Uncategorized'
        );

        // Find category
        $cat_q = $conn->prepare(
            "SELECT id
             FROM categories
             WHERE name = :name
             LIMIT 1"
        );

        $cat_q->execute([
            ':name' => $category_name
        ]);

        $cat_row = $cat_q->fetch(PDO::FETCH_ASSOC);

        if ($cat_row) {

            $category_id = $cat_row['id'];

        } else {

            $ins_cat = $conn->prepare(
                "INSERT INTO categories (name)
                 VALUES (:name)
                 RETURNING id"
            );

            $ins_cat->execute([
                ':name' => $category_name
            ]);

            $category_id = $ins_cat->fetchColumn();
        }

        $sku = trim($data['sku'] ?? '');
        $name = trim($data['name'] ?? '');
        $desc = $data['description'] ?? '';

        $qty = (int)($data['quantity'] ?? 0);
        $price = (float)($data['price'] ?? 0);
        $cost = (float)($data['cost'] ?? 0);
        $reorder = (int)($data['reorderLevel'] ?? 0);

        $expiry =
            !empty($data['expiryDate'])
            ? $data['expiryDate']
            : null;

        $nb_qty =
            (int)($data['newStockQuantity'] ?? 0);

        $nb_expiry =
            !empty($data['newStockExpiry'])
            ? $data['newStockExpiry']
            : null;

        if ($sku === '' || $name === '') {
            throw new RuntimeException(
                "SKU and product name are required"
            );
        }

        $supplier = get_smart_supplier($name, $category_name);
        $batch_number = trim($data['batchNumber'] ?? '');
        if ($batch_number === '' || strpos($batch_number, '20261014-') === 0) {
            $arr_code = !empty($data['arrivalDate']) ? date('Ymd', strtotime($data['arrivalDate'])) : date('Ymd');
            $batch_number = $arr_code . '-' . $supplier;
        }

        $new_batch_queue = $data['newBatchQueue'] ?? [];
        if (!is_array($new_batch_queue)) {
            $new_batch_queue = [];
        }
        if ($nb_qty > 0 && empty($new_batch_queue)) {
            $nb_arr_date = !empty($data['newStockArrivalDate']) ? $data['newStockArrivalDate'] : date('Y-m-d');
            $nb_arr = date('Ymd', strtotime($nb_arr_date));
            $new_batch_queue = [
                [
                    'batchNumber' => $nb_arr . '-' . $supplier,
                    'supplier' => $supplier,
                    'quantity' => $nb_qty,
                    'expiryDate' => $nb_expiry,
                    'arrivalDate' => $nb_arr_date
                ]
            ];
        }
        $nb_json = json_encode($new_batch_queue);

        $stmt = $conn->prepare(
            "INSERT INTO products
            (
                sku,
                name,
                category_id,
                description,
                quantity,
                price,
                cost,
                reorder_level,
                expiry_date,
                new_stock_quantity,
                new_stock_expiry,
                batch_number,
                new_batch_queue
            )
            VALUES
            (
                :sku,
                :name,
                :category_id,
                :description,
                :quantity,
                :price,
                :cost,
                :reorder_level,
                :expiry_date,
                :new_stock_quantity,
                :new_stock_expiry,
                :batch_number,
                :new_batch_queue
            )
            RETURNING id"
        );

        $stmt->execute([
            ':sku' => $sku,
            ':name' => $name,
            ':category_id' => $category_id,
            ':description' => $desc,
            ':quantity' => $qty,
            ':price' => $price,
            ':cost' => $cost,
            ':reorder_level' => $reorder,
            ':expiry_date' => $expiry,
            ':new_stock_quantity' => $nb_qty,
            ':new_stock_expiry' => $nb_expiry,
            ':batch_number' => $batch_number,
            ':new_batch_queue' => $nb_json
        ]);

        $new_id = $stmt->fetchColumn();

        include_once '../includes/audit_logger.php';

        $user =
            $_SERVER['HTTP_X_USER_NAME']
            ?? 'Admin';

        log_action(
            $conn,
            $user,
            'Add Product',
            "Added product: $name (SKU: $sku)"
        );

        echo json_encode([
            'success' => true,
            'id' => (string)$new_id
        ]);

    } catch (Throwable $e) {
        apiError(
            500,
            'Failed to add product',
            $e->getMessage()
        );
    }
}


// PUT: Update product
elseif ($method === 'PUT') {
    try {

        $data = json_decode(
            file_get_contents("php://input"),
            true
        );

        if (!$data) {
            throw new RuntimeException(
                "Invalid JSON body"
            );
        }

        $id =
            isset($_GET['id'])
            ? (int)$_GET['id']
            : (int)($data['id'] ?? 0);

        if (!$id) {
            throw new RuntimeException(
                "Missing product ID"
            );
        }

        $category_name =
            trim(
                $data['category']
                ?? 'Uncategorized'
            );

        $cat_q = $conn->prepare(
            "SELECT id
             FROM categories
             WHERE name = :name
             LIMIT 1"
        );

        $cat_q->execute([
            ':name' => $category_name
        ]);

        $cat_row =
            $cat_q->fetch(PDO::FETCH_ASSOC);

        if ($cat_row) {

            $category_id =
                $cat_row['id'];

        } else {

            $ins_cat =
                $conn->prepare(
                    "INSERT INTO categories (name)
                     VALUES (:name)
                     RETURNING id"
                );

            $ins_cat->execute([
                ':name' => $category_name
            ]);

            $category_id =
                $ins_cat->fetchColumn();
        }

        $sku = trim($data['sku'] ?? '');
        $name = trim($data['name'] ?? '');
        $desc = $data['description'] ?? '';

        $qty =
            (int)($data['quantity'] ?? 0);

        $price =
            (float)($data['price'] ?? 0);

        $cost =
            (float)($data['cost'] ?? 0);

        $reorder =
            (int)($data['reorderLevel'] ?? 0);

        $expiry =
            !empty($data['expiryDate'])
            ? $data['expiryDate']
            : null;

        $supplier = get_smart_supplier($name, $category_name);
        $batch_number = trim($data['batchNumber'] ?? '');
        if ($batch_number === '' || strpos($batch_number, '20261014-') === 0) {
            $arr_code = !empty($data['arrivalDate']) ? date('Ymd', strtotime($data['arrivalDate'])) : date('Ymd');
            $batch_number = $arr_code . '-' . $supplier;
        }

        $new_batch_queue = $data['newBatchQueue'] ?? null;
        $nb_qty = 0;
        $clean_queue = [];
        $expList = [];

        if (is_array($new_batch_queue)) {
            foreach ($new_batch_queue as $item) {
                if (!is_array($item)) continue;
                $item_qty = (int)($item['quantity'] ?? 0);
                if ($item_qty <= 0) continue;
                $item_sup = trim($item['supplier'] ?? $supplier);
                $item_arr = !empty($item['arrivalDate']) ? $item['arrivalDate'] : date('Y-m-d');
                $item_code_prefix = date('Ymd', strtotime($item_arr));
                $item_bn = trim($item['batchNumber'] ?? '');
                if (empty($item_bn) || strpos($item_bn, '20261014-') === 0) {
                    $item_bn = $item_code_prefix . '-' . ($item_sup ?: 'UNILAB');
                }
                $item_exp = !empty($item['expiryDate']) ? $item['expiryDate'] : null;
                if ($item_exp) {
                    $expList[] = $item_exp;
                }
                $nb_qty += $item_qty;
                $clean_queue[] = [
                    'batchNumber' => $item_bn,
                    'supplier' => $item_sup ?: $supplier,
                    'quantity' => $item_qty,
                    'expiryDate' => $item_exp,
                    'arrivalDate' => $item_arr
                ];
            }
            $new_batch_queue = $clean_queue;
            $nb_expiry = !empty($expList) ? min($expList) : null;
        } else {
            $nb_qty = (int)($data['newStockQuantity'] ?? 0);
            $nb_expiry = !empty($data['newStockExpiry']) ? $data['newStockExpiry'] : null;
            if ($nb_qty > 0) {
                $new_batch_queue = [
                    [
                        'batchNumber' => date('Ymd') . '-' . $supplier,
                        'supplier' => $supplier,
                        'quantity' => $nb_qty,
                        'expiryDate' => $nb_expiry,
                        'arrivalDate' => date('Y-m-d')
                    ]
                ];
            } else {
                $new_batch_queue = [];
            }
        }

        // Auto-rotate if Old Batch is 0 and queue has batches
        if ($qty <= 0 && is_array($new_batch_queue) && !empty($new_batch_queue)) {
            $promoted = array_shift($new_batch_queue);
            $qty = (int)$promoted['quantity'];
            $expiry = $promoted['expiryDate'] ?? null;
            $batch_number = $promoted['batchNumber'] ?? $batch_number;
            $nb_qty = array_sum(array_column($new_batch_queue, 'quantity'));
            $expList = array_filter(array_column($new_batch_queue, 'expiryDate'));
            $nb_expiry = !empty($expList) ? min($expList) : null;
        }
        $nb_json = json_encode($new_batch_queue);

        $stmt = $conn->prepare(
            "UPDATE products
             SET
                sku = :sku,
                name = :name,
                category_id = :category_id,
                description = :description,
                quantity = :quantity,
                price = :price,
                cost = :cost,
                reorder_level = :reorder_level,
                expiry_date = :expiry_date,
                new_stock_quantity = :new_stock_quantity,
                new_stock_expiry = :new_stock_expiry,
                batch_number = :batch_number,
                new_batch_queue = :new_batch_queue,
                updated_at = CURRENT_TIMESTAMP
             WHERE id = :id"
        );

        $stmt->execute([
            ':sku' => $sku,
            ':name' => $name,
            ':category_id' => $category_id,
            ':description' => $desc,
            ':quantity' => $qty,
            ':price' => $price,
            ':cost' => $cost,
            ':reorder_level' => $reorder,
            ':expiry_date' => $expiry,
            ':new_stock_quantity' => $nb_qty,
            ':new_stock_expiry' => $nb_expiry,
            ':batch_number' => $batch_number,
            ':new_batch_queue' => $nb_json,
            ':id' => $id
        ]);

        include_once '../includes/audit_logger.php';

        $user =
            $_SERVER['HTTP_X_USER_NAME']
            ?? 'Admin';

        log_action(
            $conn,
            $user,
            'Edit Product',
            "Updated product: $name (ID: $id)"
        );

        echo json_encode([
            'success' => true
        ]);

    } catch (Throwable $e) {

        $code =
            str_contains(
                $e->getMessage(),
                'Missing'
            )
            ? 400
            : 500;

        apiError(
            $code,
            'Failed to update product',
            $e->getMessage()
        );
    }
}


// DELETE: Archive product
elseif ($method === 'DELETE') {
    try {

        $id =
            isset($_GET['id'])
            ? (int)$_GET['id']
            : 0;

        if (!$id) {
            throw new RuntimeException(
                "Missing product ID"
            );
        }

        include_once '../includes/audit_logger.php';

        $user =
            $_SERVER['HTTP_X_USER_NAME']
            ?? 'Admin';

        // Get product first
        $fetch = $conn->prepare(
            "SELECT
                p.id,
                p.sku,
                p.name,
                c.name AS category,
                p.description,
                p.quantity,
                p.price,
                p.cost,
                p.reorder_level,
                p.expiry_date
             FROM products p
             LEFT JOIN categories c
                ON p.category_id = c.id
             WHERE p.id = :id"
        );

        $fetch->execute([
            ':id' => $id
        ]);

        $p =
            $fetch->fetch(PDO::FETCH_ASSOC);

        if (!$p) {
            apiError(
                404,
                'Product not found'
            );
        }

        $conn->beginTransaction();

        try {

            // Archive
            $ins = $conn->prepare(
                "INSERT INTO deleted_products
                (
                    original_id,
                    sku,
                    name,
                    category,
                    description,
                    quantity,
                    price,
                    cost,
                    reorder_level,
                    expiry_date,
                    deleted_by
                )
                VALUES
                (
                    :original_id,
                    :sku,
                    :name,
                    :category,
                    :description,
                    :quantity,
                    :price,
                    :cost,
                    :reorder_level,
                    :expiry_date,
                    :deleted_by
                )"
            );

            $ins->execute([
                ':original_id' =>
                    $p['id'],

                ':sku' =>
                    $p['sku'],

                ':name' =>
                    $p['name'],

                ':category' =>
                    $p['category'],

                ':description' =>
                    $p['description'],

                ':quantity' =>
                    $p['quantity'],

                ':price' =>
                    $p['price'],

                ':cost' =>
                    $p['cost'],

                ':reorder_level' =>
                    $p['reorder_level'],

                ':expiry_date' =>
                    $p['expiry_date'],

                ':deleted_by' =>
                    $user
            ]);

            // Delete active product
            $del = $conn->prepare(
                "DELETE FROM products
                 WHERE id = :id"
            );

            $del->execute([
                ':id' => $id
            ]);

            $conn->commit();

        } catch (Throwable $e) {

            if ($conn->inTransaction()) {
                $conn->rollBack();
            }

            throw $e;
        }

        log_action(
            $conn,
            $user,
            'Archive Product',
            "Moved to recycle bin: {$p['name']}"
        );

        echo json_encode([
            'success' => true
        ]);

    } catch (Throwable $e) {

        $code =
            str_contains(
                $e->getMessage(),
                'Missing'
            )
            ? 400
            : 500;

        apiError(
            $code,
            'Failed to delete product',
            $e->getMessage()
        );
    }
}

else {
    apiError(
        405,
        'Method not allowed'
    );
}
?>