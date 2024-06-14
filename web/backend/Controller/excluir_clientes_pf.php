<?php
// Verifica se foi recebido um request POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica se o parâmetro pk_id_clientes_pf foi recebido
    if (isset($_POST['pk_id_clientes_pf'])) {
        $pk_id_clientes_pf = $_POST['pk_id_clientes_pf'];

        // Inclui o arquivo de conexão com o banco de dados
        include("../Connection/conexao_bd.php");

        try {
            // Prepara a declaração SQL para excluir o registro do cliente
            $query = "DELETE FROM clientes_pf WHERE pk_id_clientes_pf = :pk_id_clientes_pf";
            $stmt = $conexao->prepare($query);
            $stmt->bindValue(':pk_id_clientes_pf', $pk_id_clientes_pf);
            $stmt->execute();

            // Verifica se a exclusão foi bem-sucedida
            if ($stmt->rowCount() > 0) {
                echo 'success';
            } else {
                echo 'Erro: Nenhum registro encontrado para exclusão.';
            }
        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
        }

        // Fecha a conexão com o banco de dados
        $conexao = null;
    } else {
        echo 'Erro: Parâmetro pk_id_clientes_pf não recebido.';
    }
} else {
    echo 'Erro: Método de requisição inválido.';
}
?>
