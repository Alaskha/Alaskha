<?php
/*
PHP_Aufgabe.php
Janjic Martina
02.06.2021
Version 1
*/

if (isset($_POST['txtVorname']) || isset($_POST['txtNachname']) || isset($_POST['txtWohnort']) || isset($_POST['txtPasswort']))
{
    $txtVorname = $_POST['txtVorname'];
    $txtNachname = $_POST['txtNachname'];
    $txtWohnort = $_POST['txtWohnort'];
    $txtPasswort = $_POST['txtPasswort'];

    $password1 = password_hash('$txtPasswort', PASSWORD_DEFAULT);

    //write csv
    $f = fopen('myCsv.csv', 'a');
    fputcsv($f, ["$txtVorname", "$txtNachname", "$txtWohnort", "$password1"]);
    fclose($f);

    // read csv to sql
    $g = fopen('myCsv.csv', 'r+');

    /*	Ganze Seite in DB eingeben
    while (($data = fgetcsv($g)) !== false)
    {
    $con = mysqli_connect('localhost', 'root', '', 'php_db_test');
        $sql = "INSERT INTO `table1` (`id`, `flVorname`, `flNachname`, `flWohnort`, `flPasswort`) VALUES ('0', '$data[0]', '$data[1]', '$data[2]', '$data[3]' );";
    $rs = mysqli_query($con, $sql);
    }
    */

    //nur letzten Eintrag in die
    $con = mysqli_connect('localhost', 'root', '', 'php_db_test');
    while (($data = fgetcsv($g)) !== false)
    {
        $sql = "INSERT INTO `table1` (`id`, `flVorname`, `flNachname`, `flWohnort`, `flPasswort`) VALUES ('0', '$data[0]', '$data[1]', '$data[2]', '$data[3]' );";
    }
    $rs = mysqli_query($con, $sql);

    fclose($g);

    if ($rs)
    {
        echo "Contact Records Inserted" . nl2br("\n");
    }
}
else
{
    echo "error _POST is empty";
}
echo '<a href=/myOwnFiles/phpAnmeldeformular.html>Zurück zum Anmeldeformular</a>';
echo nl2br("\n") . "-Warnings- beim Beta wurden die Warnings wohl geloest" . nl2br("\n") . "https://wordpress.org/support/topic/undefined-array-key-1-in-php-8/";
?>
