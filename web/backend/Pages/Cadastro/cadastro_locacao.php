    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Locação</title>
        <link rel="stylesheet" href="../Public/css/style.css">

        <style>
            /* Estilo para o título */
            h2 {
                color: #333;
                font-size: 24px;
                margin-bottom: 20px;
            }

            /* Estilo para os rótulos */
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 10px;
            }

            /* Estilo para os campos de entrada */
            input[type="number"],
            input[type="date"],
            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            /* Estilo para o botão de cadastro */
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
            }

            /* Estilo para o botão de cadastro ao passar o mouse */
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body>

        <h2>Cadastro de Locação</h2>
        <form action="../../Controller/processa_cadastro_locacao.php" method="post">
            <label for="valor_total_aluga">Valor Total:</label>
            <input type="number" id="valor_total_aluga" name="valor_total_aluga" required><br><br>

            <label for="data_entrega_aluga">Data de Entrega:</label>
            <input type="date" id="data_entrega_aluga" name="data_entrega_aluga" required><br><br>

            <label for="data_retirada_aluga">Data de Retirada:</label>
            <input type="date" id="data_retirada_aluga" name="data_retirada_aluga" required><br><br>

            <label for="fk_id_clientes_pf">ID do Cliente PF:</label>
            <input type="number" id="fk_id_clientes_pf" name="fk_id_clientes_pf" required><br><br>

            <label for="fk_placa_carros">Placa do Carro:</label>
            <?php

            echo '<label name= "fk_placa_carros">' . $_GET['id'] . '</label>'
            ?>

            <input type="submit" value="Cadastrar">
        </form>
    </body>

    </html>