<?php
// Inicia a sessão (se ainda não estiver iniciada)
session_start();

// Encerra a sessão atual
session_destroy();

// Redireciona para a página de login ou outra página desejada
header('Location: ../Pages/index.php'); // Substitua com o URL da página desejada
exit();
?>
