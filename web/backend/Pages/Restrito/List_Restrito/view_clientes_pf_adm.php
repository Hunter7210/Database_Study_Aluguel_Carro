<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <title>Clientes Cadastrados</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
            overflow-x: auto; /* Adiciona barra de rolagem horizontal */
        }

        th, td {
            padding: 10px; /* Reduz o padding para diminuir a largura das colunas */
            text-align: left;
            border-bottom: 1px solid #ddd;
            white-space: nowrap; /* Evita que o texto quebre para próxima linha */
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
            padding: 8px; /* Reduz o padding dos botões para melhorar o layout */
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
        function editarLinha(pk_id_clientes_pf) {
            var linha = document.querySelector('#linha-' + pk_id_clientes_pf);
            linha.querySelectorAll('.visualizar').forEach(function (element) {
                element.style.display = 'none';
            });
            linha.querySelectorAll('.editar').forEach(function (element) {
                element.style.display = 'inline';
            });
            linha.querySelector('.btn-editar').style.display = 'none';
            linha.querySelector('.btn-salvar').style.display = 'inline';
            linha.querySelector('.btn-cancelar').style.display = 'inline';
        }

        function cancelarEdicao(pk_id_clientes_pf) {
            var linha = document.querySelector('#linha-' + pk_id_clientes_pf);
            linha.querySelectorAll('.visualizar').forEach(function (element) {
                element.style.display = 'inline';
            });
            linha.querySelectorAll('.editar').forEach(function (element) {
                element.style.display = 'none';
            });
            linha.querySelector('.btn-editar').style.display = 'inline';
            linha.querySelector('.btn-salvar').style.display = 'none';
            linha.querySelector('.btn-cancelar').style.display = 'none';
        }

        function salvarEdicao(pk_id_clientes_pf) {
            var nome = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="nome"]').value;
            var sobrenome = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="sobrenome"]').value;
            var email = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="email"]').value;
            var celular = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="celular"]').value;
            var endereco = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="endereco"]').value;
            var cidade = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="cidade"]').value;
            var estado = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="estado"]').value;
            var senha = document.querySelector('#linha-' + pk_id_clientes_pf + ' input[name="senha"]').value;

            var formData = new FormData();
            formData.append('pk_id_clientes_pf', pk_id_clientes_pf);
            formData.append('nome_clientes_pf', nome);
            formData.append('sobrenome_clientes_pf', sobrenome);
            formData.append('email_clientes_pf', email);
            formData.append('celular_clientes_pf', celular);
            formData.append('endereco_clientes_pf', endereco);
            formData.append('cidade_clientes_pf', cidade);
            formData.append('estado_clientes_pf', estado);
            formData.append('senha_cliente_pf', senha);

            fetch('../../Controller/salvar_edicao_clientes_pf.php', {
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

        function excluirCliente(pk_id_clientes_pf) {
            if (confirm('Tem certeza que deseja excluir este cliente?')) {
                var formData = new FormData();
                formData.append('pk_id_clientes_pf', pk_id_clientes_pf);

                fetch('../../Controller/excluir_clientes_pf.php', {
                    method: 'POST',
                    body: formData
                }).then(response => {
                    if (!response.ok) {
                        throw new Error('Erro HTTP: ' + response.status);
                    }
                    return response.text();
                }).then(data => {
                    if (data === 'success') {
                        alert('Cliente excluído com sucesso!');
                        location.reload(); // Recarrega a página para atualizar os dados
                    } else {
                        alert('Erro ao excluir o cliente! Detalhes: ' + data);
                    }
                }).catch(error => {
                    console.error('Erro:', error);
                    alert('Erro ao excluir o cliente! Detalhes: ' + error.message);
                });
            }
        }
    </script>
</head>

<body>
    <h1>Clientes Cadastrados</h1>

    <table>
        <tr>
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>Email</th>
            <th>Celular</th>
            <th>Endereço</th>
            <th>Cidade</th>
            <th>Estado</th>
            <th>Senha</th>
            <th>Ações</th>
        </tr>
        <?php
        include("../../Connection/conexao_bd.php");

        try {
            $query = 'SELECT * FROM clientes_pf';
            $stmt = $conexao->query($query);

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr id='linha-" . htmlspecialchars($row['pk_id_clientes_pf']) . "'>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['nome_clientes_pf']) . "</span><input type='text' class='editar' name='nome' value='" . htmlspecialchars($row['nome_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['sobrenome_clientes_pf']) . "</span><input type='text' class='editar' name='sobrenome' value='" . htmlspecialchars($row['sobrenome_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['email_clientes_pf']) . "</span><input type='email' class='editar' name='email' value='" . htmlspecialchars($row['email_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['celular_clientes_pf']) . "</span><input type='text' class='editar' name='celular' value='" . htmlspecialchars($row['celular_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['endereco_clientes_pf']) . "</span><input type='text' class='editar' name='endereco' value='" . htmlspecialchars($row['endereco_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['cidade_clientes_pf']) . "</span><input type='text' class='editar' name='cidade' value='" . htmlspecialchars($row['cidade_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>" . htmlspecialchars($row['estado_clientes_pf']) . "</span><input type='text' class='editar' name='estado' value='" . htmlspecialchars($row['estado_clientes_pf']) . "' style='display: none;'></td>";
                echo "<td><span class='visualizar'>********</span><input type='password' class='editar' name='senha' value='" . htmlspecialchars($row['senha_cliente_pf']) . "' style='display: none;'></td>";

                echo "<td>";
                echo '<button class="btn-editar" onclick="editarLinha(' . htmlspecialchars($row['pk_id_clientes_pf']) . ')">Editar</button>';
                echo '<button class="btn-salvar" onclick="salvarEdicao(' . htmlspecialchars($row['pk_id_clientes_pf']) . ')" style="display: none;">Salvar Edição</button>';
                echo '<button class="btn-cancelar" onclick="cancelarEdicao(' . htmlspecialchars($row['pk_id_clientes_pf']) . ')" style="display: none;">Cancelar Edição</button>';
                echo '<button onclick="excluirCliente(' . htmlspecialchars($row['pk_id_clientes_pf']) . ')">Excluir</button>';
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
