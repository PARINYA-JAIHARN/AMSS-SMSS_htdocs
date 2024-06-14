<?php 
session_start();
if(!(isset($_SESSION['login_user_id']))){
exit();
}

if(isset($_SESSION['login_user_id'])){
?>
<?php
$fileid=$_GET['fileid'];
$file_des=$_GET['detail'];
$file_path="../upload_files/".$fileid;
$file_name=$file_des."-".$fileid;

    if (file_exists($file_path)) {
        header('Content-Description: File Transfer');
	if(strchr($file_path,".")==".doc" || strchr($file_path,".")==".DOC") {
        header('Content-Type: application/msword');
	}elseif(strchr($file_path,".")==".docx" || strchr($file_path,".")==".DOCX"){
        header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');		
	}elseif(strchr($file_path,".")==".pdf" || strchr($file_path,".")==".PDF"){
        header('Content-Type: application/pdf');		
	}elseif(strchr($file_path,".")==".gif" || strchr($file_path,".")==".GIF"){
        header('Content-Type: image/gif');		
	}elseif(strchr($file_path,".")==".JPG" || strchr($file_path,".")==".jpg"){
        header('Content-Type: image/jpeg');		
	}elseif(strchr($file_path,".")==".rar" || strchr($file_path,".")==".RAR"){
        header('Content-Type: application/x-rar-compressed');		
	}elseif(strchr($file_path,".")==".zip" || strchr($file_path,".")==".ZIP"){
        header('Content-Type: application/zip');		
	}elseif(strchr($file_path,".")==".xls" || strchr($file_path,".")==".XS"){
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');		
	} 
        header('Content-Disposition: attachment; filename='.urldecode($file_name));
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file_path));
        ob_clean();
        flush();
        readfile($file_path);
    }else{
echo"<center><h3 style ='color:red;'>file not found!!</h3></center>";
//echo $file_path;
	}
}else{
header('Location: ../../../');
exit;
}
?>