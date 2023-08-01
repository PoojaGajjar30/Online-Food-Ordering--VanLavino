<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>Login</title>
    <link rel = "icon" href ="/vanlavino/img/logo.jpg" type = "image/x-icon">

<style>
   body {
        background-color: #f7f7f7;
        font-family: Arial, sans-serif;
    }

    main {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .card {
        width: 650px;
        height: 500px;
        max-width: 90%;
        max-height: 90%;
        background-color: #fff;
        border: none;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);}

    .logo {
        text-align: center;
        margin-bottom: 20px;
    }

    .logo img {
        max-width: 300px;
        height: auto;
    }

    .card-title {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .form-group label {
        font-weight: bold;
    }

    .btn-login {
        background-color: #007bff;
        color: #fff;
        width: 100%;
    }

    .btn-login:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <main>
        <div class="card">
            <div class="logo">
                <img src="/vanlavino/img/logo.png" alt="Logo">
            </div>
            <h5 class="card-title">Login</h5>
            <form action="partials/_handleLogin.php" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control">
                </div>
                <button type="submit" class="btn btn-login">Login</button>
            </form>
        </div>
    </main>
    <?php
        if(isset($_GET['loginsuccess']) && $_GET['loginsuccess']=="false"){
        echo '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Warning!</strong> Invalid Credentials
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                </div>';
        }
    ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>         
    <script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>
</body>
</html>