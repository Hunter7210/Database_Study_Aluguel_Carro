<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Manutenções Cadastradas</title>
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
            color: #1976d2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
            overflow-x: auto; /* Adiciona barra de rolagem horizontal */
        }

        th, td {
            padding: 8px; /* Reduz o padding para diminuir a largura das colunas */
            text-align: left;
            border-bottom: 1px solid #ddd;
            white-space: nowrap; /* Evita que o texto quebre para próxima linha */
        }

        th {
            background-color: #f2f2f2;
            color: #333;
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
            padding: 6px 10px; /* Reduz o padding dos botões */
            margin: 3px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-editar, .btn-salvar, .btn-cancelar {
            background-color: #1976d2;
            color: white;
        }

        button:hover {
            opacity: 0.8;
        }
    </style>
    <script>
        function editarLinha(pk_id_manutencoes) {
            var linha = document.querySelector('#linha-' + pk_id_manutencoes);
            linha.querySelectorAll('.visualizar').forEach(function(element) {
                element.style.display = 'none';
            });
            linha.querySelectorAll('.editar').forEach(function(element) {
                element.style.display = 'inline';
            });
            linha.querySelector('.btn-editar').style.display = 'none';
            linha.querySelector('.btn-salvar').style.display = 'inline';
            linha.querySelector('.btn-cancelar').style.display = 'inline';
        }

        function cancelarEdicao(pk_id_manutencoes) {
            var linha = document.querySelector('#linha-' + pk_id_manutencoes);
            linha.querySelectorAll('.visualizar').forEach(function(element) {
                element.style.display = 'inline';
            });
            linha.querySelectorAll('.editar').forEach(function(element) {
                element.style.display = 'none';
            });
            linha.querySelector('.btn-editar').style.display = 'inline';
            linha.querySelector('.btn-salvar').style.display = 'none';
            linha.querySelector('.btn-cancelar').style.display = 'none';
        }

        function salvarEdicao(pk_id_manutencoes) {
            var data = document.querySelector('#linha-' + pk_id_manutencoes + ' input[name="data"]').value;
            var tipo = document.querySelector('#linha-' + pk_id_manutencoes + ' input[name="tipo"]').value;
            var custo = document.querySelector('#linha-' + pk_id_manutencoes + ' input[name="custo"]').value;
            var descricao = document.querySelector('#linha-' + pk_id_manutencoes + ' input[name="descricao"]').value;

            var formData = new FormData();
            formData.append('pk_id_manutencoes', pk_id_manutencoes);
            formData.append('data', data);
            formData.append('tipo', tipo);
            formData.append('custo', custo);
            formData.append('descricao', descricao);

            fetch('../../Controller/salvar_edicao_manutencoes.php', {
                method: 'POST',
                body: formData
            }).then(response => {
                if (!response.ok) {
                    throw new Error('Erro HTTP: ' + response.status);
                }
                return response.text();
            }).then(data => {
                if (data === 'success') {
                    alert('Edição salva com sucesso!');
                    location.reload(); // Recarrega a página para atualizar os dados
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
    <h1>Manutenções Cadastradas</h1>

    <table>
        <tr>
            <th>Data</th>
            <th>Tipo</th>
            <th>Custo</th>
            <th>Descrição</th>
            <th>Ações</th>
        </tr>
        <?php
        include("../../Connection/conexao_bd.php");

        try {
            $query = 'SELECT * FROM manutencoes';
            $stmt = $conexao->query($query);

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr id='linha-" . htmlspecialchars($row['pk_id_manutencoes']) . "'>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['data_manutencoes']) . "</span><input type='date' class='editar' name='data' value='" . htmlspecialchars($row['data_manutencoes']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['tipo_manutencoes']) . "</span><input type='text' class='editar' name='tipo' value='" . htmlspecialchars($row['tipo_manutencoes']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['custo_manutencoes']) . "</span><input type='text' class='editar' name='custo' value='" . htmlspecialchars($row['custo_manutencoes']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['descricao_manutencoes']) . "</span><input type='text' class='editar' name='descricao' value='" . htmlspecialchars($row['descricao_manutencoes']) . "' style='display: none;'></td>";
                
                echo "<td>";
                echo '<button class="btn-editar" onclick="editarLinha(' . htmlspecialchars($row['pk_id_manutencoes']) . ')">Editar</button>';
                echo '<button class="btn-salvar" onclick="salvarEdicao(' . htmlspecialchars($row['pk_id_manutencoes']) . ')" style="display: none;">Salvar Edição</button>';
                echo '<button class="btn-cancelar" onclick="cancelarEdicao(' . htmlspecialchars($row['pk_id_manutencoes']) . ')" style="display: none;">Cancelar Edição</button>';
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
