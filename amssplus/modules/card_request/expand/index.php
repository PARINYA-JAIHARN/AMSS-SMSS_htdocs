<?php
session_start();
define( "_VALID_", 1 );
require_once "../../../amssplus_connect.php";	
date_default_timezone_set('Asia/Bangkok');

foreach($_GET as $system_key => $system_key_val) {
 	$_GET["$system_key"] =mysqli_real_escape_string($connect,$system_key_val);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AMSSPLUS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../../../css/mm_training.css" type="text/css" />

<link href="../../../css/dropdown/dropdown.css" media="all" rel="stylesheet" type="text/css" />
<link href="../../../css/dropdown/themes/adobe.com/default.advanced.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../main_js.js"></script>

</head>

<?php

require_once("../../../smss/function.php");

require_once "../../../smss/sync.php";	

GETMODULE($_REQUEST['file']);
require_once("".$MODPATHFILE."") ;


mysqli_close($connect);
?>