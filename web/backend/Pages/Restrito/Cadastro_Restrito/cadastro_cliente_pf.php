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

    <div class="container">
        <h2>Cadastro de Clientes PF - Etapas</h2>
        <form action="../../../Controller/cadas_cliente_pf.php" method="post">
            <!-- Etapa 1 -->
            <div class="step active" id="step1">

                <div class="form-group">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" name="Nome_Cliente" required>
                </div>
                <div class="form-group">
                    <label for="sobrenome">Sobrenome:</label>
                    <input type="text" id="sobrenome" name="Sobrenome_Cliente" required>
                </div>

                <div class="form-group">
                    <label for="celular">Celular:</label>
                    <input type="tel" id="celular" name="Celular_Cliente" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="Email_Cliente" required>
                </div>
                <div class="button-group">
                    <button type="button" onclick="nextStep(2)">Próxima Etapa</button>
                </div>
            </div>
            <!-- Etapa 2 -->
            <div class="step" id="step2">
                <div class="form-group">
                    <label for="endereco">Endereço:</label>
                    <input type="text" id="endereco" name="Endereco_Cliente" required>
                </div>
                <div class="form-group">
                    <label for="cidade">Cidade:</label>
                    <input type="text" id="cidade" name="Cidade_Cliente" required>
                </div>
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <input type="text" id="estado" name="Estado_Cliente" required>
                </div>
                <div class="button-group">
                    <button type="button" onclick="previousStep(1)">Etapa Anterior</button>
                    <button type="button" onclick="nextStep(3)">Próxima Etapa</button>
                </div>
            </div>
            <!-- Etapa 3 -->
            <div class="step" id="step3">
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="Senha_Cliente" required>
                </div>
                <div class="form-group">
                    <label for="confirmar-senha">Confirmar Senha:</label>
                    <input type="password" id="confirmar-senha" name="Confirmar_Senha_Cliente" required>
                </div>

                <div class="button-group">
                    <button type="button" onclick="previousStep(2)">Etapa Anterior</button>
                    <button type="submit" id="submit" name="submit">Cadastrar</button>
                </div>
        </form>



    </div>
    <?php
    if (isset($_GET['status'])) {
        if ($_GET['status'] == 'success') {
            echo  '<br>
                <div class="container-result-sucess">
                    <h2>Cadastro realizado com sucesso</h2>
                </div>';
        } elseif ($_GET['status'] == 'email_exists') {
            echo  '<br>
                <div class="container-result-failed">
                    <h2>Email ja existente, tente novamente</h2>
                </div>';
        } else {
            echo  '<br>
                <div class="container-result-failed">
                    <h2>Erro ao cadastrar</h2>
                </div>';
        }
    }
    ?>
    <script>
        function nextStep(step) {
            var currentStep = document.querySelector('.step.active');
            currentStep.classList.remove('active');
            var nextStep = document.getElementById('step' + step);
            nextStep.classList.add('active');
        }

        function previousStep(step) {
            var currentStep = document.querySelector('.step.active');
            currentStep.classList.remove('active');
            var prevStep = document.getElementById('step' + step);
            prevStep.classList.add('active');
        }
    </script>
</body>

</html>