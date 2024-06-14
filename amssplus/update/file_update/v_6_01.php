<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql="UPDATE system_module SET menu_pic= '' ";
$dbquery = mysqli_query($connect,$sql);

$sql_update = "select * from system_module";
$dbquery_update= mysqli_query($connect,$sql_update);
While ($result_update = mysqli_fetch_array($dbquery_update)){
$module_name=$result_update['module'];
		
			if($result_update['module']=="achievement"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-graduation-cap' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="alert"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-info-circle' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="bets"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-graduation-cap' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="book"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-book' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="bookobec"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-book' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="bookpv"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-book' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="bookregister"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-book' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="budget"){
			$sql="UPDATE system_module SET menu_pic= 'fab fa-btc' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="car"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-road' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="mail"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-envelope' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="opportunity"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-child' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="othersalary"){
			$sql="UPDATE system_module SET menu_pic= 'fab fa-btc' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="person"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-user-circle' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="salary"){
			$sql="UPDATE system_module SET menu_pic= 'fab fa-btc' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="spacial_student"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-child' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="student_main"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-child' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="supervision"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-graduation-cap' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
			else if($result_update['module']=="warroom"){
			$sql="UPDATE system_module SET menu_pic= 'fa fa-filter' WHERE module= '$module_name' ";
			$dbquery = mysqli_query($connect,$sql);
			}
		
}

?>
