<?php 
    include 'koneksi.php';

    $idBab = $_POST['id_bab'];
    $bab = $_POST['bab'];
    $nama = $_POST['nama_bab'];

    $sql = $kon->query("UPDATE `bab` SET `bab`='$bab',`nama_bab`='$nama' WHERE id_bab='$idBab'");

    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>