<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Language" content="th" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>คำขอทำบัตรประจำตัวเจ้าหน้าที่ราชการ</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Sarabun&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins&display=swap" rel="stylesheet">-->
    <link rel="stylesheet" href="form.css" type="text">
    <link rel="stylesheet" href="checkboxStyle.css" type="text">
    <link rel="stylesheet" href="thsarabunnew.css" type="text">
    <!--<link rel="stylesheet" href="alert_popup.css" type="text">
    <link rel="stylesheet" href="alert.css" type="text">-->
    <link rel="stylesheet" href="success_popup.css" type="text">
    <link rel="stylesheet" href="alert_popup_3/alert_dialog.css" type="text">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="alert_popup_3/alert_dialog.js"></script>
</head>

<style>
    <?php 
    include "form.css";
    include "checkboxStyle.css";
    include "thsarabunnew.css";
    //include "alert_popup.css";
    include "alert_popup_2/alert.css";
    include "alert_popup_2/alert.js";
    include "alert_popup_3/alert_dialog.css";
    include "alert_popup_3/alert_dialog.js";
    include "success_popup.css";
    ?>
</style>

<?php
if(isset($_POST["submit"])){
    $IDNumber = $_POST["IDNumber"];
    $prefix = $_POST["prefix"];
    $firstName = $_POST["firstName"];
    $lastName = $_POST["lastName"];
    $dateOfBirth = $_POST["dateOfBirth"];
    $age = $_POST["age"];
    $nationality = $_POST["nationality"];
    $bloodGroup = $_POST["bloodGroup"];
    $regAddress = $_POST["regAddress"];
    $regZipCode = $_POST["regZipCode"];
    $curAddress = $_POST["curAddress"];
    $curZipCode = $_POST["curZipCode"];
    $phoneNumber = $_POST["phoneNumber"];
    $email = $_POST["email"];
    $officerType = $_POST["officerType"];
    $isInSchool = $_POST["isInSchool"];
    $schoolName = $_POST["schoolName"];
    $jobLevel = $_POST["jobLevel"];
    $reqOption = $_POST["reqOption"];
    $reqCause = $_POST["reqCause"];

    $sql = "INSERT INTO card_request (IDNumber, prefix, firstName, lastName, dateOfBirth, 
                                age, nationality, bloodGroup, regAddress, regZipCode, 
                                curAddress, curZipCode, phoneNumber, email, officerType,
                                isInSchool, schoolName, jobLevel, reqOption, reqCause)                         
        VALUES ('$IDNumber','$prefix', '$firstName', '$lastName', '$dateOfBirth', 
                '$age', '$nationality', '$bloodGroup', '$regAddress', '$regZipCode', 
                '$curAddress', '$curZipCode', '$phoneNumber', '$email', '$officerType', 
                '$isInSchool', '$schoolName', '$jobLevel', '$reqOption', '$reqCause')";
    $dbquery = mysqli_query($connect,$sql);
}
?>

