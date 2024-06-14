<?php
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$today = date("Y-m-d");
$sql_edyear = "select * from student_main_edyear where year_active='1'";
$dbquery_edyear = mysqli_query($connect,$sql_edyear);
$result_edyear=mysqli_fetch_array($dbquery_edyear);
$ed_year=$result_edyear['ed_year'];

?>
<info>
		<warning><?php echo base64_encode($warning_text);?></warning>
		<ed_year><?php echo base64_encode($ed_year);?></ed_year>
		<student>
<?php

if($_GET['index']==1){
			$sql_class = "select * from student_main_class order by class_code";
			$dbuery_class = mysqli_query($connect,$sql_class);
			while($result_class = mysqli_fetch_array($dbuery_class)){
			$class_code=$result_class['class_code'];
			$class_name=$result_class['class_name'];
				$sql = "select count(check_val) as std_c from student_check_main where student_check_year='$ed_year' and check_val = 'C' and class_now='$class_code'";
				$dbuery = mysqli_query($connect,$sql);
				$result = mysqli_fetch_array($dbuery);
				$std_c = $result['std_c'];
				
				$sql = "select count(check_val) as std_x from student_check_main where student_check_year='$ed_year' and check_val != 'C' and class_now='$class_code'";
				$dbuery = mysqli_query($connect,$sql);
				$result = mysqli_fetch_array($dbuery);
				
				$sql = "select distinct(check_date) as check_date from student_check_main where student_check_year='$ed_year' and class_now='$class_code'";
				$dbuery = mysqli_query($connect,$sql);
				$check_num=mysqli_num_rows($dbuery);
				
				$std_x = $result['std_x'];
				if(($std_c+$std_x)!=0){
				$come_percent=$std_c/($std_c+$std_x)*100;
				$come_percent2=number_format($come_percent,2);
				}
				else{
				$come_percent=0;
				$come_percent2="";
				}
				?>
				<item>
				<class_code><?php echo base64_encode($class_code);?></class_code>
				<std_class><?php echo base64_encode($class_name);?></std_class>
				<come_percent><?php echo base64_encode($come_percent2);?></come_percent>
				<std_x><?php echo base64_encode($std_x);?></std_x>
				<std_c><?php echo base64_encode($std_c);?></std_c>
				<check_num><?php echo base64_encode($check_num);?></check_num>
				</item>
				<?php
				}
} //end if index==1

if($_GET['index']==2){
			$sql = "select * from student_main left join student_main_class on student_main.class_now=student_main_class.class_code where student_main.status='0' and student_main.class_now='$_GET[class_code]' order by student_main.class_now,room";
			$dbuery = mysqli_query($connect,$sql);
			while($result = mysqli_fetch_array($dbuery)){
			$student_id=$result['student_id'];
			$std_person_id=$result['person_id'];
			$std_prename=$result['prename'];
			$std_name=$result['name'];
			$std_surname=$result['surname'];
			$class_now=$result['class_now'];
			$class_name=$result['class_name'];
			
			$sql_c = "select count(check_val) as std_c from student_check_main where student_check_year='$ed_year' and check_val = 'C' and student_id='$student_id'";
			$dbuery_c = mysqli_query($connect,$sql_c);
			$result_c = mysqli_fetch_array($dbuery_c);
			$std_c = $result_c['std_c'];
			
			$sql_x = "select count(check_val) as std_x from student_check_main where student_check_year='$ed_year' and check_val != 'C' and student_id='$student_id'";
			$dbuery_x = mysqli_query($connect,$sql_x);
			$result_x = mysqli_fetch_array($dbuery_x);
			$std_x = $result_x['std_x'];
			if(($std_c+$std_x)!=0){
			$come_percent=$std_c/($std_c+$std_x)*100;
			$come_percent2=number_format($come_percent,2);
			}
			else{
			$come_percent=0;
			$come_percent2="";
			}
			
			?>
			<item2>
			<std_person_id><?php echo base64_encode($std_person_id);?></std_person_id>
			<std_prename><?php echo base64_encode($std_prename);?></std_prename>
			<std_name><?php echo base64_encode($std_name);?></std_name>
			<std_surname><?php echo base64_encode($std_surname);?></std_surname>
			<class_name><?php echo base64_encode($class_name);?></class_name>
			<std_percent><?php echo base64_encode($come_percent2);?></std_percent>
			</item2>
			<?php
			}
} // end if index==2	

