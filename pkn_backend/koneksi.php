<?php 
    // error_reporting(0);
    $server = "localhost";
    $user   = "root";
    $pass   = "";
    $db     = "db_pkn_quiz";

    $kon = mysqli_connect($server, $user, $pass, $db) or die();
    // if($kon){
    //     echo "terhubung";
    // }else{
    //     echo "gagal";
    // }
?>