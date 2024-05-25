<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<h2>ESTE É O MEU INDEX</h2>

<?php  
    session_start();

    $result = $_SESSION['result_client'];
    var_dump($result);
?>

<form action="" method="post">

        <input type="submit" value="Login" name="login_cliente">

        <input type="submit" value="Cadastrar-me" name="cadastro_cliente">
    </form>
</body>

</html>



<?php


if (isset($_POST['cadastro_cliente'])) {
    header("Location: ./Cadastro/cadastro_cliente_pf.php");
    exit();
}
if (isset($_POST['login_cliente'])) {
    header("Location: ./Login/login_cliente_pf.php");
    exit();
}
