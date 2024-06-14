<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<ach>
<?php

  //ส่วนของปีการศึกษา  ป.6
 	$strQuery = "select distinct ed_year from achievement_main where  test_type='1' and test_class='6' and school='$_GET[school_code]' order by ed_year ";
	$result = mysqli_query($connect,$strQuery);
	$year_num=1;
	$year_now=0;
	while($ors = mysqli_fetch_array($result)) {
	$ed_year_ar[$year_num]=$ors['ed_year'];
	$year_now=$ors['ed_year'];
	$year_num++;
	}
$year_num_p6=$year_num-1;  //จำนวนปีที่แสดง
$year_now_p6=$year_now;

for($x=1;$x<=$year_num_p6;$x++){
  		$strQuery = "select thai, math, science, social, english, health, art, vocation, score_avg from achievement_main where test_type='1' and test_class='6' and ed_year='$ed_year_ar[$x]' and school='$_GET[school_code]' ";
		$result = mysqli_query($connect,$strQuery);
		$ors = mysqli_fetch_array($result);  
		
		$thai=number_format($ors['thai'],2);
		$math=number_format($ors['math'],2);
		$science=number_format($ors['science'],2);
		$social=number_format($ors['social'],2);
		$english=number_format($ors['english'],2);
		$health=number_format($ors['health'],2);
		$art=number_format($ors['art'],2);
		$vocation=number_format($ors['vocation'],2);
		$score_avg=number_format($ors['score_avg'],2);							
  		$ed_year=$ed_year_ar[$x];
		?>
		<item>
				<thai><?php echo base64_encode($thai);?></thai>
				<math><?php echo base64_encode($math);?></math>
				<science><?php echo base64_encode($science);?></science>
				<social><?php echo base64_encode($social);?></social>
				<english><?php echo base64_encode($english);?></english>
				<health><?php echo base64_encode($health);?></health>
				<art><?php echo base64_encode($art);?></art>
				<vocation><?php echo base64_encode($vocation);?></vocation>
				<score_avg><?php echo base64_encode($score_avg);?></score_avg>
				<ed_year><?php echo base64_encode($ed_year);?></ed_year>
		</item>
		<?php	
}

  //ส่วนของปีการศึกษา  ม.3
 	$strQuery = "select distinct ed_year from achievement_main where  test_type='1' and test_class='9' and school='$_GET[school_code]' order by ed_year ";
	$result = mysqli_query($connect,$strQuery);
	$year_num=1;
	$year_now=0;
	while($ors = mysqli_fetch_array($result)) {
	$ed_year_ar[$year_num]=$ors['ed_year'];
	$year_now=$ors['ed_year'];
	$year_num++;
	}
$year_num_p9=$year_num-1;  //จำนวนปีที่แสดง
$year_now_p9=$year_now;

for($x=1;$x<=$year_num_p9;$x++){
  		$strQuery = "select thai, math, science, social, english, health, art, vocation, score_avg from achievement_main where test_type='1' and test_class='9' and ed_year='$ed_year_ar[$x]' and school='$_GET[school_code]' ";
		$result = mysqli_query($connect,$strQuery);
		$ors = mysqli_fetch_array($result);  
		
		$thai=number_format($ors['thai'],2);
		$math=number_format($ors['math'],2);
		$science=number_format($ors['science'],2);
		$social=number_format($ors['social'],2);
		$english=number_format($ors['english'],2);
		$health=number_format($ors['health'],2);
		$art=number_format($ors['art'],2);
		$vocation=number_format($ors['vocation'],2);
		$score_avg=number_format($ors['score_avg'],2);							
  		$ed_year=$ed_year_ar[$x];
		?>
		<item2>
				<thai><?php echo base64_encode($thai);?></thai>
				<math><?php echo base64_encode($math);?></math>
				<science><?php echo base64_encode($science);?></science>
				<social><?php echo base64_encode($social);?></social>
				<english><?php echo base64_encode($english);?></english>
				<health><?php echo base64_encode($health);?></health>
				<art><?php echo base64_encode($art);?></art>
				<vocation><?php echo base64_encode($vocation);?></vocation>
				<score_avg><?php echo base64_encode($score_avg);?></score_avg>
				<ed_year><?php echo base64_encode($ed_year);?></ed_year>
		</item2>
		<?php	
}

  //ส่วนของปีการศึกษา  ม.6
 	$strQuery = "select distinct ed_year from achievement_main where  test_type='1' and test_class='12' and school='$_GET[school_code]' order by ed_year ";
	$result = mysqli_query($connect,$strQuery);
	$year_num=1;
	$year_now=0;
	while($ors = mysqli_fetch_array($result)) {
	$ed_year_ar[$year_num]=$ors['ed_year'];
	$year_now=$ors['ed_year'];
	$year_num++;
	}
$year_num_p12=$year_num-1;  //จำนวนปีที่แสดง
$year_now_p12=$year_now;

for($x=1;$x<=$year_num_p12;$x++){
  		$strQuery = "select thai, math, science, social, english, health, art, vocation, score_avg from achievement_main where test_type='1' and test_class='12' and ed_year='$ed_year_ar[$x]' and school='$_GET[school_code]' ";
		$result = mysqli_query($connect,$strQuery);
		$ors = mysqli_fetch_array($result);  
		
		$thai=number_format($ors['thai'],2);
		$math=number_format($ors['math'],2);
		$science=number_format($ors['science'],2);
		$social=number_format($ors['social'],2);
		$english=number_format($ors['english'],2);
		$health=number_format($ors['health'],2);
		$art=number_format($ors['art'],2);
		$vocation=number_format($ors['vocation'],2);
		$score_avg=number_format($ors['score_avg'],2);							
  		$ed_year=$ed_year_ar[$x];
		?>
		<item3>
				<thai><?php echo base64_encode($thai);?></thai>
				<math><?php echo base64_encode($math);?></math>
				<science><?php echo base64_encode($science);?></science>
				<social><?php echo base64_encode($social);?></social>
				<english><?php echo base64_encode($english);?></english>
				<health><?php echo base64_encode($health);?></health>
				<art><?php echo base64_encode($art);?></art>
				<vocation><?php echo base64_encode($vocation);?></vocation>
				<score_avg><?php echo base64_encode($score_avg);?></score_avg>
				<ed_year><?php echo base64_encode($ed_year);?></ed_year>
		</item3>
		<?php	
}

?>
	</ach>
<year_num_p6><?php echo base64_encode($year_num_p6);?></year_num_p6>
<year_now_p6><?php echo base64_encode($year_now_p6);?></year_now_p6>
<year_num_p9><?php echo base64_encode($year_num_p9);?></year_num_p9>
<year_now_p9><?php echo base64_encode($year_now_p9);?></year_now_p9>	
<year_num_p12><?php echo base64_encode($year_num_p12);?></year_num_p12>
<year_now_p12><?php echo base64_encode($year_now_p12);?></year_now_p12>	
</info>



