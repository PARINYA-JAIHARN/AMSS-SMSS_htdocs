<?php
/** ensure this file is being included by a parent file */
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

if(isset($_REQUEST['switch_index'])){
	$switch_index=$_REQUEST['switch_index'];
}else{
	$switch_index="";
}

if(isset($_REQUEST['name_search'])){
	$name_search=$_REQUEST['name_search'];
}else{
	$name_search="";
}

if(!($_SESSION['login_status']<=14)){
exit();
}
require_once "modules/card_request/time_inc.php";	
$user=$_SESSION['login_user_id'];
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="th" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ตรวจสอบสถานะคำขอทำบัตรประจำตัวเจ้าหน้าที่ราชการ</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Sarabun&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins&display=swap" rel="stylesheet">-->
    <link rel="stylesheet" href="progress ring/progress ring.css" type="text">
    <link rel="stylesheet" href="stepper_2/stepper_2.css" type="text">
    <link rel="stylesheet" href="request_progress.css" type="text">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="https://fontawesome.com/icons/pen-to-square?f=classic&s=solid">

    <script src="stepper_2/stepper_2.js"></script>
</head>
<style>
    <?php 
    include "progress ring/progress ring.css";
    include "request_progress.css";
    include "stepper_2/stepper_2.css";
    include "stepper_2/stepper_2.js";
    
    ?>
</style>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <?php 
    $sql = "SELECT * FROM card_request WHERE IDNumber = '$user' LIMIT 1";
    $dbquery = mysqli_query($connect,$sql);
    $result = mysqli_fetch_assoc($dbquery);
    ?>
        <?php
        if ($result['progress'] == 0){ ?>
          <div class="container">
            <div class="text-area">
              <div class="status-icon in-progress"><i class="fa-solid fa-hourglass-half"></i></div>
              <div class="status-text in-progress">อยู่ระหว่างดำเนินการจัดทำบัตร</div>
              <div class="description in-progress">การจัดทำบัตรจะสำเร็จภายใน 1-2 วันทำการ โปรดติดตามความคืบหน้าผ่านหน้าเว็บไซต์นี้</div>
              <div style="text-align:center">          
                <a href="index.php?"><button class="button-9" role="button">กลับสู่หน้าหลัก</button></a>
              </div>
            </div>
          </div> 
        <?php 
        } elseif ($result['progress'] == 1){ ?>
          <div class="container">
            <div class="text-area">          
              <div class="status-icon success"><i class="fa-solid fa-circle-check"></i></div>
              <div class="status-text success">จัดทำบัตรสำเร็จ</div>
              <div class="description success">ท่านสามารถมารับบัตรได้ที่สำนักงานเขต ฯ ในเวลาราชการ ทุกวันจันทร์ - ศุกร์ เวลา 8.30 น. - 16.30 น.</div>
              <div style="text-align:center">          
                <a href="index.php?"><button class="button-9" role="button">กลับสู่หน้าหลัก</button></a>
              </div>
            </div>
          </div>
        <?php
        } else { ?>
          <div class="container">
            <div class="text-area">          
              <div class="status-icon no-request"><i class="fa-solid fa-box-open"></i></div>
              <div class="status-text no-request">ไม่มีคำขอ</div>
              <div class="description no-request">ท่านสามารถส่งคำขอทำบัตรได้ผ่านเมนู "ยื่นคำขอทำบัตร" ได้ตลอด 24 ชั่วโมง</div>
              <div style="text-align:center">          
                <a href="index.php?"><button class="button-9 alter" role="button">กลับสู่หน้าหลัก</button></a>
                <a href="?option=card_request&task=main/newform"><button class="button-9 " role="button">ยื่นคำขอทำบัตร</button></a>
              </div>
            </div>
          </div>
        <?php
        }
        ?>
<!-- IN PROGRESS -->
        
<!-- SUCCESS -->
        
<!-- NO REQUEST -->
        
        

<!--<div class="demo">
    <div class="demo__blurb">
      <p>Click any step to activate it</p>
      <p>Shrink the viewport for RWD goodness!</p>
    </div>
    
    <ol class="progress" data-progress="0">
      <li><i>Lorem ipsum</i></li>
      <li><i>Aliquam tincidunt</i></li>
      <li><i>Vestibulum auctor</i></li>
      <li><i>Sed eos recusandae</i></li>
      <li><i>Eos dolore vero voluptas</i></li>
    </ol>
  </div>-->

</body>
</html>
<script>
function onProgClick (event) {
  const $el = $(event.currentTarget)
  $el.parent().attr('data-progress', $el.index())
}

function initProgress () {
  $('.progress')
    .attr('data-progress', 2)
    .on('click', 'li', onProgClick)
}

$(() => setTimeout(initProgress, 1000))
</script>