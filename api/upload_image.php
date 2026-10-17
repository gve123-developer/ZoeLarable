<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-User-Name");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Method not allowed']);
    exit();
}

try {
    $targetDir = __DIR__ . '/../uploads/products/';
    if (!is_dir($targetDir)) {
        mkdir($targetDir, 0777, true);
    }

    $uploadedUrl = null;

    // 1. Check for standard multipart file upload
    if (!empty($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $file = $_FILES['image'];
        $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
        $allowed = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

        if (!in_array($ext, $allowed)) {
            echo json_encode(['success' => false, 'message' => 'Invalid image format. Allowed: JPG, PNG, WEBP, GIF']);
            exit();
        }

        // Limit size to 10MB
        if ($file['size'] > 10 * 1024 * 1024) {
            echo json_encode(['success' => false, 'message' => 'Image size exceeds 10MB limit']);
            exit();
        }

        $filename = 'prod_' . date('Ymd_His') . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
        $dest = $targetDir . $filename;

        if (move_uploaded_file($file['tmp_name'], $dest)) {
            $uploadedUrl = '/uploads/products/' . $filename;
        } else {
            throw new RuntimeException('Failed to move uploaded file');
        }
    } 
    // 2. Check for base64 JSON payload
    else {
        $input = json_decode(file_get_contents('php://input'), true);
        if (!empty($input['imageData'])) {
            $dataUri = $input['imageData'];
            if (preg_match('/^data:image\/(\w+);base64,/', $dataUri, $matches)) {
                $ext = strtolower($matches[1]);
                if ($ext === 'jpeg') $ext = 'jpg';
                $allowed = ['jpg', 'png', 'webp', 'gif'];
                if (!in_array($ext, $allowed)) $ext = 'png';

                $base64 = substr($dataUri, strpos($dataUri, ',') + 1);
                $decoded = base64_decode($base64);
                if ($decoded === false) {
                    throw new RuntimeException('Failed to decode base64 image data');
                }

                $filename = 'prod_' . date('Ymd_His') . '_' . bin2hex(random_bytes(4)) . '.' . $ext;
                $dest = $targetDir . $filename;

                if (file_put_contents($dest, $decoded)) {
                    $uploadedUrl = '/uploads/products/' . $filename;
                } else {
                    throw new RuntimeException('Failed to save decoded image file');
                }
            } else if (filter_var($dataUri, FILTER_VALIDATE_URL)) {
                // If it's already an external URL
                $uploadedUrl = $dataUri;
            }
        }
    }

    if ($uploadedUrl) {
        echo json_encode([
            'success' => true,
            'url' => $uploadedUrl,
            'message' => 'Image uploaded successfully'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'No valid image provided'
        ]);
    }
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Upload error: ' . $e->getMessage()
    ]);
}
