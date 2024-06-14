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
        <input type="number" id="ano" name="ano" min="1900" max="2100" placeholder="YYYY" required><br><br>

        <label for="marca">Marca:</label>
        <input type="text" id="marca" name="marca" required><br><br>

        <label for="placa">Placa:</label>
        <input type="text" id="placa" name="placa" required><br><br>

        <label for="disponibilidade">Disponibilidade:</label>
        <select id="disponibilidade" name="disponibilidade" required>
            <option value="Disponível">Disponível</option>
            <option value="Indisponível">Indisponível</option>
        </select><br><br>

        <label for="categoria">Categoria:</label>
        <select id="categoria" name="categoria" required>
            <option value="1">Hatch</option>
            <option value="2">SUV</option>
            <option value="3">Sport</option>
            <option value="4">Sedã</option>
            <option value="5">Cabriolet </option>
            <option value="6">Wagon</option>
            <option value="7">Minivan</option>
            <option value="8">Pick-up</option>
        </select><br><br>

        <input type="submit" name="submit" value="Cadastrar Carro">
    </form>
    <a href="../List_Restrito/view_carro_adm.php">Ver todos os carros</a>

    
    <?php
    if (isset($_GET['status'])) {
        if ($_GET['status'] == 'success') {
            echo  '<br> 
                <div class="container-result-sucess">
                    <h2>Cadastro realizado com sucesso</h2>
                </div>';
        } elseif ($_GET['status'] == 'carro_exists') {
            echo  '<br>
                <div class="container-result-failed">
                    <h2>Email ja existente, tente novamente</h2>
                </div>';
        } else {
            echo  '<br>
                <div class="container-result-failed">
                    <h2>Erro ao cadastrar</h2>
                </div>';
        }
    }
    ?>
</body>

</html>