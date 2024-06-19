<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locadora de Veículos</title>
    <link rel="stylesheet" href="Public/css/style-header.css">
</head>

<body>

    <div class="navbar">

        <div class="container-princi">
            <form action="" method="post">
                <img src="Public/Assets/img/banners/logo.png" alt="Logo LOC HERE" id="logo">

                <div class="input-princ">
                    <div class="pesquisar_index">
                        <img src="Public/Assets/img/Icons/pesquisa-de-lupa.png" class="img-input">
                    </div>
                    <input type="text" placeholder="Pesquise...">
                </div>

                <div class="btns">
                    <div class="btn-cadast">
                        <?php
                        session_start();

                        if (isset($_SESSION["nome_cliente"])) {
                            $nome_cliente = $_SESSION["nome_cliente"];
                            echo '<form action="Controller/logout_cliente_pf.php" method="post">
          <button type="submit">Logout</button>
          </form>';
                        } else {
                            echo '<img src="Public/Assets/img/Icons/usuario-fundo-preto.png" alt="">
          <a href="Cadastro/cadastro_cliente_pf.php">Cadastrar-me</a>   <h3> ||</h3>
          <a href="Login/login_cliente_pf.php">Login</a>';
                        }
                        ?>
                    </div>
                    <div class="btn-alugar">
                        <img src="Public/Assets/img/Icons/carro-alugado.png" alt="AlugueCarro">
                        <a href="List/lista_carros_cliente_pf.php">Alugue aqui</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <form action="./aluguel_cliente.php" class="containerlinks" method="POST">
        <div class="iconsCar">
            <img src="Public/Assets/img/Icons/hatchback.png" alt="">
            <a name="divHatch" href="#">Hatchs</a>
        </div>

        <div class="iconsCar">
            <img src="Public/Assets/img/Icons/sedan.png" alt="">
            <a name="divSeda" href="#">Sedãs</a>
        </div>

        <div class="iconsCar">
            <img src="Public/Assets/img/Icons/carro-suv.png" alt="">
            <a name="divSUV" href="#">Suv</a>
        </div>

        <div class="iconsCar">
            <img src="Public/Assets/img/Icons/wagon.png" alt="">
            <a name="divPerua" href="#">Peruas</a>
        </div>

        <div class="iconsCar">
            <img src="Public/Assets/img/Icons/utilitario.png" alt="">
            <a name="divUtili" href="#">Utilitários</a>
        </div>
    </form>

    <?php


    $complement_query = 'WHERE categorias_carros.nome_categorias = :selecao';

    if (isset($_POST['divHatch'])) {
        $stmt->bindValue(':selecao', $_POST['divHatch']);
    } else if (isset($_POST['divSeda'])) {
        $stmt->bindValue(':selecao', $_POST['divSeda']);
    } else if (isset($_POST['divSUV'])) {
        $stmt->bindValue(':selecao', $_POST['divSUV']);
    } else if (isset($_POST['divPerua'])) {
        $stmt->bindValue(':selecao', $_POST['divPerua']);
    } else if (isset($_POST['divUtili'])) {
        $stmt->bindValue(':selecao', $_POST['divUtili']);
        header('Location : ../List/lista_carros_cliente_pf.php');
    }


    ?>


</body>

</html>