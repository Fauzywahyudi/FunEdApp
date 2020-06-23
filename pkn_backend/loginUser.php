<?php 
    include 'koneksi.php';

    $nisn = $_POST['nisn'];
    $pass = $_POST['password'];

    $sql = $kon->query("SELECT * FROM siswa WHERE nis='$nisn' AND password='$pass'");
    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
    }
    echo json_encode($data);
?>