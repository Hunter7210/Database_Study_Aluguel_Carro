
<h2>AA</h2>

<?php
if (isset($_POST['submit'])) {
    //Incluindo a conexão somente se o btn dubmit for apertador
    include("../Connection/Conexao_bd.php");    

    //Criando minha consulta sql
    $sql = "INSERT INTO clientes_pf(sobrenome_cliente, Id_Cliente_PF, nome_cliente, endereco_cliente, cidade_Cliente, Estado_cliente,celular_cliente, email_cliente, senha_cliente_pf) VALUES (:sobrenome, null, :nome, :endereco, :cidade, :Estado, :celular, :email, :senha) ";

    
    echo "Sobrenome: " . $_POST['sobrenome_cliente'] . "<br>";
    echo "Nome: " . $_POST['nome_cliente'] . "<br>";
    echo "Endereço: " . $_POST['endereco_cliente'] . "<br>";
    echo "Cidade: " . $_POST['cidade_Cliente'] . "<br>";
    echo "Estado: " . $_POST['estado_cliente'] . "<br>";
    echo "Celular: " . $_POST['celular_cliente'] . "<br>";
    echo "Email: " . $_POST['email_cliente'] . "<br>";
    echo "Senha: " . $_POST['senha_cliente_pf'] . "<br>";

    
    //Inserindo dados
    
if (isset($_POST['senha_cliente_pf']) && (isset($_POST['email_cliente']))) {
        $sobrenome = $_POST['sobrenome_cliente'];
        $nome = $_POST['nome_cliente'];
        $endereco = $_POST['endereco_cliente'];
        $cidade = $_POST['cidade_Cliente'];
        $estado = $_POST['estado_cliente'];
        $celular = $_POST['celular_cliente'];
        $email = $_POST['email_cliente'];
        $senha = $_POST['senha_cliente_pf'];


        $stmt = $conexao->prepare($sql);
        $stmt->bindValue(':sobrenome', $sobrenome);
        $stmt->bindValue(':nome', $nome);
        $stmt->bindValue(':endereco', $endereco);
        $stmt->bindValue(':cidade', $cidade);
        $stmt->bindValue(':Estado', $estado);
        $stmt->bindValue(':celular', $celular);
        $stmt->bindValue(':email', $email);
        $stmt->bindValue(':senha', $senha);

        $stmt->execute();

        echo "<h2> Carro cadastrado com sucesso</h2>";
    } else {
        
        echo "<h2> Implementar novos dados falhou </h2>";
    }
    //Fechar a conexão 
    $conexao = null;
}
