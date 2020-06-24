<?php 
    include 'koneksi.php';

    $id = $_POST['id'];
    $nisn = $_POST['nisn'];
    $nama = $_POST['nama'];
    $jk = $_POST['jk'];
    $kelas = $_POST['kelas'];
    $jurusan = $_POST['jurusan'];

    $sql = $kon->query("UPDATE `siswa` SET `nis`='$nisn',`nama`='$nama',`jk`='$jk',`kelas`='$kelas',`jurusan`='$jurusan' WHERE  id_siswa='$id'");
    if($sql){
        echo "Sukses";
    }else{
        echo "Gagal";
    }
?>