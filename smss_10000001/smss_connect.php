<?php
$hostname="localhost";
$user="root";
$password="";
$dbname="smss_10000001";
$system_office_code= "10000001";

$connect=mysqli_connect($hostname,$user,$password,$dbname) or die("Could not connect MySql");
mysqli_query($connect,"SET NAMES utf8");
?> 