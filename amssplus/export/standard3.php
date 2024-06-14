<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$school_code=$_GET['school_code'];
$ed_year=$_GET['ed_year'];
$subject=$_GET['subject'];
$level=$_GET['level'];
$person_id=$_GET['person_id'];
/////////////////////////////////////////////////
//หาชื่อ
			$sql_name = "select prename,name,surname from student_main_main where school_code='$school_code'  and person_id='$person_id' order by id desc limit 1";
			$dbquery_name = mysqli_query($connect,$sql_name);
			if($result_2 = mysqli_fetch_array($dbquery_name)){
			$prename=$result_2['prename'];
			$name=$result_2['name'];
			$surname=$result_2['surname'];
			$fullname=$prename.$name." ".$surname;
			}
			else{
			$fullname="";
			} 	


if($subject=='1'){
$subject="thai";
$thai_subject="ภาษาไทย";
}
else if($subject=='2'){
$subject="math";
$thai_subject="คณิตศาสตร์";
}
else if($subject=='3'){
$subject="science";
$thai_subject="วิทยาศาสตร์";
}
else if($subject=='4'){
$subject="social";
$thai_subject="สังคมศึกษา";
}
else if($subject=='5'){
$subject="english";
$thai_subject="มาตรฐานภาษาอังกฤษ";
}
else if($subject=='6'){
$subject="english2";
$thai_subject="ภาษาอังกฤษเพื่อการสื่อสาร";
}

// เชื่อมdatabase ชื่อ amssplus_bets
/////////
$user_db=$user;
if(isset($amssplus_bets)){   
$amssplus_bets=$amssplus_bets;
}
else{
$amssplus_bets="amssplus_bets"; 
}
$connect_bets=@mysqli_connect($hostname,$user_db,$password,$amssplus_bets);
		if($connect_bets){
		mysqli_query($connect_bets,"SET NAMES utf8");
		}
/////////
//end 	

?>
<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<school_code><?php echo base64_encode($school_code);?></school_code>
	<ed_year><?php echo base64_encode($ed_year);?></ed_year>
	<level><?php echo base64_encode($level);?></level>
	<person><?php echo base64_encode($person_id);?></person>
	<fullname><?php echo base64_encode($fullname);?></fullname>
			
<?php

$table_main=$subject;
$table_expand=$table_main."_expand_".$level;

$sql = "select  group_code from $subject where  ed_year='$ed_year' and level='$level' and school_code='$school_code' order by id desc limit 1";
$query = mysqli_query($connect_bets,$sql);
$result=mysqli_fetch_array($query);
$group_code=$result['group_code'];  

if($level==1 or $level==2){
$class_room=1;
}
else if($level==3 or $level==4){
$class_room=2;
}
else if($level==5 or $level==6){
$class_room=3;
}
else if($level==7 or $level==8){
$class_room=4;
}
else if($level==9 or $level==10){
$class_room=5;
}
else if($level==11 or $level==12){
$class_room=6;
}
else if($level==13 or $level==14){
$class_room=7;
}
else if($level==15 or $level==16){
$class_room=8;
}
else if($level==17 or $level==18){
$class_room=9;
}
else if($level==19 or $level==20){
$class_room=10;
}
else if($level==21 or $level==22){
$class_room=11;
}
else if($level==23 or $level==24){
$class_room=12;
}

		//หาจำนวนผู้สอบ
		if($person_id==204){
		$sql = "select id from $table_main where school_code='$school_code' and level='$level' and ed_year='$ed_year'";
		}
		else{
		$sql = "select id from $table_main where school_code='$school_code' and level='$level' and ed_year='$ed_year' and $table_main.person_id='$person_id'";
		}
		$dbquery = mysqli_query($connect_bets,$sql);
		$row_num = mysqli_num_rows($dbquery);

		//หาผลสอบรวม
		if($person_id==204){
		$sql = "select avg(score) as avg_score from $table_main where school_code='$school_code' and level='$level' and ed_year='$ed_year'";
		}
		else{
		$sql = "select avg(score) as avg_score from $table_main where school_code='$school_code' and level='$level' and ed_year='$ed_year' and $table_main.person_id='$person_id'";
		}
		$dbquery = mysqli_query($connect_bets,$sql);
		$result = mysqli_fetch_array($dbquery);
		$avg_score=$result ['avg_score'];
		$total_percent=number_format($avg_score,2);


