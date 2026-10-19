<?php
header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Origin: *');

include __DIR__ . '/../includes/db_connect.php';

$rawList = <<<LIST
BENCH B/Spray 50mL Bare Me Not
BENCH B/Spray 50mL So In Love
BENCH B/Spray 50mL Tickled Pink
BENCH B/Spray 100mL Atlantis
BENCH B/Spray 100mL B20
BENCH B/Spray 100mL Bare Me Not
BENCH B/Spray 100mL Capture
BENCH B/Spray 100mL Eight
BENCH B/Spray 100mL i Choose
BENCH B/Spray 100mL i Desire
BENCH B/Spray 100mL i Rock
BENCH B/Spray 100mL i Sport
BENCH B/Spray 100mL Pure Play
BENCH B/Spray 100mL So In Love
BENCH B/Spray 100mL Sure Blue
BENCH B/Spray 100mL Velocity-BLUE
BENCH D/Scent Col. 25-Beach Bum
BENCH D/Scent Col. 25-Bubble Pop
BENCH D/Scent Col. 25-Eye Candy
BENCH D/Scent Col. 25-Happy Hour
BENCH D/Scent Col. 25-IndianSummer
BENCH D/Scent Col. 25-LazyAftrn.
BENCH D/Scent Col. 25-Nine 2 Mine
BENCH D/Scent Col. 25-Spring Break
BENCH D/Scent Col. 25-Sunday Mrng
BENCH D/Scent Col. 50-Beach Bum
BENCH D/Scent Col. 50-Bubble Pop
BENCH D/Scent Col. 50-Eye Candy
BENCH D/Scent Col. 50-Happy Hour
BENCH D/Scent Col. 50-IndianSummer
BENCH D/Scent Col. 50-LazyAftrn.
BENCH D/Scent Col. 50-Nine 2 Mine
BENCH D/Scent Col. 50-Spring Break
BENCH D/Scent Col. 50-Sunday Mrng
BENCH D/Scent Col. 75-Happy Hour
BENCH D/Scent Col. 75-IndianSummer
BENCH D/Scent Col. 75-Lazy Aftrn.
BENCH D/Scent Col. 75-Nine 2 Mine
BENCH D/Scent Col. 75-Sunday Mrng
BENCH D/Scent Col.125-Beach Bum
BENCH D/Scent Col.125-Bubble Pop
BENCH D/Scent Col.125-Eye Candy
BENCH D/Scent Col.125-Happy Hour
BENCH D/Scent Col.125-IndianSummer
BENCH D/Scent Col.125-LazyAftrn.
BENCH D/Scent Col.125-Nine 2 Mine
BENCH D/Scent Col.125-Spring Break
BENCH D/Scent Col.125-Sunday Mrng
AXE Roll-On 40mL (Apollo)
AXE Roll-On 40mL (Black)
AXE Roll-On 40mL (Click)
AXE Roll-On 40mL (Dark Temptation)
AXE Roll-On 40mL (Gold Temptation)
AXE Spray 50mL (Apollo)
AXE Spray 50mL (Black)
AXE Spray 50mL (Click)
AXE Spray 50mL (Dark Temptation)
AXE Spray 50mL (You)
COLGATE TBrush Classic (Adult) 1+1
COLGATE Toothbrush w/ cap (Adult)
COLGATE Toothbrush w/ cap (Child)
DIGITAL Thermometer (Advan)
DIGITAL Thermometer (Surgitech)
DISPOSABLE Syringe 1mL-SureShot
DISPOSABLE Syringe 3mL-SureShot
DISPOSABLE Syringe 5mL-SureShot
CARE Adult Diaper Large 8's
CARE Adult Diaper Medium 10's
CARE Adult Diaper Medium Singles
CARESS Adult Diaper Large 2's
CARESS Adult Diaper Large 10's
CARESS Adult Diaper Medium 1's
CARESS Adult Diaper Medium 10's
CARESS Underpad Large 8's
CARESS Underpad Medium 10's
CARESS Underpad X-Large 8's
DR. P Adult Diaper (Basic Large 2's)
DR. P Adult Diaper (Basic Large 8's)
DR. P Adult Diaper (Basic Medium 2's)
DR. P Adult Diaper (Basic Medium 10's)
DR. P Adult Diaper (Standard Large 13's)
DR. P Adult Diaper (Standard Med. 16's)
DR. P Adult Diaper (Standard Medium 2's)
GRAND Adult Diapers Large 2's
GRAND Adult Diapers Large 8's
GRAND Adult Diapers Medium 10's
GRAND Adult Diapers Medium 2's
EQ Diapers Dry (Large 4's)
EQ Diapers Dry (Large 16's)
EQ Diapers Dry (Large 32's)
EQ Diapers Dry (Large 48's)
EQ Diapers Dry (Large 72's)
EQ Diapers Dry (Medium 4's)
EQ Diapers Dry (Medium 18's)
EQ Diapers Dry (Medium 36's)
EQ Diapers Dry (Medium 54's)
EQ Diapers Dry (New Born 4's)
EQ Diapers Dry (New Born 22's)
EQ Diapers Dry (Small 4's)
EQ Diapers Dry (Small 20's)
EQ Diapers Dry (Small 40's)
EQ Diapers Dry (Small 60's)
EQ Diapers Dry (X-Large 4's)
EQ Diapers Dry (X-Large 14's)
EQ Diapers Dry (X-Large 28's)
EQ Diapers Dry (X-Large 42's)
EQ Diapers Dry (XX-Large 3's)
EQ Diapers Dry (XX-Large 12's)
EQ Diapers Dry (XX-Large 24's)
EQ Diapers Dry (XX-Large 36's)
EQ Diapers Plus (Large 4's)
EQ Diapers Plus (Large 12's)
EQ Diapers Plus (Large 28's)
EQ Diapers Plus (Medium 4's)
EQ Diapers Plus (Medium 12's)
EQ Diapers Plus (Medium 32's)
EQ Diapers Plus (Small 4's)
EQ Diapers Plus (Small 12's)
EQ Diapers Plus (Small 36's)
EQ Diapers Plus (X-Large 4's)
EQ Diapers Plus (X-Large 12's)
EQ Diapers Plus (X-Large 24's)
EQ Diapers Plus (XX-Large 12's)
EQ Diapers Plus (XX-Large 20's)
EQ Pants (Large 10's)
EQ Pants (Large 4's)
EQ Pants (Medium 4's)
EQ Pants (X-Large 10's)
EQ Pants (XX-Large 10's)
HAPPY Baby Pants 4's Large
HAPPY Baby Pants 4's Medium
HAPPY Baby Pants 4's X-Large
HAPPY Baby Pants 4's XX-Large
HAPPY Baby Pants 12's Large
HAPPY Baby Pants 12's Medium
HAPPY Baby Pants 12's X Large
HAPPY Baby Pants 12's XX-Large
HAPPY Baby Pants 24's Large
HAPPY Baby Pants 24's Medium
HAPPY Baby Pants 24's X-Large
HAPPY Baby Pants 24's XX-Large
LIST;

$lines = array_values(array_filter(array_map('trim', explode("\n", $rawList))));

try {
    // 1. Fetch all products from DB
    $dbProducts = $conn->query("SELECT id, sku, name, expiry_date, dispensing_method FROM products")->fetchAll(PDO::FETCH_ASSOC);
    $byName = [];
    $byClean = [];
    foreach ($dbProducts as $p) {
        $byName[strtoupper(trim($p['name']))] = $p;
        $clean = preg_replace('/[^A-Z0-9]/', '', strtoupper($p['name']));
        $byClean[$clean] = $p;
    }

    $matched = [];
    $unmatched = [];

    foreach ($lines as $line) {
        $n = strtoupper($line);
        $clean = preg_replace('/[^A-Z0-9]/', '', $n);

        if (isset($byName[$n])) {
            $matched[] = ['input' => $line, 'db' => $byName[$n]];
        } elseif (isset($byClean[$clean])) {
            $matched[] = ['input' => $line, 'db' => $byClean[$clean]];
        } else {
            $found = null;
            foreach ($dbProducts as $p) {
                $pClean = preg_replace('/[^A-Z0-9]/', '', strtoupper($p['name']));
                if (strpos($pClean, $clean) !== false || strpos($clean, $pClean) !== false) {
                    $found = $p;
                    break;
                }
            }
            if ($found) {
                $matched[] = ['input' => $line, 'db' => $found];
            } else {
                $unmatched[] = $line;
            }
        }
    }

    if (count($matched) !== 141) {
        echo json_encode([
            'success' => false,
            'message' => 'Matched count does not equal 141',
            'matched_count' => count($matched),
            'unmatched' => $unmatched
        ], JSON_PRETTY_PRINT);
        exit;
    }

    $conn->beginTransaction();

    // Reset all products to FEFO by default (keeping existing expiry dates intact)
    $conn->exec("UPDATE products SET dispensing_method = 'FEFO'");

    // Update the matched 141 products to FIFO and clear expiration dates
    $stmtFifo = $conn->prepare("
        UPDATE products 
        SET dispensing_method = 'FIFO',
            expiry_date = NULL,
            new_stock_expiry = NULL,
            new_batch_queue = :nbq
        WHERE id = :id
    ");

    $countUpdated = 0;
    foreach ($matched as $m) {
        $id = $m['db']['id'];
        $current = $conn->query("SELECT new_batch_queue FROM products WHERE id = $id")->fetch(PDO::FETCH_ASSOC);
        $queue = json_decode($current['new_batch_queue'] ?? '[]', true);
        if (is_array($queue)) {
            foreach ($queue as &$qItem) {
                $qItem['expiryDate'] = null;
            }
            unset($qItem);
        } else {
            $queue = [];
        }

        $stmtFifo->execute([
            ':nbq' => json_encode($queue),
            ':id' => $id
        ]);
        $countUpdated++;
    }

    $conn->commit();

    $fifoCount = (int)$conn->query("SELECT count(*) FROM products WHERE dispensing_method = 'FIFO'")->fetchColumn();
    $fefoCount = (int)$conn->query("SELECT count(*) FROM products WHERE dispensing_method = 'FEFO'")->fetchColumn();
    $fifoWithExp = (int)$conn->query("SELECT count(*) FROM products WHERE dispensing_method = 'FIFO' AND (expiry_date IS NOT NULL OR new_stock_expiry IS NOT NULL)")->fetchColumn();

    echo json_encode([
        'success' => true,
        'message' => 'Successfully set 141 products as FIFO and removed their expiration dates.',
        'updated_fifo_count' => $countUpdated,
        'current_fifo_total' => $fifoCount,
        'current_fefo_total' => $fefoCount,
        'fifo_with_expiry' => $fifoWithExp
    ], JSON_PRETTY_PRINT);

} catch (Throwable $e) {
    if ($conn->inTransaction()) {
        $conn->rollBack();
    }
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ], JSON_PRETTY_PRINT);
}
