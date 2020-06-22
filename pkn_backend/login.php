<?php 
    include 'koneksi.php';

    $user = $_POST['username'];
    $pass = $_POST['password'];

    $sql = $kon->query("SELECT * FROM admin WHERE username='$user' AND password='$pass'");
    $jum = $sql->num_rows;
    echo $jum;
    $data = array();
    while($fetchData = $sql->fetch_assoc()){
        $data[] = $fetchData;
        }
    echo json_encode($data);
?>