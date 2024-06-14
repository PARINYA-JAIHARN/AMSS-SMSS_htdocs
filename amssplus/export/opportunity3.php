<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

function getDateThai($date){
list($y,$m,$d) =preg_split("/-/",$date);
$y=$y+543;
return "$d/$m/$y";
}

function getDateEng($date){
list($d,$m,$y)= explode("/",$date);
$y=$y-543;
return "$y-$m-$d";
}

function thai_date_3($date){
		if(!isset($date)){
		return;
		}
$thai_month_arr=array(
	"00"=>"-",
	"01"=>"มค",
	"02"=>"กพ",
	"03"=>"มีค",
	"04"=>"เมย",
	"05"=>"พค",
	"06"=>"มิย",	
	"07"=>"กค",
	"08"=>"สค",
	"09"=>"กย",
	"10"=>"ตค",
	"11"=>"พย",
	"12"=>"ธค"					
);
	$f_date_2=explode(" ", $date);
	$f_date=explode("-", $f_date_2[0]);
	$f_date[2]=intval($f_date[2]);
	$thai_date_return="";
	$thai_date_return.=	$f_date[2];
	$thai_date_return.= " ".$thai_month_arr[$f_date[1]]." ";
	$thai_date_return.=	$f_date[0]+543;
	if($date!=""){
	return $thai_date_return;
	}
	else{
	$thai_date_return="";
	return $thai_date_return;
	}
}


?>

<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
		
<?php


$sql_edyear ="SELECT ed_year FROM student_main_edyear where year_active='1' ";
$dbquery_edyear= mysqli_query($connect,$sql_edyear);
$result_edyear = mysqli_fetch_array($dbquery_edyear);
$ed_year=$result_edyear['ed_year'];
$ed_year_now=$result_edyear['ed_year'];
$table="opportunity_search".$ed_year;  //ตารางแต่ละปีการศึกษา

?>
<ed_year><?php echo base64_encode($ed_year);?></ed_year>
<?php


//หาตารางมีหรือไม่ หากไม่มีให้เพิ่มตาราง
$sql_table="SHOW TABLES FROM `$dbname` LIKE '$table' ";
$dbquery_table= mysqli_query($connect,$sql_table);
if($result_table= mysqli_fetch_array($dbquery_table)){
}
else{
}

$ed_year2=$ed_year-1;  //ปีก่อน
$table2="opportunity_search".$ed_year2; 
$sql2="SHOW TABLES FROM `$dbname` LIKE '$table2' ";
$dbquery2= mysqli_query($connect,$sql2);
if($result2= mysqli_fetch_array($dbquery2)){
$table2_status=1;
}
else{
$table2_status=0;
}  

$start_year=$ed_year-15;  //14+1 ปี
$stop_year=$ed_year-12; //12 ปี

$date_start="17/05/$start_year";	
$date_stop="16/05/$stop_year";
$date_start_page=$date_start;
$date_stop_page=$date_stop;	
$date_start=getDateEng($date_start);
$date_stop=getDateEng($date_stop);

$M=1;
$N=0;

?>
<student>
<?php 

$sql ="SELECT *,opportunity_population.person_id FROM opportunity_population left join opportunity_village on opportunity_population.moo_code = opportunity_village.vill_code 
left join opportunity_tambon on opportunity_population.tambon = opportunity_tambon.tambon_code
left join opportunity_amphoe on opportunity_population.amphoe = opportunity_amphoe.amp_code
left join opportunity_province on opportunity_population.province = opportunity_province.prov_code
left join $table on opportunity_population.person_id = $table.person_id
where (opportunity_population.birthday between '$date_start' and '$date_stop') and check_pop='1'";
		$sql2="SELECT * FROM opportunity_sch_area where school_code='$_GET[school_code]'  and area_type='1' order by province,amphoe,tambon,village"; 	
		$dbquery2 = mysqli_query($connect,$sql2);
		$x=1;
		While ($result2 = mysqli_fetch_array($dbquery2)){
				if($x==1){
				$sql=$sql." and (";
				}
				if($x>1){
				$sql=$sql." or ";
				}
		$sql=$sql."opportunity_population.moo_code='$result2[village]'";
		$x++;
		}
				if($x>1){
				$sql=$sql.")";
				}
				else {
				$sql=$sql." and opportunity_population.moo_code='00000000'";
				}
$sql_sch=$sql." order by province,amphoe,tambon,moo_code,birthday";

