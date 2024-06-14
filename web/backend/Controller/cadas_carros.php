<?php


if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");

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

        $stmt->execute();

        header('../index-adm.php');
        echo "<h2> Carro cadastrado com sucesso</h2>";
        exit();


    } else {
        echo "<h2> Implementar novos dados falhou </h2>";
    }
    //Fechar a conexão 
    $conexao = null;
}