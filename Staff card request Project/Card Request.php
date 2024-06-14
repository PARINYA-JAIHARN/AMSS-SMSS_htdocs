<?php
/*
string

$prefix = $firstname = $lastname = $idNumber = $birthday = $nationality = $bloodGroup = 
$houseNumber = $villageNumber = $street = $alley = $subDistrict = $district = 
$province = $zipcode = $phoneNumber = $email = $staffType = $schoolName = 
$workGroup = $level = $reqCause = $renewCause = $imgFile = "";

$workInSchool = $useSameAddress = false;

$age = 0;

*/



$nameErr = $emailErr = $genderErr = $websiteErr = "";
$name = $email = $gender = $comment = $website = "";


function getAge($dateOfBirth){
    $bday = new DateTime($dateOfBirth);
    $today = new Datetime(date('m.d.y'));
    if($bday>$today){
      return '-';
    }
    $diff = $today->diff($bday);
    return $diff->y;
  }


// Function to convert Gregorian date to Thai Buddhist (Thai) date
function gregorianToThai($date) {
    $gregorianYear = date('Y', strtotime($date));
    $thaiYear = $gregorianYear + 543; // Add 543 years to convert to Thai year
    $thaiDate = date('d/m/', strtotime($date)) . $thaiYear; // Format date as dd/mm/yyyy (Thai year)
    return $thaiDate;
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    
}
function toggleInput($status) {
    $status[''] = '';
    return $status;
}

/*function toggleInput() {
    var checkbox = document.getElementById('enable_checkbox');
    var inputField = document.getElementById('input_field');
    inputField.disabled = !checkbox.checked;
}";*/

?>