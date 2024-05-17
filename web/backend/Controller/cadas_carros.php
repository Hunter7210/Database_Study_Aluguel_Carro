<?php


if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");

    //Criando minha consulta sql
    $sql = "INSERT INTO carro (modelo, ano, marca, placa, disponibilidade) VALUES (:modelo, :ano, :marca, :placa, :disponibilidade)";

    //Inserindo dados
    if (isset($_POST['placa']) && isset($_POST['placa'])) {

        $modelo = $_POST['modelo'];
        $ano = $_POST['ano'];
        $marca = $_POST['marca'];
        $placa = $_POST['placa'];
        $disponibilidade = $_POST['disponibilidade'];


        $stmt = $conexao->prepare($sql);
        $stmt->bindValue(':modelo', $modelo);
        $stmt->bindValue(':ano', $ano);
        $stmt->bindValue(':marca', $marca);
        $stmt->bindValue(':placa', $placa);
        $stmt->bindValue(':disponibilidade', $disponibilidade);

        $stmt->execute();

        echo "<h2> Carro cadastrado com sucesso</h2>";


    } else {
        echo "<h2> Implementar novos dados falhou </h2>";
    }
    //Fechar a conexão 
    $conexao = null;
}