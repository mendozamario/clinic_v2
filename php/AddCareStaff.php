<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header("HTTP/1.1 200 OK");
die();
}


    require "config.php";


    $id = $_POST['id'];
    $picture = $_POST['picture'];
    $full_name = $_POST['full_name'];   
    $tipo = $_POST['tipo'];  
    $estado = $_POST['estado']; 
    $working = $_POST['working']; 
    
   /* 
    $nombre ='alex';   
    $foto = "alex";   
    $placa ="alex";   
    $telefono = "alex";   
    $whatsapp ="alex";   
    $moto = "alex";   
    $soat = "alex";   
    $tecno ="alex";   
    $activo = "alex";   
    */

    $sql = "INSERT INTO CareStaff (id, picture, full_name, tipo, estado, working) VALUES ('$id', $picture', '$full_name', '$tipo', '$estado', '$working')";
    
    if (mysqli_query($con, $sql)) {
    $respuesta = array("mensaje"=>"Datos Modificados");
    $json_string = json_encode($respuesta);
    echo $json_string;
  } else {
    $respuesta = array("mensaje"=>"Error". mysqli_error($con));
    $json_string = json_encode($respuesta);
    echo $json_string;
  }
    
?>
