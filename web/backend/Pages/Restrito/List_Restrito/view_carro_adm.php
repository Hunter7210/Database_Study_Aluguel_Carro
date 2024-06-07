<?php

// session_start();
// $result = $_SESSION['result_nivel'];

// if ($result <> 1) {
//     echo "<h2>Você não tem permissão para acessar este site!</h2>";
//     $url = '../../../Pages/index.php';
//     header('Location:' . $url);
// } else {
//     print "Acesso permitido!";
//     $url = './view_carro_adm.php';
//     header('Location:' . $url);
// }

// 
?>


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
        <form action="./view_carro_adm.php" method="post">
            <input type="text" name="pesquisa" id="pesquisa">
            <input type="submit" value="Pesquisar" name="submit" id="btn-pesquisa">
        </form>
    </div>
    <div class="pesquisa_carros_select">
        <h3>Pesquise aqui:</h3>

        <form action="./view_carro_adm.php" method="post">
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
            <?php
            if ($result == 1) {
                echo '<th>Data_Entrega</th>';
            }
            ?>
        </tr>
        <!-- PHP code to fetch data from database and display -->
        <?php




        include("../../../Connection/conexao_bd.php");


        include("../../../Controller/functions.php");
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
                echo "<td>";
                echo "<span class='visualizar'>" . htmlspecialchars($row['modelo_carros']) . "</span>";
                echo "<input type='text' class='editar' name='modelo' value='" . htmlspecialchars($row['modelo_carros']) . "' style='display: none;'>";
                echo "</td>";
                echo "<td>";
                echo "<span class='visualizar'>" . htmlspecialchars($row['ano_carros']) . "</span>";
                echo "<input type='text' class='editar' name='ano' value='" . htmlspecialchars($row['ano_carros']) . "' style='display: none;'>";
                echo "</td>";
                echo "<td>";
                echo "<span class='visualizar'>" . htmlspecialchars($row['marca_carros']) . "</span>";
                echo "<input type='text' class='editar' name='marca' value='" . htmlspecialchars($row['marca_carros']) . "' style='display: none;'>";
                echo "</td>";
                echo "<td>";
                echo "<span class='visualizar'>" . htmlspecialchars($row['pk_placa_carros']) . "</span>";
                echo "<input type='text' class='editar' value='" . htmlspecialchars($row['pk_placa_carros']) . "' style='display: none;'>";
                echo "</td>";

                if ($row['disponibilidade_carros'] == 'Disponível') {
                    echo "<td style='background-color:green; width:10%;'>Disponível</td>";
                } elseif ($row['disponibilidade_carros'] == 'Indisponível') {
                    echo "<td style='background-color:red; width:10%;'>Indisponível</td>";
                    if ($result == 1) {
                        echo "<td>" . htmlspecialchars($row['data_entrega_aluga']) . "</td>";
                    }
                }

                // Botão Editar
                echo '<td><button class="btn-editar">Editar</button></td>';
                // Botão Excluir


                // Botão Excluir
                echo "<td><a href='excluir.php?id=" . htmlspecialchars($row['pk_placa_carros']) . "'>Excluir</a></td>";

                echo "</tr>";
            }
        } catch (PDOException $e) {
            echo "Erro: " . $e->getMessage();
        }
        $conexao = null;

        ?>
    </table>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {

$(".btn-editar").click(function() {
    var tr = $(this).closest("tr");
    tr.find(".visualizar").hide();
    tr.find(".editar").show();
});

$("tr").dblclick(function() {
    
    var placa = $(this).find(".editar").first().val();
    var modelo = $(this).find(".editar").first().val();
    var ano = $(this).find(".editar").first().val();
    var marca = $(this).find(".editar").first().val();

    var newdados = {
        'modelo': modelo,
        'ano': ano,
        'marca': marca
    };

    editar_carros(placa, newdados); // Corrigido para chamar editar_carros
});
});

function editar_carros(placa, newdados) { // Corrigido para nomear a função corretamente
$.ajax({
    type: "POST",
    url: "../../../Controller/functions.php",
    data: {
        placa: placa,
        newdados: newdados
    },
    success: function(response) {
        alert(response);
    },
    error: function(xhr, status, error) {
        alert("Erro ao editar carros: " + error);
    }
});
}
</script>


    </form>

</body>

</html>

