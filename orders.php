<?php
// ...

$result = null;
if ($_SESSION["type"] == "user") {
    $user = $_SESSION["username"];
    $result = $mysqli->query("SELECT o.*, p.product_name, p.price FROM orders o INNER JOIN products p ON o.product_code = p.product_code WHERE o.email = '$user'");
} else {
    $result = $mysqli->query("SELECT o.*, p.product_name, p.price FROM orders o INNER JOIN products p ON o.product_code = p.product_code");
}

// ...

while ($obj = $result->fetch_object()) {
    // ...
    echo '<p><a href="receipt.php?order_id=' . $obj->id . '" class="button [secondary success alert]">View Receipt</a></p>';
    // ...
}
?>