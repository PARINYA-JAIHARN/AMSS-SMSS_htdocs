<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_edyear = "select * from student_main_edyear where year_active='1'";
$dbquery_edyear = mysqli_query($connect,$sql_edyear);
$result_edyear=mysqli_fetch_array($dbquery_edyear);

$sql_schoolname = "select * from system_school_name";
$dbquery_schoolname = mysqli_query($connect,$sql_schoolname);
$result_schoolname=mysqli_fetch_array($dbquery_schoolname);


/////////// แยกหน้า
$pagelen=25;  // 1_กำหนดแถวต่อหน้า
$sql = "select id from student_main where status='0' ";

$dbquery = mysqli_query($connect,$sql);
$num_rows=mysqli_num_rows($dbquery);
$totalpages=ceil($num_rows/$pagelen);

if(isset($_GET['page'])){
$display=1;
			//////// แยกหน้า
			if($_GET['page']<1){
			$page=$totalpages;
			}
			else{
			$page=$_GET['page'];
			}
			
			if($page<2){
			$page=1;
			}
			$start=($page-1)*$pagelen;
			///////////  end แยกหน้า
}
else{
$display=0;
}

if($display==1){
$sql = "select * from student_main left join student_main_class on student_main.class_now=student_main_class.class_code where student_main.status='0' order by student_main.class_now,student_main.student_id limit $start,$pagelen";
}
else{
$sql = "select * from student_main left join student_main_class on student_main.class_now=student_main_class.class_code where student_main.status='0' order by student_main.class_now,student_main.student_id";
}

$objQuery = mysqli_query($connect,$sql);
$num_rows=mysqli_num_rows($objQuery);

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
	<ed_year><?php echo base64_encode($result_edyear['ed_year']);?></ed_year>
	<totalpages><?php echo base64_encode($totalpages);?></totalpages>
	<page><?php echo base64_encode($page);?></page>
	<student>
		<?php
		$N=(($page-1)*$pagelen)+1;  
		while($obResult = mysqli_fetch_array($objQuery))
		{
		?>
			<item>
				<number><?php echo base64_encode($N);?></number>
				<student_id><?php echo base64_encode($obResult["student_id"]);?></student_id>
				<student_number><?php echo base64_encode($obResult["student_id"]);?></student_number>
				<prename><?php echo base64_encode($obResult["prename"]);?></prename>
				<student_name><?php echo base64_encode($obResult["name"]);?></student_name>
				<student_surname><?php echo base64_encode($obResult["surname"]);?></student_surname>
				<person_id><?php echo base64_encode($obResult["person_id"]);?></person_id>
				<sex><?php echo base64_encode($obResult["sex"]);?></sex>
				<class_now><?php echo base64_encode($obResult["class_now"]);?></class_now>
				<room><?php echo base64_encode($obResult["room"]);?></room>
				<class_name><?php echo base64_encode($obResult["class_name"]);?></class_name>
				<status><?php echo base64_encode($obResult["status"]);?></status>
			</item>
		<?php
		$N++;
		}
		?>
	</student>
</info>
