<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Busca Avançada</title>
    <style>
        body {
            width: 100%;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: start;
            min-height: 100vh;
        }

        .search-container {
            max-width: 100%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .search-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-form {
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-form label {
            font-weight: bold;
            margin-right: 10px;
            flex: 1;
            min-width: 100px;
            text-align: right;
            margin-bottom: 5px;
        }

        .search-form input[type="text"],
        .search-form input[type="submit"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            flex: 2;
            min-width: 200px;
            box-sizing: border-box;
        }

        .search-form input[type="submit"] {
            background-color: #1976d2;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .search-results table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .search-results th,
        .search-results td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .visualizar {
            display: inline;
        }
        
        .inputs {
            display: flex;
        
        }

        .editar {
            display: none;
        }

        button {
            padding: 6px 12px;
            margin: 5px;
            border: none;
            border-radius: 4px;
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
        function editarLinha() {
            var valueDisplayVisua = 'none';
            var valueDisplayEdita = 'inline';

            document.querySelectorAll('.visualizar').forEach(function(element) {
                element.style.display = valueDisplayVisua;
            });
            document.querySelectorAll('.editar').forEach(function(element) {
                element.style.display = valueDisplayEdita;
            });
            document.querySelectorAll('#btn-editar').forEach(function(element) {
                element.style.display = 'none';
            });
            document.querySelectorAll('#btn-salvar').forEach(function(element) {
                element.style.display = 'inline';
            });
            document.querySelectorAll('#btn-cancelar').forEach(function(element) {
                element.style.display = 'inline';
            });
            document.querySelectorAll('#btn-excluir').forEach(function(element) {
                element.style.display = 'none';
            });
        }

        function cancelarEdicao() {
            document.querySelectorAll('.visualizar').forEach(function(element) {
                element.style.display = 'inline';
            });
            document.querySelectorAll('.editar').forEach(function(element) {
                element.style.display = 'none';
            });
            document.querySelectorAll('#btn-editar').forEach(function(element) {
                element.style.display = 'inline';
            });
            document.querySelectorAll('#btn-salvar').forEach(function(element) {
                element.style.display = 'none';
            });
            document.querySelectorAll('#btn-cancelar').forEach(function(element) {
                element.style.display = 'none';
            });
            document.querySelectorAll('#btn-excluir').forEach(function(element) {
                element.style.display = 'inline';
            });
        }

        function salvarEdicao() {
            // Implementar lógica de salvamento aqui
            alert('Implemente a lógica de salvamento conforme necessário.');
        }

        function excluirLinha() {
            if (confirm('Tem certeza que deseja excluir este registro?')) {
                // Implementar lógica de exclusão aqui
                alert('Implemente a lógica de exclusão conforme necessário.');
            }
        }
    </script>
</head>

<body>
    <div class="search-container">
        <h2>Busca Avançada</h2>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" class="search-form">
            <div class="inputs">
                <label for="cliente">Cliente:</label>
                <input type="text" id="cliente" name="cliente" placeholder="Nome do cliente">
            </div>
            <div class="inputs">
                <label for="placa_carro">Placa do Carro:</label>
                <input type="text" id="placa_carro" name="placa_carro" placeholder="Placa do carro">
            </div>
            <div class="inputs">
                <label for="manutencao">Manutenção:</label>
                <input type="text" id="manutencao" name="manutencao" placeholder="Tipo de manutenção">
            </div>
            <input type="submit" value="Buscar" name="buscar">
        </form>

        <div class="search-results">
            <?php
            // Processar o formulário quando for submetido
            if (isset($_POST['buscar'])) {
                include('../../Connection/conexao_bd.php');

                // Recupera os valores dos campos de busca
                $cliente = $_POST['cliente'] ?? '';
                $placa_carro = $_POST['placa_carro'] ?? '';
                $manutencao = $_POST['manutencao'] ?? '';

                // Inicializa a query e o statement PDO
                $query = '';
                $stmt = null;

                // Verifica qual campo está preenchido para construir a query adequada
                if (!empty($cliente) && empty($placa_carro) && empty($manutencao)) {
                    $query = 'SELECT * FROM clientes_pf WHERE nome_clientes_pf LIKE :busca';
                    $stmt = $conexao->prepare($query);
                    $stmt->bindValue(':busca', '%' . $cliente . '%');
                } else if (!empty($cliente) && !empty($placa_carro) && empty($manutencao)) {
                    $query = 'SELECT carros.*, aluga.data_entrega_aluga, aluga.data_retirada_aluga, clientes_pf.nome_clientes_pf, clientes_pf.endereco_clientes_pf
FROM carros
INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros
INNER JOIN clientes_pf ON aluga.fk_id_clientes_pf = clientes_pf.pk_id_clientes_pf
WHERE clientes_pf.nome_clientes_pf LIKE :cliente AND carros.pk_placa_carros LIKE :placa';
                    $stmt = $conexao->prepare($query);
                    $stmt->bindValue(':cliente', '%' . $cliente . '%');
                    $stmt->bindValue(':placa', '%' . $placa_carro . '%');
                } else if (empty($cliente) && !empty($placa_carro) && empty($manutencao)) {
                    $query = 'SELECT * FROM carros WHERE pk_placa_carros LIKE :busca';
                    $stmt = $conexao->prepare($query);
                    $stmt->bindValue(':busca', '%' . $placa_carro . '%');
                } else if (empty($cliente) && empty($placa_carro) && !empty($manutencao)) {
                    $query = 'SELECT * FROM manutencoes WHERE descricao_manutencoes LIKE :busca';
                    $stmt = $conexao->prepare($query);
                    $stmt->bindValue(':busca', '%' . $manutencao . '%');
                }

                // Executa a query preparada
                $stmt->execute();

                // Verifica se encontrou algum resultado
                if ($stmt->rowCount() > 0) {
                    echo '<h3>Resultados da Busca:</h3>';
                    echo '<table>';
                    echo '<tr>';

                    // Exibe cabeçalho da tabela de acordo com a consulta realizada
                    if (!empty($cliente) && empty($placa_carro) && empty($manutencao)) {
                        echo '<th>Nome</th>';
                        echo '<th>Sobrenome</th>';
                        echo '<th>Email</th>';
                        echo '<th>Celular</th>';
                        echo '<th>Endereço</th>';
                        echo '<th>Cidade</th>';
                        echo '<th>Estado</th>';
                        echo '<th>Senha</th>';
                    } else if (empty($cliente) && !empty($placa_carro) && empty($manutencao)) {
                        echo '<th>Modelo</th>';
                        echo '<th>Ano</th>';
                        echo '<th>Marca</th>';
                        echo '<th>Placa</th>';
                        echo '<th>Disponibilidade</th>';
                        echo '<th>Editar/Excluir</th>';
                    } else if (empty($cliente) && empty($placa_carro) && !empty($manutencao)) {
                        echo '<th>Data</th>';
                        echo '<th>Tipo</th>';
                        echo '<th>Custo</th>';
                        echo '<th>Descrição</th>';
                        echo '<th>Editar/Excluir</th>';
                    }

                    echo '</tr>';

                    // Itera sobre os resultados
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        echo '<tr>';

                        // Exibe os dados conforme a consulta realizada
                        if (!empty($cliente) && empty($placa_carro) && empty($manutencao)) {
                            echo '<td class="visualizar">' . htmlspecialchars($row['nome_clientes_pf']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['sobrenome_clientes_pf']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['email_clientes_pf']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['celular_clientes_pf']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['endereco_clientes_pf']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['cidade_clientes_pf']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['estado_clientes_pf']) . '</td>';
                            echo '<td><button id="btn-editar" onclick="editarLinha()">Editar</button>';
                            echo '<button id="btn-salvar" onclick="salvarEdicao()" style="display: none;">Salvar</button>';
                            echo '<button id="btn-cancelar" onclick="cancelarEdicao()" style="display: none;">Cancelar</button>';
                            echo '<button id="btn-excluir" onclick="excluirLinha()">Excluir</button></td>';
                        } else if (empty($cliente) && !empty($placa_carro) && empty($manutencao)) {
                            echo '<td class="visualizar">' . htmlspecialchars($row['modelo_carros']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['ano_carros']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['marca_carros']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['pk_placa_carros']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['disponibilidade_carros']) . '</td>';
                            echo '<td><button id="btn-editar" onclick="editarLinha()">Editar</button>';
                            echo '<button id="btn-salvar" onclick="salvarEdicao()" style="display: none;">Salvar</button>';
                            echo '<button id="btn-cancelar" onclick="cancelarEdicao()" style="display: none;">Cancelar</button>';
                            echo '<button id="btn-excluir" onclick="excluirLinha()">Excluir</button></td>';
                        } else if (empty($cliente) && empty($placa_carro) && !empty($manutencao)) {
                            echo '<td class="visualizar">' . htmlspecialchars($row['data_manutencoes']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['tipo_manutencoes']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['custo_manutencoes']) . '</td>';
                            echo '<td class="visualizar">' . htmlspecialchars($row['descricao_manutencoes']) . '</td>';
                            echo '<td><button id="btn-editar" onclick="editarLinha()">Editar</button>';
                            echo '<button id="btn-salvar" onclick="salvarEdicao()" style="display: none;">Salvar</button>';
                            echo '<button id="btn-cancelar" onclick="cancelarEdicao()" style="display: none;">Cancelar</button>';
                            echo '<button id="btn-excluir" onclick="excluirLinha()">Excluir</button></td>';
                        }

                        echo '</tr>';
                    }

                    echo '</table>';
                } else {
                    echo '<p>Nenhum resultado encontrado.</p>';
                }
            }
            ?>
        </div>
    </div>
</body>

</html>