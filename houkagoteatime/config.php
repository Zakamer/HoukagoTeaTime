<?php
// db settings
$hostname = 'localhost';
$username = 'root';
$password = '';
$database = 'db_si_silalahi';

// db connection
$con = mysqli_connect($hostname, $username, $password, $database) or die("Error " . mysqli_error($con));

?>