<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

?>
<info>
<warning><?php echo base64_encode($warning_text);?></warning>
<student>
<?php

$sql = "select * from student_main_main where person_id='$_GET[person_id]' order by id desc limit 1";
$dbquery = mysqli_query($connect,$sql);
$result= mysqli_fetch_array($dbquery);
$prename=$result['prename'];
$name=$result['name'];
$surname=$result['surname'];
$std_person_id=$result['person_id'];

$sql = "select * from student_main_expand1 where school_code='$_GET[school_code]' and person_id='$_GET[person_id]' limit 1";
$dbquery = mysqli_query($connect,$sql);

while($result_edyear= mysqli_fetch_array($dbquery)){
$person_id=$result_edyear['person_id'];
$e_name=$result_edyear['e_name'];
$e_surname=$result_edyear['e_surname'];
$birthday=$result_edyear['birthday'];
$blood=$result_edyear['blood'];
$race=$result_edyear['race'];
$nationlity=$result_edyear['nationlity'];
$religion=$result_edyear['religion'];

				?>
				<item>
				<std_person_id><?php echo base64_encode($std_person_id);?></std_person_id>
				<prename><?php echo base64_encode($prename);?></prename>
				<name><?php echo base64_encode($name);?></name>
				<surname><?php echo base64_encode($surname);?></surname>
				<person_id><?php echo base64_encode($person_id);?></person_id>
				<e_name><?php echo base64_encode($e_name);?></e_name>
				<e_surname><?php echo base64_encode($e_surname);?></e_surname>
				<birthday><?php echo base64_encode($birthday);?></birthday>
				<blood><?php echo base64_encode($blood);?></blood>
				<race><?php echo base64_encode($race);?></race>
				<nationlity><?php echo base64_encode($nationlity);?></nationlity>
				<religion><?php echo base64_encode($religion);?></religion>
				</item>
				<?php
}

$sql = "select * from student_main_expand3 where school_code='$_GET[school_code]' and std_person_id='$_GET[person_id]' and home_status='1' limit 1";
$dbquery = mysqli_query($connect,$sql);

while($result_home= mysqli_fetch_array($dbquery)){
$home_number=$result_home['home_number'];
$village=$result_home['village'];
$road=$result_home['road'];
$tambon=$result_home['tambon'];
$district=$result_home['district'];
$province=$result_home['province'];
$zip_code=$result_home['zip_code'];
$tel=$result_home['tel'];
				
				?>
				<item2>
				<home_number><?php echo base64_encode($home_number);?></home_number>
				<village><?php echo base64_encode($village);?></village>
				<road><?php echo base64_encode($road);?></road>
				<tambon><?php echo base64_encode($tambon);?></tambon>
				<district><?php echo base64_encode($district);?></district>
				<province><?php echo base64_encode($province);?></province>
				<zip_code><?php echo base64_encode($zip_code);?></zip_code>
				<tel><?php echo base64_encode($blood);?></tel>
				</item2>
				<?php
}

$sql = "select * from student_main_expand3 where school_code='$_GET[school_code]' and std_person_id='$_GET[person_id]' and home_status='2' limit 1";
$dbquery = mysqli_query($connect,$sql);

while($result_home= mysqli_fetch_array($dbquery)){
$home_number=$result_home['home_number'];
$village=$result_home['village'];
$road=$result_home['road'];
$tambon=$result_home['tambon'];
$district=$result_home['district'];
$province=$result_home['province'];
$zip_code=$result_home['zip_code'];
$tel=$result_home['tel'];
				
				?>
				<item3>
				<home_number><?php echo base64_encode($home_number);?></home_number>
				<village><?php echo base64_encode($village);?></village>
				<road><?php echo base64_encode($road);?></road>
				<tambon><?php echo base64_encode($tambon);?></tambon>
				<district><?php echo base64_encode($district);?></district>
				<province><?php echo base64_encode($province);?></province>
				<zip_code><?php echo base64_encode($zip_code);?></zip_code>
				<tel><?php echo base64_encode($blood);?></tel>
				</item3>
				<?php
}

$sql = "select * from student_main_expand2 where school_code='$_GET[school_code]' and std_person_id='$_GET[person_id]' and status='1' limit 1";
$dbquery = mysqli_query($connect,$sql);
$result_father= mysqli_fetch_array($dbquery);
$p_id=$result_father['p_id'];
$p_prename=$result_father['p_prename'];
$p_name=$result_father['p_name'];
$p_surname=$result_father['p_surname'];
$p_tel=$result_father['p_tel'];
				
$sql = "select * from student_main_expand2 where school_code='$_GET[school_code]' and std_person_id='$_GET[person_id]' and status='2' limit 1";
$dbquery = mysqli_query($connect,$sql);
$result_mother= mysqli_fetch_array($dbquery);
$p_id2=$result_mother['p_id'];
$p_prename2=$result_mother['p_prename'];
$p_name2=$result_mother['p_name'];
$p_surname2=$result_mother['p_surname'];
$p_tel2=$result_mother['p_tel'];

$sql = "select * from student_main_expand2 where school_code='$_GET[school_code]' and std_person_id='$_GET[person_id]' and status='3' limit 1";
$dbquery = mysqli_query($connect,$sql);
$result_parent= mysqli_fetch_array($dbquery);
$p_id3=$result_parent['p_id'];
$p_prename3=$result_parent['p_prename'];
$p_name3=$result_parent['p_name'];
$p_surname3=$result_parent['p_surname'];
$p_tel3=$result_parent['p_tel'];
$relationship=$result_parent['relationship'];		
		
				?>
				<item4>
				<p_id><?php echo base64_encode($p_id);?></p_id>
				<p_prename><?php echo base64_encode($p_prename);?></p_prename>
				<p_name><?php echo base64_encode($p_name);?></p_name>
				<p_surname><?php echo base64_encode($p_surname);?></p_surname>
				<p_tel><?php echo base64_encode($p_tel);?></p_tel>
				<p_id2><?php echo base64_encode($p_id2);?></p_id2>
				<p_prename2><?php echo base64_encode($p_prename2);?></p_prename2>
				<p_name2><?php echo base64_encode($p_name2);?></p_name2>
				<p_surname2><?php echo base64_encode($p_surname2);?></p_surname2>
				<p_tel2><?php echo base64_encode($p_tel2);?></p_tel2>
				
				<p_id3><?php echo base64_encode($p_id3);?></p_id3>
				<p_prename3><?php echo base64_encode($p_prename3);?></p_prename3>
				<p_name3><?php echo base64_encode($p_name3);?></p_name3>
				<p_surname3><?php echo base64_encode($p_surname3);?></p_surname3>
				<p_tel3><?php echo base64_encode($p_tel3);?></p_tel3>
				<relationship><?php echo base64_encode($relationship);?></relationship>
				</item4>
				<?php

?>
</student>
</info>




