<?php 
    include 'koneksi.php';

    $id = $_POST['id_pertanyaan'];
    $pertanyaan = $_POST['pertanyaan'];
    $jawaban    = $_POST['jawaban'];
    $opsi       = $_POST['opsi'];

    $sql = $kon->query("UPDATE `pertanyaan` SET `pertanyaan`='$pertanyaan',`jawaban`='$jawaban',`opsi`='$opsi' WHERE id_pertanyaan='$id'");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>