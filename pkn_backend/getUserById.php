<?php 
    include 'koneksi.php';

    $id = $_POST['id'];

    $sql = $kon->query("SELECT * FROM siswa WHERE id_siswa='$id' ");
    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
    }
    echo json_encode($data);
?>