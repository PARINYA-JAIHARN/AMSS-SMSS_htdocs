<script type="text/javascript" src="../jquery/jquery-1.5.1.js"></script> 
<script type="text/javascript">

$(function(){
	$("select#module").change(function(){
		var datalist2 = $.ajax({	// รับค่าจาก ajax เก็บไว้ที่ตัวแปร datalist2
			  url: "section/default/show_name_th.php", // ไฟล์สำหรับการกำหนดเงื่อนไข
			  data:"module="+$(this).val(), // ส่งตัวแปร GET ชื่อ moduleให้มีค่าเท่ากับ ค่าของ module
			  async: false
		}).responseText;		
		$("div#displayAJAX").html(datalist2); // นำค่า datalist2 มาแสดงใน listbox ที่ 2 ที่ชื่อ displayAJAX
		// ชื่อตัวแปร และ element ต่างๆ สามารถเปลี่ยนไปตามการกำหนด
	});
});
</script>

<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
//sd page 
//ส่วนหัว
echo "<br />";
if(!(($index==1) or ($index==1.1) or ($index==1.2) or ($index==2) or ($index==5))){
echo "<table width='50%' border='0' align='center'>";
echo "<tr align='center'><td><font color='#006666' size='3'><strong>ระบบงานย่อย (Module)</strong></font></td></tr>";
echo "</table>";
}

//ส่วนฟอร์มรับข้อมูล
if($index==1){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่ม ระบบงานย่อย (Module)</Font>";
echo "</Cener>";
echo "<Br><Br><Br>";
echo "<Table width='50%' Border='0'>";
echo "<Tr><Td align='right' width='50%' >ชื่อระบบงานย่อย(อังกฤษ)&nbsp;&nbsp;&nbsp;&nbsp;</Td>
<Td align='left' width='50%' >";
echo"<select name='module' id='module'>";
echo"<option value=''><-------------เลือก------------></option>";
$dir = "../modules";
if (is_dir($dir)) {
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
                if (($file == '.')||($file == '..')||($file == 'defualt'))
                {
                }
               else  
                {
					echo"<option value='".$file."'>".$file."</option>";
			     }
        }
        closedir($dh);
    }
}
echo"</select>
</Td></Tr>";
echo "<Tr><Td align='right'>ชื่อระบบงานย่อย(ไทย)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><div id=displayAJAX></div></Td></Tr>";
echo "<Tr><Td align='right'>กลุ่ม&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='workgroup' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select  * from system_menugroup";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery))
   {
		$menugroup = $result['menugroup'];
		$menugroup_desc = $result['menugroup_desc'];
		echo  "<option value = $menugroup>$menugroup_desc</option>" ;
	}
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>การใช้งาน&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='where_work' size='1'>";
echo  "<option value ='0'>สพท. และสถานศึกษา</option>" ;
echo  "<option value ='1'>เฉพาะสพท.</option>" ;
echo  "<option value ='2'>เฉพาะสถานศึกษา</option>" ;
echo  "<option value ='3'>สพท. สถานศึกษา และผู้เรียน</option>" ;
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>Icon เมนู&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='menu_pic' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
echo  "<option value = 'fa fa-asterisk'>fa fa-asterisk</option>";
echo  "<option value = 'fa fa-book'>fa fa-book</option>";
echo  "<option value = 'fa fa-briefcase'>fa fa-briefcase</option>";
echo  "<option value = 'fab fa-btc'>fab fa-btc</option>";
echo  "<option value = 'fa fa-child'>fa fa-child</option>";
echo  "<option value = 'fa fa-envelope'>fa fa-envelope</option>";
echo  "<option value = 'fa fa-eraser'>fa fa-eraser</option>";
echo  "<option value = 'fa fa-file'>fa fa-file</option>";
echo  "<option value = 'fa fa-filter'>fa fa-filter</option>";
echo  "<option value = 'fa fa-graduation-cap'>fa fa-graduation-cap</option>";
echo  "<option value = 'fa fa-info-circle'>fa fa-info-circle</option>";
echo  "<option value = 'fa fa-list'>fa fa-list</option>";
echo  "<option value = 'fa fa-road'>fa fa-road</option>";
echo  "<option value = 'fa fa-th'>fa fa-th</option>";
echo  "<option value = 'fa fa-th-large'>fa fa-th-large</option>";
echo  "<option value = 'fa fa-th-list'>fa fa-th-list</option>";
echo  "<option value = 'fa fa-user'>fa fa-user</option>";
echo  "<option value = 'fa fa-user-circle'>fa fa-user-circle</option>";
echo "</select>";
echo "</Td></Tr>";

