<?php

$prodfirma = $_POST["prodfirma"];

$conn = mysqli_connect('localhost', 'root', '', 'eigene_filmverwaltung');

if($conn -> connect_error){
    echo "Connection failed: ".$conn -> connect_error;
}

$sql = "SELECT Filmtitel FROM `films` 
INNER JOIN produktionsfirma on films.idprodfirma = produktionsfirma.idprodfirma
WHERE produktionsfirma.Filmstudio LIKE '%$prodfirma%'";

$result = $conn -> query($sql);
$rowFilmtitel = mysqli_fetch_all($result, MYSQLI_NUM);

$outputhtml = "<table>
  <thead>
    <tr>
      <th>Filmtitel</th>
    </tr>
  </thead>
  <tbody>";
  foreach($rowFilmtitel as $filmtitel){
$outputhtml .= "
    <tr>
      <td>".$filmtitel[0]."</td>
    </tr>";
  }
$outputhtml .= "
  </tbody>
</table>
";
echo json_encode($outputhtml);

?>