$dbquery_sch = mysqli_query($connect,$sql_sch);
While ($result_sch = mysqli_fetch_array($dbquery_sch)){
$person_id= $result_sch['person_id'];
$prename= $result_sch['prename'];
$name= $result_sch['name'];
$surname= $result_sch['surname'];
$birthday= $result_sch['birthday'];
$ban_no= $result_sch['ban_no'];
$moo_code= $result_sch['moo_code'];
$vill_no=substr($moo_code, -2, 2);
$vill_name= $result_sch['vill_name'];
$tambon_name= $result_sch['tambon_name'];
$amp_name= $result_sch['amp_name'];
$prov_name= $result_sch['prov_name'];
$study_school= $result_sch['study_school'];
$class= $result_sch['study_class'];
$cause= $result_sch['cause'];

if(($study_school!="") or ($cause>20)){
$N++;
}

	$prename_text="";		
	if($prename=='001'){
	$prename_text="เด็กชาย";
	}
	else if($prename=='002'){
	$prename_text="เด็กหญิง";
	}	
	else if($prename=='003'){
	$prename_text="นาย";
	}	
	else if($prename=='004'){
	$prename_text="นางสาว";
	}	

$class_text="";
if($class==1){
$class_text="อ.1(3ปี)";
}
else if($class==2){
$class_text="อ.1";
}
else if($class==3){
$class_text="อ.2";
}
else if($class==4){
$class_text="ป.1";
}
else if($class==5){
$class_text="ป.2";
}
else if($class==6){
$class_text="ป.3";
}
else if($class==7){
$class_text="ป.4";
}
else if($class==8){
$class_text="ป.5";
}
else if($class==9){
$class_text="ป.6";
}
else if($class==10){
$class_text="ม.1";
}
else if($class==11){
$class_text="ม.2";
}
else if($class==12){
$class_text="ม.3";
}
else if($class==13){
$class_text="ม.4";
}
else if($class==14){
$class_text="ม.5";
}
else if($class==15){
$class_text="ม.6";
}

if($cause>=21 and $cause<=29){
		if($cause==21){
		$study_school="<font color='red'>ไม่พบตัวตนในพื้นที่</font>";
		}
		else if($cause==22){
		$study_school="<font color='red'>ตาย</font>";
		}
		else if($cause==23){
		$study_school="<font color='red'>พิการ/เจ็บป่วยรุนแรง</font>";
		}
		else if($cause==24){
		$study_school="<font color='red'>ย้ายออกนอกพื้นที่</font>";
		}
		else if($cause==25){
		$study_school="<font color='red'>ขาดแคลน/ยากจน</font>";
		}
		else if($cause==26){
		$study_school="<font color='red'>สมรส</font>";
		}
		else if($cause==27){
		$study_school="<font color='red'>ถูกดำเนินคดี</font>";
		}
		else if($cause==28){
		$study_school="<font color='red'>ไม่ต้องการเรียน</font>";
		}
		else if($cause==29){
		$study_school="<font color='red'>สาเหตุอื่น ๆ</font>";
		}
}

		if(($M%2) == 0)
		$color="#FFFFC";
		else  $color="#FFFFFF";

$thai_date=thai_date_3($birthday);

		?>
		<item>
		<number><?php echo base64_encode($M);?></number>
		<prename><?php echo base64_encode($prename_text);?></prename>
		<name><?php echo base64_encode($name);?></name>
		<surname><?php echo base64_encode($surname);?></surname>
		<birthday><?php echo base64_encode($thai_date);?></birthday>
		<ban_no><?php echo base64_encode($ban_no);?></ban_no>
		<vill_no><?php echo base64_encode($vill_no);?></vill_no>
		<vill_name><?php echo base64_encode($vill_name);?></vill_name>
		<tambon_name><?php echo base64_encode($tambon_name);?></tambon_name>
		<amp_name><?php echo base64_encode($amp_name);?></amp_name>		
		<prov_name><?php echo base64_encode($prov_name);?></prov_name>		
		<study_school><?php echo base64_encode($study_school);?></study_school>
		<class_text><?php echo base64_encode($class_text);?></class_text>
		</item>
		<?php

//echo "</tr>";
$M++;
}
?>
</student>
<?php
	if(($M-1)>0){
	$action_percent=($N/($M-1))*100;
	$action_percent=number_format($action_percent,2);
	}
	else{
	$action_percent=0;
	}
?>
	<percent><?php echo base64_encode($action_percent);?></percent>	
</info>	
