<?php

require_once __DIR__ . '/includes/db_connect.php';

try {
    $stmt = $conn->query("SELECT version()");
    $result = $stmt->fetch();

    echo "POSTGRESQL CONNECTION SUCCESSFUL<br><br>";
    echo htmlspecialchars($result['version']);

} catch (Throwable $e) {

    echo "POSTGRESQL CONNECTION FAILED<br><br>";
    echo htmlspecialchars($e->getMessage());
}
?>