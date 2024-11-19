<?php
include('header.php');
include('products.php');
//warenkorb

$bestellID = $_GET["bestellID"];
$idbenutzer = $_GET["idbenutzer"];


echo "bestell id: " .$bestellID ."<br>";
echo "benutzer id: " .$idbenutzer;

?>

<html>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
<script>
    function hinzufügen(productID, bestellID) {

        $.ajax({
            type: "POST", 
            url: "/shop/warenkorb.php", 
            data: {productID : productID, bestellID : bestellID},
            success: function(result){
                if(result){
                    $("#output").html(JSON.parse(result)); //output durch json parse rausgeschrieben
                }
            }

        });
    }
</script>


<body>
    <div>
        <table width="80%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Bewertungen</th>
            </tr>

            <?php
            // foreach($rows as $row)
            foreach ($allproducts as $products) {
                echo ("<tr>");
                echo ("<td>$products[0]</td>");
                echo ("<td>$products[1]</td>");
                echo ("<td>$products[2]</td>");
                echo ("<td><button type='button' onclick='hinzufügen(" . $products[0] . ", ".$bestellID.")'> Hinzufügen </td>");
                echo ("</tr>");
            }

            ?>
        </table>
        <!-- Add navigation button -->
<form action="review.php" method="get" style="margin-top: 20px;">
    <input type="hidden" name="idbenutzer" value="<?= htmlspecialchars($idbenutzer) ?>">
    <button type="submit">Go to Reviews</button>
</form>

</body>
    </div>

<label name="output" id="output"></label>


</html>






<!-- < ?php


$email = $_POST['email'];
$password = $_POST['password'];

$conn = mysqli_connect("localhost", "root", "", "onlineshop");


if ($_POST['action'] == 'Login') {
    login($conn, $email, $password);
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

    login($conn, $email, $password);
   

}
mysqli_close($conn);



function login($conn, $email, $password){

    
                                                                //mit limit 1 wird nur eins ausgegeben
                                                                $sql = "SELECT * FROM `benutzerprofil` where `email` = '$email' AND  `password` = '$password' limit 1;";

                                                                $result = $conn->query($sql);
                                                                $benutzer = mysqli_fetch_array($result); //nur eine zeile wird gefetched
                                                            
                                                                echo "$benutzer[0] $benutzer[1] $benutzer[2] <br>";
                                                                  
                                                            
}
?> -->