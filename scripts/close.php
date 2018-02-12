<?php
session_start();

if (!isset($_SESSION["email"]) | !isset($_SESSION["login"]) | $_SESSION["login"] != true | !isset($_SESSION["active"])) {
    header("Location: ../index.php");
    exit;
}

require "connect.php";

$id = $_POST["id"];

$validate = mysql_fetch_assoc(mysql_query("SELECT email FROM tbl_sold WHERE id = '1'"))["email"] == $_SESSION["email"];

if (!$validate) {
    header("Location: ../index.php");
    exit;
}

$sql = mysql_query("UPDATE tbl_sold SET active = '2' WHERE id = $id");

header("Location: ../purchases/orders.php");