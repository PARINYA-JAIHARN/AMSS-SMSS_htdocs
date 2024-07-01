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

// Pagination
$rowPerPage = 5;
if (isset($_GET['page'])){
    $page = $_GET['page'];
} 
else {
    $page = 1;
}
$startPage = ($page-1)*$rowPerPage; 
?>

<!--
https://github.com/JeetSaru/Responsive-HTML-Table-With-Pure-CSS---Web-Design-UI-Design
 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta http-equiv="Content-Language" content="th" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>รายการอนุมัติคำขอทำบัตร</title>
    <link rel="stylesheet" type="text/css" href="table_2/table_2.css">
    <link rel="stylesheet" href="thsarabunnew.css" type="text">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="https://fontawesome.com/icons/pen-to-square?f=classic&s=solid">
</head>

<style>
	<?php
	include "table_2/table_2.css";
    include "thsarabunnew.css";
    
    ?>
</style>

<body>
    <main class="table" id="customers_table">
        <section class="table__header">
            <h1>รายการคำขอทำบัตร</h1>
            <div class="input-group">
                <input type="search" placeholder="ค้นหา...">
                <!--<a class="fa-solid fa-magnifying-glass"></a>-->
            </div>
        </section>
        <section class="table__body">
            <table id="request_list" class="table table-striped table-class">
                <thead>
                    <tr>
                        <th> ที่ </th>
                        <th> ชื่อ-สกุล </th>
                        <th> ประเภทเจ้าหน้าที่ </th>
                        <th> ระดับ </th>
                        <th> โทร. </th>
                        <th> วันที่ </th>
                        <th> สถานะ </th>
                        <th> ตรวจสอบ </th>
                    </tr>
                </thead>
                <tbody>
                    <!-- loop query from db to show in table-->
                    <?php
                    $sql = "SELECT * FROM card_request ORDER BY reqOrder DESC LIMIT {$startPage}, {$rowPerPage}";
                    $dbquery = mysqli_query($connect,$sql);
                    While ($result = mysqli_fetch_array($dbquery)){
                        $reqOrder = $result['reqOrder'];
                        $prefix = $result['prefix'];
                        $firstName = $result['firstName'];
                        $lastName = $result['lastName'];
                        $officerType = $result['officerType'];
                        $jobLevel = $result['jobLevel'];
                        $phoneNumber = $result['phoneNumber'];
                        $requestDate = $result['reqDate'];
                        $status = $result['progress'];
                    ?>
                    <tr>
                        <td> <?php echo $reqOrder ?> </td>
                        <td> <?php echo $prefix; echo $firstName; echo '&nbsp'; echo $lastName ?> </td>
                        <td> <?php echo $officerType ?> </td>
                        <td> <?php echo $jobLevel ?> </td>
                        <td> <?php echo $phoneNumber ?> </td>
                        <td> <?php echo $requestDate ?> </td>
                        <td>
                            <?php if($status == 1) {?>
                                <p class="status delivered">สำเร็จ</p>
                            <?php
                            } elseif($status == 0) {?>
                                <p class="status pending">กำลังดำเนินการ</p>
                            <?php
                            }
                            ?>
                        </td>
                        <td><a class="fa-solid fa-pen-to-square" style="font-size:large" href=""></a></td>
                    </tr>
                    <?php 
                    } 
                    ?>

                </tbody>
            </table>
        </section>

        <!-- page count -->
        <?php
        $sqlRowCount = "SELECT * FROM card_request";
        $dbRowCount = mysqli_query($connect,$sqlRowCount);
        $totalRow = mysqli_num_rows($dbRowCount);
        $totalPages = ceil($totalRow / $rowPerPage);
        ?>
        <!-- Pagination -->
        
            <ul class="pagination justify-content-center " >
                <li class="page-item">
                    <a class="page-link" href="index.php?option=card_request&task=main/request_list&page=1" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                
                <?php
                for ($i = 1; $i <= $totalPages; $i++){ ?>
                    <li class="page-item"><a class="page-link" href="index.php?option=card_request&task=main/request_list&page=<?php echo $i; ?>"><?php echo $i; ?></a></li>

                <?php } ?>

                <li class="page-item">
                    <a class="page-link" href="index.php?option=card_request&task=main/request_list&page=<?php echo $totalPages; ?>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        
        

    </main>

    <script src="table_2/table_2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

