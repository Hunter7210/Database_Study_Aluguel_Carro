<?php
// Verifica se foi recebido um request POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica se todos os parâmetros necessários foram recebidos
    if (isset($_POST['pk_id_clientes_pf'], $_POST['nome_clientes_pf'], $_POST['sobrenome_clientes_pf'], $_POST['email_clientes_pf'], $_POST['celular_clientes_pf'], $_POST['endereco_clientes_pf'], $_POST['cidade_clientes_pf'], $_POST['estado_clientes_pf'])) {
        $pk_id_clientes_pf = $_POST['pk_id_clientes_pf'];
        $nome = $_POST['nome_clientes_pf'];
        $sobrenome = $_POST['sobrenome_clientes_pf'];
        $email = $_POST['email_clientes_pf'];
        $celular = $_POST['celular_clientes_pf'];
        $endereco = $_POST['endereco_clientes_pf'];
        $cidade = $_POST['cidade_clientes_pf'];
        $estado = $_POST['estado_clientes_pf'];

        // Inclui o arquivo de conexão com o banco de dados
        include("../Connection/conexao_bd.php");

        try {
            // Prepara a declaração SQL para atualizar o registro do cliente
            $query = "UPDATE clientes_pf SET nome_clientes_pf = :nome, sobrenome_clientes_pf = :sobrenome, email_clientes_pf = :email, celular_clientes_pf = :celular, endereco_clientes_pf = :endereco, cidade_clientes_pf = :cidade, estado_clientes_pf = :estado WHERE pk_id_clientes_pf = :pk_id_clientes_pf";
            $stmt = $conexao->prepare($query);
            $stmt->bindValue(':nome', $nome);
            $stmt->bindValue(':sobrenome', $sobrenome);
            $stmt->bindValue(':email', $email);
            $stmt->bindValue(':celular', $celular);
            $stmt->bindValue(':endereco', $endereco);
            $stmt->bindValue(':cidade', $cidade);
            $stmt->bindValue(':estado', $estado);
            $stmt->bindValue(':pk_id_clientes_pf', $pk_id_clientes_pf);
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
