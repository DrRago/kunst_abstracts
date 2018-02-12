<?php
require "scripts/connect.php";

$img = array("img/placeholder.png");

$img_width = 49;

if (isset($_GET["id"]) && is_numeric($_GET["id"])) {
    $overview = false;

    $url = $_GET["id"];

    $result = mysql_fetch_assoc(mysql_query("SELECT title, tbl_material.material, topic, content, author, class FROM `tbl_material` JOIN tbl_abstract ON tbl_abstract.material = tbl_material.id WHERE tbl_abstract.id = $url"));

    if (file_exists("img/$url" . "_1.jpg")) {
        $img = array("img/$url" . "_1.jpg", "img/$url" . "_2.jpg");
    }

    if (file_exists("img/$url.jpg")) {
        $img = array("img/$url.jpg");
    }
} else {
    echo "<script>window.close()</script>";
    exit;
}
?>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>
    <title>Abstract<?=": $result[title] - $result[author]"?></title>
    <script src="js/jquery.js"></script>
</head>
<body>
<div class="container my-2 cont">
    <?php
    echo "<div class='text-justify'><h1 class='title'>$result[title]</h1>";
    echo "<p class='material'>$result[material]</p>";
    echo "<p class='topic'>$result[topic]</p>";
    echo "<br><br>$result[content]<p>$result[author], $result[class]</p></div></div></div>";
    ?>
</div>
<div class="container image text-center" style="width: 610px; display: none;">
    <div class="row" style="width: 610px">
        <?php
        foreach ($img as $value) {
            ?>
            <img src="https://tandashi.de/kunst/<?= $value ?>" class="img-thumbnail"
                 style="width: 300px; <?php if (end($img) != $value) {
                     echo "margin-right: 10px;";
                 } ?>">
            <?php
        }
        ?>
        <?php if (count($img) > 1) { ?>
            <script>
                $(".image").show();

                var cw = $('.img-thumbnail').width();
                $('.img-thumbnail').css({'height': cw + 'px'});
            </script>
        <?php } else { ?>
            <script>
                var cw = $(".cont").width() * <?=$img_width / 100?>;
                $(".image").css({'width': cw + "px", 'height': cw + 'px'});

                $(".row").removeAttr("style");

                $('.img-thumbnail').css({'width': '100%', 'height': '100%'});
                $(".image").show();
            </script>
        <?php } ?>
    </div>
</div>
<script>
    history.pushState(null, null, "index.php?id=<?=$url?>");
    window.print();
</script>
</body>
</html>