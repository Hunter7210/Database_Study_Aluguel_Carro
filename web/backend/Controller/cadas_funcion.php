<?php

session_start();



if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");
    // Criando minha consulta SQL para verificar se o e-mail já está em uso
    $emailExistQuery = "SELECT COUNT(*) as count FROM funcionarios WHERE pk_id_funcionarios = :id_func";

    // Preparando a consulta
    $stmtEmailExist = $conexao->prepare($emailExistQuery);
    $stmtEmailExist->bindParam(':id_func', $_POST['pk_id_funcionarios']);
    $stmtEmailExist->execute();
    $resultEmailExist = $stmtEmailExist->fetch(PDO::FETCH_ASSOC);

    // Verificando se o e-mail já está em uso
    if ($resultEmailExist['count'] > 0) {
        // E-mail já cadastrado, exibir mensagem de erro e interromper o processo
        header("Location: ../Pages/Restrito/Cadastro_Restrito/cadastro_funcionarios.php?status=func_exist");
        exit();
    } else {

        //Criando minha consulta sql
        $sql = "INSERT INTO funcionarios (nome_funcionarios, sobrenome_funcionarios, data_contratacao_funcionarios, fk_cod_cargo) VALUES (:nome, :sobrenome, :data_contra, :cargo) ";


        echo $_POST['nome_funcionarios'];
        echo $_POST['sobrenome_funcionarios'];
        echo $_POST['data_contr'];
        echo $_POST['cargo'];


        //Inserindo dados  
        $cadastrado = false;

        if (isset($_POST['nome_funcionarios']) && (isset($_POST['cargo']))) {

            $nome = $_POST['nome_funcionarios'];
            $sobrenome = $_POST['sobrenome_funcionarios'];
            $data_contra = $_POST['data_contr'];
            $cargo = $_POST['cargo'];/* 
            $senha = password_hash($_POST['Senha_Cliente'], PASSWORD_DEFAULT);  // Criptografando a senha */

            $stmt = $conexao->prepare($sql);
            $stmt->bindValue(':nome', $nome);
            $stmt->bindValue(':sobrenome', $sobrenome);
            $stmt->bindValue(':data_contra', $data_contra);
            $stmt->bindValue(':cargo', $cargo);

            // Executando a consulta e verificando se foi bem-sucedida
            if ($stmt->execute()) {
                $cadastrado = true;
                $_SESSION["nome_funcionarios"] = $_POST['nome_funcionarios'];
                header("Location:  ../Pages/Restrito/index_adm.php?status=success");
            } else {
                $cadastrado = false;
                header("Location:  ../Pages/Restrito/Cadastro_Restrito/cadastro_funcionarios.php?status=failed");
            }

            echo "<h2> Cliente cadastrado com sucesso</h2>";
        } else {

            echo "<h2> Implementar novos dados falhou </h2>";
        }
        //Fechar a conexão 
        $conexao = null;
    }
}
