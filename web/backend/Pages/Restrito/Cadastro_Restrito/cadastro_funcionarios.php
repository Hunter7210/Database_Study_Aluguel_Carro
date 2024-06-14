<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Cadastro de Funcionario</title>
</head>

<body>
    <h1>Cadastro de Funcionario</h1>

    <form action="../../../Controller/cadas_funcion.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome_funcionarios" name="nome_funcionarios" required><br><br>

        <label for="sobrenome">Sobrenome:</label>
        <input type="text" id="sobrenome_funcionarios" name="sobrenome_funcionarios" required><br><br>

        <label for="data_contr">Data Contraração:</label>
        <input type="date" id="data_contr" name="data_contr" required><br><br>

        <label for="cargo">Cargo:</label>
        <select id="cargo" name="cargo" required>
            <option value="31">Gerente</option>
            <option value="32">Assistente</option>
            <option value="33">Analista</option>
            <option value="34">Desenvolvedor</option>
            <option value="35">Estagiário </option>
        </select><br><br>

        <input type="submit" name="submit" value="Cadastrar Funcionarios">
    </form>

    <a href="../List_Restrito/view_carro_adm.php">Ver todos os carros</a>
</body>

</html>