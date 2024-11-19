<?php

$conn = mysqli_connect("localhost", "root", "", "onlineshop");
$sql = "SELECT * FROM `products`;";

$result = $conn->query($sql);
$allproducts = mysqli_fetch_all($result, MYSQLI_NUM); 





?>