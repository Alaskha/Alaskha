<html lang="en">
<meta charset="utf-8"> 

<?php
include 'header.php';
include 'nav.php';
include 'connect.php';

$result = $conn->query("SELECT id, Vorname, Nachname, Herkunpft FROM `schauspieler`");
$rows = mysqli_fetch_all ($result, MYSQLI_NUM);
?>

<head>
    <h1>Actors</h1>
</head>

<div>
<table width="80%" >
    <tr>
    <th>ID</th>
    <th>Vorname</th>
    <th>Nachname</th>
    <th>Herkunft</th>
    </tr>


<?php
// foreach($rows as $row)
foreach($rows as $row)
{
    echo("<tr>");
    // echo("<td>" . $row['id'] . "</td>");
    // echo("<td>" . $row['Vorname'] . "</td>");
    echo("<td>$row[0]</td>");
    echo("<td>$row[1]</td>");
    echo("<td>$row[2]</td>");
    echo("<td>$row[3]</td>");
    echo("</tr>");
}

//actors

?>
</table>
</div>



</html>