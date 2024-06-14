<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<ach>
<?php

  //ส่วนของปีการศึกษา  ป.3
 	$strQuery = "select distinct ed_year from achievement_main where  test_type='2' and test_class='3' and school='$_GET[school_code]' order by ed_year ";
	$result = mysqli_query($connect,$strQuery);
	$year_num=1;
	$year_now=0;
	while($ors = mysqli_fetch_array($result)) {
	$ed_year_ar[$year_num]=$ors['ed_year'];
	$year_now=$ors['ed_year'];
	$year_num++;
	}
$year_num_p3=$year_num-1;  //จำนวนปีที่แสดง
$year_now_p3=$year_now;

for($x=1;$x<=$year_num_p3;$x++){
  		$strQuery = "select thai, math, science, score_avg from achievement_main where test_type='2' and test_class='3' and ed_year='$ed_year_ar[$x]' and school='$_GET[school_code]' ";
		$result = mysqli_query($connect,$strQuery);
		$ors = mysqli_fetch_array($result);  
		
		$thai=number_format($ors['thai'],2);
		$math=number_format($ors['math'],2);
		$science=number_format($ors['science'],2);
		$score_avg=number_format($ors['score_avg'],2);							
  		$ed_year=$ed_year_ar[$x];
		?>
		<item>
				<thai><?php echo base64_encode($thai);?></thai>
				<math><?php echo base64_encode($math);?></math>
				<science><?php echo base64_encode($science);?></science>
				<score_avg><?php echo base64_encode($score_avg);?></score_avg>
				<ed_year><?php echo base64_encode($ed_year);?></ed_year>
		</item>
		<?php	
}

?>
	</ach>
<year_num_p3><?php echo base64_encode($year_num_p3);?></year_num_p3>
<year_now_p3><?php echo base64_encode($year_now_p3);?></year_now_p3>
</info>



