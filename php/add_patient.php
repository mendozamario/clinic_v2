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
    $birth_date = $_POST['birth_date'];
    $adress = $_POST['adress'];  
    $neighborhood = $_POST['neighborhood'];  
    $phone = $_POST['phone'];  
    $city = $_POST['city']; 
    $estado = $_POST['estado']; 
    
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

    $sql = "INSERT INTO Patient (id, picture, full_name, birth_date, adress, neighborhood, phone, city, estado) VALUES ('$id','$picture', '$full_name', '$birth_date', '$adress', '$neighborhood','$phone','$city','$estado')";
    
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
