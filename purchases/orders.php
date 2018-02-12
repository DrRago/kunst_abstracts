<?php
session_start();
if (!isset($_SESSION["email"]) | !isset($_SESSION["login"]) | $_SESSION["login"] != true | !isset($_SESSION["active"])) {
    header("Location: index.php");
    exit;
}
require "../scripts/connect.php";

$email = $_SESSION["email"];

$admin = false;

if (mysql_fetch_assoc(mysql_query("SELECT active FROM tbl_sold WHERE email = '$email'"))["active"] == "3") {
    $sql = mysql_query("SELECT title as abstract, tbl_abstract.id as abs_id, tbl_sold.id as id, author, amount, message, active, email FROM tbl_sold JOIN tbl_abstract ON tbl_sold.abstract_id=tbl_abstract.id WHERE email != '$email'");
    $admin = true;
    if ($sql) {
        $result = array();


        while ($r = mysql_fetch_assoc($sql)) {
            array_push($result, $r);
        }
    }
} else {
    $sql = mysql_query("SELECT title as abstract, tbl_abstract.id as abs_id, tbl_sold.id as id, author, amount, message, active, email FROM tbl_sold JOIN tbl_abstract ON tbl_sold.abstract_id=tbl_abstract.id WHERE email = '$email'");

    if ($sql) {
        $result = array();

        while ($r = mysql_fetch_assoc($sql)) {
            array_push($result, $r);
        }
    }
}
?>
<html>
<head>
    <title>Meine Bestellungen</title>

    <link rel="shortcut icon" type="image/png" href="../img/favicon.png"/>

    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">

    <div class="row mb-5">
        <h3 class="col"><?= $_SESSION["email"] ?></h3>
        <div class="col text-right">
            <a class="btn btn-secondary" href="../" role="button"><i class="fa fa-list-alt" aria-hidden="true"></i> Übersicht</a>
            <a class="btn btn-secondary" href="../scripts/logout.php" role="button"><i class="fa fa-sign-out" aria-hidden="true"></i> Abmelden</a>

        </div>
    </div>


    <table class="table table-hover">
        <thead>
        <tr>
            <th>Abstract Titel</th>
            <th>Künstler</th>
            <th>Besteller</th>
            <th>Anzahl</th>
            <th>Nachricht</th>
            <th>Status</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($result as $value) {
            if ($admin) {
                $button = "Abschließen";
                $btn_class = "btn-outline-primary";
                $btn_url = "../scripts/close.php";
            } else {
                $button = "Stornieren";
                $btn_class = "btn-outline-danger";
                $btn_url = "../scripts/storno.php";
            }
            $status = "";
            $class = "";
            $disable = "";
            switch ($value["active"]) {
                case "2":
                    $status = "Abgeschlossen";
                    $class = "table-active";
                    $disable = "disabled";
                    break;
                case "1":
                    $status = "Aktiv";
                    $class = "table-info";
                    break;
                case "0":
                    $status = "Storniert";
                    $class = "table-danger";
                    $disable = "disabled";
                    break;
            }
            echo "<tr class='$class'><td><a href='../?id=$value[abs_id]'>$value[abstract]</a></td><td>$value[author]</td><td>$value[email]</td><td>$value[amount]</td><td>$value[message]</td><td>$status</td><td><form action='$btn_url' method='post' style='margin-bottom: 0'><input name='id' value='$value[id]' hidden><button type='submit' role='button' class='btn $btn_class btn-sm' $disable>$button</button></form></td></tr>";
        }
        ?>
        </tbody>
    </table>
</div>
</body>
</html>