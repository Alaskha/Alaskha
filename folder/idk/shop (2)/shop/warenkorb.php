<?php
include ('nav.php');

$bestellID = $_POST["bestellID"];
$productID = $_POST["productID"];

$conn = mysqli_connect("localhost", "root", "", "onlineshop");

$sql = "INSERT INTO `bestellung_hat_produkt` (`idbestellung`, `idprodukt`) VALUES ($bestellID, $productID);";
               //wert haben möchte  |   werte geholt werden     |das was ich haben möchte ist nicht im "b_h_p" drinnen | produkt id ist dieselbe wie vom bhp idprodukt
$sql2 = "SELECT `products`.`name`, count(idprodukt) FROM `bestellung_hat_produkt` inner join `products` on `products`.`id` = `bestellung_hat_produkt`.`idprodukt` GROUP BY `products`.`name`;";
$result = mysqli_query($conn, $sql);
$result2 = mysqli_query($conn, $sql2);
$warenkorb = mysqli_fetch_all($result2, MYSQLI_NUM); 



$outputHTML = "<table>
            <tr>
                <th >Name</th>
                <th>Count</th>
                
            </tr>";

            foreach ($warenkorb as $products) {
                $outputHTML .= "<tr>";
                $outputHTML .= "<td >$products[0]</td>";
                $outputHTML .= "<td>$products[1]</td>";
                $outputHTML .= "</tr>";
            }
            $outputHTML .= "</table>";

            echo json_encode($outputHTML);
?>

