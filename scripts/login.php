<?php
require "connect.php";

$email = $_POST["email"];
$password = hash("sha512", $_POST["password"]);

$sql = mysql_query("SELECT * FROM tbl_sold WHERE password = '$password' AND email = '$email'");


if ($sql) {
    $result = array();

    $active = 1;

    while ($r = mysql_fetch_assoc($sql)) {
        array_push($result, $r);
        if ($r["active"] == "2") $active = 2;
    }
    if (count($result) != 0) {
        session_start();
        $_SESSION["email"] = $email;
        $_SESSION["login"] = true;
        $_SESSION["active"] = $active;
        header("Location: ../purchases/orders.php");
    } else {
        header("Location: ../purchases/?error=1");
    }
} else {
    header("Location: ../purchases/?error=" . mysql_error());
    exit;
}
