<?php
$conn = new mysqli("localhost", "root", "", "Vishnev_A_IS1_45");

if ($conn->connect_error) {
    die("Ошибка подключения: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_email = $_POST['user_email'];
    $user_password = $_POST['user_password'];

    $sqlCli = "SELECT * FROM Users WHERE user_email=? AND user_password=? AND user_role=1";
    $sqlAdm = "SELECT * FROM Users WHERE user_email=? AND user_password=? AND user_role=2";

    $stmt = $conn->prepare($sqlCli);
    $stmt->bind_param("ss", $user_email, $user_password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo '<script> window.location.href = "client.php"; alert("Авторизация клиента успешна!");</script>';
    } else {
        $stmt = $conn->prepare($sqlAdm);
        $stmt->bind_param("ss", $user_email, $user_password);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo '<script> window.location.href = "admin.php"; alert("Авторизация админа успешна!");</script>';
        } else {
            echo '<script> window.location.href = "index.html";alert("Неверное имя пользователя или пароль");</script>';
        }
    }

    $stmt->close();
}

$conn->close();
?>