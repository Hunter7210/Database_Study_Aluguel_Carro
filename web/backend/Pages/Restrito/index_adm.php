<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Controle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f4f4f9;
            color: #333;
        }

        .sidebar {
            width: 250px;
            background-color: #1565c0;
            /* Azul principal do seu site */
            color: white;
            height: 100vh;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            /* Centraliza o conteúdo horizontalmente */
        }

        .sidebar a,
        .sidebar input[type="submit"] {
            text-decoration: none;
            color: white;
            margin: 10px 0;
            padding: 10px;
            width: 80%;
            /* Define a largura dos inputs */
            text-align: center;
            border: none;
            border-radius: 4px;
            transition: background 0.3s;
            cursor: pointer;
            background-color: #1976d2;
            /* Cor de fundo dos inputs (tom de azul) */
        }

        .sidebar input[type="submit"]:hover {
            background-color: #1e88e5;
            /* Cor de fundo dos inputs ao passar o mouse (tom mais claro de azul) */
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h2 {
            margin: 0;
            font-size: 24px;
        }
    </style>


</head>

<body>
    <div class="sidebar">
        <a href="../index.php">INDEX</a>
        <form action="./index_adm.php" method="post">
            <input type="submit" value="Home" name="home">
            <input type="submit" value="Cadastro Carros" name="cadastrar_carro">
            <input type="submit" value="Cadastro Funcionario" name="cadastrar_funcionario">
            <input type="submit" value="Ver_DB_carros" name="ver_db_carros">
            <input type="submit" value="Ver_DB_Funcinarios" name="ver_db_funcionarios">
            <input type="submit" value="Ver_DB_Manutenção" name="ver_db_manutencao">
            <input type="submit" value="Ver_DB_Clientes_pf" name="ver_db_clientes_pf">
            <input type="submit" value="Ver_DB_Aluguel" name="ver_db_aluguel">
        </form>

    </div>
    <div class="main-content">
        <div class="header">
            <h2>ESTE É O MEU INDEX DO ADM</h2>
        </div>

        <?php
        if (isset($_POST['ver_db_carros'])) {
            include("./List_Restrito/view_carro_adm.php");
        } elseif (isset($_POST['ver_db_funcionarios'])) {
            include("./List_Restrito/view_funcionarios_adm.php");
        } elseif (isset($_POST['ver_db_manutencao'])) {
            include("./List_Restrito/view_manutencoes_adm.php");
        } elseif (isset($_POST['ver_db_clientes_pf'])) {
            include("./List_Restrito/view_clientes_pf_adm.php");
        } elseif (isset($_POST['cadastrar_carro'])) {
            include("./Cadastro_Restrito/cadastro_carros_adm.php");
        } elseif (isset($_POST['cadastrar_funcionario'])) {
            include("./Cadastro_Restrito/cadastro_funcionarios.php");
        } elseif (isset($_POST['ver_db_aluguel'])) {
            include("./List_Restrito/view_locacoes_adm.php");
        } elseif (isset($_POST['home'])) {
            include("./List_Restrito/view_home_adm.php");
        } else {
            include("./List_Restrito/view_home_adm.php");
        }

        ?> <!-- O conteúdo principal vai aqui -->
    </div>
</body>

</html>