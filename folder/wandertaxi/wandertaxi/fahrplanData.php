<?php
    
    $conn = mysqli_connect('localhost', 'root', '', 'wandertaxi');
         
    if ($conn->connect_error) 
    {
        echo "Connection failed: " . $conn->connect_error;
    }
    $sql = "SELECT Beschreibung FROM tbl_routen;";
    $result = $conn->query($sql);
    $rowsRoutes = mysqli_fetch_all ($result, MYSQLI_NUM);

    $result = $conn->query(getSqlTime(1, 1));
    $r1MoDo = mysqli_fetch_all ($result, MYSQLI_NUM);
    $result = $conn->query(getSqlTime(1, 2));
    $r1Fr = mysqli_fetch_all ($result, MYSQLI_NUM);
    $result = $conn->query(getSqlTime(1, 3));
    $r1SaSo = mysqli_fetch_all ($result, MYSQLI_NUM);
    $result = $conn->query(getSqlTime(2, 4));
    $r2MoFr = mysqli_fetch_all ($result, MYSQLI_NUM);
    $result = $conn->query(getSqlTime(2, 5));
    $r2SaSo = mysqli_fetch_all ($result, MYSQLI_NUM);

    $date = new DateTime();
    $time =  $date->format("H:i");
    $weekday = $date->format( 'N' );

    $sql = "SELECT Station, IDStation  FROM `tbl_stationen` ORDER BY `tbl_stationen`.`IDStation` ASC;";
    $result = $conn->query($sql);
    $stationsAll = mysqli_fetch_all ($result, MYSQLI_NUM);

    $sql = "SELECT Wochentag, Reihenfolge  FROM `tbl_wochentage`;";
    $result = $conn->query($sql);
    $rowsDays = mysqli_fetch_all ($result, MYSQLI_NUM);
    
    mysqli_close($conn);

    function getSqlTime($route, $day){
        return "SELECT tbl_routentage_routenfuehrung.Uhrzeit, `tbl_stationen`.`Station` FROM tbl_routentage_routenfuehrung
        INNER JOIN tbl_routenfuehrung ON tbl_routenfuehrung.IDRoutenfuehrung=tbl_routentage_routenfuehrung.FIDRoutenfuehrung
        INNER JOIN tbl_stationen ON `tbl_stationen`.`IDStation`= `tbl_routenfuehrung`.`FIDStation` 
        WHERE tbl_routentage_routenfuehrung.FIDRoutentag = $day
        AND `tbl_routenfuehrung`.`FIDRoute` = $route
        ORDER BY `tbl_routenfuehrung`.`Reihenfolge` ASC";
    }

    function getTimeFormatted($time){
        return date("H:i", strtotime($time));
    }

    ?>