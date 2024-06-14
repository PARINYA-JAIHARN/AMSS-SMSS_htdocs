<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<sch>
<?php

$sql_school_detail = "select * from  system_school_detail where school_code='$_REQUEST[school_code]'";
$dbquery_school_detail = mysqli_query($connect,$sql_school_detail);
$result_school_detail = mysqli_fetch_array($dbquery_school_detail);
$edschool_type=$result_school_detail['edschool_type'];
if($edschool_type==1){
$sch_type="โรงเรียนอนุบาล";
}
else if($edschool_type==2){
$sch_type="โรงเรียนประถมศึกษา";
}
else if($edschool_type==3){
$sch_type="โรงเรียนขยายโอกาสทางการศึกษา";
}
else if($edschool_type==4){
$sch_type="โรงเรียนมัธยมศึกษา";
}
else{
$sch_type="ไม่ระบุ";
}
$tambon=$result_school_detail['tambon'];
$amphoe=$result_school_detail['amphoe'];
$province=$result_school_detail['province'];
$postcode=$result_school_detail['postcode'];
$map=$result_school_detail['map'];
$school_code=$result_school_detail['school_code'];
$school_code10=$result_school_detail['school_code10'];
?>
		<item>
				<sch_type><?php echo base64_encode($sch_type);?></sch_type>
				<tambon><?php echo base64_encode($tambon);?></tambon>
				<amphoe><?php echo base64_encode($amphoe);?></amphoe>
				<province><?php echo base64_encode($province);?></province>
				<postcode><?php echo base64_encode($postcode);?></postcode>
				<map><?php echo base64_encode($map);?></map>
				<school_code><?php echo base64_encode($school_code);?></school_code>
				<school_code10><?php echo base64_encode($school_code10);?></school_code10>
		</item>
	</sch>
</info>


