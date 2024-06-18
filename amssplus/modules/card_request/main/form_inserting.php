<?php   
defined( '_VALID_' ) or die( 'Direct Access to this location is not allowed.' );

$officer=$_SESSION['login_user_id'];
$sql = "select * from  person_position order by position_code";
$dbquery = mysqli_query($connect, $sql);
while ($result = mysqli_fetch_array($dbquery)){
$position_ar[$result['position_code']]=$result['position_name'];
}
 
// from geek https://www.geeksforgeeks.org/how-to-insert-form-data-into-database-using-php/

// servername => localhost
// username => root
// password => empty
// database name => staff
//$conn = mysqli_connect("localhost", "root", "", "smss_10000001");
        
// Check connection
if($conn === false){
    die("ERROR: Could not connect. " 
        . mysqli_connect_error());
}
        
// Taking all 5 values from the form data(input)
/*$first_name =  $_REQUEST['first_name'];
$last_name = $_REQUEST['last_name'];
$gender =  $_REQUEST['gender'];
$address = $_REQUEST['address'];
$email = $_REQUEST['email'];*/

$prefix = $_POST['prefix'];
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$dateOfBirth = $_POST['dateOfBirth'];
$age = $_POST['age'];
$IDNumber = $_POST['IDNumber'];
$nationality = $_POST['nationality'];
$bloodGroup = $_POST['bloodGroup'];
$regAddress = $_POST['regAddress'];
$regZipCode = $_POST['regZipCode'];
$curAddress = $_POST['curAddress'];
$curZipCode = $_POST['curZipCode'];
$phoneNumber = $_POST['phoneNumber'];
$email = $_POST['email'];
$staffType = $_POST['staffType'];
$isInSchool = $_POST['isInSchool'];
$schoolName = $_POST['schoolName'];
$jobLevel = $_POST['jobLevel'];
$reqOption = $_POST['reqOption'];
$reqCause = $_POST['reqCause'];

$sql = "SELECT * FROM card_request WHERE IDNumber = '$_POST[IDNumber]'";
$dbquery = mysqli_query($connect,$sql);
if (mysqli_num_rows($dbquery)>=1){
    echo "ERROR: Hush! Sorry $sql. " ;
    exit();
}    
// Performing insert query execution
// here our table name is college
/*$sql = "INSERT INTO college  VALUES ('$first_name', 
        '$last_name','$gender','$address','$email')";*/

/*$sql = "INSERT INTO card_request VALUES ('$prefix', '$firstName', '$lastName','$dateOfBirth',
                                        '$age', '$IDNumber', '$nationality', '$bloodGroup',
                                        '$regAddress', '$regZipCode', '$curAddress', '$curZipCode',
                                        '$phoneNumber', '$email', '$staffType', '$isInSchool',
                                        '$schoolName', '$jobLevel', '$reqOption', '$reqCause')";*/

$sql = "insert into card_request (IDNumber, prefix, firstName, lastName, dateOfBirth, 
                                age, nationality, bloodGroup, regAddress, regZipCode, 
                                curAddress, curZipCode, phoneNumber, email, officerType,
                                isInSchool, schoolName, jobLevel, reqOption, reqCause)                         
        values ('$_POST[IDNumber]','$_POST[prefix]', '$_POST[firstName]', '$_POST[lastName]', '$_POST[dateOfBirth]', 
                '$_POST[age]', '$_POST[nationality]', '$_POST[bloodGroup]', '$_POST[regAddress]', '$_POST[regZipCode]', 
                '$_POST[curAddress]', '$_POST[curZipCode]', '$_POST[phoneNumber]', '$_POST[email]', '$_POST[officerType]', 
                '$_POST[isInSchool]', '$_POST[schoolName]', '$_POST[jobLevel]', '$_POST[reqOption]', '$_POST[reqCause]')";

/*INSERT INTO `card_request`(`IDNumber`, `prefix`, `firstName`, `lastName`, `dateOfBirth`, 
                            `age`, `nationality`, `bloodGroup`, `regAddress`, `regZipCode`, 
                            `curAddress`, `curZipCode`, `phoneNumber`, `email`, `officerType`, 
                            `isInSchool`, `schoolName`, `jobLevel`, `reqOption`, `reqCause`) 
                    VALUES ([value-2],[value-3],[value-4],[value-5],[value-6],
                            [value-7],[value-8],[value-9],[value-10],[value-11],
                            [value-12],[value-13],[value-14],[value-15],[value-16],
                            [value-17],[value-18],[value-20],[value-21],[value-21])
*/
$dbquery = mysqli_query($connect,$sql);
        
