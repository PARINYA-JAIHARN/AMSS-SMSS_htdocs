<?php
session_start();
if(isset($_GET['id'])){
	$id = $_GET['id'];
require('../amssplus_connect.php');
require('../modules/idocument/time_inc.php');
$sql = "Select * From idocument_main where id = $id";
$dbquery = mysqli_query($connect,$sql);
$dataDisplay = mysqli_fetch_assoc($dbquery);

$subject = iconv( 'UTF-8','cp874//IGNORE' , $dataDisplay['subject']);

$subjectH = iconv( 'UTF-8','cp874//IGNORE' , $dataDisplay['subject']);
$filename = $dataDisplay['subject'].".pdf";
$book_no = iconv( 'UTF-8','cp874//IGNORE' , $dataDisplay['book_no']);

$subject_NewPage = iconv( 'UTF-8','cp874//IGNORE' , 'บันทึกข้อความที่ '.$book_no.'  เรื่อง  '.$dataDisplay['subject']);

$book_date = iconv( 'UTF-8','cp874//IGNORE' , thai_dateBook($dataDisplay['book_date']));
$txtMemo = iconv( 'UTF-8','cp874//IGNORE' , 'บันทึกข้อความ' );
$txtContent1 = iconv( 'UTF-8','cp874//IGNORE' , htmlspecialchars_decode ($dataDisplay['content1']));
$txtContent2 = iconv( 'UTF-8','cp874//IGNORE' , htmlspecialchars_decode ($dataDisplay['content2']));
$txtContent3 = iconv( 'UTF-8','cp874//IGNORE' , htmlspecialchars_decode ($dataDisplay['content3'])); 

$txtworkgroup = iconv( 'UTF-8','cp874//IGNORE' , $dataDisplay['workgroup_txt'] );
$txtName = iconv( 'UTF-8','cp874//IGNORE' , '
( '. $dataDisplay['officer_name'] .' )
'. $dataDisplay['officer_position'] .'
'. thai_dateBook($dataDisplay['book_date']));
$book_to = "ผู้อำนวยการ".$_SESSION['office_name'];
require('fpdf.php');
//require('mc_indent.php');
$InterLigne = 7;
$indent = 15;
//require_once("class.multicelltag.php");
$pdf = new FPDF();
//$txtContent3 = $txtContent3. " ";
$pdf->SetMargins(20,10,20);
//$pdf->SetLeftMargin(20);
//$pdf->SetTopMargin(20);
$pdf->AddFont('THSarabunNew','','THSarabunNew.php');
$pdf->AddFont('THSarabunNew','B','THSarabunNew Bold.php');
$pdf->AddPage();
//$pdf->SetTitle($dataDisplay['subject']);
//$pdf->SetTitle($subjectH);
//$pdf->Image('krut.png',20,10,20,0,'PNG');
$pdf->Image('krut.png',20,10,20,0);
$pdf->Ln(10);
$pdf->SetFont('THSarabunNew','B',20);
$pdf->MultiCell(185, 6, $txtMemo, 0, 'C', 0, 0, '', '', true);
$pdf->Ln();
$pdf->SetFont('THSarabunNew','B',16);
$pdf->Write(6,iconv( 'UTF-8','cp874//IGNORE' , 'ส่วนราชการ   '));
$pdf->SetFont('THSarabunNew','',16);
$pdf->MultiCell(185, 6, $txtworkgroup);
//$pdf->Ln();

$pdf->SetFont('THSarabunNew','B',16);
$dX = $pdf->GetX();
$dY = $pdf->GetY();
$pdf->MultiCell(165, 6,iconv( 'UTF-8','cp874//IGNORE' , 'ที่ '. $book_no . '                                                      วันที่   '), 0, '', 0, 0, '', '', 1);
$pdf->SetY($dY);
$pdf->SetX(120);
$pdf->MultiCell(165, 6, $book_date);
$pdf->SetFont('THSarabunNew','B',16);
$pdf->Write(6,iconv( 'UTF-8','cp874//IGNORE' , 'เรื่อง   '));
$pdf->SetFont('THSarabunNew','',16);
$pdf->MultiCell(165, 6, $subject);
$y = $pdf->GetY();
$pdf->Line(20,$y,192,$y); //เส้นใต้เรื่อง

$pdf->SetFont('THSarabunNew','B',16);
$pdf->Write(12,iconv( 'UTF-8','cp874//IGNORE' , 'เรียน   '));
$pdf->SetFont('THSarabunNew','',16);
$pdf->MultiCell(165, 12,iconv( 'UTF-8','cp874//IGNORE' , $book_to));
//$pdf->Cell(20,20);
//Reff
$sql = "Select * From idocument_files Where document_id = '$id' and docType = 'ref'";
$result = mysqli_query($connect,$sql);
if($result->num_rows > 0){
$i = 1;

$pdf->SetFont('THSarabunNew','B',16);
$pdf->Write(8,iconv( 'UTF-8','cp874//IGNORE' , 'อ้างถึง   '));
$x = $pdf->GetX();
$pdf->SetFont('THSarabunNew','',16);
  while ($row = $result->fetch_assoc()) {
  	$pdf->SetX(35);
  	$txt_ref = $row['file_des'];
  	if(!empty($row['file_name'])){
  		$link = ".".$row['file_name']; 
  		$txt_ref = (!empty($txt_ref))?$txt_ref:"เอกสารอ้างถึง";		
  		$pdf->write(6,iconv( 'UTF-8','cp874//IGNORE' , $i .". ".$txt_ref),$link);
  	}else{
  		$pdf->write(6,iconv( 'UTF-8','cp874//IGNORE' , $i .". ".$txt_ref));
  	}
	$pdf->Ln();
	$i++;
	}
}

//Attach
$sql = "Select * From idocument_files Where document_id = '$id' and docType = 'attach'";
$result = mysqli_query($connect,$sql);
if($result->num_rows > 0){
$i = 1;
$pdf->SetX(20);
$pdf->SetFont('THSarabunNew','B',16);
$pdf->Write(8,iconv( 'UTF-8','cp874//IGNORE' , 'สิ่งที่ส่งมาด้วย   '));
$x = $pdf->GetX();

$pdf->SetFont('THSarabunNew','',16);
  while ($row = $result->fetch_assoc()) {
  	$pdf->SetX(45);
  	$txt_ref = $row['file_des'];
  	if(!empty($row['file_name'])){
  		$link = ".".$row['file_name'];  		
  		$txt_ref = (!empty($txt_ref))?$txt_ref:"สิ่งที่ส่งมาด้วย";		
  		$pdf->write(8,iconv( 'UTF-8','cp874//IGNORE' , $i .". ".$txt_ref),$link);
  	}else{
  		$pdf->write(8,iconv( 'UTF-8','cp874//IGNORE' , $i .". ".$txt_ref));
  	}
	$pdf->Ln();
	$i++;
	}
}

$pdf->SetFont('THSarabunNew','',16);
$pdf->ln(6);
if(strlen($txtContent1)<115){
	$savX = $pdf->GetX();
	$pdf->SetX($savX+$indent);
	$pdf->MultiCell(0, $InterLigne, $txtContent1, 0, 'J', 0);
	$pdf->SetX($savX);
}else{
	$pdf->MultiCell(0, $InterLigne, $txtContent1, 0, 'J', 0, $indent);
}
$pdf->ln(4);
if(strlen($txtContent2)<115){
	$savX = $pdf->GetX();
	$pdf->SetX($savX+$indent);
	$pdf->MultiCell(0, $InterLigne, $txtContent2, 0, 'J', 0);
	$pdf->SetX($savX);
}else{
	$pdf->MultiCell(0, $InterLigne, $txtContent2, 0, 'J', 0, $indent);
}
$pdf->ln(6);
if(strlen($txtContent3)<115){
	$savX = $pdf->GetX();
	$pdf->SetX($savX+$indent);
	$pdf->MultiCell(0, $InterLigne, $txtContent3, 0, 'J', 0);
	$pdf->SetX($savX);
}else{
	$pdf->MultiCell(0, $InterLigne, $txtContent3, 0, 'J', 0, $indent);
}

$pdf->ln(6);
//Add signature
$fileSig = "../signature/". $dataDisplay['officer'] .".png";
if(file_exists($fileSig)){
$sY= $pdf->GetY();
$sX= $pdf->GetX();
$pdf->Image($fileSig,$sX+80,$sY+3,40,0);
}
$pdf->MultiCell(190, 4,iconv( 'UTF-8','cp874//IGNORE' , 'ตรวจสอบเสนอ'), 0, 'C');
$pdf->Ln();
$pdf->MultiCell(190, 6, $txtName , 0, 'C');
$pdf->Ln();
$Y= $pdf->GetY();

if ($pdf->GetY()>200){
$pdf->AddPage();
$pdf->SetAutoPageBreak(false);
$pdf->SetXY(10, 10);
$pdf->Write(8,$subject_NewPage);
$pdf->Ln(20);//iconv( 'UTF-8','cp874//IGNORE'
}
$Y= $pdf->GetY();

$x=12;
$pdf->SetFont('THSarabunNew','',14);
if(isset($_GET['comment'])){
$sqlComment = "Select * From idocument_comment where document_id = $id Order by id";
//echo $sqlComment;
$dbqueryComment = mysqli_query($connect,$sqlComment);	
if(mysqli_num_rows($dbqueryComment)==0){

}else{
	while($commentData = mysqli_fetch_array($dbqueryComment)){
$fullname  = iconv( 'UTF-8','cp874//IGNORE' , '( '. $commentData['person_comments_name'].' )
'. $commentData['person_comments_position'].'
'. thai_dateBook($commentData['comments_date']));

if($commentData['comments_select'] == ""){
	$commenttext = "";
}
if($commentData['comments_select'] == 0){
	$commenttext = "เพื่อโปรดทราบ";
}
if($commentData['comments_select'] == 1){
	$commenttext = "เพื่อโปรดพิจารณา";
}
if($commentData['comments_select'] == 2){
	$commenttext = "ทราบ";
}
if($commentData['comments_select'] == 3){
	$commenttext = "ลงนามแล้ว";
}
if($commentData['comments_select'] == 4){
	$commenttext = "อนุญาต";
}
if($commentData['comments_select'] == 5){
	$commenttext = "ไม่อนุญาต";
}
if($commentData['comments_select'] == 6){
	$commenttext = "อนุมัติ";
}
if($commentData['comments_select'] == 7){
	$commenttext = "ไม่อนุมัติ";
}
if($commentData['comments_select'] == 8){
	$commenttext = "ชอบ/ให้ดำเนินการตามเสนอ";
}

if(!empty($commentData['comments_etctxt'])){
$comment = iconv( 'UTF-8','cp874//IGNORE' ,'- '.$commenttext.'
- '. $commentData['comments_etctxt']);
$yIMG = $Y+10;
}else{
$comment = iconv( 'UTF-8','cp874//IGNORE' ,'- '. $commenttext);
$yIMG = $Y;
}

$pdf->SetY($Y);
$pdf->SetX($x);
$pdf->MultiCell(65, 6,$comment, 0, '');
$pdf->Ln();
$fileSigComment = "../signature/". $commentData['person_comments_id'] .".png";
if(file_exists($fileSigComment)){
$pdf->Image($fileSigComment,$x+10,$yIMG,0,15);
}
$pdf->Ln();
$pdf->SetX($x);
$pdf->MultiCell(65, 6,$fullname, 0, 'C');
$x = $x+65;
	}
}
}
$pdf->Output();
}
?>	