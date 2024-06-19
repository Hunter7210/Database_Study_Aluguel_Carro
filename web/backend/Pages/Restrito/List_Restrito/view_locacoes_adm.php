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
        function editarLinha(pk_id_locacao_aluga) {
            document.querySelectorAll('#linha-' + pk_id_locacao_aluga + ' .visualizar').forEach(element => element.style.display = 'none');
            document.querySelectorAll('#linha-' + pk_id_locacao_aluga + ' .editar').forEach(element => element.style.display = 'inline');
            document.getElementById('btn-editar-' + pk_id_locacao_aluga).style.display = 'none';
            document.getElementById('btn-salvar-' + pk_id_locacao_aluga).style.display = 'inline';
            document.getElementById('btn-cancelar-' + pk_id_locacao_aluga).style.display = 'inline';
            document.getElementById('btn-excluir-' + pk_id_locacao_aluga).style.display = 'none';
        }

        function cancelarEdicao(pk_id_locacao_aluga) {
            document.querySelectorAll('#linha-' + pk_id_locacao_aluga + ' .visualizar').forEach(element => element.style.display = 'inline');
            document.querySelectorAll('#linha-' + pk_id_locacao_aluga + ' .editar').forEach(element => element.style.display = 'none');
            document.getElementById('btn-editar-' + pk_id_locacao_aluga).style.display = 'inline';
            document.getElementById('btn-salvar-' + pk_id_locacao_aluga).style.display = 'none';
            document.getElementById('btn-cancelar-' + pk_id_locacao_aluga).style.display = 'none';
            document.getElementById('btn-excluir-' + pk_id_locacao_aluga).style.display = 'inline';
        }

        function salvarEdicao(pk_id_locacao_aluga) {
            var pk_id_locacao_aluga = document.querySelector('#linha-' + pk_id_locacao_aluga + ' input[name="pk_id_locacao_aluga"]').value;
            var fk_id_clientes_pf = document.querySelector('#linha-' + pk_id_locacao_aluga + ' input[name="fk_id_clientes_pf"]').value;
            var fk_placa_carros = document.querySelector('#linha-' + pk_id_locacao_aluga + ' input[name="fk_placa_carros"]').value;
            var data_entrega_aluga = document.querySelector('#linha-' + pk_id_locacao_aluga + ' input[name="data_entrega_aluga"]').value;
            var data_retirada_aluga = document.querySelector('#linha-' + pk_id_locacao_aluga + ' input[name="data_retirada_aluga"]').value;
            var valor_total_aluga = document.querySelector('#linha-' + pk_id_locacao_aluga + ' input[name="valor_total_aluga"]').value;

            var formData = new FormData();
            formData.append('pk_id_locacao_aluga', pk_id_locacao_aluga);
            formData.append('fk_id_clientes_pf', fk_id_clientes_pf);
            formData.append('fk_placa_carros', fk_placa_carros);
            formData.append('data_entrega_aluga', data_entrega_aluga);
            formData.append('data_retirada_aluga', data_retirada_aluga);
            formData.append('valor_total_aluga', valor_total_aluga);

            fetch('../../Controller/salvar_edicao.php', {
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

        function excluirLinha(pk_id_locacao_aluga) {
            if (confirm('Tem certeza que deseja excluir este registro?')) {
                fetch('../../Controller/excluir_carro.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'pk_id_locacao_aluga=' + encodeURIComponent(pk_id_locacao_aluga),
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
    <h1>Aluguéis Cadastrados</h1>

    <div class="pesquisa_carros">
        <h3>Pesquise aqui:</h3>
        <form action="./view_locacoes_adm.php" method="post">
            <input type="text" name="pesquisa" id="pesquisa">
            <input type="submit" value="Pesquisar" name="submit" id="btn-pesquisa">
        </form>
    </div>

    <table>
        <tr>
            <th>Id Locação</th>
            <th>Id Cliente</th>
            <th>Placa Carro</th>
            <th>Data Entrega</th>
            <th>Data Retirada</th>
            <th>Valor Total</th>
            <th>Ações</th>
        </tr>
        <?php
include("../../Connection/conexao_bd.php");
include("../../Controller/functions.php");

try {
    $query = 'SELECT aluga.* FROM aluga';

    if (isset($_POST['submit'])) {
        $busca = $_POST['pesquisa'];

        $query .= ' WHERE CAST(aluga.pk_id_locacao_aluga AS TEXT) = :busca 
                    OR CAST(aluga.fk_id_clientes_pf AS TEXT) = :busca 
                    OR CAST(aluga.fk_placa_carros AS TEXT) = :busca 
                    OR CAST(aluga.data_entrega_aluga AS TEXT) = :busca 
                    OR CAST(aluga.data_retirada_aluga AS TEXT) = :busca 
                    OR CAST(aluga.valor_total_aluga AS TEXT) = :busca';

        $stmt = $conexao->prepare($query);
        $stmt->bindValue(':busca', $busca);

    } else {
        $stmt = $conexao->query($query);
    }

    $stmt->execute();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr id='linha-" . htmlspecialchars($row['pk_id_locacao_aluga']) . "'>";

        echo "<td><span class='visualizar'>" . htmlspecialchars($row['pk_id_locacao_aluga']) . "</span><input type='text' class='editar' name='pk_id_locacao_aluga' value='" . htmlspecialchars($row['pk_id_locacao_aluga']) . "' style='display: none;'></td>";

        echo "<td><span class='visualizar'>" . htmlspecialchars($row['fk_id_clientes_pf']) . "</span><input type='text' class='editar' name='fk_id_clientes_pf' value='" . htmlspecialchars($row['fk_id_clientes_pf']) . "' style='display: none;'></td>";

        echo "<td><span class='visualizar'>" . htmlspecialchars($row['fk_placa_carros']) . "</span><input type='text' class='editar' name='fk_placa_carros' value='" . htmlspecialchars($row['fk_placa_carros']) . "' style='display: none;'></td>";

        echo "<td><span class='visualizar'>" . htmlspecialchars($row['data_entrega_aluga']) . "</span><input type='text' class='editar' name='data_entrega_aluga' value='" . htmlspecialchars($row['data_entrega_aluga']) . "' style='display: none;'></td>";

        echo "<td><span class='visualizar'>" . htmlspecialchars($row['data_retirada_aluga']) . "</span><input type='text' class='editar' name='data_retirada_aluga' value='" . htmlspecialchars($row['data_retirada_aluga']) . "' style='display: none;'></td>";

        echo "<td><span class='visualizar'>" . htmlspecialchars($row['valor_total_aluga']) . "</span><input type='text' class='editar' name='valor_total_aluga' value='" . htmlspecialchars($row['valor_total_aluga']) . "' style='display: none;'></td>";

        echo "<td>";
        echo '<button id="btn-editar-' . htmlspecialchars($row['pk_id_locacao_aluga']) . '" onclick="editarLinha(\'' . htmlspecialchars($row['pk_id_locacao_aluga']) . '\')">Editar</button>';
        echo '<button id="btn-salvar-' . htmlspecialchars($row['pk_id_locacao_aluga']) . '" onclick="salvarEdicao(\'' . htmlspecialchars($row['pk_id_locacao_aluga']) . '\')" style="display: none;">Salvar Edição</button>';
        echo '<button id="btn-cancelar-' . htmlspecialchars($row['pk_id_locacao_aluga']) . '" onclick="cancelarEdicao(\'' . htmlspecialchars($row['pk_id_locacao_aluga']) . '\')" style="display: none;">Cancelar</button>';
        echo '<button id="btn-excluir-' . htmlspecialchars($row['pk_id_locacao_aluga']) . '" onclick="excluirLinha(\'' . htmlspecialchars($row['pk_id_locacao_aluga']) . '\')">Excluir</button>';
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