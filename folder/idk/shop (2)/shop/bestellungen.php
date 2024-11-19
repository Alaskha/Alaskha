<?php
include('header.php');
include('products.php');
//warenkorb

$bestellID = $_GET["bestellID"];
$idbenutzer = $_GET["idbenutzer"];


echo "bestell id: " . $bestellID . "<br>";
echo "benutzer id: " . $idbenutzer;

?>

<html>
<style>
    table,
    th,
    td {
        border: 1px solid black;
    }
</style>
<script>
    function hinzufügen(productID, bestellID) {

        $.ajax({
            type: "POST",
            url: "/shop/warenkorb.php",
            data: {
                productID: productID,
                bestellID: bestellID
            },
            success: function(result) {
                if (result) {
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
                echo ("<td><button type='button' onclick='hinzufügen(" . $products[0] . ", " . $bestellID . ")'> Hinzufügen </td>");
                echo ("</tr>");
            }

            //actors

            ?>
        </table>

        <!-- Navigation button to reviews -->
        <form action="review.php" method="get" style="margin-top: 20px;">
            <input type="hidden" name="idbenutzer" value="<?= $idbenutzer ?>"> 
            <button  type="submit">Reviews</button>
        </form>
    </div>

    <label name="output" id="output"></label>
</body>

</html>