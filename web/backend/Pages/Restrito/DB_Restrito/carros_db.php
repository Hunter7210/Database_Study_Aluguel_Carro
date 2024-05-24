<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Carros Cadastrados</title>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <h1>Carros Cadastrados</h1>

    <div class="pesquisa_carros">
        <h3>Pesquise aqui:</h3>
        <form action="./carros_db.php" method="post">
            <input type="text" name="pesquisa" id="pesquisa">
            <input type="submit" value="Pesquisar" name="submit" id="btn-pesquisa">
        </form>
    </div>
    <div class="pesquisa_carros_select">
        <h3>Pesquise aqui:</h3>

        <form action="./carros_db.php" method="post">
            <select name="pesquisa_select" id="pesquisa_select">
                <option value="pk_placa_carros">Placa</option>
                <option value="disponibilidade_carros">Disponibilidade</option>
                <option value="modelo_carros">Modelo</option>
                <option value="marca_carros">Marca</option>
            </select>
            <input type="submit" value="Pesquisar" name="submit_select" id="btn-pesquisa">
        </form>
    </div>
    <table>
        <tr>
            <th>Modelo</th>
            <th>Ano</th>
            <th>Marca</th>
            <th>Placa</th>
            <th>Disponibilidade</th>
            <th>Data_Entrega</th>
        </tr>
        <!-- PHP code to fetch data from database and display -->
        <?php
        include("../../../Connection/conexao_bd.php");

        try {
            if (isset($_POST['submit'])) {
                $busca = $_POST['pesquisa'];

                $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros WHERE carros.pk_placa_carros = :busca OR carros.disponibilidade_carros = :busca OR carros.modelo_carros = :busca OR carros.marca_carros = :busca';

                $stmt = $conexao->prepare($query);
                $stmt->bindParam(':busca', $busca);

            } elseif (isset($_POST['submit_select'])) {

                $busca_select = $_POST['pesquisa_select'];
                var_dump($busca_select);

                $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros ORDER BY :pesquisa_select';


                $stmt = $conexao->prepare($query);
                $stmt->bindParam(':pesquisa_select', $busca_select);

            } else {
                $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros';
                $stmt = $conexao->query($query);
            }

            $stmt->execute();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['modelo_carros']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['ano_carros']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['marca_carros']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['pk_placa_carros']) . "</td>";

                if ($row['disponibilidade_carros'] == 'Disponível') {
                    echo "<td style='background-color:green; width:10%;'>Disponível</td>";
                } elseif ($row['disponibilidade_carros'] == 'Indisponível') {
                    echo "<td style='background-color:red; width:10%;'>Indisponível</td>";
                    echo "<td>" . htmlspecialchars($row['data_entrega_aluga']) . "</td>";
                }

                echo "</tr>";
            }
        } catch (PDOException $e) {
            echo "Erro: " . $e->getMessage();
        }
        $conexao = null;
        ?>
    </table>
</body>

</html>