<?php
/*
PHP_Aufgabe.php
Janjic Martina
02.06.2021
Version 1.2
*/


if (isset($_POST['txtUsername']) || isset($_POST['txtPasswort']))
{
	$txtUsername = $_POST['txtUsername'];
	$txtPasswort = $_POST['txtPasswort'];
    $password1 = password_hash('$txtPasswort', PASSWORD_DEFAULT);

    //write csv
    $f = fopen('myCsv.csv', 'a');
    fputcsv($f, ["$txtUsername", "$password1"]);
    fclose($f);

    // read csv to sql
    $g = fopen('myCsv.csv', 'r+');
    $con = mysqli_connect('localhost', 'root', '', 'php_db_test');
    while (($data = fgetcsv($g)) !== false)
    {
        $sql = "INSERT INTO `table1` (`id`, `flUsername`, `flPasswort`) VALUES ('0', '$data[0]', '$data[1]' );";
    }
    $rs = mysqli_query($con, $sql);

    fclose($g);

    if ($rs)
    {
        echo "Contact Records Inserted" . nl2br("\n");
    }
	mysqli_close($con);
}
else
{
    echo "error _POST is empty";
}
echo '<a href=/myOwnFiles/phpLogin.html>Zurück zum Anmeldeformular</a>';
echo nl2br("\n") . "-Warnings- beim Beta wurden die Warnings wohl geloest" . nl2br("\n") . "https://wordpress.org/support/topic/undefined-array-key-1-in-php-8/";

?>
