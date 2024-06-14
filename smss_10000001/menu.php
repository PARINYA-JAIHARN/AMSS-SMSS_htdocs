<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
?>
<tr bgcolor="#FFCC00">
<td colspan="5">
<ul id="nav" class="dropdown dropdown-horizontal">
<?php		
//**
if(!($_SESSION['login_status']==5)){

$sql_workgroup = "select  * from system_workgroup order by workgroup_order";
$dbquery_workgroup = mysqli_query($connect,$sql_workgroup);
While ($result_workgroup = mysqli_fetch_array($dbquery_workgroup)) {	

		if($result_workgroup['workgroup']==1){
		$menu_pic="<span class='fa fa-graduation-cap'></span>&nbsp;";
		}
		else if($result_workgroup['workgroup']==2){
		$menu_pic="<span class='fab fa-btc'></span>&nbsp;";
		}
		else if($result_workgroup['workgroup']==3){
		$menu_pic="<span class='fa fa-user'></span>&nbsp;";
		}
		else if($result_workgroup['workgroup']==4){
		$menu_pic="<span class='fa fa-th-large'></span>&nbsp;";
		}
		else if($result_workgroup['workgroup']==5){
		$menu_pic="<span class='fa fa-th-large'></span>&nbsp;";
		}
		else{
		$menu_pic="<span class='fa fa-th-large'></span>&nbsp;";
		}

		echo "<li>";
		echo "<a href='./' class='dir'>$menu_pic$result_workgroup[workgroup_desc]</a>";
					$sql_module = "select  * from system_module where workgroup='$result_workgroup[workgroup]' and module_active='1' order by module_order";
					$dbquery_module = mysqli_query($connect,$sql_module);
					echo "<ul>";
					While ($result_module = mysqli_fetch_array($dbquery_module)){
					
					if($result_module['menu_pic']!=""){
					$pic=$result_module['menu_pic'];
					$sub_menu_pic="<span class='$pic'></span>&nbsp;";
					}
					else{
					$sub_menu_pic="<span class='fa fa-th'></span>&nbsp;";
					}
					
						if(($_SESSION['login_status']<=4 or $_SESSION['login_status']==88 or $_SESSION['login_status']==99) and ($result_module['where_work']<=1)){
									if($result_module['web_link']==1){
									echo "<li><a href='$result_module[url]' target='_blank'>$sub_menu_pic$result_module[module_desc]</a></li>";
									}
									else {
									echo "<li><a href='?option=$result_module[module]'>$sub_menu_pic$result_module[module_desc]</a></li>";
									}
											if(!(isset($_SESSION['module_name_'.$result_module['module']]))){
											$_SESSION['module_name_'.$result_module['module']]=$result_module['module_desc'];
											}
						  }
						else if(($_SESSION['login_status']==6) and ($result_module['where_work']==1)){
									if($result_module['web_link']==1){
									echo "<li><a href='$result_module[url]' target='_blank'>$sub_menu_pic$result_module[module_desc]</a></li>";
									}
									else {
									echo "<li><a href='?option=$result_module[module]'>$sub_menu_pic$result_module[module_desc]</a></li>";
									}
											if(!(isset($_SESSION['module_name_'.$result_module['module']]))){
											$_SESSION['module_name_'.$result_module['module']]=$result_module['module_desc'];
											}
						  }
					}
					echo "</ul>";
echo "</li>";
}
} //end **

//แจ้งเตือน
if(!(isset($_SESSION['module_name_alert']))){
$_SESSION['module_name_alert']="แจ้งเตือน";
}
?>		
	<li><a href="?option=alert" class="dir"><span class='fa fa-info-circle'></span></span>&nbsp;แจ้งเตือน</a></li>
	
	<li><a href="./" class="dir"><span class='fa fa-user-circle'></span>&nbsp;ผู้ใช้ (User)</a>
		<ul>
<?php			
			if(($_SESSION['login_status']<=4) or ($_SESSION['login_status']==88) or ($_SESSION['login_status']==99)){	
			echo "<li><a href='?file=user_change_pwd'><span class='fas fa-pen'></span>&nbsp;เปลี่ยนรหัสผ่าน</a></li>";
			}
			if($_SESSION['login_status']==5){	
			echo "<li><a href='?file=register'><span class='fas fa-pen'></span>&nbsp;ลงทะเบียนผู้ใช้</a></li>";
			}
			echo "<li><a href='?file=manual/smss_team'><span class='fa fa-envelope'></span>&nbsp;Mail ถึงทีมงานSMSS</a></li>";
?>			
		</ul>
	</li>
</ul>
</td>
<td align="right">Version <?php echo $_SESSION['system_version']; ?>&nbsp;&nbsp;&nbsp;</td>
</tr>
