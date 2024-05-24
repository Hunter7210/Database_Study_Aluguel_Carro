<?php

// Criação de uma função para busca de todos os carros
function buscar_all_car($conexao) {
    
    $stmt = $conexao->query("SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros");

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    return $row;

}