<?php

session_start();
$host = "localhost"; /* equipo */
$user = "id16840157_mendoza_mario"; /* usuario */
$password = "MarioMendoza#02"; /* clave */
$dbname = "id16840157_clinic"; /* base de datos */

$con = mysqli_connect($host, $user, $password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
//echo "Conexion Exitosa";

?>