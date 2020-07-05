<?php 
    include 'koneksi.php';

    $idBab = $_POST['id_bab'];

    $sql = $kon->query("SELECT * FROM `pertanyaan` WHERE id_bab='$idBab'");

    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
        }
    echo json_encode($data);
?>