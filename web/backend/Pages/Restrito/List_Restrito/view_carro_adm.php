<?php

/* session_start();
$result = $_SESSION['result_nivel'];

if ($result <> 1) {
    echo "<h2>Você não tem permissão para acessar este site!</h2>";
    $url = '../../../Pages/index.php';
    header('Location:' . $url);
} else {
    print "Acesso permitido!";
    $url = './view_carro_adm.php';
    header('Location:' . $url);
} */
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
    <script>
        function editarLinha(pk_placa_carros) {
            var valueDisplayVisua = 'none';
            var valueDisplayEdita = 'inline';

            document.querySelectorAll('#linha-' + pk_placa_carros + ' .visualizar').forEach(function(element) {
                element.style.display = valueDisplayVisua;
            });
            document.querySelectorAll('#linha-' + pk_placa_carros + ' .editar').forEach(function(element) {
                element.style.display = valueDisplayEdita;
            });
            document.getElementById('btn-editar-' + pk_placa_carros).style.display = 'none';
            document.getElementById('btn-salvar-' + pk_placa_carros).style.display = 'inline';
            document.getElementById('btn-cancelar-' + pk_placa_carros).style.display = 'inline';
        }

        function cancelarEdicao(pk_placa_carros) {
            document.querySelectorAll('#linha-' + pk_placa_carros + ' .visualizar').forEach(function(element) {
                element.style.display = 'inline';
            });
            document.querySelectorAll('#linha-' + pk_placa_carros + ' .editar').forEach(function(element) {
                element.style.display = 'none';
            });
            document.getElementById('btn-editar-' + pk_placa_carros).style.display = 'inline';
            document.getElementById('btn-salvar-' + pk_placa_carros).style.display = 'none';
            document.getElementById('btn-cancelar-' + pk_placa_carros).style.display = 'none';
        }

        function salvarEdicao(pk_placa_carros) {
            var modelo = document.querySelector('#linha-' + pk_placa_carros + ' input[name="modelo"]').value;
            var ano = document.querySelector('#linha-' + pk_placa_carros + ' input[name="ano"]').value;
            var marca = document.querySelector('#linha-' + pk_placa_carros + ' input[name="marca"]').value;
            var disponibilidade = document.querySelector('#linha-' + pk_placa_carros + ' select[name="disponibilidade"]').value;

            var formData = new FormData();
            formData.append('pk_placa_carros', pk_placa_carros);
            formData.append('modelo', modelo);
            formData.append('ano', ano);
            formData.append('marca', marca);
            formData.append('disponibilidade', disponibilidade);

            fetch('../../../Controller/salvar_edicao.php', { // Atualize para o caminho correto
                method: 'POST',
                body: formData
            }).then(response => {
                if (!response.ok) {
                    throw new Error('Erro HTTP: ' + response.status);
                }
                return response.text();
            }).then(data => {
                if (data === 'success') {
                    location.reload();

                    valueDisplayVisua = 'inline';
                    valueDisplayEdita = 'none';

                } else {
                    alert('Erro ao salvar a edição! Detalhes: ' + data);
                }
            }).catch(error => {
                console.error('Erro:', error);
                alert('Erro ao salvar a edição! Detalhes: ' + error.message);
            });
        }
    </script>
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
            <th>Ações</th>
            <th>Data_Entrega</th>
        </tr>
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
                $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros ORDER BY :pesquisa_select';
                $stmt = $conexao->prepare($query);
                $stmt->bindParam(':pesquisa_select', $busca_select);
            } else {
                $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros';
                $stmt = $conexao->query($query);
            }

            $stmt->execute();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr id='linha-" . htmlspecialchars($row['pk_placa_carros']) . "'>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['modelo_carros']) . "</span><input type='text' class='editar' name='modelo' value='" . htmlspecialchars($row['modelo_carros']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['ano_carros']) . "</span><input type='text' class='editar' name='ano' value='" . htmlspecialchars($row['ano_carros']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['marca_carros']) . "</span><input type='text' class='editar' name='marca' value='" . htmlspecialchars($row['marca_carros']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['pk_placa_carros']) . "</span><input type='text' class='editar' value='" . htmlspecialchars($row['pk_placa_carros']) . "' style='display: none;'></td>";

                echo "<td>";
                echo "<span class='visualizar'>" . htmlspecialchars($row['disponibilidade_carros']) . "</span>";
                echo "<select name='disponibilidade' class='editar' style='display: none;'>";
                echo "<option value='Disponível'" . ($row['disponibilidade_carros'] == 'Disponível' ? ' selected' : '') . ">Disponível</option>";
                echo "<option value='Indisponível'" . ($row['disponibilidade_carros'] == 'Indisponível' ? ' selected' : '') . ">Indisponível</option>";
                echo "</select>";
                echo "</td>";

                
                echo "<td>";
                echo '<button id="btn-editar-' . htmlspecialchars($row['pk_placa_carros']) . '" onclick="editarLinha(\'' . htmlspecialchars($row['pk_placa_carros']) . '\')">Editar</button>';
                echo '<button id="btn-salvar-' . htmlspecialchars($row['pk_placa_carros']) . '" onclick="salvarEdicao(\'' . htmlspecialchars($row['pk_placa_carros']) . '\')" style="display: none;">Salvar Edição</button>';
                echo '<button id="btn-cancelar-' . htmlspecialchars($row['pk_placa_carros']) . '" onclick="cancelarEdicao(\'' . htmlspecialchars($row['pk_placa_carros']) . '\')" style="display: none;">Sair</button>';
                echo "</td>";
                if ($row['disponibilidade_carros'] == 'Indisponível') {
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