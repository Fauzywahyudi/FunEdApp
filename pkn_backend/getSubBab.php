<?php 
    include 'koneksi.php';
    
    $id_bab = $_POST['id_bab'];

    $sql = $kon->query("SELECT * FROM `sub_bab` WHERE id_bab='$id_bab'");

    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
        }
    echo json_encode($data);
?>