/*
echo "$sql";
if(mysqli_query($conn, $sql)){
    echo "<h3>data stored in a database successfully." 
        . " Please browse your localhost php my admin" 
        . " to view the updated data</h3>";        
} else{
    echo "ERROR: Hush! Sorry $sql. " 
        . mysqli_error($conn);
}
        
// Close connection
mysqli_close($conn);


}*/



/*if(isset($_POST["submit"])){
    if( !empty($_POST["prefix"]) && 
        !empty($_POST["firstName"]) && 
        !empty($_POST["lastName"]) && 
        !empty($_POST["dateOfBirth"]) &&
        !empty($_POST["age"]) && 
        !empty($_POST["IDNumber"]) && 
        !empty($_POST["nationality"]) && 
        !empty($_POST["bloodGroup"]) && 
        !empty($_POST["regAddress"]) && 
        !empty($_POST["regZipCode"]) && 
        !empty($_POST["curAddress"]) && 
        !empty($_POST["curZipCode"]) && 
        !empty($_POST["phoneNumber"]) && 
        !empty($_POST["email"]) && 
        !empty($_POST["staffType"]) && 
        !empty($_POST["isInSchool"]) && 
        !empty($_POST["schoolName"]) && 
        !empty($_POST["jobLevel"]) && 
        !empty($_POST["reqOption"]) &&
        !empty($_POST["reqCause"]) ){

        $prefix = $_POST["prefix"];
        $firstName = $_POST["firstName"];
        $lastName = $_POST["lastName"];
        $dateOfBirth = $_POST["dateOfBirth"];
        $age = $_POST["age"];
        $IDNumber = $_POST["IDNumber"];
        $nationality = $_POST["nationality"];
        $bloodGroup = $_POST["bloodGroup"];
        $regAddress = $_POST["regAddress"];
        $regZipCode = $_POST["regZipCode"];
        $curAddress = $_POST["curAddress"];
        $curZipCode = $_POST["curZipCode"];
        $phoneNumber = $_POST["phoneNumber"];
        $email = $_POST["email"];
        $staffType = $_POST["staffType"];
        $isInSchool = $_POST["isInSchool"];
        $schoolName = $_POST["schoolName"];
        $jobLevel = $_POST["jobLevel"];
        $reqOption = $_POST["reqOption"];
        $reqCause = $_POST["reqCause"];

        $query = "insert into card_request(prefix, firstName, lastName, 
        dateOfBirth, age, IDNumber, nationality, bloodGroup, regAddress, 
        regZipCode, curAddress, curZipCode, email, staffType, isInSchool,
        schoolName, jobLevel, reqOption) values ($prefix, $firstName, $lastName, 
        $dateOfBirth, $age, $IDNumber, $nationality, $bloodGroup, $regAddress, 
        $regZipCode, $curAddress, $curZipCode, $email, $staffType, $isInSchool,
        $schoolName, $jobLevel, $reqOption, $reqCause)";

        $run = mysqli_query($connect, $query) or die(mysqli_error($connect));
        if($run){
            echo"Form submitted successful.";
        }
        else{
            echo "Form not submitted.";
        }
        
    }
    else{
        echo "All field required.";
    }
}*/

/*if(isset($_POST["submit"])){
    $sql = "insert into card_request(IDNumber,
                                prefix, 
                                firstName, 
                                lastName, 
                                dateOfBirth, 
                                age, 
                                nationality, 
                                bloodGroup, 
                                regAddress,   
                                regZipCode, 
                                curAddress, 
                                curZipCode, 
                                phoneNumber,
                                email, 
                                officerType, 
                                isInSchool,    
                                schoolName, 
                                jobLevel, 
                                reqOption,
                                reqCause) 
            values ('$_POST[IDNumber]',
                    '$_POST[prefix]', 
                    '$_POST[firstName]', 
                    '$_POST[lastName]', 
                    '$_POST[dateOfBirth]', 
                    '$_POST[age]', 
                    '$_POST[nationality]', 
                    '$_POST[bloodGroup]', 
                    '$_POST[regAddress]',   
                    '$_POST[regZipCode]', 
                    '$_POST[curAddress]', 
                    '$_POST[curZipCode]', 
                    '$_POST[phoneNumber]',
                    '$_POST[email]', 
                    '$_POST[officerType]', 
                    '$_POST[isInSchool]',    
                    '$_POST[schoolName]', 
                    '$_POST[jobLevel]', 
                    '$_POST[reqOption]',
                    '$_POST[reqCause]')";
    mysqli_query($connect,$sql);
}*/
?>