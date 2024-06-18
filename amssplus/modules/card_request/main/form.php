<!DOCTYPE html>
<html lang="th-th">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>คำขอทำบัตรประจำตัวเจ้าหน้าที่ราชการ</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/form.css" type="text">
</head>
<body>
    <div class="container">
        <h1>คำขอทำบัตรประจำตัวเจ้าหน้าที่ราชการ</h1>
        <form action="Card Request.php" method="POST">
            <h3>ข้อมูลพื้นฐาน</h3>
            <div>
                <label for="prefix">คำนำหน้าชื่อ:</label>
                <select id="prefix" name="prefix"><option value="none">คำนำหน้าชื่อ</option>
                    <option value="mister">นาย</option>
                    <option value="miss">นาง</option>
                    <option value="missis">นางสาว</option>
                </select>
                <label for="firstname">ชื่อ:</label>
                <input type="text" name="firstname" id="firstname">
                <label for="lastname">นามสกุล:</label>
                <input type="text" name="lastname" id="lastname">
            </div>
            <div>
                <label for="dateOfBirth">เกิดวันที่:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth">
                <label for="age">อายุ:</label>
                <input type="text" name="age" id="age">
            </div>
            <div>
                <label for="idNumber">หมายเลขประจำตัวประชาชน:</label>
                <input type="text" name="idNumber" id="idNumber">
            </div>
            <div>
                <label for="nationality">สัญชาติ:</label>
                <input type="text" name="nationality" id="nationality">
                <label for="bloodGroup">หมู่เลือด:</label>
                <select id="bloodGroup" name="bloodGroup">
                    <option value="none">หมู่เลือด</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="AB">AB</option>
                    <option value="O">O</option>
                </select>
            </div>
            <h3>ที่อยู่ตามทะเบียนบ้าน</h3>
            <div>
                <div>
                    <label for="houseNumber">บ้านเลขที่:</label>
                    <input type="text" name="houseNumber" id="houseNumber">
                    <label for="villageNumber">หมู่ที่:</label>
                    <input type="text" name="villageNumber" id="villageNumber">
                    <label for="street">ถนน:</label>
                    <input type="text" name="street" id="street">
                    <label for="alley">ตรอก/ซอย:</label>
                    <input type="text" name="alley" id="alley">
                </div>
                <div>
                    <label for="subDistrict">ตำบล:</label>
                    <input type="text" name="subDistrict" id="subDistrict">
                    <label for="district">อำเภอ:</label>
                    <input type="text" name="district" id="district">
                    <label for="province">จังหวัด:</label>
                    <input type="text" name="province" id="province">
                    <label for="zipcode">รหัสไปรษณีย์:</label>
                    <input type="text" name="zipcode" id="zipcode">
                </div>
            </div>
            <h3>ที่อยู่ปัจจุบันและช่องทางการติดต่อ</h3>
            <div>     
                <div>
                    <input type="checkbox" id="useSameAddress" name="useSameAddress" value="true">
                    
                    <label for="useSameAddress">ใช้ที่อยู่เดียวกับทะเบียนบ้าน</label>
                </div>
                <div>
                    <label for="houseNumber">บ้านเลขที่:</label>
                    <input type="text" name="houseNumber" id="houseNumber">
                    <label for="villageNumber">หมู่ที่:</label>
                    <input type="text" name="villageNumber" id="villageNumber">
                    <label for="street">ถนน:</label>
                    <input type="text" name="street" id="street">
                    <label for="alley">ตรอก/ซอย:</label>
                    <input type="text" name="alley" id="alley">
                </div>
                <div>
                    <label for="subDistrict">ตำบล:</label>
                    <input type="text" name="subDistrict" id="subDistrict">
                    <label for="district">อำเภอ:</label>
                    <input type="text" name="district" id="district">
                    <label for="province">จังหวัด:</label>
                    <input type="text" name="province" id="province">
                    <label for="zipcode">รหัสไปรษณีย์:</label>
                    <input type="text" name="zipcode" id="zipcode">
                        
                </div> 
                <br>         
                <div>
                    <label for="phoneNumber">หมายเลขโทรศัพท์:</label>
                    <input type="text" name="phoneNumber" id="phoneNumber">
                    <label for="email">Email:</label>
                    <input type="text" name="email" id="email">
                </div> 
            </div>
            <h3>คุณสมบัติเจ้าหน้าที่รัฐ</h3>
            <div>
                <div>
                    <label for="staffType">เจ้าหน้าที่รัฐประเภท:</label>
                    <select id="staffType" name="staffType"><option value="none">ประเภท</option>
                        <option value="govOfficer">ข้าราชการครูและบุคลากรทางการศึกษา</option>
                        <option value="govEmployee">พนักงานราชการ</option>
                        <option value="fullTimeEmployee">ลูกจ้างประจำ</option>
                    </select>
                </div>
                <div>
                    <br>
                    <input type="checkbox" id="workInSchool" name="workInSchool" value="true">
                    <label for="workInSchool">รับราชการ/ปฏิบัติงานในโรงเรียน</label>
                </div>  
                <div>
                    <label for="schoolName">โรงเรียน:</label>
                    <input type="text" name="schoolName" id="schoolName">
                    <label for="workGroup">สังกัดกลุ่ม:</label>
                    <input type="text" name="workGroup" id="workGroup">
                </div>
                <div>
                    <label for="level">ระดับ:</label>
                    <select id="level" name="level"><option value="none">ระดับ</option>
                        <option value="normal_1">ทั่วไป-ปฏิบัติงาน</option>
                        <option value="normal_2">ทั่วไป-ชำนาญงาน</option>
                        <option value="normal_3">ทั่วไป-อาวุโส</option>
                        <option value="academic_1">วิชาการ-ปฏิบัติการ</option>
                        <option value="academic_2">วิชาการ-ชำนาญการ</option>
                        <option value="academic_3">วิชาการ-ชำนาญการพิเศษ</option>
                        <option value="academic_4">วิชาการ-เชี่ยวชาญ</option>
                        <option value="other">อื่น ๆ<input type="text" name="level" id="level"></option>
                    </select>
                </div>
            </div>
            <h3>สาเหตุการขอบัตร</h3>
            <div>
                <label for="reqCause">กรณี:</label>
                <select id="reqCause" name="reqCause"><option value="none">กรณี</option>
                    <option value="firstCard">ขอมีบัตรครั้งแรก</option>
                    <option value="newCard">ขอมีบัตรใหม่</option>
                    <option value="changeCard">ขอเปลี่ยนบัตร</option>
                </select>

                <select id="renewCause" name="renewCause"><option value="none">สาเหตุการขอใหม่</option>    
                    <option value="1_expire">บัตรหมดอายุ</option>
                    <option value="2_lostOrDamaged">บัตรหายหรือถูกทำลาย</option>
                    <option value="3_fnameChange">เปลี่ยนชื่อ</option>
                    <option value="4_lnameChange">เปลี่ยนสกุล</option>
                    <option value="5_fullnameChange">เปลี่ยนชื่อและสกุล</option>
                    <option value="6_damaged">ชำรุด</option>
                    <option value="7_changePosition">เปลี่ยนตำแหน่ง/เลื่อนยศ/เลื่อนระดับ</option>
                    <option value="8_other">อื่น ๆ<input type="text" name="level" id="level"></option>
                </section>
            </div>
            <h3>แนบเอกสาร</h3>
            <div>
                <label for="imgFile">เลือกไฟล์รูปภาพ(.jpg, .png, .pdf):</label>
                <input type="file" id="imgFile" name="imgFile"><br><br>
            </div>
            <button class="animation a6">ส่งข้อมูล</button>
        </form>
    </div>
</body>
</html>