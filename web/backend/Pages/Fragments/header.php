<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="../Public/css/style-header.css">

</head>

<body>


    <div class="navbar">

        <div class="container-princi">
            <form action="" method="post">
                <img src="../Public/Assets/img/banners/logo.png" alt="Logo LOC HERE" id="logo">


                <div class="input-princ">
                    <div class="pesquisar_index">

                        <img src="../Public/Assets/img/Icons/pesquisa-de-lupa.png" class="img-input">
                    </div>
                    <input type="text" placeholder="Pesquise...">
                </div>


                <div class="btns">
                    <div class="btn-cadast">
                        <?php
                        session_start();

                        $logado = $_SESSION['logado'];

                        if ($logado) {
                            $nome_cliente = $_SESSION["nome_cliente"];

                            if ($nome_cliente <> '') {

                                echo "<h1> Seu nome é : $nome_cliente </h1>";

                                echo '  <form action="../../Controller/logout_cliente_pf.php" method="post">
                            <input type="submit" name="logout" value="Sair">
                            </form>';
                            } else {

                                echo "Nada";
                            }
                        } else {
                            echo '';
                        }
                        ?>
                        <img src="../Public/Assets/img/Icons/usuario-fundo-preto.png" alt="">
                        <a href="Cadastro/cadastro_cliente_pf.php"> Cadastrar-me </a>
                        <img src="../Public/Assets/img/Icons/usuario-fundo-preto.png" alt="">
                        <a href="Login/login_cliente_pf.php">Login</a>
                    </div>
                    <div class="btn-alugar">
                        <img src="../Public/Assets/img/Icons/carro-alugado.png" alt="AlugueCarro">
                        <a href="../List/lista_carros_cliente_pf.php">Alugue aqui</a>
                    </div>

            </form>

        </div>
    </div>

    <div class="containerlinks">

        <div class="iconsCar">
            <img src="../Public/Assets/img/Icons/hatchback.png" alt="">
            <a href="#">Hatchs</a>
        </div>


        <div class="iconsCar">
            <img src="../Public/Assets/img/Icons/sedan.png" alt="">
            <a href="#">Sedãs</a>
        </div>


        <div class="iconsCar">
            <img src="../Public/Assets/img/Icons/carro-suv.png" alt="">
            <a href="#">Suv</a>
        </div>


        <div class="iconsCar">
            <img src="../Public/Assets/img/Icons/wagon.png" alt="">
            <a href="#">Peruas</a>
        </div>
        <div class="iconsCar">
            <img src="../Public/Assets/img/Icons/utilitario.png" alt="">
            <a href="#">Utilitarios</a>
        </div>
    </div>

    </div>

</body>

</html>