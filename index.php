<?php
require "scripts/connect.php";


// catch pdf parameter and replace it with id
if (isset($_GET["pdf"]) && is_numeric($_GET["pdf"])) {
    header("Location: https://www.tandashi.de/kunst/?id=$_GET[pdf]");
}

$img = array("img/placeholder.png");

$img_width = 49;

if (isset($_GET["id"]) && is_numeric($_GET["id"])) {

    if ($_GET["id"] < 1) {
        header("Location: https://www.tandashi.de/kunst/");
        exit;
    }

    $overview = false;

    $url = $_GET["id"];

    $result = mysql_fetch_assoc(mysql_query("SELECT title, tbl_material.material, topic, content, author, class, price FROM `tbl_material` JOIN tbl_abstract ON tbl_abstract.material = tbl_material.id WHERE tbl_abstract.id = $url"));

    if (file_exists("img/$url" . "_1.jpg")) {
        $img = array("img/$url" . "_1.jpg", "img/$url" . "_2.jpg");
    }

    if (file_exists("img/$url.jpg")) {
        $img = array("img/$url.jpg");
    }

    if (!$result) {
        header("Location: https://www.tandashi.de/kunst/");
        exit;
    }

    $found_next = false;

    $count = 0;

    $next = mysql_query("SELECT id FROM tbl_abstract");

    $next_count = false;

    $obj = array();

    while ($r = mysql_fetch_assoc($next)) {
        $found_next = $r["id"] == $url;
        $obj[$count] = $r;
        if ($found_next) {
            $next_count = $count;
        }
        $count++;
    }

    $next = false;
    if (isset($obj[$next_count + 1])) {
        $next = $obj[$next_count + 1]["id"];
    }

    $prev = false;
    if (isset($obj[$next_count - 1])) {
        $prev = $obj[$next_count - 1]["id"];
    }


    $amount = getImageLeft($url);

} else {
    $overview = true;
    $sql = "SELECT id, title, author, class FROM tbl_abstract";

    $result = mysql_query($sql);
}
?>
<html>
<head>
    <title>Abstract<?php if ($overview) {
            echo " Overview";
        } else {
            echo ": $result[title] - $result[author]";
        } ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=0.5">

    <link rel="shortcut icon" type="image/png" href="img/favicon.png"/>

    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>

    <style>
        .price {
            background-color: inherit !important;
            padding-right: 0;
            border-right: none !important;
            -webkit-transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
            -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
            font-family: sans-serif;
        }

        .fa-arrow-down, .buy-arrow {
            transition-duration: .5s
        }

        .rotate-180 {
            -moz-transform: rotate(-180deg);
            -webkit-transform: rotate(-180deg);
            -o-transform: rotate(-180deg);
            -ms-transform: rotate(-180deg);
        }

        @media screen and (max-width: 800px) {
            .container {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<?php if ($overview) { // condition if the overview should be shown ?>
    <div class="container text-center mt-2">
        <a class="btn btn-secondary" href="purchases/" role="button"><i class="fa fa-shopping-cart"
                                                                        aria-hidden="true"></i> Käufe</a>
    </div>
    <div class="container mt-2">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>Titel</th>
                <th>Künstler</th>
                <th>Klasse</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $count = 0;
            while ($r = mysql_fetch_assoc($result)) {
                $count++;
                echo "<tr onclick='window.location.href=\"?id=$count\"'><td>$r[id]</td><td><a href='?id=$r[id]'>$r[title]</a></td><td>$r[author]</td><td>$r[class]</td></tr>";
            }
            ?>
            </tbody>
        </table>
    </div>
    <style>
        .table tbody tr:hover {
            cursor: pointer;
        }

        @media screen and (max-width: 800px) {
            .container {
                width: 100%;
            }
        }
    </style>
<?php } else { ?>
    <div class="container my-2">
        <div class="row">
            <div class="text-center col col-md-offset-1">
                <?php if (isset($prev) && $prev) {
                    echo "<a title='Vorheriges Abstract' role=\"button\" class=\"btn btn-secondary mb-2 fa fa-step-backward\" href='?id=", $prev, "'></a>";
                } ?>
                <a class="btn btn-secondary mb-2" href="/kunst/" role="button"><i class="fa fa-list-alt"
                                                                                  aria-hidden="true"></i> Übersicht</a>
                <a class="btn btn-secondary mb-2" href="embeded.php?id=<?= $_GET["id"] ?>" role="button"
                   target="_blank"><i
                            class="fa fa-print" aria-hidden="true"></i> Drucken</a>
                <?php
                if (isset($next) && $next) { ?>
                    <a title='Nächstes Abstract' role='button' class='btn btn-secondary mb-2 fa fa-step-forward'
                       href='?id=<?= $next ?>'></a>
                <?php } ?>

            </div>
            <a class="btn btn-secondary mb-2 mr-3" href="purchases/" role="button"><i class="fa fa-shopping-cart"
                                                                                      aria-hidden="true"></i> Käufe</a>
        </div>

        <?php
        echo "<div class='card'><div class='card-block text-justify'><h1 class='title'>$result[title]</h1>";
        echo "<p class='material'>$result[material]</p>";
        echo "<p class='topic'>$result[topic]</p>";
        echo "<br><br>$result[content]<p>$result[author], $result[class]</p></div></div></div>";
        ?>
    </div>
    <div class="container text-center mb-2">
        <?php if ($amount > 0 | $_GET["error"] == "1") { ?>
            <div class="card text-center px-3">
                <div class="card-block">
                    <div class="alert alert-info" style="display: inline-table">
                    <?php if ($amount == 1) {
                        echo "Es steht noch eins dieser Bilder zum Verkauf";
                    } else {
                        echo "Es stehen noch $amount dieser Bilder zum Verkauf";
                    }
                    ?>
                    </div>
                    <p role="button" onclick="$('.buy-arrow').toggleClass('rotate-180');$('.infotext').slideToggle()">
                        Warum sollte ich ein Bild kaufen? <i class="buy-arrow fa">▼</i></p>
                    <div class="infotext text-justify" style="display: none">
                        <p>Die Erlöse aus dem Verkauf der einzelnen Werke gehen nicht zu 100% an den
                            Künstler, sondern werden wie Folgt aufgeteilt:</p>
                        <div class="container" style="width: 40%;">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th scope="row">10%</th>
                                    <td><a href="https://www.dkms.de/de/grundlegende-informationen" target="_blank">DKMS
                                            Spendenlauf</a></td>
                                </tr>
                                <tr>
                                    <th scope="row">40%</th>
                                    <td>Künstlerentscheidung</td>
                                </tr>
                                <tr>
                                    <th scope="row">50%</th>
                                    <td>Nachfolgeprojekt & Materialkosten</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <p>Sollten Sie sich dafür entscheiden, mehr als den Standardpreis für ein Bild zu
                            zahlen, können Sie entscheiden, was mit der überschüssigen Summe geschieht, oder sie wird,
                            wie oben genannt, aufgeteilt.</p>
                    </div>
                    <a class="btn btn-secondary" role="button"
                       onclick="$('form').slideToggle(); $('.fa-arrow-down').toggleClass('rotate-180');"><i
                                class="fa fa fa-shopping-cart"
                                aria-hidden="true"></i> Kaufen <i class="fa fa-arrow-down" aria-hidden="true"></i></a>
                </div>
                <form style="display: none;" class="text-left" method="post" action="scripts/order.php">
                    <input name="abstract" style="display: none" value="<?= $url ?>">
                    <div class="form-group">
                        <label for="inputEmail">E-Mail-Ad­res­se</label>
                        <input required type="email" name="email" class="form-control" id="inputEmail"
                               aria-describedby="emailHelp"
                               placeholder="E-Mail-Ad­res­se">
                        <small id="emailHelp" class="form-text text-muted">Ihre E-Mail-Ad­res­se wird nicht
                            veröffentlicht!
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Passwort</label>
                        <input required type="password" name="password" class="form-control" id="exampleInputPassword"
                               aria-describedby="passwordHelp" placeholder="Passwort">
                        <small id="passwordHelp" class="form-text text-muted">Das Passwort wird benötigt, damit Sie Ihre
                            Bestellung ändern können (Bei mehreren Bestellungen können Sie das gleiche Passwort
                            verwenden). Ihr Passwort wird außerdem mit der kryptologischen Hashfunktion <a
                                    href="https://en.wikipedia.org/wiki/SHA-2">SHA-512</a> verschlüsselt. Es wird
                            verschlüsselt in der Datenbank gespeichert!
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="amount">Anzahl</label>
                        <select class="form-control" name="amount" id="amount">
                            <?php for ($i = 1; $i <= $amount; $i++) echo "<option>$i</option>" ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="price_add">Preis pro Stück</label>
                        <div class="input-group">
                            <span class="input-group-addon">Standardpreis + Ihr Zuschlag: </span>
                            <span id="price_add_span" class="input-group-addon price"><?= $result["price"] ?>€ +&nbsp;</span>
                            <input required type="number" class="form-control" style="border-left: none; padding-left: 0 !important;"
                                   aria-describedby="priceHelp" name="price_add" id="price_add"
                                   placeholder="Optionaler Preis" min="0" value="0">
                        </div>
                        <small id="priceHelp" class="form-text text-muted">Der eingegebene Preis wird dem Standardpreis
                            hinzugefügt, wenn Sie den Wunsch haben, uns mehr zu unterstützen.
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="message">Besondere Wünsche (z.B. Farbe) oder Anmerkungen</label>
                        <textarea class="form-control" name="msg" id="message" rows="3"></textarea>
                    </div>
                    <?php if ($_GET["error"] == "1") {
                        echo "<div id='alert' class='alert alert-danger' role='alert' >
                    <strong > Etwas ist schief gegangen! </strong > Ihre gewünschte Anzahl des Bildes steht leider nicht mehr zur Verfügung
                    </div><script>$('form').slideToggle();window.history.pushState('', '', window.location.href.split('&error')[0]);</script>";
                    } else if (isset($_GET["error"]) && $_GET["error"] != "2") {
                        echo "<div id='alert' class='alert alert-danger' role='alert' >
                    <strong> Fehler! </strong > $_GET[error]
                    </div><script>$('form').slideToggle();window.history.pushState('', '', window.location.href.split('&error')[0]);</script>";
                    }
                    ?>
                    <button type="submit" role="button" class="btn btn-primary">Bestellen (Unverbindlich)</button>
                </form>
            </div>

        <?php } else { ?>
            <div class="alert alert-danger" role="alert">
                <strong>Schade!</strong> Dieses Bild steht leider nicht mehr zum Verkauf
            </div>
        <?php }
        if ($_GET["error"] == "2") {
            echo "<div id='alert' class='alert alert-success mt-2' role='alert' >
                    <strong> Bestellung erfolgreich! </strong > Sie können unter <a href='purchases/'>https://www.tandashi.de/kunst/purchases/</a> Ihre akutellen Bestellungen einsehen
                    </div><script>window.history.pushState('', '', window.location.href.split('&error')[0]);</script>";
        }
        ?>
    </div>

    <div class="container image" style="width: 400px; display: none;">
        <div class="row">
            <?php
            foreach ($img as $value) {
                ?>
                <img src="https://tandashi.de/kunst/<?= $value ?>" class="img-thumbnail"
                     style="width: <?= $img_width ?>%; <?php if (end($img) != $value) {
                         echo "margin-right: 2%;";
                     } ?>">
                <?php
            }
            ?>
            <?php if (count($img) > 1) { ?>
                <script>
                    $(".image").show();

                    var cw = $(".card").width();
                    $(".image").css({'width': cw + "px"});

                    var cw = $('.img-thumbnail').width();
                    $('.img-thumbnail').css({'height': cw + 'px'});

                    $(window).resize(function () {
                        var cw = $(".card").width();
                        $(".image").css({'width': cw + "px"});

                        var cw = $('.img-thumbnail').width();
                        $('.img-thumbnail').css({'height': cw + 'px'});
                    });
                </script>
            <?php } else { ?>
                <script>

                    var cw = $(".card").width() * <?=$img_width / 100?>;
                    $(".image").css({'width': cw + "px", 'height': cw + 'px'});

                    $('.img-thumbnail').css({'width': '100%', 'height': '100%'});

                    $(window).resize(function () {
                        var cw = $(".card").width() * <?=$img_width / 100?>;
                        $(".image").css({'width': cw + "px", 'height': cw + 'px'});
                    });
                    $(".image").show();
                </script>
            <?php } ?>
        </div>
    </div>

    <script>
        document.addEventListener('touchstart', handleTouchStart, false);
        document.addEventListener('touchmove', handleTouchMove, false);
        var xDown = null;
        var yDown = null;
        function handleTouchStart(evt) {
            xDown = evt.touches[0].clientX;
            yDown = evt.touches[0].clientY;
        }
        function handleTouchMove(evt) {
            if (!xDown || !yDown) {
                return;
            }

            var xUp = evt.touches[0].clientX;
            var yUp = evt.touches[0].clientY;

            var xDiff = xDown - xUp;
            var yDiff = yDown - yUp;
            if (Math.abs(xDiff) + Math.abs(yDiff) > 150) { //to deal with to short swipes

                if (Math.abs(xDiff) > Math.abs(yDiff)) {/*most significant*/
                    if (xDiff > 0) {/* left swipe */
                        <?php if ($next) { ?>
                        window.location.href = "?id=<?=$next?>";
                        <?php } ?>
                    } else {/* right swipe */
                        <?php if ($prev) { ?>
                        window.location.href = "?id=<?=$prev?>";
                        <?php } ?>
                    }
                } else {
                    if (yDiff > 0) {/* up swipe */
                        // window.location.href = "https://www.tandashi.de/kunst/"
                    }
                }
                /* reset values */
                xDown = null;
                yDown = null;
            }
        }

        $("#price_add").focus(function () {
            $("#price_add_span").css({"border-color": "#5cb3fd"})
        });
        $("#price_add").focusout(function () {
            $("#price_add_span").css({"border-color": "rgba(0, 0, 0, 0.15)"})
        });

        $(function(){
            $('#price_add').keyup(function(){
                if (($("#price_add").val().substring(0, 1)) === "-") {
                    $("#price_add").val($("#price_add").val().substring(1))
                }
            });
        });

        $("html, body").animate({ scrollTop: $('#alert').offset().top }, 1000);
    </script>
<?php } ?>
</body>
</html>