<?php 
    include 'koneksi.php';

    $namaSubBab    = $_POST['nama_subbab'];
    $idBab        = $_POST['id_bab'];
    $isiSubBab = $_POST['isi_subbab'];
    $gambar = $_POST['gambar'];

    $sql = $kon->query("INSERT INTO `sub_bab`(`id_sub_bab`, `id_bab`, `nama_sub_bab`, `isi`, `gambar`) VALUES (NULL,'$idBab','$namaSubBab','$isiSubBab', '$gambar')");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
?>