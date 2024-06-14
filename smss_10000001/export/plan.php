<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_schoolname = "select * from system_school_name";
$dbquery_schoolname = mysqli_query($connect,$sql_schoolname);
$result_schoolname=mysqli_fetch_array($dbquery_schoolname);

function thai_date_3($date){
		if(!isset($date)){
		return;
		}
$thai_month_arr=array(
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

$sql_budgetyear = "select * from plan_year where year_active='1'";
$dbquery_budgetyear = mysqli_query($connect,$sql_budgetyear);
$result_budgetyear=mysqli_fetch_array($dbquery_budgetyear);
$budgetyear=$result_budgetyear['budget_year']; //ปีงบประมาณ

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<office_code><?php 
	if(isset($_GET['school_code'])){
	echo base64_encode($_GET['school_code']);
	}
	else{
	echo base64_encode($system_office_code);
	}
	?></office_code>
	<countOfstudent><?php echo $num_rows;?></countOfstudent>
	<timestamp><?php echo date("Y-m-d H:i:s");?></timestamp>
	<school_name><?php echo base64_encode($result_schoolname['school_name']);?></school_name>
	<budgetyear><?php echo base64_encode($budgetyear);?></budgetyear>
	<project>
<?php	

$sql = "select * from  plan_proj left join person_main on plan_proj.owner_proj=person_main.person_id where plan_proj.budget_year='$budgetyear' order by plan_proj.code_proj ";
$query_proj = mysqli_query($connect,$sql);
$rd=1;
	
$budget_proj_sum=0; //ตัวแปรรวมเงินโครงการ

While ($result = mysqli_fetch_array($query_proj)) {
$begin_date= $result['begin_date'];
$finish_date= $result['finish_date'];
$budget_proj_plan= $result['budget_proj'];
$budget_proj_plan2=number_format($budget_proj_plan,2);
$fullname=$result['prename'].$result['name']." ".$result['surname'];
$proj_time=thai_date_3($begin_date)." - ".thai_date_3($finish_date);

$budget_proj_sum=$budget_proj_sum+$budget_proj_plan;  //รวมเงินโครงการ

?>
			<item>
				<code_proj><?php echo base64_encode($result["code_proj"]);?></code_proj>
				<name_proj><?php echo base64_encode($result["name_proj"]);?></name_proj>
				<budget_proj_plan2><?php echo base64_encode($budget_proj_plan2);?></budget_proj_plan2>
				<proj_time><?php echo base64_encode($proj_time);?></proj_time>
				<owner><?php echo base64_encode($fullname);?></owner>
			</item>
<?php	
			
		$sql_acti = "select * from plan_acti where budget_year='$budgetyear' and code_proj='$result[code_proj]' order by code_acti";
		$query_acti = mysqli_query($connect,$sql_acti);
		$re=1;
		While ($result_acti = mysqli_fetch_array($query_acti))
		{
		$code_acti= $result_acti['code_acti'];
		$name_acti= $result_acti['name_acti'];
		$budget_acti= $result_acti['budget_acti'];
		$budget_acti=number_format($budget_acti,2);
		$begin_date_acti=$result_acti['begin_date'];
		$finish_date_acti=$result_acti['finish_date'];
		$time_acti=thai_date_3($begin_date_acti)." - ".thai_date_3($finish_date_acti);
?>
			<item2>
			<code_proj_acti><?php echo base64_encode($result["code_proj"]);?></code_proj_acti>
			<code_acti><?php echo base64_encode($code_acti);?></code_acti>
			<name_acti><?php echo base64_encode($name_acti);?></name_acti>
			<budget_acti><?php echo base64_encode($budget_acti);?></budget_acti>
			<time_acti><?php echo base64_encode($time_acti);?></time_acti>
			</item2>
<?php
		}		
$rd++;	
}	
$budget_proj_sum=number_format($budget_proj_sum,2);
?>
<budget_proj_sum><?php echo base64_encode($budget_proj_sum);?></budget_proj_sum>
</project>
</info>
