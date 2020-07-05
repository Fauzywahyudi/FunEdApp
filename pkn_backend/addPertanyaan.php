<?php 
    include 'koneksi.php';

    $idBab      = $_POST['id_bab'];
    $pertanyaan = $_POST['pertanyaan'];
    $jawaban    = $_POST['jawaban'];
    $opsi       = $_POST['opsi'];

    $sql = $kon->query("INSERT INTO `pertanyaan`(`id_pertanyaan`,id_bab, `pertanyaan`, `jawaban`, `opsi`) VALUES (NULL,'$idBab','$pertanyaan','$jawaban','$opsi')");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>