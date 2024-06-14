<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$sql_schoolname = "select * from system_school_name";
$dbquery_schoolname = mysqli_query($connect,$sql_schoolname);
$result_schoolname=mysqli_fetch_array($dbquery_schoolname);

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
	<timestamp><?php echo date("Y-m-d H:i:s");?></timestamp>
	<school_name><?php echo base64_encode($result_schoolname['school_name']);?></school_name>

<?php
for($x=1;$x<=3;$x++){
	if($x==1){
	$test_class='6';
	}
	if($x==2){
	$test_class='9';
	}
	if($x==3){
	$test_class='12';
	}
$sql = "select distinct ed_year from achievement_main where test_type='1' and test_class='$test_class' order by ed_year";
$dbquery = mysqli_query($connect,$sql);
	?>
	<test_class>
		<class_item><?php echo base64_encode($test_class);?></class_item>
	</test_class>
	<student>
	<?php

While ($result_year = mysqli_fetch_array($dbquery)){
		$strQuery = "select thai, math, science, social, english, health, art, vocation, score_avg from achievement_main where test_type='1' and test_class='$test_class' and ed_year='$result_year[ed_year]' and level='1' ";
		$result = mysqli_query($connect,$strQuery);
		$ors = mysqli_fetch_array($result); 
		
		$ed_year=$result_year['ed_year'];
		$thai=number_format($ors['thai'],2);
		$math=number_format($ors['math'],2);
		$science=number_format($ors['science'],2);
		$social=number_format($ors['social'],2);
		$english=number_format($ors['english'],2);
		$health=number_format($ors['health'],2);
		$art=number_format($ors['art'],2);
		$vocation=number_format($ors['vocation'],2);
		$score_avg=number_format($ors['score_avg'],2);		
		?>
		<item>
			<class><?php echo base64_encode($test_class);?></class>
			<ed_year><?php echo base64_encode($ed_year);?></ed_year>
			<thai><?php echo base64_encode($thai);?></thai>
			<math><?php echo base64_encode($math);?></math>
			<science><?php echo base64_encode($science);?></science>
			<social><?php echo base64_encode($social);?></social>
			<english><?php echo base64_encode($english);?></english>
			<health><?php echo base64_encode($health);?></health>
			<art><?php echo base64_encode($art);?></art>
			<vocation><?php echo base64_encode($vocation);?></vocation>
			<score_avg><?php echo base64_encode($score_avg);?></score_avg>
		</item>
		<?php
} //while
?>
	</student>
<?php
} //for
?>
</info>
