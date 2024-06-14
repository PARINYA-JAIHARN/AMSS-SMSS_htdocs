<?php
$PHP_SELF = "index.php";

if(!(isset($_REQUEST['index']))){
$index="";
}
else{
$index=$_REQUEST['index'];
}

//ตรวจสอบว่ามีโมดูลหรือไม่ (โมดูล User)
function GETMODULE($file){
	global $MODPATH, $MODPATHFILE ;
	if(!$file){$file = "index";}
$modpathfile=$file.".php";  
if (file_exists($modpathfile)) {
	$MODPATHFILE = $modpathfile;
	}else{
	die ("No Page");
	}
}

// รับตัวแปรผนวกไฟล์ในโมดูล
if(isset($_REQUEST['task'])){
$task=$_REQUEST['task'];
$task="$task.php";
}
else {
$task="";
}
?>
