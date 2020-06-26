<?php 
    include 'koneksi.php';

    $idSiswa = $_POST['id_siswa'];

    $sql = $kon->query("SELECT * FROM `hasil` WHERE id_siswa='$idSiswa' ORDER BY tgl_selesai DESC LIMIT 3");

    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
        }
    echo json_encode($data);
?>