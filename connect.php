<?php
    $server = 'localhost';
    $user='root';
    $pass='';
    $database='qlcuahangsua';
    
    $conn= new mysqLi($server, $user,$pass,$database);

    if($conn){
        mysqLi_query($conn,"SET NAMES 'utf8' ");
        echo 'ket noi thanh cong';
    }
    else{
        echo 'ket noi that bai';
    }
?>