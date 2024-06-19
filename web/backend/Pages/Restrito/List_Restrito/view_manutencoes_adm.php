<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Manutenções Cadastradas</title>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

        .visualizar {
            display: inline;
        }

        .editar {
            display: none;
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

            fetch('salvar_edicao_manutencoes.php', { // Atualize para o caminho correto
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
        include("../../Controller/functions.php");

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


                
