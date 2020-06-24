<?php 
    include 'koneksi.php';

    $id         = $_POST['id_siswa'];
    $pertanyaan = $_POST['pertanyaan'];
    $pilihan    = $_POST['pilihan'];
    $jumPertanyaan = $_POST['jumlah_pertanyaan'];
    $jumBenar = $_POST['jumlah_benar'];

    $sql = $kon->query("INSERT INTO `hasil`(`id_hasil`, `id_siswa`, `pertanyaan`, `pilihan`, `jumlah_pertanyaan`, `pilihan_benar`, `tgl_selesai`) VALUES (NULL,'$id','$pertanyaan','$pilihan','$jumPertanyaan', '$jumBenar', NOW())");
    if($sql){
        echo "sukses";
    }else{
        echo "gagal";
    }
