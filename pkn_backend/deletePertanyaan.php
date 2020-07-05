<?php 
    include 'koneksi.php';

    $id = $_POST['id_pertanyaan'];

    $sql = $kon->query("DELETE FROM `pertanyaan` WHERE id_pertanyaan='$id'");

    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>