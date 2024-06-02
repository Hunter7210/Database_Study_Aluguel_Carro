<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Carro</title>
</head>
<body>
    <h1>Cadastro de Carro</h1>
    
    <form action="../../../Controller/cadas_carros.php" method="post">
        <label for="modelo">Modelo:</label>
        <input type="text" id="modelo" name="modelo" required><br><br>

        <label for="ano">Ano:</label>
        <input type="date" id="ano" name="ano" required><br><br>

        <label for="marca">Marca:</label>
        <input type="text" id="marca" name="marca" required><br><br>

        <label for="placa">Placa:</label>
        <input type="text" id="placa" name="placa" required><br><br>

        <label for="disponibilidade">Disponibilidade:</label>
            <select id="disponibilidade" name="disponibilidade" required>
                <option value="Disponível">Disponível</option>
                <option value="Indisponível">Indisponível</option>
            </select><br><br>

        <input type="submit" name="submit" value="Cadastrar Carro">
    </form>

    <a href="../DB_Restrito/carros_db.php">View DB</a>
</body>
</html>