<body>
    <div class="container">
        <h2>คำขอทำบัตรประจำตัวเจ้าหน้าที่ราชการ</h2>
        <form id="card_request" method="POST">
            <h3>ข้อมูลพื้นฐาน</h3>
            <div>
                <label for="prefix" >คำนำหน้าชื่อ:</label>
                <input type="text" name="prefix" id="prefix" values="" placeholder="คำนำหน้า" required/>
                <label for="firstName">ชื่อ:</label>
                <input type="text" name="firstName" id="firstName" values="" placeholder="ชื่อ" required/>
                <label for="lastName">นามสกุล:</label>
                <input type="text" name="lastName" id="lastName" values="" placeholder="นามสกุล" required/>
            </div>
            <div>
                <label for="dateOfBirth">เกิดวันที่:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" values="" placeholder="เดือน/วัน/ปี ค.ศ." required/>
                <label for="age">อายุ:</label>
                <input type="text" name="age" id="age" placeholder="อายุ" values="" required/>
            </div>
            <div>
                <label for="IDNumber">หมายเลขประจำตัวประชาชน:</label>
                <input type="text" name="IDNumber" id="IDNumber" values="" placeholder="xxxxxxxxxxxxx" required/>
            </div>
            <div>
                <label for="nationality">สัญชาติ:</label>
                <input type="text" name="nationality" id="nationality" values="" placeholder="สัญชาติ"required/>
                <label for="bloodGroup">หมู่เลือด:</label>
                <select id="bloodGroup" name="bloodGroup" required placeholder="หมู่เลือด">
                    <option default values="">หมู่เลือด</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="O">O</option>
                    <option value="AB">AB</option>
                </select>
            </div>
            <br><hr class="lineGradient">
            <!------------------------------------------------------------------------------------------------->

            <h3>ที่อยู่ตามทะเบียนบ้าน</h3>
            <div>
                <textarea type="text" row="5" column="40" name="regAddress" id="regAddress" values="" required></textarea><br>
            <label for="regZipCode">รหัสไปรษณีย์:</label>
                <input type="text" name="regZipCode" id="regZipCode" values="" placeholder="xxxxx"required/>
            </div>
            <br><hr class="lineGradient">
            <!------------------------------------------------------------------------------------------------->

            <h3>ที่อยู่ปัจจุบันและช่องทางการติดต่อ</h3>
            <div class="checkbox-wrapper-4">
                <input class="inp-cbx" type="checkbox" id="useSameAddress" name="useSameAddress"/>
                <label class="cbx" for="useSameAddress"><span>
                <svg width="12px" height="10px">
                    <use xlink:href="#check-4"></use>
                </svg></span><span>ใช้ที่อยู่เดียวกับทะเบียนบ้าน</span></label>
                <svg class="inline-svg">
                    <symbol id="check-4" viewbox="0 0 12 10">
                        <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
                    </symbol>
                </svg>
            </div>
            <div>
                <textarea type="text" row="5" column="40" name="curAddress" id="curAddress" values=""></textarea><br>
                <label for="curZipCode">รหัสไปรษณีย์:</label>
                <input type="text" name="curZipCode" id="curZipCode" values="" placeholder="xxxxx" required/>
            </div>
            <br>
            <div>
                <label for="phoneNumber">หมายเลขโทรศัพท์:</label>
                <input type="text" name="phoneNumber" id="phoneNumber" values="" placeholder="xxx xxx xxxx"required/>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" values="" placeholder="sample@email.com"required/>
            </div>
            <br><hr class="lineGradient">
            <!------------------------------------------------------------------------------------------------->

            <h3>คุณสมบัติเจ้าหน้าที่รัฐ</h3>
            <div>
                <div>
                    <label for="officerType">เจ้าหน้าที่รัฐประเภท:</label>
                    <select id="officerType" name="officerType" required>
                        <option default values="">ประเภท</option>
                        <option value="govOfficer">ข้าราชการครูและบุคลากรทางการศึกษา</option>
                        <option value="govEmployee">พนักงานราชการ</option>
                        <option value="ftEmployee">ลูกจ้างประจำ</option>
                    </select>
                </div><br>
                <div>
                    <div class="checkbox-wrapper-4">
                        <input class="inp-cbx" type="checkbox" id="isInSchool" name="isInSchool"/>
                        <label class="cbx" for="isInSchool"><span>
                        <svg width="12px" height="10px">
                            <use xlink:href="#check-4"></use>
                        </svg></span><span>รับราชการ/ปฏิบัติงานในโรงเรียน</span></label>
                        <svg class="inline-svg">
                            <symbol id="check-4" viewbox="0 0 12 10">
                                <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
                            </symbol>
                        </svg>
                    </div>
                    <label for="schoolName">โรงเรียน:</label>
                    <input disabled type="text" name="schoolName" id="schoolName"  values="" placeholder="ชื่อโรงเรียน"/>
                    <label for="workGroup">สังกัดกลุ่ม:</label>
                    <input disabled type="text" name="workGroup" id="workGroup" values="" placeholder="กลุ่มงาน"/>
                </div><br>

                <div>
                    <label for="jobLevel">ระดับ:</label>
                    <select id="jobLevel" name="jobLevel" onchange="showFieldJobLevel(this.options[this.selectedIndex].value)" required>
                        <option default values="" >ระดับ</option>
                        <option value=normal_1 >ทั่วไป-ปฏิบัติงาน</option>
                        <option value=normal_2 >ทั่วไป-ชำนาญงาน</option>
                        <option value=normal_3 >ทั่วไป-อาวุโส</option>
                        <option value=academic_1 >วิชาการ-ปฏิบัติการ</option>
                     <option value=academic_2 >วิชาการ-ชำนาญการ</option>
                        <option value=academic_3 >วิชาการ-ชำนาญการพิเศษ</option>
                        <option value=academic_4 >วิชาการ-เชี่ยวชาญ</option>
                        <option value=other >อื่น ๆ</option>
                    </select><span id="divJobLevelOther"></span>
                </div>
            </div>
            <br><hr class="lineGradient">
            <div>
                <h3>สาเหตุการขอบัตร</h3>
                <label for="reqOption">กรณีขอบัตร:</label>
                <select id="reqOption" name="reqOption" required>
                    <option default values="">กรณี</option>
                    <option value="firstCard">ขอมีบัตรครั้งแรก</option>
                    <option value="newCard">ขอมีบัตรใหม่</option>
                    <option value="changeCard">ขอเปลี่ยนบัตร</option>
                </select>
                <div>
                    <label for="reqCause">สาเหตุการขอใหม่:</label>
                    <input type="text" name="reqCause" id="reqCause" values="" placeholder="สาเหตุ"required/>
                </div>
            </div>

            <div class='animation a6'><br>
                <button class="submitButton" type="submit" id="submit" name="submit" onclick="goto_page(1)">ส่งข้อมูล</button>               
            </div>
 
            <!--<div class='animation a6'><br>
                <label class="submitButton" for="dialog_state">ส่งข้อมูล</label>               
            </div>
            <input type="checkbox" name="dialog_state" id="dialog_state" class="dialog_state">
            
            <div id='dialog'>
                <label id="dlg-back" for="dialog_state"></label>
                <div id='dlg-wrap'>
                    <label id="dlg-close" for="dialog_state"></label>
                    <h2 id='dlg-header'>คุณต้องการส่งคำร้องขอทำบัตรหรือไม่?</h2>
                    <div id='dlg-content'>โปรดตรวจข้อมูลให้ถูกต้องก่อนส่ง</div><br>
                    <div id='dlg-prompt'>
                        <button class='button positive' id="open-popup-btn" type='submit' name="submit"></i>ตกลง</button>
                        <div class='button' for="dialog_state">ยกเลิก</div>
                    </div>
                </div>
            </div>

            <div class="popup center">
                <div class="icon">
                    <i class="fa fa-check"></i>
                </div>
                <div class="title">กรอกข้อมูลสำเร็จ</div>
                <div class="description">เจ้าหน้าที่่กำลังจัดทำบัตรให้กับท่าน เมื่อดำเนินการเสร็จสิ้นเจ้าหน้าที่จะติดต่อกลับไป</div>
                <div class="dismiss-btn">
                    <button id="dismiss-popup-btn" onclick="goto_page(1)">กลับไปเมนูหลัก</button>
                </div>
            </div>-->
        </form>

        
        <!--<div class="center">
            <button id="open-popup-btn">
                open popup
            </button>
        </div>-->

    </div>

    

