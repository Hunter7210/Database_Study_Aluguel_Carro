<link rel="stylesheet" href="../../../frontend/css/style-header.css">
<div class="navbar">
    <div class="container-princi">
        <img src="../assets/img/banners/logo.png" alt="Logo LOC HERE" id="logo">


        <div class="input-princ">
            <img src="../assets/img/banners/logo.png" alt="">
            <input type="text" placeholder="Pesquise...">
        </div>

        <div class="btns">
            <div class="btn-cadast">
                <img src="../assets/img/banners/logo.png" alt="Cadastre-se">
                <a>Cadastre-se</a>
            </div>
            <div class="btn-alugar">
                <img src="../assets/img/banners/logo.png" alt="AlugueCarro">
                <a>Alugue aqui</a>
            </div>
        </div>
    </div>

    
    <div class="containerlinks">

        <div class="iconsCar">
            <img src="../assets/img/banners/logo.png" alt="">
            <a href="#">Hatchs</a>
        </div>


        <div class="iconsCar">
            <img src="../assets/img/banners/logo.png" alt="">
            <a href="#">Sedãs</a>
        </div>


        <div class="iconsCar">
            <img src="../assets/img/banners/logo.png" alt="">
            <a href="#">Minivans</a>
        </div>


        <div class="iconsCar">
            <img src="../assets/img/banners/logo.png" alt="">
            <a href="#">Conversível</a>
        </div>
        <div class="iconsCar">
            <img src="../assets/img/banners/logo.png" alt="">
            <a href="#">Esportivo</a>
        </div>
    </div>

</div>


<?php
session_start();
$result = $_SESSION['result_nivel'];

if($result == 1) {
    echo '<h2> $result <h2>';
}

?>