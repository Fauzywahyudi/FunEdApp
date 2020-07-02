<?php 
    include 'koneksi.php';

    $idBab = $_POST['id_bab'];

    $sql = $kon->query("DELETE FROM `bab` WHERE id_bab='$idBab'");
    $sqlSub = $kon->query("DELETE FROM sub_bab WHERE id_bab='$idBab'");

    if($sql && $sqlSub){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>