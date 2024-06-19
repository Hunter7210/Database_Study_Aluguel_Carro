<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Cadastro de Funcionario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        form.cadastro-funcionario {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 0 auto;
        }

        form.cadastro-funcionario label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

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
    <h1>Cadastro de Funcionario</h1>

    <form class="cadastro-funcionario" action="../../../Controller/cadas_funcion.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome_funcionarios" name="nome_funcionarios" required>

        <label for="sobrenome">Sobrenome:</label>
        <input type="text" id="sobrenome_funcionarios" name="sobrenome_funcionarios" required>

        <label for="data_contr">Data Contratação:</label>
        <input type="date" id="data_contr" name="data_contr" required>

        <label for="cargo">Cargo:</label>
        <select id="cargo" name="cargo" required>
            <option value="31">Gerente</option>
            <option value="32">Assistente</option>
            <option value="33">Analista</option>
            <option value="34">Desenvolvedor</option>
            <option value="35">Estagiário</option>
        </select>

        <input type="submit" name="submit" value="Cadastrar Funcionarios">
    </form>

    <a class="cadastro-link" href="../List_Restrito/view_carro_adm.php">Ver todos os carros</a>
</body>

</html>
