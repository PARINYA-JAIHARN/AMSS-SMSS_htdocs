<?php
session_start();

require('fpdf.php');

$pdf = new FPDF();
$pdf->AddFont('THSarabunNew','','THSarabunNew.php');
$pdf->AddFont('THSarabunNew','B','THSarabunNew Bold.php');
$pdf->AddPage();
$pdf->SetFont('THSarabunNew','',16);
$pdf->Cell(0,0,'aa');
$pdf->Output();
$pdf->Output();

?>