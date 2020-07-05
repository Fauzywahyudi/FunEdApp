<?php 
    include 'koneksi.php';

    $idBab = $_POST['id_bab'];

    $sql = $kon->query("SELECT * FROM `pertanyaan` a INNER JOIN bab b ON a.id_bab=b.id_bab ORDER BY id_pertanyaan");

    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
        }
    echo json_encode($data);
?>