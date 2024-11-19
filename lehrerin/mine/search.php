<?php

include('header.php');
include('nav.php');
include('connect.php')

?>


<html>
<div class="input-group rounded">
    <nav class="navbar ">
        <a class="navbar-brand">Suche nach Produktionsfilm: </a>
        <form class="form-inline" method="post">
          <input class="form-control mr-sm-2" type="search" name="search" id="search" placeholder="Search" >
          <button href="search.php" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </nav>

<?php
$search = $_POST['search'];

$sql = "SELECT * FROM `produktionsfirma` WHERE Bezeichnung LIKE '%$search%';";

$result = $conn->query($sql);

if ($result->num_rows > 0){
    while($row = $result->fetch_assoc() ){
        echo $row["Bezeichnung"]. "<br>";
    }
    } else {
        echo "0 records";
    }

?>



    </html>