<?php
/*
PHP_Aufgabe.php
Janjic Martina
09.06.2021
Version 1.2
*/


if (isset($_POST['txtUsername']) || isset($_POST['txtPasswort']))
{
	$txtUsername = $_POST['txtUsername'];
	$txtPasswort = $_POST['txtPasswort'];
	
    if (check_login($txtUsername, $txtPasswort))
    {
        $_SESSION['USER'] = $username;
		
		echo "Logged in" . nl2br("\n");
		echo '<a href=/myOwnFiles/phpLogin.html>Zurück zum Anmeldeformular</a>';
    }else{
		echo "Username or Password couldn't be found in the database" . nl2br("\n");
		echo '<a href=/myOwnFiles/phpLogin.html>Zurück zum Anmeldeformular</a>';
	}
}

function check_login($username, $password){
	$con = mysqli_connect('localhost', 'root', '', 'php_db_test');
    $sql = "SELECT flPasswort FROM `table1` WHERE flUsername='$password' LIMIT 1;";
    $rs = mysqli_query($con, $sql);
	mysqli_close($con);
	return password_verify($password, $rs['$username']);
}
?>
