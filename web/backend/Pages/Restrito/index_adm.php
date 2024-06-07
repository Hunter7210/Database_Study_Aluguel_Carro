<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<h2>ESTE É O MEU INDEX DO ADM</h2>
    <form action="./index_adm.php" method="post">
        <input type="submit"  value="Cadastro_Carros">
       
        <input type="submit" value="Ver_DB" name="ver_db">
    </form>
</body>

</html>



<?php

if (isset($_POST['ver_db'])) {
    header("Location: ./List_Restrito/view_carro_adm.php");
    exit();
}