echo "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
echo "<tr><td align='right'></td>";
echo "<td align='left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url(1)'>
	&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url(0)'></td></tr>";
echo "</Table>";
echo "<Input Type=Hidden Name='web_link' Value='0'>";
echo "</form>";
echo "<br>";
echo "<div align='center'>*กรณีเลือกชื่อระบบงานย่อย(อังกฤษ) ไม่ได้ <a href=?file=module&index=1.2>คลิก</a></div>";
}

if($index==1.1){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่ม ระบบงานย่อยจากภายนอก (Weblink)</Font>";
echo "</Cener>";
echo "<Br><Br><Br>";
echo "<Table width='80%' Border='0'>";
echo "<Tr><Td align='right' width='50%' >ชื่อระบบงานย่อย(อังกฤษ)&nbsp;&nbsp;&nbsp;&nbsp;</Td>
<Td align='left'><Input Type='Text' Name='module' Size='30'></Td></Tr>";
echo "<Tr><Td align='right'>ชื่อระบบงานย่อย(ไทย)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='module_desc' Size='30'></Td></Tr>";
echo "<Tr><Td align='right'>URL&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='url' Size='30'></Td></Tr>";
echo "<Tr><Td align='right'>กลุ่ม(menu)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='workgroup' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select  * from system_menugroup";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery))
   {
		$menugroup = $result['menugroup'];
		$menugroup_desc = $result['menugroup_desc'];
		echo  "<option value = $menugroup>$menugroup_desc</option>" ;
	}
echo "</select>";
echo "</Td></Tr>";


echo "<Tr><Td align='right'>การใช้งาน&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='where_work' size='1'>";
echo  "<option value ='0'>สพท. และสถานศึกษา</option>" ;
echo  "<option value ='1'>เฉพาะสพท.</option>" ;
echo  "<option value ='2'>เฉพาะสถานศึกษา</option>" ;
echo  "<option value ='3'>สพท. สถานศึกษา และผู้เรียน</option>" ;
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>Icon เมนู&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='menu_pic' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
echo  "<option value = 'fa fa-asterisk'>fa fa-asterisk</option>";
echo  "<option value = 'fa fa-book'>fa fa-book</option>";
echo  "<option value = 'fa fa-briefcase'>fa fa-briefcase</option>";
echo  "<option value = 'fab fa-btc'>fab fa-btc</option>";
echo  "<option value = 'fa fa-child'>fa fa-child</option>";
echo  "<option value = 'fa fa-envelope'>fa fa-envelope</option>";
echo  "<option value = 'fa fa-eraser'>fa fa-eraser</option>";
echo  "<option value = 'fa fa-file'>fa fa-file</option>";
echo  "<option value = 'fa fa-filter'>fa fa-filter</option>";
echo  "<option value = 'fa fa-graduation-cap'>fa fa-graduation-cap</option>";
echo  "<option value = 'fa fa-info-circle'>fa fa-info-circle</option>";
echo  "<option value = 'fa fa-list'>fa fa-list</option>";
echo  "<option value = 'fa fa-road'>fa fa-road</option>";
echo  "<option value = 'fa fa-th'>fa fa-th</option>";
echo  "<option value = 'fa fa-th-large'>fa fa-th-large</option>";
echo  "<option value = 'fa fa-th-list'>fa fa-th-list</option>";
echo  "<option value = 'fa fa-user'>fa fa-user</option>";
echo  "<option value = 'fa fa-user-circle'>fa fa-user-circle</option>";
echo "</select>";
echo "</Td></Tr>";

echo "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
echo "<tr><td align='right'></td>";
echo "<td align='left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url2(1)'>
	&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url(0)'></td></tr>";
