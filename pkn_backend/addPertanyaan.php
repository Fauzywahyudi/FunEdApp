<?php 
    include 'koneksi.php';

    $pertanyaan = $_POST['pertanyaan'];
    $jawaban    = $_POST['jawaban'];
    $opsi       = $_POST['opsi'];

    $sql = $kon->query("INSERT INTO `pertanyaan`(`id_pertanyaan`, `pertanyaan`, `jawaban`, `opsi`) VALUES (NULL,'$pertanyaan','$jawaban','$opsi')");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>