</body>

</html>


<script>
/*
//new popup   
document.querySelector('#btnChangeBg').addEventListener('click', () => {
    Confirm.open({
        title: 'คุณต้องการส่งคำร้องขอทำบัตรหรือไม่?',
        message: 'โปรดตรวจข้อมูลให้ถูกต้องก่อนส่ง',
        onok: () => {
            document.getElementById("card_request").submit();
        }
    })
});*/

//this function use for "ENABLE" input box when the check box is checked.
document.getElementById("isInSchool").onchange = function() {
    document.getElementById("schoolName").disabled = !this.checked;
    document.getElementById("workGroup").disabled = !this.checked;
};

//this function use for "DISABLE" input box when the check box is checked.
document.getElementById("useSameAddress").onchange = function() {
    document.getElementById("curAddress").disabled = this.checked;
    document.getElementById("curZipCode").disabled = this.checked;
};

//this function use for "SHOW" input box when select the other choice.
function showFieldJobLevel(choice){
    if(choice == 'other')document.getElementById("divJobLevelOther").innerHTML=' ระบุระดับ: <input type="text" name="jobLevelOther" id="jobLevelOther" required>';
    else document.getElementById('divJobLevelOther').innerHTML='';
}


/*$(function(){
    $(document).keypress(function(e) {
      cwrite(e.which,'Keypress event');
      if(e.which==120) custom_dialog_toggle('Keypress x','You opened this window by pressing x');
    });
});

function custom_dialog_toggle(title,text,buttons) {
    if(typeof title !=='undefined') $('#dlg-header').html(title);
    if(typeof text !=='undefined') $('#dlg-content').html(text);
    cwrite('Current state: '+$('#dialog_state').prop("checked"),'custom_dialog_toggle');
    $('#dialog_state').prop("checked", !$('#dialog_state').prop("checked"));
}
  // Console logging function for debugging
  // cwrite(str, title)
  //      str:              string to be appended to console
  //      title (optional): title of the string
  // (c)  Tuomas Hatakka 2015
  //      http://tuomashatakka.fi
function cwrite(str,title) {
    var ce = $('#console');
    var sg = "<p>";
    if(typeof title !=='undefined') sg = sg+"<em>"+title+"</em> ";
    sg = sg+str+"</p>";
    ce.prepend(sg);
    if(ce.children("p").length>6) ce.children("p").first().remove();
}*/
/*
// function for open and close the SUCCESSFUL dialog popup
document.getElementById("open-popup-btn").addEventListener("click", function(){
    document.getElementsByClassName("popup")[0].classList.add("active");
});

document.getElementById("dismiss-popup-btn").addEventListener("click", function(){
    document.getElementsByClassName("popup")[0].classList.remove("active");
});
*/
/*document.getElementById("cancel-submit").addEventListener("click", function(){
    document.getElementsByID("dialog").remove("active");
});*/

