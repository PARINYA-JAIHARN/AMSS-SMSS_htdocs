<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );
require_once "../modules/building/time_inc.php";	


$sql = "select *,building_main.id from building_main left join system_school on building_main.school_code=system_school.school_code 
 left join building_model on building_main.model_code=building_model.model_code where building_main.school_code='$_GET[school_code]' and status='0'
order by building_main.id"; 

$dbquery = mysqli_query($connect,$sql);
?>

<info>
	<warning><?php echo base64_encode($warning_text);?></warning>
	<sch>
		<?php
		while($result = mysqli_fetch_array($dbquery))
		{
		$id = $result['id'];
		//$school_code= $result['school_code'];
		//$school_name= $result['school_name'];
		$model_code= $result['model_code'];
		$model_name= $result['model_name'];
		$type_code= $result['type_code'];
		$room= $result['room'];
		if($room==0){
		$room="";
		}
		$get_year= $result['get_year'];
		$build_date= $result['build_date'];
		
		if($build_date=="0001-01-01"){
		$build_date="";;
		}
		else{
		$build_date=getDateThai($build_date);
		}
		
		$sql_type= "select * from building_type, building_category where  building_type.cate_code=building_category.cate_code and building_type.type_code='$type_code'";
		$dbquery_type = mysqli_query($connect,$sql_type);
		$result_type = mysqli_fetch_array($dbquery_type);
		$cate_code=$result_type['cate_code'];
		$cate_name=$result_type['cate_name'];
		$type_name= $result_type['type_name']; 
		
		$sql_file= "select * from building_file where  building_id='$id'";
		$dbquery_file = mysqli_query($connect,$sql_file);
		$file_num=mysqli_num_rows($dbquery_file);
		
		?>
			<item>
				<id><?php echo base64_encode($id);?></id>
				<cate_name><?php echo base64_encode($cate_name);?></cate_name>
				<type_name><?php echo base64_encode($type_name);?></type_name>
				<model_name><?php echo base64_encode($model_name);?></model_name>
				<room><?php echo base64_encode($room);?></room>
				<get_year><?php echo base64_encode($get_year);?></get_year>
				<build_date><?php echo base64_encode($build_date);?></build_date>
				<file_num><?php echo base64_encode($file_num);?></file_num>
			</item>
		<?php
		}
		?>
	</sch>
</info>
