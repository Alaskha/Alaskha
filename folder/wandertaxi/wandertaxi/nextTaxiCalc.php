<?php include('fahrplanData.php');

//if(isset($_POST['stationID']) && if(isset($_POST['dayID'])){ error
$stationID = $_POST['stationID'];
$dayID = $_POST['dayID'];
$timeEntered = $_POST['timeEntered'];

$conn = mysqli_connect('localhost', 'root', '', 'wandertaxi');
         
if ($conn->connect_error) 
{
    echo "Connection failed: " . $conn->connect_error;
}

$routenTag = $dayID;
if(1<=$dayID && $dayID<=4){
    $routenTag = 1;
}else if(5 == $dayID){
    $routenTag = 2;
}
else if(6 <= $dayID && $dayID <= 7) {
     $routenTag = 3;
}

$sql = getSqlTimeEndstation($stationID, $routenTag, $timeEntered, 1);
$result = $conn->query($sql);
$rowRoute1 = $result->fetch_array(MYSQLI_NUM);
if(6<=$dayID && $dayID<=7){
    $routenTag = 5;
}
else if(1 <= $dayID && $dayID <= 5) {
    $routenTag = 4;
}
$sql = getSqlTimeEndstation($stationID, $routenTag, $timeEntered, 2);
$result = $conn->query($sql);
$rowRoute2 = $result->fetch_array(MYSQLI_NUM);

mysqli_close($conn);

$outputHTML = "";
$outputHTML .= getOutput($rowRoute1, 1);
$outputHTML .= getOutput($rowRoute2, 2);

if(strlen($outputHTML) == 0){
    $outputHTML = "An diesem Tag fährt das Wandertaxi leider nicht mehr zu dieser Station.";
}

echo json_encode($outputHTML);
//}

function getSqlTimeEndstation($stationID, $routeDay, $selectedtime, $route){
    return "SELECT tbl_routentage_routenfuehrung.Uhrzeit, `tbl_routenfuehrung`.`isEndstation` FROM tbl_routentage_routenfuehrung 
        INNER JOIN tbl_routenfuehrung ON tbl_routenfuehrung.IDRoutenfuehrung=tbl_routentage_routenfuehrung.FIDRoutenfuehrung 
        INNER JOIN tbl_stationen ON `tbl_stationen`.`IDStation`= `tbl_routenfuehrung`.`FIDStation` 
        WHERE tbl_routentage_routenfuehrung.Uhrzeit > '$selectedtime'
        AND `tbl_routenfuehrung`.`FIDRoute` = $route
        AND tbl_routentage_routenfuehrung.FIDRoutentag = $routeDay 
        AND tbl_routenfuehrung.FIDStation = $stationID
        ORDER BY tbl_routentage_routenfuehrung.Uhrzeit ASC 
        LIMIT 1;";
        
    }

function getOutput($route, $routeNum){
    $output = "";
    if($route){
        $output .= getTimeFormatted($route[0]) . " auf Route $routeNum";
        if($route[1] == 1){
            $output .= " (Endstation)";
        }
        $output .= "<br>";
    }
    return $output;
    }
?>