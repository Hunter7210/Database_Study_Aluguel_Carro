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
    <table>
        <tr>
            <th>Modelo</th>
            <th>Ano</th>
            <th>Marca</th>
            <th>Placa</th>
            <th>Disponibilidade</th>
        </tr>
        <!-- PHP code to fetch data from database and display -->
        <?php
        include("../../../Connection/conexao_bd.php");

        try {
            $stmt = $conexao->query("SELECT carro.*, aluga.data_entrega FROM carro INNER JOIN aluga ON carro.placa = aluga.placa");

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['modelo']) . "</td>";
                echo "<td>" . htmlspecialchars($row['ano']) . "</td>";
                echo "<td>" . htmlspecialchars($row['marca']) . "</td>";
                echo "<td>" . htmlspecialchars($row['placa']) . "</td>";
                // Verifica se a disponibilidade é 'SIM' e adiciona um sinal verde
                if ($row['disponibilidade'] == 'Disponível' || $row['disponibilidade'] == 'Indisponível') {
                    if ($row['disponibilidade'] == 'Disponível') {
                        echo "<td style='background-color:green; width:10%;'>Disponivel</td>";
                        echo "<td>" . htmlspecialchars($row['data_entrega']) . "</td>";  //Coloquei isso aqui so para testar, não vai ser necessário no site
                    }
                    if ($row['disponibilidade'] == 'Indisponível') {
                        echo "<td style='background-color:red; width:10%;'>Indisponível</td>";
                        echo "<td>" . htmlspecialchars($row['data_entrega']) . "</td>";
                    }
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