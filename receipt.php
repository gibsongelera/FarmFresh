// receipt.php
<?php
include("header.php");

if(!isset($_SESSION["username"])){
    header("location:index.php");
}
include 'config.php';

$order_id = $_GET['order_id'];

$result = $mysqli->query("SELECT o.*, p.product_name, p.price FROM orders o INNER JOIN products p ON o.product_code = p.product_code WHERE o.id='".$order_id."'");

if($result) {
    $obj = $result->fetch_object();
    ?>
    <div class="row" style="margin-top:10px;">
        <div class="large-12">
            <h3>Receipt for Order #<?php echo $obj->id; ?></h3>
            <hr>
            <p><strong>Date of Purchase</strong>: <?php echo $obj->date; ?></p>
            <p><strong>Product Code</strong>: <?php echo $obj->product_code; ?></p>
            <p><strong>Product Name</strong>: <?php echo $obj->product_name; ?></p>
            <p><strong>Price Per Unit</strong>: <?php echo $obj->price; ?></p>
            <p><strong>Units Bought</strong>: <?php echo $obj->units; ?></p>
            <p><strong>Total Cost</strong>: <?php echo $currency.$obj->total; ?></p>
            <?php if ($_SESSION["type"] == "admin") echo '<p><strong>Customer Email Id</strong>: '.$obj->email.'</p>'; ?>
            <p><hr></p>
            <button class="button [secondary success alert]" onclick="window.print()">Print Receipt</button>
        </div>
    </div>
    <?php
}
include("footer.php");
?>