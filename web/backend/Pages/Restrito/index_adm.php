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
            color: white;
            height: 100vh;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .sidebar a,
        .sidebar input[type="submit"] {
            text-decoration: none;
            color: white;
            margin: 10px 0;
            padding: 10px;
            width: 80%;
            text-align: center;
            border: none;
            border-radius: 4px;
            transition: background 0.3s;
            cursor: pointer;
            background-color: #1976d2;
        }

        .sidebar input[type="submit"]:hover {
            background-color: #1e88e5;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h5 {
            margin: 0;
            font-size: 24px;
        }

        .container-result-sucess,
        .container-result-failed {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
        }

        .container-result-sucess {
            background-color: #dff0d8;
            color: #3c763d;
        }

        .container-result-failed {
            background-color: #f2dede;
            color: #a94442;
        }

        form.cadastro-carro,
        form.cadastro-funcionario {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 0 auto;
        }

        form.cadastro-carro label,
        form.cadastro-funcionario label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        form.cadastro-carro input[type="text"],
        form.cadastro-carro input[type="number"],
        form.cadastro-carro select,
        form.cadastro-funcionario input[type="text"],
        form.cadastro-funcionario input[type="date"],
        form.cadastro-funcionario select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        form.cadastro-carro input[type="submit"],
        form.cadastro-funcionario input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        form.cadastro-carro input[type="submit"]:hover,
        form.cadastro-funcionario input[type="submit"]:hover {
            background-color: #45a049;
        }

        .cadastro-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #4CAF50;
            text-decoration: none;
        }

        .cadastro-link:hover {
            text-decoration: underline;
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
            <h5>ESTE É O MEU INDEX DO ADM</h5>
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
        ?>
    </div>
</body>

</html>
