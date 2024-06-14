<?php
//date(yy/mm/dd)
function thai_date_3($date){
		if(!isset($date)){
		return;
		}
$thai_month_arr=array(
	"00"=>"-",
	"01"=>"มค",
	"02"=>"กพ",
	"03"=>"มีค",
	"04"=>"เมย",
	"05"=>"พค",
	"06"=>"มิย",	
	"07"=>"กค",
	"08"=>"สค",
	"09"=>"กย",
	"10"=>"ตค",
	"11"=>"พย",
	"12"=>"ธค"					
);
	$f_date_2=explode(" ", $date);
	$f_date=explode("-", $f_date_2[0]);
	$f_date[2]=intval($f_date[2]);
	$thai_date_return="";
	$thai_date_return.=	$f_date[2];
	$thai_date_return.= " ".$thai_month_arr[$f_date[1]]." ";
	$thai_date_return.=	$f_date[0]+543;
	if($date!=""){
	return $thai_date_return;
	}
	else{
	$thai_date_return="";
	return $thai_date_return;
	}
}

function getDateThai($date){
list($y,$m,$d) =preg_split("/-/",$date);
$y=$y+543;
return "$d/$m/$y";
}

function getDateEng($date){
list($d,$m,$y)= explode("/",$date);
$y=$y-543;
return "$y-$m-$d";
}
?>