if($_GET['index']==3){
$check_day=$_GET['check_day'];

function getDateEng($date){
list($d,$m,$y)= explode("/",$date);
$y=$y-543;
return "$y-$m-$d";
}

$check_day=getDateEng($check_day);
$today=$check_day;

			$sql_class = "select * from student_main_class order by class_code";
			$dbuery_class = mysqli_query($connect,$sql_class);
			while($result_class = mysqli_fetch_array($dbuery_class)){
			$class_code=$result_class['class_code'];
			$class_name=$result_class['class_name'];
				$sql = "select count(check_val) as std_c from student_check_main where student_check_year='$ed_year' and check_val = 'C' and class_now='$class_code' and check_date='$today' ";
				$dbuery = mysqli_query($connect,$sql);
				$result = mysqli_fetch_array($dbuery);
				$std_c = $result['std_c'];
				
				$sql = "select count(check_val) as std_x from student_check_main where student_check_year='$ed_year' and check_val != 'C' and class_now='$class_code' and check_date='$today' ";
				$dbuery = mysqli_query($connect,$sql);
				$result = mysqli_fetch_array($dbuery);
				$std_x = $result['std_x'];
				if(($std_c+$std_x)!=0){
				$come_percent=$std_c/($std_c+$std_x)*100;
				$come_percent2=number_format($come_percent,2);
				}
				else{
				$come_percent=0;
				$come_percent2="";
				}
				?>
				<item>
				<class_code><?php echo base64_encode($class_code);?></class_code>
				<std_class><?php echo base64_encode($class_name);?></std_class>
				<come_percent><?php echo base64_encode($come_percent2);?></come_percent>
				<std_x><?php echo base64_encode($std_x);?></std_x>
				<std_c><?php echo base64_encode($std_c);?></std_c>
				<check_day><?php echo base64_encode($check_day);?></check_day>
				</item>
				<?php
				}
} // end if index==3	

if($_GET['index']==4){

$check_day=$_GET['check_day'];
$today=$check_day;

			$sql = "select * from student_main left join student_main_class on student_main.class_now=student_main_class.class_code where student_main.status='0' and student_main.class_now='$_GET[class_code]' order by student_main.class_now,room";
			$dbuery = mysqli_query($connect,$sql);
			
			while($result = mysqli_fetch_array($dbuery)){
			$student_id=$result['student_id'];
			$std_person_id=$result['person_id'];
			$std_prename=$result['prename'];
			$std_name=$result['name'];
			$std_surname=$result['surname'];
			$class_now=$result['class_now'];
			$class_name=$result['class_name'];
			
			$sql_c = "select check_val from student_check_main where student_check_year='$ed_year' and student_id='$student_id' and check_date='$today'";
			$dbuery_c = mysqli_query($connect,$sql_c);
			$result_c = mysqli_fetch_array($dbuery_c);
			$std_c = $result_c['check_val'];
			if($std_c=="C"){
			$come=0;
			}
			else if($std_c=="W"){
			$come=1;
			}
			else if($std_c=="S"){
			$come=2;
			}
			else if($std_c=="L"){
			$come=3;
			}
			else{
			$come=9;
			}

			?>
			<item2>
			<std_person_id><?php echo base64_encode($std_person_id);?></std_person_id>
			<std_prename><?php echo base64_encode($std_prename);?></std_prename>
			<std_name><?php echo base64_encode($std_name);?></std_name>
			<std_surname><?php echo base64_encode($std_surname);?></std_surname>
			<class_name><?php echo base64_encode($class_name);?></class_name>
			<std_come><?php echo base64_encode($come);?></std_come>
			</item2>
			<?php
			}
} // end if index==4	


	?>
	
	</student>
</info>

