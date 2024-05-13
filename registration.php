<?php
$conn = new mysqli("localhost", "root", "", "Vishnev_A_IS1_45");

if ($conn->connect_error) {
    die("Ошибка подключения: " . $conn->connect_error);
}

$name1 = $_POST['user_name_1'];
$name2 = $_POST['user_name_2'];
$name3 = $_POST['user_name_3'];
$email = $_POST['user_email'];
$password = $_POST['user_password'];
$repassword = $_POST['user_repassword'];
$role = $_POST['user_role'];

if ($password === $repassword) {
    // Использование подготовленного выражения для защиты от SQL инъекций
    if ($role === "сусемь") {
        $sql = "INSERT INTO Users (user_name_1, user_name_2, user_name_3, user_email, user_password, user_role) VALUES (?, ?, ?, ?, ?, 2)";
    }
    else {
        $sql = "INSERT INTO Users (user_name_1, user_name_2, user_name_3, user_email, user_password, user_role) VALUES (?, ?, ?, ?, ?, 1)";
    }
    $stmt = $conn->prepare($sql);
    if ($stmt) {
        // Привязываем параметры к подготовленному выражению
        $stmt->bind_param("sssss", $name1, $name2, $name3, $email, $password);
        // Выполняем запрос
        if ($stmt->execute()) {
            echo '<script>alert("Пользователь успешно зарегистрирован"); window.location.href = "index.html";</script>';
        } else {
            echo "Ошибка: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "Ошибка: не удается подготовить запрос";
    }
} else {
    echo '<script>alert("Пароли не совпадают"); window.location.href = "registration.html";</script>';
}

$conn->close();
?>