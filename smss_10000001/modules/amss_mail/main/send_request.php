<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

require_once "include/sync.php";
	
$modules="card";
$file="send_report_book";

echo "<iframe src='$url/modules/$modules/expand/index.php?file=$file&get_office=$office_code&sync=$sync&get_serv=$get_serv&get_person=$get_person&get_prename=$get_prename&get_name=$get_name&get_surname=$get_surname&position_code=$position_code&get_time=$get_time&get_status=$status&classlevel=$classlevel&module=$modules' height='800' width='100%'></iframe>";

?>