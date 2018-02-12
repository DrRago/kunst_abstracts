<?php
$servername = 'localhost';
$username = 'admin';
$password = '******';
$database = 'Kunst';

mysql_connect($servername, $username, $password);

mysql_select_db($database);

mysql_set_charset('utf8');

function getImageLeft($id)
{
    $result = mysql_query("SELECT `amount` FROM `tbl_sold` WHERE abstract_id = $id AND active = 1");
    $images_left = mysql_fetch_assoc(mysql_query("SELECT `img_sell_count` as img FROM `tbl_abstract` WHERE id = $id"))["img"];

    while ($r = mysql_fetch_assoc($result)) {
        $images_left -= $r["amount"];
    }
    return $images_left;
}