<?php

session_start();

//Abrindo a sessão para armazenar o numero de dias que o usuario pretende alugar o carro
include("../Connection/Conexao_bd.php");
// Criando minha consulta SQL para verificar se o e-mail já está em uso



$data_entr = new DateTime($_POST['data_entrega']);
$data_reti = new DateTime($_POST['data_retirada']);

$intervalo = $data_reti->diff($data_entr);
echo $intervalo->format('%R%a dias');

$_SESSION['dias_alugado'] = $intervalo->days; // Extrai o número de dias do intervalo

$query = 'SELECT categorias_carros.valor_diario FROM categorias_carros';
$stmt = $conexao->query($query  );
$result = $stmt->execute();
if ($result) {

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

         echo $row['valor_diario'];

/* 
        $resultado =  $intervalo->days $row['valor_diario'];
        echo '<br>'; // Usa o número de dias na multiplicação
        echo $resultado */;
    }



} else {
    print "erro ao executar a consulta";
}





if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn submit for apertado
    include("../Connection/Conexao_bd.php");
    // Criando minha consulta SQL para verificar se o e-mail já está em uso





}