/////////////////////////////////////
//กลุ่มสาระ
$sql_2 = "select * from bets_substance where group_code='$group_code' order by id ";
$dbquery_2 = mysqli_query($connect,$sql_2);
while($result_2 = mysqli_fetch_array($dbquery_2)){
			//สาระ
			$sql_2 = "select * from bets_substance where group_code='$group_code' order by id ";
			$dbquery_2 = mysqli_query($connect,$sql_2);
			while($result_2 = mysqli_fetch_array($dbquery_2)){
			$substance_code=$result_2['substance_code'];
			$substance_sum[$substance_code]="";  //ตัวแปรอาเรย์สาระ
			$substance_x[$substance_code]=0;  //ตัวแปรอาเรย์สาระ
					//มาตรฐาน
					$sql_3 = "select * from bets_standard where substance_code='$result_2[substance_code]' order by id ";
					$dbquery_3 = mysqli_query($connect,$sql_3);
					while($result_3 = mysqli_fetch_array($dbquery_3)){
					$standard_code=$result_3['standard_code'];
					$standard_sum[$standard_code]="";  //ตัวแปรอาเรย์มาตรฐาน
					$standard_x[$standard_code]=0;  //ตัวแปรอาเรย์มาตรฐาน
								//ตัวชี้วัด
								$sql_4 = "select * from bets_indicator where standard_code='$result_3[standard_code]' and class_code='$class_room' order by id ";
								$dbquery_4 = mysqli_query($connect,$sql_4);
								$M=1;
								while($result_4 = mysqli_fetch_array($dbquery_4)){
								$indicator_code=$result_4['indicator_code'];
								$indicator_sum[$indicator_code]="";
								$indicator_x[$indicator_code]=0;  //ตัวแปรอาเรย์ตัวชี้วัด

								//คะแนนตัวชี้วัด
								if($person_id==204){
								$sql_4_1 = "select avg($table_expand.score) as score from $table_expand,$table_main where $table_expand.person_id=$table_main.person_id and indicator='$result_4[indicator_code]' and $table_expand.level='$level' and $table_main.school_code='$school_code' and $table_main.ed_year='$ed_year' ";		
							    }
								else{
								$sql_4_1 = "select avg($table_expand.score) as score from $table_expand,$table_main where $table_expand.person_id=$table_main.person_id and indicator='$result_4[indicator_code]' and $table_expand.level='$level' and $table_main.school_code='$school_code' and $table_main.ed_year='$ed_year' and  $table_expand.person_id='$person_id'";		
								}
											$dbquery_4_1 = mysqli_query($connect_bets,$sql_4_1);
											$result_4_1 = mysqli_fetch_array($dbquery_4_1);
											if($result_4_1['score']!=""){
											@$substance_sum[$substance_code]=$substance_sum[$substance_code]+$result_4_1['score'];
											$substance_x[$substance_code]=$substance_x[$substance_code]+1;
											
											@$standard_sum[$standard_code]=$standard_sum[$standard_code]+$result_4_1['score'];
											$standard_x[$standard_code]=$standard_x[$standard_code]+1;
											
											@$indicator_sum[$indicator_code]=$indicator_sum[$indicator_code]+$result_4_1['score'];
											$indicator_x[$indicator_code]=$indicator_x[$indicator_code]+1;
											
											}
			                    } // ตัวชี้วัด
					} //มาตรฐาน		
			} //สาระ
} //กลุ่มสาระ		


//////////////////////////////
?>
<thai_subject><?php echo base64_encode($thai_subject);?></thai_subject>
<total_percent><?php echo base64_encode($total_percent);?></total_percent>
<?php

