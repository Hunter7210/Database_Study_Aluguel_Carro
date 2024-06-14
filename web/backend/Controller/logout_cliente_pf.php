<?php 
session_start();

    if($_POST['logout']) {
        $logado = $_SESSION['logado'];
        if($logado){
        include('functions.php');
            logout($logado);
        } else {
            echo "Usuario não logado";
        }
         
        
    }
?>
