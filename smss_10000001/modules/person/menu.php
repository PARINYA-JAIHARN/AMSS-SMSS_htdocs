<?php	
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_permission = "select * from person_permission where person_id='$_SESSION[login_user_id]'";
$dbquery_permission = mysqli_query($connect,$sql_permission);
$result_permission = mysqli_fetch_array($dbquery_permission);

if(isset($_SESSION['admin_person'])){
	$admin_person=$_SESSION['admin_person'];
}else{
	$admin_person=null;
}
	
if($_SESSION['login_status']==2){
$admin_person="person";
}

echo "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"; 
echo "<tr bgcolor='#FFCC00'><td>";
echo "<ul id='nav' class='dropdown dropdown-horizontal'>";
	echo "<li><a href='./'>$mpic_home&nbsp;รายการหลัก</a></li>";
	if(($admin_person=="person") or ($_SESSION['login_status']==99) or ($_SESSION['login_status']<=4 and $result_permission['p1']==1)){	
	echo "<li><a href='?option=person' class='dir'>$mpic1 ตั้งค่าระบบ</a>";
		echo "<ul>";
			echo "<li><a href='?option=person&task=permission'>$mpic2 เจ้าหน้าที่ครูและบุคลากร</a></li>";
			echo "<li><a href='?option=person&task=position'>$mpic2 กำหนดตำแหน่งครูและบุคลากร</a></li>";
			echo "<li><a href='?option=person&task=person_import'>$mpic2 นำเข้าข้อมูลครูและบุคลากรจาก Text File</a></li>";
		echo "</ul>";
	echo "</li>";
	}
	
	if(($admin_person=="person") or ($_SESSION['login_status']==99) or ($_SESSION['login_status']<=4 and $result_permission['p1']==1)){	
	echo "<li><a href='?option=person' class='dir'>$mpic1 ครูและบุคลากรปัจจุบัน</a>";
		echo "<ul>";
			echo "<li><a href='?option=person&task=person'>$mpic2 ข้อมูลครูและบุคลากรปัจจุบัน</a></li>";
	echo "</ul>";
	echo "</li>";
	}	
	
	if(($admin_person=="person") or ($_SESSION['login_status']<=4 and $result_permission['p1']==1)){	
	echo "<li><a href='?option=person' class='dir'>$mpic1 ครูและบุคลากรในอดีต</a>";
		echo "<ul>";
			echo "<li><a href='?option=person&task=change_status_person'>$mpic2 ข้อมูลครูและบุคลากรในอดีต</a></li>";
	echo "</ul>";
	echo "</li>";
	}	

     if(($_SESSION['login_status']<=4) or ($_SESSION['login_status']==88)){	
	echo "<li><a href='?option=person' class='dir'>$mpic1 รายงาน</a>";
		echo "<ul>";
			echo "<li><a href='?option=person&task=person_report1'>$mpic2 ข้อมูลครูและบุคลากร</a></li>";
			echo "<li><a href='modules/person/export_to_excel.php' target='_blank'>$mpic2 ส่งออกข้อมูลเป็นไฟล์ Excel</a></li>";
		echo "</ul>";
	echo "</li>";
	}
	
	echo "<li><a href='?option=person' class='dir'>$mpic1 คู่มือ</a>";
		echo "<ul>";
			echo "<li><a href='modules/person/manual/person.pdf' target='_blank'>เอกสารคู่มือ</a></li>";
			if(($admin_person=="person") or ($_SESSION['login_status']==99) or ($_SESSION['login_status']<=4 and $result_permission['p1']==1)){	
			echo "<li><a href='modules/person/manual/person.xls' target='_blank'>ตัวอย่างไฟล์ Excel</a></li>";
			}
		echo "</ul>";
	echo "</li>";
echo "</ul>";
echo "</td></tr>";
echo "</table>";
?>
