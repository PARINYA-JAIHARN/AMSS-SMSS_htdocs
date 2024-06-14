<?php
session_start();
require_once "amssplus_connect.php";	
define( "_VALID_", 1 );
$_SESSION['smss_mode']=1;
require_once "include/login_chk.php";	
?>
