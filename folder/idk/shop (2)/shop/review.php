<?php

include('header.php');
include('products.php');

$idbenutzer = $_GET["idbenutzer"];

// Database connection
$conn = mysqli_connect("localhost", "root", "", "onlineshop");

$sql = "SELECT `benutzerprofil`.`idprofil`, `products`.`id`, `products`.`name`, `bestellung`.`idbestellung` 
FROM `bestellung_hat_produkt` 
INNER JOIN bestellung ON bestellung.idbestellung = bestellung_hat_produkt.idbestellung 
INNER JOIN products ON products.id = bestellung_hat_produkt.idprodukt 
INNER JOIN benutzerprofil ON bestellung.idbenutzer = benutzerprofil.idprofil 
WHERE benutzerprofil.idprofil = $idbenutzer";

$result = mysqli_query($conn, $sql);
$allproducts = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Handle form submission
$productID = $_POST["product_id"];
$rating = $_POST["rating"];
$reviewText = $_POST["review_text"];

$sql2 = "SELECT bestellung_hat_produkt.idbestellung 
FROM bestellung_hat_produkt 
INNER JOIN bestellung ON bestellung_hat_produkt.idbestellung = bestellung.idbestellung 
WHERE bestellung_hat_produkt.idprodukt = $productID AND bestellung.idbenutzer = $idbenutzer LIMIT 1";
$result2 = mysqli_query($conn, $sql2);

$sql3 = "INSERT INTO reviews (bewertung, beschreibung, idproduct, idbenutzer) 
VALUES ($rating, '$reviewText', $productID, $idbenutzer)";
$result3 = mysqli_query($conn, $sql3);

$sql4 = "SELECT reviews.idreview, products.name, reviews.bewertung, reviews.beschreibung, reviews.idbenutzer 
FROM reviews 
INNER JOIN products ON reviews.idproduct = products.id 
WHERE reviews.idbenutzer = $idbenutzer";
$result4 = mysqli_query($conn, $sql4);

$reviews = mysqli_fetch_all($result4, MYSQLI_ASSOC);

?>

<html>

<body>
    <h2>Review</h2>

    <form method="POST">
        <label for="product_id">Product:</label>
        <select name="product_id" required>
            <?php foreach ($allproducts as $product): ?>
                <option value="<?= $product['id'] ?>"><?= $product['name'] ?></option>
            <?php endforeach; ?>
        </select>

        <label for="rating">Ratings:</label>
        <input type="number" name="rating" min="1" max="5" required>

        <label for="review_text">Review:</label>
        <textarea name="review_text" required></textarea>

        <button type="submit">Submit</button>
    </form>

    <h2>Your Reviews</h2>

    <table width="80%">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Bewertungen</th>
            <th>Review</th>
            <th>User ID</th>
        </tr>

        <?php foreach ($reviews as $review): ?>
            <tr>
                <td><?= $review['idreview'] ?></td>
                <td><?= $review['name'] ?></td>
                <td><?= $review['bewertung'] ?></td>
                <td><?= $review['beschreibung'] ?></td>
                <td><?= $review['idbenutzer'] ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</body>

</html>
