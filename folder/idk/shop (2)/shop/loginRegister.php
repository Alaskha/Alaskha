<?php
if ($_POST['action'] == 'Login') {
    //action for update here
    $email = $_POST['email'];
    $password = $_POST['password'];

    $conn = mysqli_connect("localhost", "root", "", "onlineshop");
    //mit limit 1 wird nur eins ausgegeben
    $sql = "SELECT * FROM benutzerprofil where email = '$email' limit 1;";

    $result = $conn->query($sql);
    $benutzer = mysqli_fetch_array($result); //nur eine zeile wird gefetched

    $sql2 = "INSERT INTO `bestellung` (`idbestellung`, `datum`, `idbenutzer`) VALUES (NULL, (now()), $benutzer[0]);";
    $sql3 = "SELECT `idbestellung` FROM `bestellung` where `datum` = (now()) AND `idbenutzer` = $benutzer[0];";

    $result = mysqli_query($conn, $sql2);

    $result = mysqli_query($conn, $sql3);
    $bestellung = mysqli_fetch_array($result); //nur eine zeile wird gefetched

    mysqli_close($conn);

    echo "$benutzer[0] $benutzer[1] $benutzer[2] <br>";
    header('Location: http://localhost:80/shop/bestellungen.php?idbenutzer=' . $benutzer[0] . '&bestellID=' . $bestellung[0], true, 303);
    die();
} else if ($_POST['action'] == 'Register') {
    $email = $_POST['email'];
    $password = $_POST['password'];


    // Create connection
    $conn = mysqli_connect("localhost", "root", "", "onlineshop");
    //if i want it to start the id with 2000, 
    //create the user in the site, then replace 2000 again with NULL
    //either create it first with insert in the db or write 2000 instead of NULL, 
    $sql = "INSERT INTO `benutzerprofil` (`idprofil`, `email`, `password`) VALUES (NULL, '$email', '$password');";

    $result = mysqli_query($conn, $sql);

  //  $sql2 = "SELECT * FROM benutzerprofil where email = '$email' limit 1;";
  //  $result = $conn->query($sql2);

   // $benutzer = mysqli_fetch_array($result); //nur eine zeile wird gefetched

  //  $sql3 = "SELECT `idbestellung` FROM `bestellung` where `datum` = (now()) AND `idbenutzer` = $benutzer[0];";

  //  $result = mysqli_query($conn, $sql3);
  //  $bestellung = mysqli_fetch_array($result);
    mysqli_close($conn);

   // echo "$benutzer[0] $benutzer[1] $benutzer[2] <br>";

  //  header('Location: http://localhost:80/shop/bestellungen.php?idbenutzer=' . $benutzer[0] . '&bestellID=' . $bestellung[0], true, 303);
   // die();
}
