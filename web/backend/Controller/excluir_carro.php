<?php
// Verifica se foi recebido um request POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include("../Connection/conexao_bd.php");
    
    // Verifica se o parâmetro pk_placa_carros foi recebido
        $pk_placa_carros = $_POST['pk_placa_carros'];

        // Inclua o arquivo de conexão com o banco de dados

        try {
            // Prepara a declaração SQL para excluir o registro
            $query = "DELETE FROM carros WHERE pk_placa_carros = :pk_placa_carros";
            $stmt = $conexao->prepare($query);
            $stmt->bindValue(':pk_placa_carros', $pk_placa_carros);
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
        echo 'Erro: Parâmetro pk_placa_carros não recebido.';
    }
?>
