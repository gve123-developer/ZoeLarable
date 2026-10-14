<?php
include __DIR__ . '/../includes/db_connect.php';
$stmt = $conn->query("SELECT MIN(date) as min_date, MAX(date) as max_date, COUNT(*) as count FROM transactions");
$res = $stmt->fetch(PDO::FETCH_ASSOC);
echo json_encode($res, JSON_PRETTY_PRINT);
