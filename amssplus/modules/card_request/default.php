<?php
	if($_SESSION['user_os']=='mobile'){
	include("modules/card_request/main/newform.php");	
	}
	else{
	echo "<br />";
	echo "<br />";
	echo "<br />";
	echo "<div align='center'><img src='modules/card_request/images/message.png' border='0' width='15%'></div>";
	}
?>
