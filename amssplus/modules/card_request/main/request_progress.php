<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="th" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ตรวจสอบรายการคำขอทำบัตรประจำตัวเจ้าหน้าที่ราชการ</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Sarabun&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins&display=swap" rel="stylesheet">-->
    <link rel="stylesheet" href="progress ring/progress ring.css" type="text">
    <link rel="stylesheet" href="stepper_2/stepper_2.css" type="text">
    <script src="stepper_2/stepper_2.js"></script>
</head>
<style>
    <?php 
    include "progress ring/progress ring.css";
    include "stepper_2/stepper_2.css";
    include "stepper_2/stepper_2.js";
    
    ?>
</style>

<body>

<div class="demo">
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
  </div>

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