<script>

// main table 

const search = document.querySelector('.input-group input'),
    table_rows = document.querySelectorAll('tbody tr'),
    table_headings = document.querySelectorAll('thead th');

// 1. Searching for specific data of HTML table
search.addEventListener('input', searchTable);

function searchTable() {
    table_rows.forEach((row, i) => {
        let table_data = row.textContent.toLowerCase(),
            search_data = search.value.toLowerCase();

        row.classList.toggle('hide', table_data.indexOf(search_data) < 0);
        row.style.setProperty('--delay', i / 25 + 's');
    })

    document.querySelectorAll('tbody tr:not(.hide)').forEach((visible_row, i) => {
        visible_row.style.backgroundColor = (i % 2 == 0) ? 'transparent' : '#0000000b';
    });
}

// 2. Sorting | Ordering data of HTML table

/*table_headings.forEach((head, i) => {
    let sort_asc = true;
    head.onclick = () => {
        table_headings.forEach(head => head.classList.remove('active'));
        head.classList.add('active');

        document.querySelectorAll('td').forEach(td => td.classList.remove('active'));
        table_rows.forEach(row => {
            row.querySelectorAll('td')[i].classList.add('active');
        })

        head.classList.toggle('asc', sort_asc);
        sort_asc = head.classList.contains('asc') ? false : true;

        sortTable(i, sort_asc);
    }
})


function sortTable(column, sort_asc) {
    [...table_rows].sort((a, b) => {
        let first_row = a.querySelectorAll('td')[column].textContent.toLowerCase(),
            second_row = b.querySelectorAll('td')[column].textContent.toLowerCase();

        return sort_asc ? (first_row < second_row ? 1 : -1) : (first_row < second_row ? -1 : 1);
    })
        .map(sorted_row => document.querySelector('tbody').appendChild(sorted_row));
}*/


// Pagination 
let currentPage = 1;
let rowsPerPage = <?php echo $rowPerPage ?>;
let totalPages = <?php echo $totalPages ?>;
const pageNumbers = document.getElementById("pageNumbers");

function paginateTable() {
    let table = document.getElementById("myTable");
    let rows = Array.from(table.rows).slice(1);
    totalPages = Math.ceil(rows.length/rowsPerPage);

    rows.forEach(row=>row.style.display="none");

    let start = (currentPage - 1) * rowsPerPage;
    let end = start + rowsPerPage;
    rows.slice(start,end).forEach(row=>row.style.display = "");
    pageNumbers.innerHTML = "";
    createPageLink("<<",1);
    createPageLink("<",currentPage-1);

    let startPageNumber = currentPage < 5 ? 1 : (currentPage>totalPages-2?totalPages-4 : currentPage-2);
    let endPageNumber =totalPages<5 ? totalPages : (currentPage<=totalPages -2 ? startPageNumber+4 : totalPages);
    for (let i=startPageNumber;i<=endPageNumber;i++) {
        createPageLink(i,i);
    }
    createPageLink(">",currentPage+1);
    createPageLink(">>",totalPages);

    setActivePageNumber();
    from.innerHTML = (currentPage-1)*rowsPerPage+1;
    to.innerHTML = currentPage === totalPages ? rows.length : (currentPage)*rowsPerPage;
    totalTableEntries.innerHTML = rows.length;

}

paginateTable();

function changePage(e,pageNumber) {
    if((pageNumber == 0)||(pageNumber==totalPages+1)) return;
    e.preventDefault();
    currentPage = pageNumber;
    pageNumberInput.value = "";
    paginateTable();
}

function setActivePageNumber() {
    document.querySelectorAll("#pageNumbers a").forEach(a=>{
        if(a.innerText == currentPage) {
            a.classList.add("active");
        }
    });
}

function createPageLink(linkText,pageNumber) {
    let pageLink = document.createElement("a");
    pageLink.href = "#";
    pageLink.innerHTML = linkText;
    pageLink.addEventListener("click",function(e){
        changePage(e,pageNumber);
    });
    pageNumbers.appendChild(pageLink);
}

goToPageButton.addEventListener("click",(e)=>{
    changePage(e,pageNumberInput.value);
});
</script>