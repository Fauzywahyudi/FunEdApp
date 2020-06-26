<?php 
    include 'koneksi.php';

    $id = $_POST['id'];
    $text = $_POST['text'];

    $sql = $kon->query("UPDATE `petunjuk` SET `text`='$text' WHERE  id_petunjuk='$id'");
    if($sql){
        echo "Sukses";
    }else{
        echo "Gagal";
    }
?>