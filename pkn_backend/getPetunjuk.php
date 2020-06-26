<?php 
    include 'koneksi.php';

    $sql = $kon->query("SELECT * FROM `petunjuk`");

    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
        }
    echo json_encode($data);
?>