<?php 
    include 'koneksi.php';

    $namaBab    = $_POST['nama_bab'];
    $bab        = $_POST['bab'];

    $sql = $kon->query("INSERT INTO `bab`(`id_bab`, `bab`, `nama_bab`) VALUES (NULL,'$bab','$namaBab')");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>