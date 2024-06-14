<?php
// salvar_edicao.php

include("../Connection/conexao_bd.php");
include("./functions.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {


    $pk_placa_carros = $_POST['pk_placa_carros'];
    $modelo = $_POST['modelo'];
    $ano = $_POST['ano'];
    $marca = $_POST['marca'];
    $disponibilidade = $_POST['disponibilidade'];

    try {
        $query = 'UPDATE carros SET modelo_carros = :modelo, ano_carros = :ano, marca_carros = :marca, disponibilidade_carros = :disponibilidade WHERE pk_placa_carros = :pk_placa_carros';
        $stmt = $conexao->prepare($query);
        $stmt->bindParam(':modelo', $modelo);
        $stmt->bindParam(':ano', $ano);
        $stmt->bindParam(':marca', $marca);
        $stmt->bindParam(':disponibilidade', $disponibilidade);
        $stmt->bindParam(':pk_placa_carros', $pk_placa_carros);

        if ($stmt->execute()) {
            echo "success";
        } else {
            $errorInfo = $stmt->errorInfo();
            echo "error: " . $errorInfo[2];
        }
    } catch (PDOException $e) {
        echo "PDOException: " . $e->getMessage();
    }
} else {
    echo "invalid_request";
}
?>
