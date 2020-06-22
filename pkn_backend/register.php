<?php 
    include 'koneksi.php';

    $nisn   = $_POST['nisn'];
    $pass   = $_POST['pass'];
    $nama   = $_POST['nama'];

    $sql = $kon->query("INSERT INTO `siswa`(`id_siswa`, `nis`, `password`, `nama`) VALUES (NULL,'$nisn','$pass','$nama')");
    if($sql){
        echo "1";
    }else{
        echo "0";
    }
?>