echo "</Table>";
echo "<Input Type=Hidden Name='web_link' Value='1'>";
echo "</form>";
}

if($index==1.2){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>เพิ่ม ระบบงานย่อย (Module)</Font>";
echo "</Cener>";
echo "<Br><Br>";
echo "<Table width='50%' Border='0'>";
echo "<Tr><Td align='right' width='50%' >ชื่อระบบงานย่อย(อังกฤษ)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left' width='50%' ><Input Type='Text' Name='module' Size='20' ></Td></Tr>";
echo "<Tr><Td align='right'>ชื่อระบบงานย่อย(ไทย)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='module_desc' Size='20'></Td></Tr>";
echo "<Tr><Td align='right'>กลุ่ม&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='workgroup' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select  * from system_menugroup";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery))
   {
		$menugroup = $result['menugroup'];
		$menugroup_desc = $result['menugroup_desc'];
		echo  "<option value = $menugroup>$menugroup_desc</option>" ;
	}
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>การใช้งาน&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='where_work' size='1'>";
echo  "<option value ='0'>สพท. และสถานศึกษา</option>" ;
echo  "<option value ='1'>เฉพาะสพท.</option>" ;
echo  "<option value ='2'>เฉพาะสถานศึกษา</option>" ;
echo  "<option value ='3'>สพท. สถานศึกษา และผู้เรียน</option>" ;
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>Icon เมนู&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='menu_pic' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
echo  "<option value = 'fa fa-asterisk'>fa fa-asterisk</option>";
echo  "<option value = 'fa fa-book'>fa fa-book</option>";
echo  "<option value = 'fa fa-briefcase'>fa fa-briefcase</option>";
echo  "<option value = 'fab fa-btc'>fab fa-btc</option>";
echo  "<option value = 'fa fa-child'>fa fa-child</option>";
echo  "<option value = 'fa fa-envelope'>fa fa-envelope</option>";
echo  "<option value = 'fa fa-eraser'>fa fa-eraser</option>";
echo  "<option value = 'fa fa-file'>fa fa-file</option>";
echo  "<option value = 'fa fa-filter'>fa fa-filter</option>";
echo  "<option value = 'fa fa-graduation-cap'>fa fa-graduation-cap</option>";
echo  "<option value = 'fa fa-info-circle'>fa fa-info-circle</option>";
echo  "<option value = 'fa fa-list'>fa fa-list</option>";
echo  "<option value = 'fa fa-road'>fa fa-road</option>";
echo  "<option value = 'fa fa-th'>fa fa-th</option>";
echo  "<option value = 'fa fa-th-large'>fa fa-th-large</option>";
echo  "<option value = 'fa fa-th-list'>fa fa-th-list</option>";
echo  "<option value = 'fa fa-user'>fa fa-user</option>";
echo  "<option value = 'fa fa-user-circle'>fa fa-user-circle</option>";
echo "</select>";
echo "</Td></Tr>";

echo "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
echo "<tr><td align='right'></td>";
echo "<td align='left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url(1)'>
	&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url(0)'></td></tr>";
echo "</Table>";
echo "<Input Type=Hidden Name='web_link' Value='0'>";
echo "</form>";
}

//ส่วนยืนยันการลบข้อมูล
if($index==2) {
echo "<table width='500' border='0' align='center'>";
echo "<tr><td align='center'><font color='#990000' size='4'>โปรดยืนยันความต้องการลบข้อมูลอีกครั้ง</font><br></td></tr>";
echo "<tr><td align=center>";
echo "<INPUT TYPE='button' name='smb' value='ยืนยัน' onclick='location.href=\"?file=module&index=3&id=$_GET[id]&page=$_REQUEST[page]\"'>
		&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ยกเลิก' onclick='location.href=\"?file=module&page=$_REQUEST[page]\"'";
echo "</td></tr></table>";
}

