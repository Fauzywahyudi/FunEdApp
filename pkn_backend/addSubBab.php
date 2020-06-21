<?php 
    include 'koneksi.php';

    $namaSubBab    = $_POST['nama_subbab'];
    $idBab        = $_POST['id_bab'];
    $isiSubBab = $_POST['isi_subbab'];

    $sql = $kon->query("INSERT INTO `sub_bab`(`id_sub_bab`, `id_bab`, `nama_sub_bab`, `isi`) VALUES (NULL,'$idBab','$namaSubBab','$isiSubBab')");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>