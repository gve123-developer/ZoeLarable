<?php
$baseUrl = 'https://zoepharmacyandgeneralmerchandise.systems/api';

$endpoints = [
    'products' => "$baseUrl/products.php",
    'transactions' => "$baseUrl/transactions.php",
    'audit_logs' => "$baseUrl/audit_logs.php",
    'inventory_loss' => "$baseUrl/inventory_loss.php",
    'deleted_products' => "$baseUrl/deleted_products.php",
];

$output = [];

foreach ($endpoints as $table => $url) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    $res = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode === 200 && $res) {
        $json = json_decode($res, true);
        if (is_array($json)) {
            $output[$table] = $json;
            echo "Fetched $table: " . count($json) . " records\n";
        } else {
            echo "Failed to decode JSON for $table (Length: " . strlen($res) . ")\n";
        }
    } else {
        echo "Error fetching $table: HTTP $httpCode\n";
    }
}

// Also check users endpoint (requires authorization or basic check)
$ch = curl_init("$baseUrl/users.php");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$res = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);
if ($httpCode === 200 && $res) {
    $json = json_decode($res, true);
    if (is_array($json)) {
        $output['users'] = $json;
        echo "Fetched users: " . count($json) . " records\n";
    }
}

// Save complete JSON dump
$jsonFile = 'c:/Users/Asus/Downloads/Website/zoe_live_database_backup.json';
file_put_contents($jsonFile, json_encode($output, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
echo "Saved JSON backup to $jsonFile (" . filesize($jsonFile) . " bytes)\n";
