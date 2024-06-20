<?php
// endereco
// nome do BD
// usuario
// senha
$endereco = 'localhost';
$banco = 'db_locadora_carros';
$adm = 'postgres';
$senha = 'postgres';

try {
    // sgbd:host;port;dbname
    // usuario
    // senha
    // errmode
    $conexao = new PDO(
        "pgsql:host=$endereco;port=5432;dbname=$banco",
        $adm,
        $senha,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    echo '<script>console.log("Conectado no banco de dados!!!")</script>';
} catch (PDOException $e) {
    echo '<script>console.log("Falha ao conectar ao banco de dados"")</script>';

    die($e->getMessage());
}