// function for redirect to another page
function goto_page(des){
	if(des==0){
		callfrm("?option=form_inserting");   // submitte and return to card request menu
	}else if(des==1){
		callfrm("?option=card_request");   
	}
}
/*
function Confirm(title, msg, $true, $false, $link) { //change
    var $content =  "<div class='dialog-ovelay'>" +
                    "<div class='dialog'><header>" +
                     " <h3> " + title + " </h3> " +
                     "<i class='fa fa-close'></i>" +
                 "</header>" +
                 "<div class='dialog-msg'>" +
                     " <p> " + msg + " </p> " +
                 "</div>" +
                 "<footer>" +
                     "<div class='controls'>" +
                         " <button class='button button-danger doAction' onclick='goto_page(1)'>" + $true + "</button> " +
                         " <button class='button button-default cancelAction'>" + $false + "</button> " +
                     "</div>" +
                 "</footer>" +
              "</div>" +
            "</div>";
     $('body').prepend($content);
  $('.doAction').click(function () {
    window.open($link, "_blank"); //new
    $(this).parents('.dialog-ovelay').fadeOut(500, function () {
      $(this).remove();
    });
  });
$('.cancelAction, .fa-close').click(function () {
    $(this).parents('.dialog-ovelay').fadeOut(500, function () {
      $(this).remove();
    });
  });
  
}
$('a').click(function () {
    Confirm('Go to Google', 'Are you sure you want to visit Google', 'Yes', 'Cancel', "https://www.google.com.eg"); //change
});
*/
</script>
