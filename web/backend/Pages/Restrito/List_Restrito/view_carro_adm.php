<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Carros Cadastrados</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #1565c0;
        }

        .pesquisa_carros,
        .pesquisa_carros_select {
            margin-bottom: 20px;
            text-align: center;
        }

        .pesquisa_carros h3,
        .pesquisa_carros_select h3 {
            color: #1565c0;
        }

        .pesquisa_carros input[type="text"],
        .pesquisa_carros select,
        .pesquisa_carros input[type="submit"],
        .pesquisa_carros_select input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .pesquisa_carros input[type="submit"],
        .pesquisa_carros_select input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .pesquisa_carros input[type="submit"]:hover,
        .pesquisa_carros_select input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th,
        td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #1565c0;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .visualizar {
            display: inline;
        }

        .editar {
            display: none;
        }

        button {
            padding: 10px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button#btn-editar,
        button#btn-excluir {
            background-color: #1976d2;
            color: white;
        }

        button#btn-salvar {
            background-color: #4CAF50;
            color: white;
        }

        button#btn-cancelar {
            background-color: #f44336;
            color: white;
        }

        button:hover {
            opacity: 0.8;
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
            document.getElementById('btn-excluir-' + pk_placa_carros).style.display = 'none'; // Adicionado
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
            document.getElementById('btn-excluir-' + pk_placa_carros).style.display = 'inline'; // Adicionado
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

            fetch('../../../Controller/salvar_edicao.php', {
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
                } else {
                    alert('Erro ao salvar a edição! Detalhes: ' + data);
                }
            }).catch(error => {
                console.error('Erro:', error);
                alert('Erro ao salvar a edição! Detalhes: ' + error.message);
            });
        }

        function excluirLinha(pk_placa_carros) {
            if (confirm('Tem certeza que deseja excluir este registro?')) {
                fetch('../../../Controller/excluir_carro.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'pk_placa_carros=' + encodeURIComponent(pk_placa_carros),
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Erro HTTP: ' + response.status);
                    }
                    return response.text();
                }).then(data => {
                    if (data === 'success') {
                        location.reload();
                    } else {
                        alert('Erro ao excluir o registro! Detalhes: ' + data);
                    }
                }).catch(error => {
                    console.error('Erro:', error);
                    alert('Erro ao excluir o registro! Detalhes: ' + error.message);
                });
            }
        }
    </script>
</head>

<body>

    <h1>Carros Cadastrados</h1>
<a href="./List_Restrito/view_carro_adm.php">Acessar os carros</a>
    <div class="pesquisa_carros">
        <h3>Pesquise aqui:</h3>
        <form action="./view_carro_adm.php" method="post">
            <input type="text" name="pesquisa" id="pesquisa">
            <input type="submit" value="Pesquisar" name="submit" id="btn-pesquisa">
        </form>
    </div>
    <div class="pesquisa_carros_select">
        <h3>Pesquise aqui:</h3>
        <form action="./List_Restrito/view_carro_adm.php" method="post">
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
        </tr>
        <?php
        
        include("../../../Connection/conexao_bd.php");
        include("../../../Controller/functions.php");
        
        // include("../../Connection/conexao_bd.php");
        // include("../../Controller/functions.php");

        try {
            $query = 'SELECT carros.* FROM carros';

            if (isset($_POST['submit'])) {
                $busca = $_POST['pesquisa'];
                $query .= ' WHERE carros.pk_placa_carros = :busca OR carros.disponibilidade_carros = :busca OR carros.modelo_carros = :busca OR carros.marca_carros = :busca';
                $stmt = $conexao->prepare($query);
                $stmt->bindValue(':busca', $busca);
            } elseif (isset($_POST['submit_select'])) {
                $busca_select = $_POST['pesquisa_select'];
                $query .= ' ORDER BY ' . $busca_select;
                $stmt = $conexao->prepare($query);
            } else {
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
                echo '<button id="btn-cancelar-' . htmlspecialchars($row['pk_placa_carros']) . '" onclick="cancelarEdicao(\'' . htmlspecialchars($row['pk_placa_carros']) . '\')" style="display: none;">Cancelar</button>';
                echo '<button id="btn-excluir-' . htmlspecialchars($row['pk_placa_carros']) . '" onclick="excluirLinha(\'' . htmlspecialchars($row['pk_placa_carros']) . '\')">Excluir</button>';
                echo "</td>";

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
