<?php
$conn = new mysqli("localhost", "root", "", "Vishnev_A_IS1_45");

if ($conn->connect_error) {
    die("Ошибка подключения: " . $conn->connect_error);
}
$id = '';
$unit = $_POST['unit'];
$image_unit = $_POST['image_unit'];
    
$sql = "INSERT INTO Units (id_unit, unit, image_unit) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);

$stmt->bind_param($id, $unit, $image_unit);
if ($stmt->execute()) {
    echo '<script>alert("Запись успешно добавлена"); window.location.href = "admin.php";</script>';
} else {
    echo "Ошибка: " . $stmt->error;
}
$stmt->close();

$conn->close();
?>