<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_edyear = "select * from student_main_edyear where year_active='1'";
$dbquery_edyear = mysqli_query($connect,$sql_edyear);
$result_edyear=mysqli_fetch_array($dbquery_edyear);

/////////// แยกหน้า
$pagelen=25;  // 1_กำหนดแถวต่อหน้า
$sql = "select id from student_main_main where ed_year='$result_edyear[ed_year]' and school_code='$_GET[school_code]' and status='0'";

$dbquery = mysqli_query($connect,$sql);
$num_rows=mysqli_num_rows($dbquery);
$totalpages=ceil($num_rows/$pagelen);

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

$sql = "select * from student_main_main where ed_year='$result_edyear[ed_year]' and school_code='$_GET[school_code]' and status='0' order by classlevel,classroom limit $start,$pagelen";
$objQuery = mysqli_query($connect,$sql);
?>

<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<ed_year><?php echo base64_encode($result_edyear['ed_year']);?></ed_year>
	<num_rows><?php echo base64_encode($num_rows);?></num_rows>
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
				<prename><?php echo base64_encode($obResult["prename"]);?></prename>
				<student_name><?php echo base64_encode($obResult["name"]);?></student_name>
				<student_surname><?php echo base64_encode($obResult["surname"]);?></student_surname>
				<person_id><?php echo base64_encode($obResult["person_id"]);?></person_id>
				<sex_id><?php echo base64_encode($obResult["sex"]);?></sex_id>
				<classlevel><?php echo base64_encode($obResult["classlevel"]);?></classlevel>
			</item>
		<?php
		$N++;
		}
		?>
	</student>
</info>
