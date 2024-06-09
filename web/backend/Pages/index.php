<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="Public/css/style-index.css">
</head>

<body>
    <?php
    include('Fragments/header.php');
    ?>


    <!-- 
    <input type="submit" value="Login" name="login_cliente">
 -->

    <div class="container-principal-index">
        <div class="carrousel">
            <img src="Public/Assets/img/banners/Banner-60-off.png" alt=""> <!-- Imagem deve vir do servidor -->
            <!-- Criar carrousel no GPT  -->
        </div>


        <div class="container-in">
            <div class="banner-pesqui">
                <div class="titulo-pesqui">
                    <h1>Faça seu orçamento</h1>
                </div>

                <div class="inputs-pesquisa">
                    <?php
                    include('List/lista_aluguel_cliente.php')
                    ?>
                </div>
            </div>

            <div class="cards-promocao">
                <div class="titulo-cards">
                    <div class="titulo-linha">
                        <h1>CARDS</h1>
                        <hr>
                        <!-- <img src="Public/Assets/img/banners/banner-linha.png" alt="linha-fundo"> -->
                    </div>
                </div>



                <div class="cards-construcao">
                    
                    <a href=""> <!-- Tornar todo o card clicavel -->
                        <div class="conteudo-cards">
                            <img src="Public/Assets/img/banners/logo.png" alt="img pegando 70% height">
                            <div class="info-card">
                                <div class="info-card-detalhes">
                                    <h3>Descricao da promocao</h3>
                                </div>
                                <div class="info-card-btn">
                                    <input type="button" class = "conferir-promo-card"value="Conferir Promocao">
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href=""> <!-- Tornar todo o card clicavel -->
                        <div class="conteudo-cards">
                            <img src="Public/Assets/img/banners/logo.png" alt="img pegando 70% height">
                            <div class="info-card">
                                <h3>Descricao da promocao</h3>
                                <input type="button" value="conferir-promocao">
                            </div>
                        </div>
                    </a>
                </div>
            </div>


            <div class="banner-aviso">
                <img src="Public/Assets/img/banners/Banner-60-off.png" alt="">
            </div>



            <div class="cards-mais-alug">

                <div class="titulo-cards">
                    <div class="titulo-linha">
                        <h1>Mais Alugados</h1>
                        <hr>
                    </div>
                </div>

                <div class="cards-contrucao-mais-alug">
                    <a href=""> <!-- Tornar todo o card clicavel -->
                        <div class="conteudo-cards-mais-alug">
                            <img src="Public/Assets/img/banners/logo.png" alt="img pegando 70% height">
                            <div class="info-card-mais-alug">
                                <div class="descricao-card-alug">
                                    <h3>Descricao dos carros mais alugados;</h3>
                                </div>
                                <div class="btn-card">
                                    <input type="button" class="conferir-mais-alug" value="Conferir mais Alugado">
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="btn-conferir-mais-alug">
                <input type="button" class="conferir-todos-carros" value="Conferir Todos Carros">

            </div>

        </div>
    </div>

</body>

</html>

<?php
if (isset($_POST['cadastro_cliente'])) {
    header("Location: ./Cadastro/cadastro_cliente_pf.php");
    exit();
}
if (isset($_POST['login_cliente'])) {
    header("Location: ./Login/login_cliente_pf.php");
    exit();
}
