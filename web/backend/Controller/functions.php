<?php

// Criação de uma função para busca de todos os carros
function buscar_all_car($conexao)
{

    $stmt = $conexao->query("SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros");

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    return $row;
}

// Função para verificar o acesso do usuário
function verificarAcesso($conexao, $CodUsuario, $table)
{
    // Definindo a coluna padrão
    $column = 'pk_id_clientes_pf';
    // Verificando se a tabela é 'administradores' e ajustando a coluna correspondente
    if ($table == 'administradores') {
        $column = 'cpf_administradores';
    }

    // Consulta SQL para buscar o nível de acesso do usuário
    $query = "SELECT fk_nivel_acesso FROM $table WHERE $column = :codusu";
    $stmt = $conexao->prepare($query);
    $stmt->bindParam(':codusu', $CodUsuario);
    $stmt->execute();

    // Obtendo o resultado da query
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    // Retorna o nível de acesso se encontrado, caso contrário retorna false
    if ($result) {
        return $result['fk_nivel_acesso'];
    } else {
        return false;
    }
}
