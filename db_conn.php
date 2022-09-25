<?php

$sname= "localhost";
$unmae= "root";
$password = "";

$db_name = "login_pagedb";

$conn = mysqli_connect($sname, $unmae, $password, $db_name);


if (!$conn) {
	echo "Bağlantı başarısız!";
}

/*$con = new mysqli('mysql_db','root','root','mysql');
if($con){
    echo 'bağlantı başarılı';
}*/
