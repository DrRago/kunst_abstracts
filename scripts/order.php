<?php
require "connect.php";

$id = $_POST["abstract"];
$email = $_POST["email"];
$password = hash("sha512", $_POST["password"]);
$amount = $_POST["amount"];
$msg = $_POST["msg"];
$price = $_POST["price_add"];

if (is_numeric($price)) {

    if ($price < 0) {
        $price *= -1;
    }


    if (getImageLeft($id) < $amount) {
        header("Location: ../index.php?id=$id&error=1");
        exit;
    }

    $standard = mysql_fetch_assoc(mysql_query("SELECT `price` FROM `tbl_abstract` WHERE `id` = '$id'"))["price"];

    $sql = mysql_query("INSERT INTO `tbl_sold`(`abstract_id`, `amount`, `email`, `message`, `password`, `price`, `surcharge`) VALUES ('$id', '$amount', '$email', '$msg', '$password', '$standard', '$price')");

    if (!$sql) {
        header("Location: ../index.php?id=$id&error=" . mysql_error());
        exit;
    }

    header("Location: ../index.php?id=$id&error=2");
} else {
    echo "Get out of here";
}