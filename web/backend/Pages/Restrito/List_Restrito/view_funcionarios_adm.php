<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Funcionários Cadastrados</title>
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
        function editarLinha(pk_id_funcionarios) {
            var linha = document.querySelector('#linha-' + pk_id_funcionarios);
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

        function cancelarEdicao(pk_id_funcionarios) {
            var linha = document.querySelector('#linha-' + pk_id_funcionarios);
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

        function salvarEdicao(pk_id_funcionarios) {
            var nome = document.querySelector('#linha-' + pk_id_funcionarios + ' input[name="nome"]').value;
            var sobrenome = document.querySelector('#linha-' + pk_id_funcionarios + ' input[name="sobrenome"]').value;
            var data_contratacao = document.querySelector('#linha-' + pk_id_funcionarios + ' input[name="data_contratacao"]').value;

            var formData = new FormData();
            formData.append('pk_id_funcionarios', pk_id_funcionarios);
            formData.append('nome', nome);
            formData.append('sobrenome', sobrenome);
            formData.append('data_contratacao', data_contratacao);

            fetch('salvar_edicao_funcionarios.php', { // Atualize para o caminho correto
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
    <h1>Funcionários Cadastrados</h1>

    <table>
        <tr>
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>Data de Contratação</th>
            <th>Ações</th>
        </tr>
        <?php
        include("../../../Connection/conexao_bd.php");
        include("../../../Controller/functions.php");

        try {
            $query = 'SELECT * FROM funcionarios';
            $stmt = $conexao->query($query);

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr id='linha-" . htmlspecialchars($row['pk_id_funcionarios']) . "'>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['nome_funcionarios']) . "</span><input type='text' class='editar' name='nome' value='" . htmlspecialchars($row['nome_funcionarios']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['sobrenome_funcionarios']) . "</span><input type='text' class='editar' name='sobrenome' value='" . htmlspecialchars($row['sobrenome_funcionarios']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['data_contratacao_funcionarios']) . "</span><input type='date' class='editar' name='data_contratacao' value='" . htmlspecialchars($row['data_contratacao_funcionarios']) . "' style='display: none;'></td>";
                
                echo "<td>";
                echo '<button class="btn-editar" onclick="editarLinha(' . htmlspecialchars($row['pk_id_funcionarios']) . ')">Editar</button>';
                echo '<button class="btn-salvar" onclick="salvarEdicao(' . htmlspecialchars($row['pk_id_funcionarios']) . ')" style="display: none;">Salvar Edição</button>';
                echo '<button class="btn-cancelar" onclick="cancelarEdicao(' . htmlspecialchars($row['pk_id_funcionarios']) . ')" style="display: none;">Cancelar Edição</button>';
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