$g1=50;
if($total_percent<$g1){
$bgcolor="#FF0000";
}
else {
$bgcolor="#66FF00";
}

		//คะแนนสาระ
		$sql_2 = "select * from bets_substance where group_code='$group_code' order by id ";
		$dbquery_2 = mysqli_query($connect,$sql_2);
		while($result_2 = mysqli_fetch_array($dbquery_2)){
		$substance_percent="";

		$substance_code=$result_2['substance_code'];
					if($substance_x[$substance_code]!=0){
					$substance_percent=$substance_sum[$substance_code]/$substance_x[$substance_code];
					$substance_percent=number_format($substance_percent,2);
					}
		?>
		<item>
				<type><?php echo base64_encode("1");?></type>
				<substance><?php echo base64_encode($result_2['substance_name']);?></substance>
				<standard_head><?php echo base64_encode("");?></standard_head>
				<standard><?php echo base64_encode("");?></standard>
				<indicator><?php echo base64_encode("");?></indicator>
				<percent><?php echo base64_encode($substance_percent);?></percent>
				<evaluation><?php echo base64_encode("");?></evaluation>
		</item>
		<?php
					if($substance_percent<$g1){
					$bgcolor="#FF0000";
					}
					else {
					$bgcolor="#66FF00";
					}

				if($substance_percent!=""){
				 }
		
					//คะแนนมาตรฐาน
					$sql_3 = "select * from bets_standard where substance_code='$result_2[substance_code]' order by id ";
					$dbquery_3 = mysqli_query($connect,$sql_3);
					while($result_3 = mysqli_fetch_array($dbquery_3)){
					$standard_percent="";
					$standard_code=$result_3['standard_code'];				
							if($standard_x[$standard_code]!=0){
							$standard_percent=$standard_sum[$standard_code]/$standard_x[$standard_code];
							$standard_percent=number_format($standard_percent,2);
							}
							
							if($standard_percent<$g1){
							$bgcolor="#FF0000";
							}
							else{
							$bgcolor="#66FF00";
							}

						?>
						<item>
								<type><?php echo base64_encode("2");?></type>
								<substance><?php echo base64_encode("");?></substance>
								<standard_head><?php echo base64_encode($result_3['short_name']);?></standard_head>
								<standard><?php echo base64_encode($result_3['standard_text']);?></standard>
								<indicator><?php echo base64_encode("");?></indicator>
								<percent><?php echo base64_encode($standard_percent);?></percent>
								<evaluation><?php echo base64_encode("");?></evaluation>
						</item>
						<?php
					
								//หาคะแนนตัวชี้วัด
								$sql_4 = "select * from bets_indicator where standard_code='$result_3[standard_code]' and class_code='$class_room' order by id ";
								$dbquery_4 = mysqli_query($connect,$sql_4);
								$M=1;
								while($result_4 = mysqli_fetch_array($dbquery_4)){
								$indicator_percent="";
								$indicator_code=$result_4['indicator_code'];
								
								$indicator_percent=$indicator_sum[$indicator_code];
										if($indicator_x[$indicator_code]!=0){
										$indicator_percent=number_format($indicator_percent,2);
										}
										if(($M%2) == 0)
										$color="#FFFFC";
										else $color="#FFFFFF";
								$indicator_text=substr($result_4['indicator_text'],0,150);
								
								if($indicator_percent<$g1){
								$bgcolor="#FF0000";
								}
								else{
								$bgcolor="#66FF00";
								}
								
								
								?>
								<item>
										<type><?php echo base64_encode("3");?></type>
										<substance><?php echo base64_encode("");?></substance>
										<standard_head><?php echo base64_encode("");?></standard_head>
										<standard><?php echo base64_encode("");?></standard>
										<indicator><?php echo base64_encode($result_4['indicator_text']);?></indicator>
										<percent><?php echo base64_encode($indicator_percent);?></percent>
										<evaluation><?php echo base64_encode("");?></evaluation>
								</item>
								<?php
								
								$M++;
								}
					}
		}

?>
</info>

