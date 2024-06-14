<!DOCTYPE html>
<html lang="pr-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>


    <style>
        /* Estilos para o footer */
        .footer {
            background-color: #333;
            color: #fff;
            padding: 30px 0;
            font-size: 14px;
        }

        .footer .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: flex-start;
        }

        .footer-content {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .footer-section {
            flex: 1 1 250px;
        }

        .footer-section h3 {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .footer-section p {
            font-size: 14px;
            line-height: 1.6;
        }

        .footer-section ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .footer-section ul li {
            margin-bottom: 8px;
        }

        .footer-section ul li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
            color: #ccc;
        }

        .footer-section.contact span {
            display: block;
            margin-bottom: 10px;
        }

        .footer-bottom {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
        }
    </style>
</head>

<body>


<footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>Sobre nós</h3>
                    <p>Texto sobre a locadora de veículos, sua missão, visão e valores.</p>
                </div>

                <div class="footer-section links">
                    <h3>Links úteis</h3>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Veículos</a></li>
                        <li><a href="#">Promoções</a></li>
                        <li><a href="#">Contato</a></li>
                    </ul>
                </div>

                <div class="footer-section contact">
                    <h3>Contato</h3>
                    <span><img src="Public/Assets/img/Icons/telefone.png" alt="Telefone"> (00) 1234-5678</span>
                    <span><img src="Public/Assets/img/Icons/email.png" alt="Email"> contato@locadoraveiculos.com</span>
                </div>
            </div>

            <div class="footer-bottom">
                &copy; 2024 Locadora de Veículos | Todos os direitos reservados
            </div>
        </div>
    </footer>
</body>

</html>