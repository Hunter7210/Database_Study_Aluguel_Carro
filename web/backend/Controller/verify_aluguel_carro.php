<?php

//Verifica se o btn submit não esta vazio, ou seja, foi pressionado
if (isset($_POST['submit'])) {

    //Abre a session
    session_start();

    //Incluindo a conexão somente se o btn submit for apertado
    include("../Connection/Conexao_bd.php");

    // Criando minha consulta SQL para verificar se a agencia escolhida existe
    $agenciaExistQuery = "SELECT COUNT(*) as count FROM agencias WHERE cidade_agencias = :cidade";

    //Preparação e Execução da query

    $stmtAgenciaExist = $conexao->prepare($agenciaExistQuery);
    $stmtAgenciaExist->bindParam(':cidade', $_POST['cidade_agencias']);
    $stmtAgenciaExist->execute();

    //resultAgenciaExist armazena o resultado da query 
    $resultAgenciaExist = $stmtAgenciaExist->fetch(PDO::FETCH_ASSOC);


    // Verificando se a agencia existe
    if ($resultAgenciaExist['count'] > 0) {
        //Verficar e listar quais carros estão disponíveis na agencia selecionada

        //**COMENTARIO**
        // **verificar se no meu HTML os names estão corretos; Se houver tempo, modifique a query para pesquisar pela cidade e tambem pelo endereco, lembrando que o endereco deve ser mostrado no html como um select option**
        //**COMENTARIO**


        //Listando todos os carros cadastrados na agencia selecionada
        $listCarros = "SELECT * FROM carros WHERE fk_num_agencias = :num_agencia ";

        //Preparação e execução da query
        $stmtListCarros = $conexao->prepare($listCarros);
        $stmtListCarros->bindParam(':num_agencia', $resultEmailExist['pk_agencia']);
        $stmtListCarros->execute();
        //resultListCarros armazena o resultado da query 
        $resultListCarros = $stmtListCarros->fetch(PDO::FETCH_ASSOC);

        //Calculando a data:

        //PODE CRIAR UMA FUNÇÃO PARA REALIZAR ESTE CALCULO

        // Definindo a data de entrega e retirada do veiculo
        $data_entr = new DateTime($_POST['data_entrega']);
        $data_reti = new DateTime($_POST['data_retirada']);

        //Calculando a diferença de tempo entre essas datas
        $intervalo = $data_reti->diff($data_entr);

        //Formatando como dias
        echo $intervalo->format('%R%a dias');

        //Abrindo a sessão para armazenar o numero de dias que o usuario pretende alugar o carro
        $_SESSION['dias_alugado'] = $intervalo->days; // Extrai o número de dias do intervalo

        $dias_alugado = $_SESSION['dias_alugado'];
        //Realiza uma query para buscar todos os valores de valor_diario, para realizar o calculo
        $query = 'SELECT categorias_carros.* FROM categorias_carros';
        $stmt = $conexao->prepare($query);

        //result armazena se a execução foi bem sucedida
        $result = $stmt->execute();

        // Verificando se a query foi bem-sucedida
        if ($result) {


            $custo_array = [];
            $_SESSION['custo_aluguel'] = []; // Inicializa a variável de sessão como um array associativo

            // Supondo que $stmt é o resultado de uma consulta que retorna pk_id_categorias, nome_categorias e valor_diario
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $categoria = $row['nome_categorias'];
                $valor_diario_str = $row['valor_diario'];

                // Convertendo o valor diário para um número, removendo o símbolo de moeda e espaços
                $valor_diario = floatval(str_replace(['R$', ' '], '', $valor_diario_str));

                 // Calculando o custo total do aluguel
                $custo_aluguel = $dias_alugado * $valor_diario;

                // Adicionando o custo total não formatado na sessão, mantendo apenas o último valor para cada categoria
                $_SESSION['custo_aluguel'][$categoria] = $custo_aluguel;

                // Adicionando o custo formatado ao array de custos formatados
                $custo_array[$categoria] = number_format($custo_aluguel, 2, ',', '.');
            }

            // Salvando o array de custos formatados na sessão
            $_SESSION['custo_aluguel_formatado'] = $custo_array;

            // Redirecionando para a página de lista de carros
            header('Location: ../Pages/List/lista_carros_cliente_pf.php?filter=all');
            exit();
        }

        // Se você precisar dos valores formatados na sessão, pode fazer assim:
        $_SESSION['custo_aluguel_formatado'] = $custo_array;
    } else {
        echo "Erro ao executar a consulta";
    }

    //ESTE SWITCH CASE DEVE SER COLOCADO NA MINHA VIEW SOMENTE PRA MOSTRAR
    /* 
        //Verifica se o status do carrro é <> de disponivel, no caso: Manutenção ou Indisponível
        if ($resultListCarros['disponibilidade_carros'] <> "Disponível") {
            echo "CRIE UM CARD QUE MOSTRE OS CARROS COMO INDISPONPIVEIS";
        } else {
            echo "LISTE TODOS OS CARDS DOS CARROS NORMALMENTE COM OS VALORES CORRETOS";
        } */

    //Se a agencia não existir então peça para ele tentar novamente;              
} else {
    echo "Por enquanto não existe uma das nossas agências neste endereço!";
}
