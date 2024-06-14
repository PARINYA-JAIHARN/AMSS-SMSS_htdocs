<?php
header("Content-type:text/xml; charset=UTF-8");              
header("Cache-Control: no-store, no-cache, must-revalidate");             
header("Cache-Control: post-check=0, pre-check=0", false);   
echo "<?xml version='1.0' encoding='UTF-8'?>";

$remote_com = $_GET['serv'];
$pieces = explode(".", $remote_com);
$sum_pieces=1;
 foreach($pieces as $key => $val) {
 		$sum_pieces=$sum_pieces+$val;     
   }
  
$time_now=time();   
$time_now2=$time_now*$sum_pieces;

?>
<info>
	<time><?php echo $time_now2;?></time>
</info>
