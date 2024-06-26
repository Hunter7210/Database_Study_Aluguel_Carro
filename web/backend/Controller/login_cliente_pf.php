<?php
if (isset($_POST['submit'])) {

    if (isset($_POST['Email_Cliente']) && isset($_POST['Senha_Cliente'])) {

        include("../Connection/Conexao_bd.php");

        $identificacao = $_POST['Email_Cliente'];
        $senha = $_POST['Senha_Cliente'];

        // Determinar se a identificação é um email ou CPF
        if (filter_var($identificacao, FILTER_VALIDATE_EMAIL)) {
            // É um email
            $query = "SELECT * FROM clientes_pf WHERE email_clientes_pf = :identificacao";
            $table = 'clientes_pf';
            $campSenha = 'senha_cliente_pf';
        } else {
            // Supondo que qualquer outra entrada seja um CPF
            $query = "SELECT * FROM administradores WHERE cpf_administradores = :identificacao AND senha_administradores = :senha";
            $table = 'administradores';
        }

        // Preparando a consulta
        $stmtEmailExist = $conexao->prepare($query);

        $stmtEmailExist->bindParam(':identificacao', $identificacao);
        if ($table == 'administradores') {
            $stmtEmailExist->bindParam(':senha', $senha);
        }
        
        $stmtEmailExist->execute();
        $resultEmailExist = $stmtEmailExist->fetch(PDO::FETCH_ASSOC);


        // Verificar se o resultado da consulta não está vazio
        if ($resultEmailExist) {
            if ($table <> 'administradores') {

                if (password_verify($senha, $resultEmailExist[$campSenha])) {
                    //Encaminha o usuario para a pagina de login

                    //Inclusão do arquivo funções
                    include("./functions.php");

                    // Definindo a coluna padrão
                    $column = 'pk_id_clientes_pf';
                    // Verificando se a tabela é 'administradores' e ajustando a coluna correspondente
                    if ($table == 'administradores') {
                        $column = 'cpf_administradores';
                    }

                    // Obtendo o código do usuário
                    $codUsu = $resultEmailExist[$column];

                    session_start();
                    // Verificar o nível de acesso do usuário
                    $resultado_nivel = verificarAcesso($conexao, $codUsu, $table);

                    echo $resultEmailExist;
                    $_SESSION['result_nivel'] = $resultado_nivel;
                    // Exibir o resultado da verificação de acesso para depuração


                    $url = '';
                    if ($resultado_nivel == 1) {
                        print('Você é um adiministrador');
                        $url = "../Pages/Restrito/index_adm.php";

                        header('Location:' . $url);

                        exit();
                    } elseif ($resultado_nivel == 2) {
                        print('Você é um usuario comum');
                        $url = "../Pages/index.php";
                        header('Location:' . $url);

                        exit();
                    } else {
                        print('Você é um erro');
                        $url = "../Pages/index.php";
                        header('Location:' . $url);

                        exit();
                    }
                } else {
                    // Exibir mensagem de erro se o email ou senha estiverem incorretos
                    echo "Email ou senha incorretos.";
                }
            } else {
                $url = "../Pages/Restrito/index_adm.php";
                header('Location:' . $url);
            }
        } else {
            // Exibir mensagem de erro se o email ou senha estiverem incorretos
            echo "Email ou senha incorretos.";
        }
    } else {

        // Exibir mensagem de erro se os campos não estiverem preenchidos
        echo "Por favor, preencha todos os campos.";
    }
}
