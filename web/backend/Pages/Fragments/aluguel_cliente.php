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
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }

        .container-aluga {
            width: 65%;
            height: 17vh;
            padding: 10px;

            background-color: green;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 15px;
            padding-bottom: 10px;
            gap: 10px;
        }


        .aluga_local {
            display: flex;
            flex-direction: column;
            align-items: start;


            width: 90%;
        }

        .aluga_data_retirada {
            display: flex;
            flex-direction: column;
            align-items: start;

            width: 40%;

        }

        .aluga_data_entrega {
            display: flex;
            flex-direction: column;
            align-items: start;

            width: 40%;
        }

        .aluga_enviar {
            width: 20%;
        }

        .inputs_aluga {
            width: 100%;
            height: 8vh;

            border-radius: 9px;
            border: none;

        }

        .inputs_aluga_local {
            width: 100%;
            height: 8vh;

            border-radius: 9px;
            border: none;
        }

        .inputs_aluga_btn {
            width: 100%;
            height: 8vh;

            border-radius: 9px;
            border: none;
        }

        .aluga_enviar {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column-reverse;
        }

        .entrega_outra_cidade {
            display: flex;
            justify-content: start;
            align-items: center;
            flex-direction: row;

        }

        .container_local {
            width: 90%;
            display: flex;
            align-items: center;
            flex-direction: column;
        }

        .aluga_local_entrega {
            width: 90%;
            display: none;
        }
    </style>


    <form action="../../../Controller/verify_aluguel_carro.php" method="post">
        <div class="container">
            <div class="container-aluga">
                <div class="container_local">
                    <div class="aluga_local">
                        <p>Local de retirada:</p>
                        <input class="inputs_aluga_local" name="cidade_agencias" type="text" placeholder="Digite o local de retirada">
                    </div>
                </div>
                <div class="aluga_data_retirada">
                    <p>Data de retirada:</p>
                    <input class="inputs_aluga" name="data_retirada" type="date" placeholder="Data Retirada">
                </div>
                <div class="aluga_data_entrega">
                    <p>Data de entrega:</p>
                    <input class="inputs_aluga" name="data_entrega" type="date" placeholder="Data Entrega">
                </div>

                <div class="aluga_enviar">
                    <input class="inputs_aluga_btn" type="submit" name="submit" value="Enviar">
                </div>
            </div>
    </form>


    <?php
    /*   session_start();
    echo $_SESSION['calculo_valor']; */
    ?>
</body>

</html>