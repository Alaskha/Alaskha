<?php
if ($_POST['action'] == 'Login') {
    //action for update here
    $email = $_POST['email'];
    $password = $_POST['password'];

    $conn = mysqli_connect("localhost", "root", "", "onlineshop");
                                                              //mit limit 1 wird nur eins ausgegeben
    $sql = "SELECT * FROM `benutzerprofil` where `email` = '$email' limit 1;";

    $result = $conn->query($sql);
    $benutzer = mysqli_fetch_array($result); //nur eine zeile wird gefetched
   

    mysqli_close($conn);

    echo "$benutzer[0] $benutzer[1] $benutzer[2] <br>";
    header('Location: http://localhost:80/shop/review.php?idbenutzer=' . $benutzer[0] , true, 303);
    die();
} 