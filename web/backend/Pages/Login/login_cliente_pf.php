<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Clientes PF - Etapas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .step {
            display: none;
        }

        .step.active {
            display: block;
        }

        form {
            width: 100%;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            color: #666;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .button-group {
            text-align: right;
        }

        button {
            padding: 10px 20px;
            margin-left: 10px;
            border: none;
            color: white;
            background-color: #5cb85c;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #4cae4c;
        }

        .container-result-sucess {
            width: 100%;
            background-color: #4cae4c;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container-result-failed {
            width: 100%;
            background-color: red;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    
<a href="../index.php">
        <img src="https://img.icons8.com/?size=100&id=pkJ2YVRU0aQW&format=png&color=000000" alt="" width="80px"></a>
    <div class="container">
        <h2>Cadastro de Clientes PF - Etapas</h2>
        <form action="../../../Controller/login_cliente_pf.php" method="post">

            <div class="step active">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="Email_Cliente" placeholder="Digite seu email" required>
                </div>
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="Senha_Cliente" placeholder="Digite sua senha" required>
                </div>
                <div class="button-group">
                    <input type="submit" name="submit" value="Entrar">

                </div>
            </div>
        </form>
    </div>
</body>

</html>