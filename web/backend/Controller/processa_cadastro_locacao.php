<?php
// Iniciar a sessão
session_start();

// Incluir o arquivo de conexão com o banco de dados
include("../Connection/Conexao_bd.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recuperar os dados do formulário
    $valor_total_aluga = $_POST['valor_total_aluga'];
    $data_entrega_aluga = $_POST['data_entrega_aluga'];
    $data_retirada_aluga = $_POST['data_retirada_aluga'];
    $fk_id_clientes_pf = $_POST['fk_id_clientes_pf'];
    $fk_placa_carros = $_POST['fk_placa_carros'];
    try {
        // Inserir os dados na tabela de locações
        $query = "INSERT INTO aluga 
                    (valor_total_aluga, data_entrega_aluga, data_retirada_aluga, fk_id_clientes_pf, fk_placa_carros, fk_cnpj_clientes_pj) 
                  VALUES 
                    (:valor_total_aluga, :data_entrega_aluga, :data_retirada_aluga, :fk_id_clientes_pf, :fk_placa_carros, 12345678000101 )";
        
        $stmt = $conexao->prepare($query);

        // Bind dos parâmetros
        $stmt->bindParam(':valor_total_aluga', $valor_total_aluga);
        $stmt->bindParam(':data_entrega_aluga', $data_entrega_aluga);
        $stmt->bindParam(':data_retirada_aluga', $data_retirada_aluga);
        $stmt->bindParam(':fk_id_clientes_pf', $fk_id_clientes_pf);
        $stmt->bindParam(':fk_placa_carros', $fk_placa_carros);

        // Executar a consulta
        $stmt->execute();

        // Redirecionar para a página de sucesso
        header("Location: ../Pages/index.php?status=success");
        exit();
    } catch (PDOException $e) {
        echo "Erro ao cadastrar a locação: " . $e->getMessage();
    }
} else {
    echo "Método de requisição inválido.";
}
?>
