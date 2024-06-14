<?php
// Verifica se foi recebido um request POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica se todos os parâmetros necessários foram recebidos
    if (isset($_POST['pk_id_funcionarios'], $_POST['nome'], $_POST['sobrenome'], $_POST['data_contratacao'])) {
        $pk_id_funcionarios = $_POST['pk_id_funcionarios'];
        $nome = $_POST['nome'];
        $sobrenome = $_POST['sobrenome'];
        $data_contratacao = $_POST['data_contratacao'];
        
        // Inclui o arquivo de conexão com o banco de dados
        include("../Connection/conexao_bd.php");
        
        try {
            // Prepara a declaração SQL para atualizar o registro do funcionário
            $query = "UPDATE funcionarios SET nome_funcionarios = :nome, sobrenome_funcionarios = :sobrenome, data_contratacao_funcionarios = :data_contratacao WHERE pk_id_funcionarios = :pk_id_funcionarios";
            $stmt = $conexao->prepare($query);
            $stmt->bindValue(':nome', $nome);
            $stmt->bindValue(':sobrenome', $sobrenome);
            $stmt->bindValue(':data_contratacao', $data_contratacao);
            $stmt->bindValue(':pk_id_funcionarios', $pk_id_funcionarios);
            $stmt->execute();

            // Verifica se a atualização foi bem-sucedida
            if ($stmt->rowCount() > 0) {
                echo 'success';
            } else {
                echo 'Erro: Nenhum registro atualizado.';
            }
        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
        }

        // Fecha a conexão com o banco de dados
        $conexao = null;
    } else {
        echo 'Erro: Parâmetros insuficientes.';
    }
} else {
    echo 'Erro: Método de requisição inválido.';
}
?>
