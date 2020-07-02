<?php 
    include 'koneksi.php';

    
    $idSubBab   = $_POST['id_sub'];
    $isiSub     = $_POST['isi'];
    $gambar = $_POST['gambar'];

    $update = $kon->query("UPDATE `sub_bab` SET `isi`='$isiSub', `gambar`='$gambar' WHERE id_sub_bab='$idSubBab'");
    
    $get = $kon->query("SELECT * FROM `sub_bab` WHERE id_sub_bab='$idSubBab'");
    $data = array();

    if($update && $get){
        while($fetchData = $get->fetch_assoc()){
            $data[] = $fetchData;
            }
        echo json_encode($data);
    }else{
        echo json_encode($data);
    }
    
?>