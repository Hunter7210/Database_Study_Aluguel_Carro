<?php

session_start();
$result = $_SESSION['result_nivel'];

if ($result <> 1) {
    echo "<h2>Um adm acessou esta pagina!</h2>";
} else {
    print "Um usuario normal acessou esta pagina!";
    $url = 'lista_carros_cliente_pf.php';
    header('Location:' . $url);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            width: 90%;
            height: 40%;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;
            padding: 10px;

            background-color: aqua;
        }

        img {

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

    <div class="container">
        <div class="container-card">

            <?php

            include("../../Connection/conexao_bd.php");

            try {
                $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros';
                $stmt = $conexao->query($query);
                $stmt->execute();


                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

                    echo '
                <div class="card">
                <div class="titulo-class"> 
                    <h2 class="title-h2">' . htmlspecialchars($row['modelo_carros']) .  '</h2>  //ADICIONAR A TABELA CARROS A COLUNA categoria_carros e foto_carro 
                </div>
                <div class="img">
                    <img src="' . htmlspecialchars($row['pk_placa_carros']) . '" alt="">
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

</body>

</html>

<?php

/* include("../../../Connection/conexao_bd.php");

try {
    if (isset($_POST['submit'])) {
        $busca = $_POST['pesquisa'];

        $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros WHERE carros.pk_placa_carros = :busca OR carros.disponibilidade_carros = :busca OR carros.modelo_carros = :busca OR carros.marca_carros = :busca';

        $stmt = $conexao->prepare($query);
        $stmt->bindParam(':busca', $busca);
    } elseif (isset($_POST['submit_select'])) {

        $busca_select = $_POST['pesquisa_select'];
        var_dump($busca_select);

        $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros ORDER BY :pesquisa_select';


        $stmt = $conexao->prepare($query);
        $stmt->bindParam(':pesquisa_select', $busca_select);
    } else {
        $query = 'SELECT carros.*, aluga.data_entrega_aluga FROM carros INNER JOIN aluga ON carros.pk_placa_carros = aluga.fk_placa_carros';
        $stmt = $conexao->query($query);
    }

    $stmt->execute();


    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['modelo_carros']) . "</td>";
        echo "<td>" . htmlspecialchars($row['ano_carros']) . "</td>";
        echo "<td>" . htmlspecialchars($row['marca_carros']) . "</td>";
        echo "<td>" . htmlspecialchars($row['pk_placa_carros']) . "</td>";

        if ($row['disponibilidade_carros'] == 'Disponível') {
            echo "<td style='background-color:green; width:10%;'>Disponível</td>";
        } elseif ($row['disponibilidade_carros'] == 'Indisponível') {
            echo "<td style='background-color:red; width:10%;'>Indisponível</td>";
            if ($result == 1) {
                echo "<td>" . htmlspecialchars($row['data_entrega_aluga']) . "</td>";
            }
        }

        echo "</tr>";
    }
} catch (PDOException $e) {
    echo "Erro: " . $e->getMessage();
}
$conexao = null;
?>
 */
?>
</body>

</html>