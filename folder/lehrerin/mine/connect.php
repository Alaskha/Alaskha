<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "filmverwaltung";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
//   echo "Connected successfully";

//   $sql = "SELECT * FROM `schauspieler`;";

//   $result = $conn->query($sql);
//   $rowsRoutes = mysqli_fetch_all ($result, MYSQLI_NUM);

//   while ($produktionsfirma_ID = mysqli_fetch_all($result, 1)) {

// }

// mysqli_close($conn);


?>