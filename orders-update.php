<?php
// Include the database connection file
include 'config.php';

// Check if the product ID is set in the URL
if (isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];
} else {
    echo 'Error: Product ID is not set';
    exit;
}

// Get the product description from the database
$result = $mysqli->query("SELECT * FROM products WHERE id = '$product_id'");

// Check if the query was successful
if ($result) {
    // Get the product description from the query result
    $product_desc = $result->fetch_object()->description;

    // Check if the order details are set in the form
    if (isset($_POST['order_id']) && isset($_POST['product_code']) && isset($_POST['units']) && isset($_POST['total'])) {
        $order_id = $_POST['order_id'];
        $product_code = $_POST['product_code'];
        $units = $_POST['units'];
        $total = $_POST['total'];

        // Create a prepared statement to update the order
        $stmt = $mysqli->prepare("UPDATE orders SET product_code = ?, units = ?, total = ?, product_desc = ? WHERE id = ?");

        // Bind the parameters to the prepared statement
        $stmt->bind_param("sssss", $product_code, $units, $total, $product_desc, $order_id);

        // Execute the prepared statement
        $stmt->execute();

        // Check if the update was successful
        if ($stmt->affected_rows > 0) {
            // Redirect to the orders page
            header('Location: orders.php');
            exit;
        } else {
            // Display an error message
            echo 'Error updating order';
        }
    } else {
        echo 'Error: Order details are not set';
    }
} else {
    // Display an error message
    echo 'Error retrieving product description';
}

// Close the database connection
$mysqli->close();
?>