//ส่วนลบข้อมูล
if($index==3){
$sql = "delete from system_module where id=$_GET[id]";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนบันทึกข้อมูล
if($index==4){
$sql = "select * from system_module where module='$_POST[module]'";
$dbquery_module = mysqli_query($connect,$sql);
$module_num=mysqli_num_rows($dbquery_module);
	if($module_num>=1){
	echo "<div align='center'>Module นี้ได้ติดตั้งไว้แล้ว ยกเลิกการดำเนินการ</div>";
	exit();
	}
	else if($_POST['web_link']==0){
			$table_create_file = "../modules/$_POST[module]/install/create_table.php";
				if(file_exists($table_create_file)) {
				require_once("$table_create_file");
				}
	}			
	
	//ตรวจสอบว่ามีโฟลเดอร์หรือไม่
if($_POST['web_link']==0){	
		if(!(file_exists("../modules/$_POST[module]"))){
		echo "<div align='center'>ไม่มีระบบงานย่อยชื่อ $_POST[module] อยู่ในระบบ ตรวจสอบความถูกต้องอีกครั้ง</div>";
		exit();
		}
}

				$sql = "select id from system_module order by id desc";
				$dbquery = mysqli_query($connect,$sql);
				$result=mysqli_fetch_array($dbquery);
				$row_number=$result['id']+1;

if($_POST['web_link']==0){	
$sql = "insert into system_module (id,module,module_desc,workgroup,module_active,where_work,module_order,menu_pic) values ('$row_number','$_POST[module]','$_POST[module_desc]','$_POST[workgroup]','1','$_POST[where_work]','0','$_POST[menu_pic]')";
}
else if($_POST['web_link']==1){
$sql = "insert into system_module (id, module, module_desc,workgroup,module_active,web_link,url,where_work,module_order,menu_pic) values ('$row_number', '$_POST[module]', '$_POST[module_desc]','$_POST[workgroup]','1','$_POST[web_link]','$_POST[url]', '$_POST[where_work]','0','$_POST[menu_pic]')";
}
$dbquery = mysqli_query($connect,$sql);
	
} //end if index

//ส่วนฟอร์มแก้ไขข้อมูล
if ($index==5){
echo "<form id='frm1' name='frm1'>";
echo "<Center>";
echo "<Font color='#006666' Size='3'><B>แก้ไข ระบบงานย่อย</B></Font>";
echo "</Cener>";
echo "<Br><Br>";
echo "<Table width='50%' Border= '0'>";

$sql = "select * from system_module where id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
$ref_result = mysqli_fetch_array($dbquery);

echo "<Tr><Td align='right'>ชื่อระบบงานย่อย(อังกฤษ)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='module' Size='20' value='$ref_result[module]' disabled='disabled'></Td></Tr>";

echo "<Tr><Td align='right'>ชื่อระบบงานย่อย(ไทย)&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='module_desc' Size='20' value='$ref_result[module_desc]' ></Td></Tr>";

echo "<Tr><Td align='right'>กลุ่ม&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='workgroup' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
$sql = "select  * from system_menugroup";
$dbquery = mysqli_query($connect,$sql);
While ($result = mysqli_fetch_array($dbquery))
   {
		$menugroup = $result['menugroup'];
		$menugroup_desc = $result['menugroup_desc'];
			if($menugroup==$ref_result['workgroup']){
			echo  "<option value = $menugroup selected>$menugroup_desc</option>" ;
			}
			else{
			echo  "<option value = $menugroup>$menugroup_desc</option>" ;
			}
	}
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>ประเภทระบบงาน&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='web_link' size='1'>";
			if($ref_result['web_link']==1){
			echo  "<option value=0>ระบบงานย่อยภายในAMSS++</option>" ;
			echo  "<option value=1 selected>เชื่อมโยงไปโปรแกรมภายนอก</option>" ;
			}
			else{
			echo  "<option value=0 selected>ระบบงานย่อยภายในAMSS++</option>" ;
			echo  "<option value=1>เชื่อมโยงไปโปรแกรมภายนอก</option>" ;
			}
echo "</select>";
echo "</Td></Tr>";

echo "<Tr><Td align='right'>*กรณี Weblink ระบุ URL&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Input Type='Text' Name='url' Size='30' value='$ref_result[url]' ></Td></Tr>";

echo "<Tr><Td align='right'>สถานะการทำงาน&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><div align='left'><Select  name='module_active' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
	if($ref_result['module_active']==1){
	$select1="selected";
	$select2="";
	}
	else{
	$select1="";
	$select2="selected";
	}
echo  "<option value = '1' $select1>เปิดการใช้งาน</option>";
echo  "<option value = '0' $select2>ปิดการใช้งาน</option>";
echo "</select>";
echo "</div></td></tr>";

echo "<Tr><Td align='right'>การใช้งาน&nbsp;&nbsp;&nbsp;&nbsp;</Td><Td align='left'><Select name='where_work' size='1'>";
if($ref_result['where_work']==0){
echo  "<option value ='0' selected>สพท. และสถานศึกษา</option>" ;
}
else{
echo  "<option value ='0'>สพท. และสถานศึกษา</option>" ;
}
if($ref_result['where_work']==1){
echo  "<option value ='1' selected>เฉพาะสพท.</option>" ;
}
else{
echo  "<option value ='1'>เฉพาะสพท.</option>" ;
}
if($ref_result['where_work']==2){
echo  "<option value ='2' selected>เฉพาะสถานศึกษา</option>" ;
}
else{
echo  "<option value ='2'>เฉพาะสถานศึกษา</option>" ;
}
if($ref_result['where_work']==3){
echo  "<option value ='3' selected>สพท. สถานศึกษา และผู้เรียน</option>" ;
}
else{
echo  "<option value ='3'>สพท. สถานศึกษา และผู้เรียน</option>" ;
}
echo "</select>";
echo "</Td></Tr>";

$select_asterisk=""; 
$select_book=""; 
$select_briefcase=""; 
$select_btc=""; 
$select_child=""; 
$select_envelope=""; 
$select_eraser=""; 
$select_file=""; 
$select_filter=""; 
$select_graduation=""; 
$select_info=""; 
$select_list=""; 
$select_road=""; 
$select_th=""; 
$select_large=""; 
$select_thlist=""; 
$select_user=""; 
$select_usercircle=""; 

	if($ref_result['menu_pic']=="fa fa-asterisk"){
	$select_asterisk="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-book"){
	$select_book="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-briefcase"){
	$select_briefcase="selected";
	}
	else if($ref_result['menu_pic']=="fab fa-btc"){
	$select_btc="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-child"){
	$select_child="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-envelope"){
	$select_envelope="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-eraser"){
	$select_eraser="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-file"){
	$select_file="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-filter"){
	$select_filter="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-graduation-cap"){
	$select_graduation="selected";  
	}
	else if($ref_result['menu_pic']=="fa fa-info-circle"){
	$select_info="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-list"){
	$select_list="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-road"){
	$select_road="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-th"){
	$select_th="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-th-large"){
	$select_large="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-th-list"){
	$select_thlist="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-user"){
	$select_user="selected";
	}
	else if($ref_result['menu_pic']=="fa fa-user-circle"){
	$select_usercircle="selected";
	}

echo "<Tr><Td align='right'> Icon เมนู&nbsp;&nbsp;&nbsp;&nbsp;</Td>";
echo "<td><div align='left'><Select  name='menu_pic' size='1'>";
echo  "<option  value = ''>เลือก</option>" ;
echo  "<option value = 'fa fa-asterisk' $select_alert>fa fa-asterisk</option>";
echo  "<option value = 'fa fa-book' $select_book>fa fa-book</option>";
echo  "<option value = 'fa fa-briefcase' $select_briefcase>fa fa-briefcase</option>";
echo  "<option value = 'fab fa-btc' $select_btc>fab fa-btc</option>";
echo  "<option value = 'fa fa-child' $select_child>fa fa-child</option>";
echo  "<option value = 'fa fa-envelope' $select_envelope>fa fa-envelope</option>";
echo  "<option value = 'fa fa-eraser' $select_eraser>fa fa-eraser</option>";
echo  "<option value = 'fa fa-file' $select_file>fa fa-file</option>";
echo  "<option value = 'fa fa-filter' $select_filter>fa fa-filter</option>";
echo  "<option value = 'fa fa-graduation-cap' $select_graduation>fa fa-graduation-cap</option>";
echo  "<option value = 'fa fa-info-circle' $select_info>fa fa-info-circle</option>";
echo  "<option value = 'fa fa-list' $select_list>fa fa-list</option>";
echo  "<option value = 'fa fa-road' $select_road>fa fa-road</option>";
echo  "<option value = 'fa fa-th' $select_th>fa fa-th</option>";
echo  "<option value = 'fa fa-th-large' $select_large>fa fa-th-large</option>";
echo  "<option value = 'fa fa-th-list' $select_thlist>fa fa-th-list</option>";
echo  "<option value = 'fa fa-user' $select_user>fa fa-user</option>";
echo  "<option value = 'fa fa-user-circle' $select_usercircle>fa fa-user-circle</option>";
echo "</select>";
echo "</div></td></tr>";

echo "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
echo "<tr><td align='right'></td>";
echo "<td align='left'><INPUT TYPE='button' name='smb' value='ตกลง' onclick='goto_url_update(1)'>&nbsp;&nbsp;<INPUT TYPE='button' name='back' value='ย้อนกลับ' onclick='goto_url_update(0)'></td></tr>";
echo "</Table>";
echo "<Br>";
echo "<Input Type=Hidden Name='id' Value='$_GET[id]'>";
echo "<Input Type=Hidden Name='page' Value='$_GET[page]'>";
echo "</form>";
}

//ส่วนปรับปรุงข้อมูล
if ($index==6){
$rec_date = date("Y-m-d");
$sql = "update system_module set  module_desc='$_POST[module_desc]', workgroup='$_POST[workgroup]', module_active='$_POST[module_active]', web_link='$_POST[web_link]', url='$_POST[url]', where_work='$_POST[where_work]',menu_pic='$_POST[menu_pic]' where id='$_POST[id]'";
$dbquery = mysqli_query($connect,$sql);
}

if ($index==6.5){
		$sql = "select * from system_module order by  workgroup,module_order";
		$dbquery = mysqli_query($connect,$sql);
		$order_number=1;
		While ($result = mysqli_fetch_array($dbquery)){
		$module_id=$result['id'];
		
				if($_GET['module_order']==1 and $result['id']==$_GET['id']){
				$module_order=$order_number-3;
				}
				else if($_GET['module_order']==-1 and $result['id']==$_GET['id']){
				$module_order=$order_number+3;
				}
				else{
				$module_order=$order_number	;
				}
		
	
		$sql_order="update system_module set  module_order='$module_order' where id='$module_id'";
		$dbquery_order = mysqli_query($connect,$sql_order);

		$order_number++;
		$order_number++;
		}
}

//ส่วนปรับปรุงสถานะmodule
if ($index==7){
	if($_GET['module_active']==1){
	$module_active=0;
	}
	else{
	$module_active=1;
	}
$sql = "update system_module set module_active='$module_active' where id='$_GET[id]'";
$dbquery = mysqli_query($connect,$sql);
}

//ส่วนแสดงผล
if(!(($index==1) or ($index==1.1) or ($index==1.2) or ($index==2) or ($index==5))){

	//ส่วนของการแยกหน้า
$pagelen=40;  // 1_กำหนดแถวต่อหน้า
$url_link="file=module";  // 2_กำหนดลิงค์ฺ
$sql = "select * from system_module"; // 3_กำหนด sql

$dbquery = mysqli_query($connect,$sql);
$num_rows = mysqli_num_rows($dbquery );  
$totalpages=ceil($num_rows/$pagelen);

if(!(isset($_REQUEST['page']))){
$_REQUEST['page']="";
}

if($_REQUEST['page']==""){
$page=$totalpages;
		if($page<2){
		$page=1;
		}
}
else{
		if($totalpages<$_REQUEST['page']){
		$page=$totalpages;
					if($page<1){
					$page=1;
					}
		}
		else{
		$page=$_REQUEST['page'];
		}
}

$start=($page-1)*$pagelen;

if(($totalpages>1) and ($totalpages<16)){
echo "<div align=center>";
echo "หน้า	";
			for($i=1; $i<=$totalpages; $i++)	{
					if($i==$page){
					echo "[<b><font size=+1 color=#990000>$i</font></b>]";
					}
					else {
					echo "<a href=$PHP_SELF?$url_link&page=$i>[$i]</a>";
					}
			}
echo "</div>";
}			
if($totalpages>15){
			if($page <=8){
			$e_page=15;
			$s_page=1;
			}
			if($page>8){
					if($totalpages-$page>=7){
					$e_page=$page+7;
					$s_page=$page-7;
					}
					else{
					$e_page=$totalpages;
					$s_page=$totalpages-15;
					}
			}
			echo "<div align=center>";
			if($page!=1){
			$f_page1=$page-1;
			echo "<<a href=$PHP_SELF?$url_link&page=1>หน้าแรก </a>";
			echo "<<<a href=$PHP_SELF?$url_link&page=$f_page1>หน้าก่อน </a>";
			}
			else {
			echo "หน้า	";
			}					
			for($i=$s_page; $i<=$e_page; $i++){
					if($i==$page){
					echo "[<b><font size=+1 color=#990000>$i</font></b>]";
					}
					else {
					echo "<a href=$PHP_SELF?$url_link&page=$i>[$i]</a>";
					}
			}
			if($page<$totalpages)	{
			$f_page2=$page+1;
			echo "<a href=$PHP_SELF?$url_link&page=$f_page2> หน้าถัดไป</a>>>";
			echo "<a href=$PHP_SELF?$url_link&page=$totalpages> หน้าสุดท้าย</a>>";
			}
			echo " <select onchange=\"location.href=this.options[this.selectedIndex].value;\" size=\"1\" name=\"select\">";
			echo "<option  value=\"\">หน้า</option>";
				for($p=1;$p<=$totalpages;$p++){
				echo "<option  value=\"?$url_link&page=$p\">$p</option>";
				}
			echo "</select>";
echo "</div>";  
}					
//จบแยกหน้า

$sql = "select system_module.id,system_module.module,system_module.module_desc,system_module.web_link,system_module.module_active,system_menugroup.menugroup_desc, system_module.where_work, system_module.menu_pic from system_module left join system_menugroup on system_module.workgroup=system_menugroup.menugroup order by system_module.workgroup,system_module.module_order limit $start,$pagelen";
$dbquery = mysqli_query($connect,$sql);
$num_effect = mysqli_num_rows($dbquery );  // จำนวนข้อมูลในหน้านี้
echo  "<table width='95%' border='0' align='center'>";
echo "<Tr><Td colspan='7' align='left'><INPUT TYPE='button' name='smb' value='เพิ่มระบบงานย่อยภายใน (Module)' onclick='location.href=\"?file=module&index=1\"'><INPUT TYPE='button' name='smb' value='เพิ่มระบบงานย่อยจากภายนอก (Weblink)' onclick='location.href=\"?file=module&index=1.1\"'></Td></Tr>";
echo "</Table>";
echo  "<table width='95%' border='1' align='center' style='border-collapse: collapse'>";
echo "<Tr bgcolor='#E6E6E6'><Td  align='center' width='50'>ที่</Td><Td  align='center'>กลุ่ม</Td><Td  align='center' width='170'>ชื่อระบบงานย่อย(อังกฤษ)</Td><Td  align='center'>ชื่อระบบงานย่อย(ไทย)</Td><Td  align='center'>ประเภท</Td><Td align='center'  width='50'>ลำดับ</Td><Td align='center' width='60'>สถานะใช้งาน</Td><Td align='center' width='200'>การใช้งาน</Td><Td align='center'  width='70'>Icon เมนู</Td><Td align='center'  width='50'>ลบ</Td><Td align='center' width='50'>แก้ไข</Td></Tr>";

$N=(($page-1)*$pagelen)+1;  //*เกี่ยวข้องกับการแยกหน้า
$M=1;

While ($result = mysqli_fetch_array($dbquery))
	{
		$id = $result['id'];
		$module= $result['module'];
		$module_desc = $result['module_desc'];
		$module_active = $result['module_active'];
		$menugroup_desc = $result['menugroup_desc'];	
		$web_link = $result['web_link'];	
		$menu_pic = $result['menu_pic'];		
		if($web_link==1){
		$type_text="weblink ภายนอก";
		}
		else{
		$type_text="module ภายใน";
		}
			
		if(($M%2) == 0)
			$color="#FFFFC";
			else  	$color="#FFFFFF";
			if($module_active==1){
			$module_active_index="<img src=../images/yes.png border='0' alt='ปัจจุบัน:เปิดการใช้งาน'>";
			}	
			else{
			$module_active_index="<img src=../images/publish_x.png border='0' alt='ปัจจุบัน:ปิดการใช้งาน'>";
			}
		echo "<Tr bgcolor=$color><Td align='center'>$N</Td><Td align='left'>$menugroup_desc</Td><Td  align='left'>$module</Td><Td align='left'>$module_desc</Td><Td align='center'>$type_text</Td>";
		
		echo "<Td align='center'>";
		if(!($M==1 and $page==1)){
		echo "<a href=?file=module&index=6.5&id=$id&module_order=1&page=$page><img src=../images/uparrow.png border='0' alt='ขึ้นด้านบน'></a>";
		}
		if(!($M==$num_effect and $page==$totalpages)){
		echo "<a href=?file=module&index=6.5&id=$id&module_order=-1&page=$page><img src=../images/downarrow.png border='0' alt='ลงด้านล่าง'></a>";
		}
		echo "</Td>";
		
		echo "<Td align='center'><a href=?file=module&index=7&id=$id&module_active=$module_active&page=$page>$module_active_index</a></Td>";
		if($result['where_work']==0){
		$where_work_txt="สพท และสถานศึกษา";
		}
		else if($result['where_work']==1){
		$where_work_txt="เฉพาะสพท";
		}
		else if($result['where_work']==2){
		$where_work_txt="เฉพาะสถานศึกษา";
		}
		else if($result['where_work']==3){
		$where_work_txt="สพท สถานศึกษา และผู้เรียน";
		}
		echo "<td align='left'>$where_work_txt</td>";
		echo "<td align='left'>$menu_pic</td>";

		echo "<Td align='center'><a href=?file=module&index=2&id=$id&page=$page><img src=../images/drop.png border='0' alt='ลบ'></a></Td>
		<Td align='center'><a href=?file=module&index=5&id=$id&page=$page><img src=../images/edit.png border='0' alt='แก้ไข'></a></Td>
	</Tr>";
$M++;
$N++;  //*เกี่ยวข้องกับการแยกหน้า
	}
echo "</Table>";
}

?>
<script>
function goto_url(val){
	if(val==0){
		callfrm("?file=module");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.module.value == ""){
			alert("กรุณากรอกชื่อระบบงานย่อย(อังกฤษ)");
		}else if(frm1.module_desc.value==""){
			alert("กรุณากรอกชื่อระบบงานย่อย(ไทย)");
		}else if(frm1.workgroup.value==""){
			alert("กรุณาเลือกกลุ่ม");
		}else{
			callfrm("?file=module&index=4");   //page ประมวลผล
		}
	}
}

function goto_url2(val){
	if(val==0){
		callfrm("?file=module");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.module.value == ""){
			alert("กรุณากรอกชื่อระบบงานย่อย(อังกฤษ)");
		}else if(frm1.module_desc.value==""){
			alert("กรุณากรอกชื่อระบบงานย่อย(ไทย)");
		}else if(frm1.workgroup.value==""){
			alert("กรุณาเลือกกลุ่ม");
		}else{
			callfrm("?file=module&index=4");   //page ประมวลผล
		}
	}
}

function goto_url_update(val){
	if(val==0){
		callfrm("?file=module");   // page ย้อนกลับ 
	}else if(val==1){
		if(frm1.module.value == ""){
			alert("กรุณากรอกชื่อระบบงานย่อย(อังกฤษ)");
		}else if(frm1.module_desc.value==""){
			alert("กรุณากรอกชื่อระบบงานย่อย(ไทย)");
		}else if(frm1.workgroup.value==""){
			alert("กรุณาเลือกกลุ่ม");
		}else{
			callfrm("?file=module&index=6");   //page ประมวลผล
		}
	}
}
</script>
