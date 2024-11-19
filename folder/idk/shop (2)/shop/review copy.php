<?php
include('header.php');

$idbenutzer = $_GET['idbenutzer'];
$conn = mysqli_connect("localhost", "root", "", "onlineshop");

$sql = "SELECT DISTINCT products.id, products.name FROM bestellung_hat_produkt INNER JOIN bestellung ON bestellung_hat_produkt.idbestellung = bestellung.idbestellung INNER JOIN products ON bestellung_hat_produkt.idprodukt = products.id WHERE bestellung.idbenutzer = $idbenutzer";
$result = mysqli_query($conn, $sql);
$purchasedProducts = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $productID = $_POST['product_id'];
    $rating = $_POST['rating'];
    $reviewText = mysqli_real_escape_string($conn, $_POST['review_text']); // Sanitize input

    // Check if the product belongs to the user
    $sql2 = "
        SELECT b.idbestellung
        FROM bestellung_hat_produkt bhp
        INNER JOIN bestellung b ON bhp.idbestellung = b.idbestellung
        WHERE bhp.idprodukt = $productID AND b.idbenutzer = $idbenutzer
        LIMIT 1
    ";
    $result2 = mysqli_query($conn, $sql2);

    if (mysqli_num_rows($result2) > 0) {
        // Insert the review
        $sql3 = "
            INSERT INTO reviews (bewertung, beschreibung, idproduct, idbenutzer)
            VALUES ($rating, '$reviewText', $productID, $idbenutzer)
        ";
        $result3 = mysqli_query($conn, $sql3);
        if ($result3) {
            echo "Review submitted successfully!";
        } else {
            echo "Error: " . mysqli_error($conn);
        }
    } else {
        echo "You cannot review this product as it is not associated with your purchases.";
    }
}
?>

<html>
<body>
<h2>Submit a Review</h2>

<!-- Dropdown to select purchased products -->
<form method="POST">
    <label for="product_id">Select Product:</label>
    <select name="product_id" required>
        <?php foreach ($purchasedProducts as $product): ?>
            <option value="<?= $product['id'] ?>"><?= htmlspecialchars($product['name']) ?></option>
        <?php endforeach; ?>
    </select>

    <label for="rating">Rating (1-5):</label>
    <input type="number" name="rating" min="1" max="5" required>

    <label for="review_text">Review:</label>
    <textarea name="review_text" required></textarea>

    <button type="submit">Submit Review</button>
</form>

</body>
</html>
