<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<h2>ESTE É O MEU INDEX DO ADM</h2>
<a href="../index.php">HOME</a>
    <form action="./index_adm.php" method="post">
        <input type="submit" value="Cadastro Carros" name="cadastrar_carro">

        <input type="submit" value="Cadastro Funcionario" name="cadastrar_funcionario">
       
        <input type="submit" value="Ver_DB_carros" name="ver_db_carros">
       
        <input type="submit" value="Ver_DB_Funcinarios" name="ver_db_funcionarios">
       
        <input type="submit" value="Ver_DB_Manutenção" name="ver_db_manutencao">
       
        <input type="submit" value="Ver_DB_Clientes_pf" name="ver_db_clientes_pf">
       
    </form>
</body>

</html>



<?php

if (isset($_POST['ver_db_carros'])) {
    header("Location: ./List_Restrito/view_carro_adm.php");
    exit();
} elseif (isset($_POST['ver_db_funcionarios'])) {
    header("Location: ./List_Restrito/view_funcionarios_adm.php");
    exit();
} elseif (isset($_POST['ver_db_manutencao'])) {
    header("Location: ./List_Restrito/view_manutencoes_adm.php");
    exit();
} elseif (isset($_POST['ver_db_clientes_pf'])) {
    header("Location: ./List_Restrito/view_clientes_pf_adm.php");
    exit();
} elseif (isset($_POST['cadastrar_carro'])) {
    header("Location: ./Cadastro_Restrito/cadastro_carros_adm.php");
    exit();
} elseif (isset($_POST['cadastrar_funcionario'])) {
    header("Location: ./Cadastro_Restrito/cadastro_funcionarios.php");
    exit();
}