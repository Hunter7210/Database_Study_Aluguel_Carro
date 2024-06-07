<?php


if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");


    include("./functions.php");


    if (isset($_GET['id'])) {
        if ($_GET['id'] <> "") {

            $novos_dados = [$_POST['modelo'], $_POST['ano'], $_POST['marca']];

            $i = 0;
            while ($novos_dados > $i) {
                editar_carros($conexao, $_GET['id'], $novos_dados[$i]);
            }

            
            echo  '<br>
                <div class="container-result-sucess">
                    <h2>Cadastro realizado com sucesso</h2>
                </div>';
        } elseif ($_GET['id'] == 'email_exists') {
            echo  '<br>
                <div class="container-result-failed">
                    <h2>Email ja existente, tente novamente</h2>
                </div>';
        } else {
            echo  '<br>
                <div class="container-result-failed">
                    <h2>Erro ao cadastrar</h2>
                </div>';
        }
    }
}
