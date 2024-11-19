<html>
<?php
include 'header.php';
include 'nav.php';
include 'connect.php';


$result = $conn->query("SELECT Produktionsfirma_ID, Bezeichnung FROM `produktionsfirma`");
$rows2 = mysqli_fetch_all ($result, MYSQLI_NUM);
?>
<head>
    <h1>Companies</h1>
</head>

<div>
<table width="50%" >
    <tr>
    <th>ID</th>
    <th>Bezeichnung</th>
    </tr>


<?php
// foreach($rows as $row)
foreach($rows2 as $row2)
{
    echo("<tr>");
    // echo("<td>" . $row['id'] . "</td>");
    // echo("<td>" . $row['Vorname'] . "</td>");
    echo("<td>$row2[0]</td>");
    echo("<td>$row2[1]</td>");
    echo("</tr>");
}


?>
</table>
</div>





</html>