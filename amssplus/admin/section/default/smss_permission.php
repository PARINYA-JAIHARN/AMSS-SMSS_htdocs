<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

echo "<br/>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>อนุญาตให้ SMSS เชื่อมระบบ</B></Font>";
echo "</Cener>";
echo "<br/>";

if($index==2){ 
$sql = "select * from system_school";
		$dbquery = mysqli_query($connect,$sql);
		While ($result = mysqli_fetch_array($dbquery)){
		$school_code = $result['school_code'];
			$sql2= "select * from  system_smss_permission where school='$school_code'"; 
			$dbquery2=mysqli_query($connect,$sql2);
			$member_num = mysqli_num_rows($dbquery2); 
			if($member_num<1){
					if(isset($_POST[$school_code])==1){ 
					$sql3="insert into system_smss_permission(school, status) values('$school_code','1')";	
					mysqli_query($connect,$sql3);
					}
			}
			if($member_num>=1){
					if(isset($_POST[$school_code])!=1){
					$sql4="delete from system_smss_permission where school='$school_code'"; 
					mysqli_query($connect,$sql4);
					}	
			}
		} //loop while
} //loopindex2

echo "<br/>";	
echo "<form id='frm1' name='frm1'>";
echo "<table width='50%' CELLSPACING=1 CELLPADDING=2 align='center'>";
	echo "<tr bgcolor='#000000' height='30'>";
	echo "<td align='center' width='80'><b><font color='#FFFFFF'>ที่</td>";
	echo "<td align='center' width='150'><b><font color='#FFFFFF'>รหัส</td>";
	echo "<td align='center'><b><font color='#FFFFFF'>โรงเรียน</td>";
	echo "<td align='center' width='80'><b><font color=#FFFFFF>อนุญาต</td>";
	echo "</tr>";
$sql = "select * from system_school  left join system_smss_permission on system_school.school_code=system_smss_permission.school  where school_type='1' order by system_school.school_type,system_school.school_code ";

	$dbquery = mysqli_query($connect,$sql);
	$n=1;
	While ($result = mysqli_fetch_array($dbquery)){
	$id= $result['id'];
	$school_code = $result['school_code'];
	$school = $result['school'];  
	$school_name = $result['school_name'];
	$status = $result['status'];  
					
					if($status==1){
					$bgcolor="#FFFFB"; 
					}
					else{
					$bgcolor="#F5F5F5";
					}
					
		echo "<tr bgcolor=$bgcolor>";
		echo "<td align=center>$n</td>";
		echo "<td align='center'>$school_code</td>";
		echo "<td align='left'>$school_name</td>";
		if($status==1){
		echo "<td align='center'><INPUT TYPE='checkbox' NAME='$school_code' checked value='1' ></td>";
		}
		else{
		echo "<td align='center'><INPUT TYPE='checkbox' NAME='$school_code' value='1' ></td>";
		}
		echo "</tr>";
	$n++;	
	}	
echo "</table>";
echo "<br/>";
echo "<div align='center'>";
echo "<INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url()'>";
echo "</div>";
echo "</form>";
?>

<script>
function goto_url(){
	callfrm("?file=smss_permission&index=2"); 
}
</script>
