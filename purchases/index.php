<?php
session_start();
if (!(!isset($_SESSION["email"]) | !isset($_SESSION["login"]) | $_SESSION["login"] != true | !isset($_SESSION["active"]))) {
    header("Location: orders.php");
    exit;
}
?>
<html>
<head>
    <title>Meine Käufe - Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=0.5">

    <link rel="shortcut icon" type="image/png" href="../img/favicon.png"/>

    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <style>
        form {
            max-width: 400px;
            padding: 15px;
            margin: 0 auto;
        }

        form .form-signin-heading {
            margin-bottom: 10px;
        }

        form .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        form .form-control:focus {
            z-index: 2;
        }

        form input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        form input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="container my-2">
        <div class="text-center col col-md-offset-1">
            <a class="btn btn-secondary mb-2" href="/kunst/" role="button"><i class="fa fa-list-alt"
                                                                              aria-hidden="true"></i> Übersicht</a>
        </div>
    </div>

    <form method="post" action="../scripts/login.php">
        <?php if ($_GET["error"] == "1") {
            echo "<div class=\"alert alert-danger\" role=\"alert\">
            <strong>Fehler!</strong> Falsche E-Mail-Adresse oder flasches Passwort
        </div><script>window.history.pushState('', '', window.location.href.split('?error')[0]);</script>";
        } else if (isset($_GET["error"]) && $_GET["error"] != "2") {
            echo "<div class='alert alert-danger' role='alert' >
                    <strong> Fehler! </strong > $_GET[error]
                    </div><script>window.history.pushState('', '', window.location.href.split('?error')[0]);</script>";
        }
        ?>

        <h2 class="form-signin-heading">Bitte melden Sie sich an</h2>
        <label for="inputEmail" class="sr-only">E-Mail-Ad­res­se</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="E-Mail-Ad­res­se"
               required autofocus>
        <label for="inputPassword" class="sr-only">Passwort</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Passwort"
               required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Anmelden</button>
        <small class="text-muted">Bei Fragen wenden Sie sich bitte an <a href="mailto:leonhard.gahr@gmail.com">leonhard.gahr@gmail.com</a>
        </small>
    </form>
</div>
</body>
</html>