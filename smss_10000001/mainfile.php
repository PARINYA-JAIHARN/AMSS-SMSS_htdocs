<?php
//ตรวจสอบว่ามีโมดูลหรือไม่ (โมดูล User)
function GETMODULE($option,$file){
	global $MODPATH, $MODPATHFILE ;
	if(!$option){$option = "defualt";}
	if(!$file){$file = "index";}
$modpathfile="modules/".$option."/".$file.".php";
if(file_exists($modpathfile)) {
	$MODPATHFILE = $modpathfile;
	$MODPATH = "modules/".$option."/";
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

foreach($_GET as $system_key => $system_key_val) {
   $_GET["$system_key"] =mysqli_real_escape_string($connect,$system_key_val);  
}

$mpic_home="<span class='fas fa-home'></span>";
$mpic1="<span class='fa fa-th'></span>";
$mpic2="<span class='fas fa-play-circle'></span>";
?>
