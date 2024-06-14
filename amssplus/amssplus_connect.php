<?php
$hostname="localhost";
$user="root";
$password="";
$dbname="amss";   
$system_office_code="16010000";    //รหัสหน่วยงาน

$connect=mysqli_connect($hostname,$user,$password,$dbname) or die("Could not connect MySql");
mysqli_query($connect,"SET NAMES utf8");
?> 