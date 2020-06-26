<?php 
    include 'koneksi.php';

    $id = $_POST['id'];
    $text = $_POST['text'];

    $sql = $kon->query("UPDATE `about` SET `text`='$text' WHERE  id_about='$id'");
    if($sql){
        echo "Sukses";
    }else{
        echo "Gagal";
    }
?>