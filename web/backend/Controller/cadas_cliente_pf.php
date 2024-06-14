<?php

session_start();

$_SESSION["nome_cliente"];


if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");
    // Criando minha consulta SQL para verificar se o e-mail já está em uso
    $emailExistQuery = "SELECT COUNT(*) as count FROM clientes_pf WHERE email_clientes_pf = :email";

    // Preparando a consulta
    $stmtEmailExist = $conexao->prepare($emailExistQuery);
    $stmtEmailExist->bindParam(':email', $_POST['Email_Cliente']);
    $stmtEmailExist->execute();
    $resultEmailExist = $stmtEmailExist->fetch(PDO::FETCH_ASSOC);

    // Verificando se o e-mail já está em uso
    if ($resultEmailExist['count'] > 0) {
        // E-mail já cadastrado, exibir mensagem de erro e interromper o processo
        header("Location: ../Pages/Cadastro/cadastro_cliente_pf.php?status=email_exists");
        exit();
    } else {

        //Criando minha consulta sql
        $sql = "INSERT INTO clientes_pf (nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf,fk_nivel_acesso) VALUES (:nome, :sobrenome, :email, :celular, :endereco, :cidade, :estado, :senha, 2) ";


        echo "Nome: " . $_POST['Nome_Cliente'] . "<br>";
        echo "Sobrenome: " . $_POST['Sobrenome_Cliente'] . "<br>";
        echo "Email: " . $_POST['Email_Cliente'] . "<br>";
        echo "Celular: " . $_POST['Celular_Cliente'] . "<br>";
        echo "Endereço: " . $_POST['Endereco_Cliente'] . "<br>";
        echo "Cidade: " . $_POST['Cidade_Cliente'] . "<br>";
        echo "Estado: " . $_POST['Estado_Cliente'] . "<br>";
        echo "Senha: " . $_POST['Senha_Cliente'] . "<br>";


        //Inserindo dados  
        $cadastrado = false;

        if (isset($_POST['Senha_Cliente']) && (isset($_POST['Email_Cliente']))) {

            $nome = $_POST['Nome_Cliente'];
            $sobrenome = $_POST['Sobrenome_Cliente'];
            $email = $_POST['Email_Cliente'];
            $celular = $_POST['Celular_Cliente'];
            $endereco = $_POST['Endereco_Cliente'];
            $cidade = $_POST['Cidade_Cliente'];
            $estado = $_POST['Estado_Cliente'];
            $senha = password_hash($_POST['Senha_Cliente'], PASSWORD_DEFAULT);  // Criptografando a senha

            $stmt = $conexao->prepare($sql);
            $stmt->bindValue(':nome', $nome);
            $stmt->bindValue(':sobrenome', $sobrenome);
            $stmt->bindValue(':email', $email);
            $stmt->bindValue(':celular', $celular);
            $stmt->bindValue(':endereco', $endereco);
            $stmt->bindValue(':cidade', $cidade);
            $stmt->bindValue(':estado', $estado);
            $stmt->bindValue(':senha', $senha);

            // Executando a consulta e verificando se foi bem-sucedida
            if ($stmt->execute()) {
                $cadastrado = true;
                $_SESSION["nome_cliente"] = $_POST['Nome_Cliente'];
                header("Location:  ../Pages/index.php?status=success");

            } else {
                $cadastrado = false;
                header("Location:  ../Pages/Cadastro/cadastro_cliente_pf.php?status=failed");
            }

            echo "<h2> Cliente cadastrado com sucesso</h2>";
        } else {
                    
            echo "<h2> Implementar novos dados falhou </h2>";
        }
        //Fechar a conexão 
        $conexao = null;
    }   
}
