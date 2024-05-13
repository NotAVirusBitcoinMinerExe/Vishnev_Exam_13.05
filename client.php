<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Пользователь</title>
	<link rel="stylesheet" type="text/css" href="css.css">
	<link rel="stylesheet" type="text/css" href="fonts.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="icon" href="IMG/Logo.png">
</head>
<body>
<header>
	<a href="#splash"><h2>АИС «Оргтехника»</h2></a>
	<div class="ha"><a href="#boxes">Первый блок</a><a href="">Второй блок</a><a href="index.html">Выход</a></div>
</header>
<div class="splash" id="splash">
	<h1 class="sph">Форма пользователя</h1>
</div>
<div class="content">
    <?php
	$conn = new mysqli("localhost", "root", "", "Vishnev_A_IS1_45");

	if ($conn->connect_error) {
	    die("Ошибка подключения: " . $conn->connect_error);
	}

	$search = $_GET['search'] ?? '';
	$sql_data = "SELECT * FROM office_equipment WHERE office_equipment LIKE '%$search'";
	$result_data = $conn->query($sql_data);

	if ($result_data->num_rows > 0) {
	    while($row = $result_data->fetch_assoc()) {
	        echo '<form class="card" id="' . $row["offeq_id"] . '">';
	        echo '<img src="IMG/1.jpg" alt="' . $row["office_equipment"] . '" class="card__img">';
	        echo '<h4>' . $row["office_equipment"] . '</h4>';
	        echo '</form>';
	    }
	}
	else {
	    echo "Ничего не найдено";
	}
	$conn->close();
	?>
</div>
<footer>
    Это футер. Он крутой, но время экзамена ограничено©
</footer>
</body>
</html>