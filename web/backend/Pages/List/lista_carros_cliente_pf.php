<?php

// session_start();
// $result = $_SESSION['result_nivel'];

// if ($result <> 1) {
//     echo "<h2>Um adm acessou esta pagina!</h2>";
// } else {
//     print "Um usuario normal acessou esta pagina!";
//     $url = 'lista_carros_cliente_pf.php';
//     header('Location:' . $url);
// }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carros para alugar</title>
</head>

<body>
    <style>
        .container {
            width: 100%;

            display: flex;
            align-items: center;
            justify-content: center;

            text-align: center;
            background-color: azure;
        }

        .container-card {
            padding: 3%;
            width: 80%;
            background-color: rgb(255, 255, 255);
            display: grid;
            grid-template-columns: repeat(3, 30%);
            gap: 3%;

        }

        .card {
            width: 100%;
            height: 80vh;

            padding: 10px;
            border-radius: 20px;

            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: space-between;


            background-color: rgb(231, 231, 231);
        }

        .img {
            width: 95%;
            height: 47%;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        img {
            border-radius: 10px;
            padding: 10px;

            height: 100%;
            width: 100%;
        }

        .conteudo {
            height: 20%;

            font-family: Arial, Helvetica, sans-serif;
            font-size: 90%;
        }

        .para-card {
            font-size: 13px;
            text-align: justify;

        }

        .btn-card {
            padding: 10px;
            width: 90%;
        }

        .btn-card-valor {
            width: 100%;
            height: 8vh;

            background-color: rgb(72, 255, 0);

            border: none;
            border-radius: 10px;

            font-size: 18px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            text-transform: uppercase;

        }

        .row-conteudo {
            width: 95%;
            height: 6vh;

            display: flex;
            flex-direction: row-reverse;
            align-items: center;
            justify-content: space-between;

        }

        .disponibilidade-card {
            width: 20%;
            height: 8vh;
            padding: 3px;

            text-align: center;

            border-radius: 10px;
            border-style: solid;
            border-width: 2px;


            font-size: 8px;
        }

        .link-detail {
            font-style: none;
            color: rgb(0, 58, 165);
        }

        .titulo-class {
            width: 100%;
            height: 6vh;

            text-align: center;
        }

        .title-h2 {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            text-transform: uppercase;
            font-size: 18px;
        }
    </style>


    <div class="container-princ">

        <?php
        include('../Fragments/aluguel_cliente.php');
        ?>
        <div class="container">
            <div class="container-card">

                <?php

                include("../../Connection/conexao_bd.php");

                try {
                    $query = 'SELECT carros.*, categorias_carros.nome_categorias FROM carros INNER JOIN categorias_carros ON carros.fk_id_categorias = categorias_carros.pk_id_categorias  ORDER BY fk_id_categorias;';
                    $stmt = $conexao->query($query);
                    $stmt->execute();


                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                        echo '
                <div class="card">
                <div class="titulo-class"> 
                    <h2 class="title-h2">' . htmlspecialchars($row['nome_categorias']) .  '</h2> 
                </div> 
                <div class="img">'
                ?>

                        <?php
                        //A img_carro esta presente no servidor_img 
                        $img;
                        if ($row['img_carros'] <> null || $row['img_carros'] <> "") {
                            $img = $row['img_carros'];
                        } else {
                            $img = "http://localhost:3000/images/no_photo.png";
                        }

                        echo '
                    <img src=" ' . $img . '" alt=""> 
                </div>
                <div class="conteudo">
                    <h2>' . htmlspecialchars($row['modelo_carros']) . '</h2>
                    <p class="para-card">"Aproveite nossas ofertas. Alugamos de acordo com a disponibilidade de nossas
                        agências!"</p>
                </div>
                <div class="row-conteudo"> ' ?>

                <?php
                        if ($row['disponibilidade_carros'] == 'Disponível') {
                            echo '
                    <div class="disponibilidade-card" style="border-color: green; background-color:  rgb(72, 255, 0)">
                        <h2>Modelo Disponível </h2>
                    </div> ';
                        } else {
                            echo '<div class="disponibilidade-card" style="border-color: red; background-color: rgb(225, 51, 51);">
                        <h2>Modelo Indisponível </h2>
                    </div> ';
                        }

                        echo '
                    <div class="link-detail-class">
                        <a href="" class="link-detail">Mostrar detalhes</a>
                    </div>
                </div>
                <div class="btn-card">
                    <input type="submit" class="btn-card-valor" value="Reserve Agora">
                </div>
            </div>';
                    }
                } catch (PDOException $e) {
                    echo "Erro: " . $e->getMessage();
                }
                $conexao = null;
                ?>

            </div>
        </div>
    </div>
</body>

</html>

</body>

</html>