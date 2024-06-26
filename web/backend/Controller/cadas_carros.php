<?php


if (isset($_POST['submit'])) {

    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");
    // Criando minha consulta SQL para verificar se o e-mail já está em uso
    $emailExistQuery = "SELECT COUNT(*) as count FROM carros WHERE pk_placa_carros = :placa";

    // Preparando a consulta
    $stmtEmailExist = $conexao->prepare($emailExistQuery);
    $stmtEmailExist->bindParam(':placa', $_POST['pk_placa_carros']);
    $stmtEmailExist->execute();
    $resultEmailExist = $stmtEmailExist->fetch(PDO::FETCH_ASSOC);

    // Verificando se a placa já está em uso
    if ($resultEmailExist['count'] < 1) {

        //Criando minha consulta sql
        $sql = "INSERT INTO carros (pk_placa_carros, disponibilidade_carros, ano_carros, modelo_carros, marca_carros, fk_id_categorias) VALUES (:placa, :disponibilidade, :ano, :modelo, :marca, :categoria)";

        //Inserindo dados
        if (isset($_POST['placa']) && isset($_POST['placa'])) {

            $modelo = $_POST['modelo'];
            $ano = $_POST['ano'];
            $data_completa = $ano . '-01-01';
            $marca = $_POST['marca'];
            $placa = $_POST['placa'];
            $disponibilidade = $_POST['disponibilidade'];
            $categoria = $_POST['categoria'];

            $stmt = $conexao->prepare($sql);
            $stmt->bindValue(':modelo', $modelo);
            $stmt->bindValue(':ano', $data_completa, $ano);
            $stmt->bindValue(':marca', $marca);
            $stmt->bindValue(':placa', $placa);
            $stmt->bindValue(':disponibilidade', $disponibilidade);
            $stmt->bindValue(':categoria', $categoria);

            $resultQuery = $stmt->execute();
            echo $resultQuery;


            if ($resultQuery) {
                header('Location: ../Pages/Restrito/index_adm.php?status=sucess');
            } else {
                echo '<h2>Erro ao cadastrar</h2>';
            }
        } else {
            echo "<h2> Implementar novos dados falhou </h2>";
        }
        //Fechar a conexão 
        $conexao = null;
    } else {
        header("Location: ../Pages/Restrito/Cadastro_Restrito/cadastro_carros_adm.php?status=carro_exist");
        echo "Carro ja existe";
        exit();
    }
}
