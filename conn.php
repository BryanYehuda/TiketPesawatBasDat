<?php
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $db = "fp_tiketpesawat_sbd";

    $conn = mysqli_connect($servername,$username,$password,$db);

    $data = '';

    if(!$conn){
        die("Tidak bisa connect");
    }

?>