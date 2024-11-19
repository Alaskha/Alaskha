<?php include('header.php');
include('nav.php');
include('fahrplanData.php');
?>
<html>
<body>
    <table class="table">
        <thead>
            <tr>
                <th scope="col" colspan="5">
                    <h3>Route 1 </h3>
                    <h5>
                        <?php echo $rowsRoutes[0][0];?>
                    </h5>
                </th>
                <th scope="col" colspan="4">
                    <h3>Route 2 </h3>
                    <h5>
                        <?php echo $rowsRoutes[1][0];?>
                    </h5>
                </th>
            </tr>
            <tr>
                <th scope="col" colspan="2"></th>
                <th scope="col">Mo-Do</th>
                <th scope="col">Fr</th>
                <th scope="col">Sa-So</th>
                <th scope="col" colspan="2"></th>
                <th scope="col">Mo-Fr</th>
                <th scope="col">Sa-So</th>
            </tr>
            <tr>
                <th scope="col" colspan="2">Ort</th>
                <th scope="col">ab/an</th>
                <th scope="col">ab/an</th>
                <th scope="col">ab/an</th>
                <th scope="col" colspan="2">Ort</th>
                <th scope="col">ab/an</th>
                <th scope="col">ab/an</th>
            </tr>
        </thead>
        <tbody>
<?php
for ($x = 0; $x < sizeof($r1MoDo); $x++) {
    echo "<tr>";
    echo "<td colspan='2'>" . $r1MoDo[$x][1] . "</td>";
    echo "<td>" . getTimeFormatted($r1MoDo[$x][0]) . "</td>";
    echo "<td>" . getTimeFormatted($r1Fr[$x][0]) . "</td>";
    echo "<td>" . getTimeFormatted($r1SaSo[$x][0]) . "</td>";

    echo "<td colspan='2'>" . $r2MoFr[$x][1] . "</td>";
    echo "<td>" . getTimeFormatted($r2MoFr[$x][0]) . "</td>";
    echo "<td>" . getTimeFormatted($r2SaSo[$x][0]) . "</td>";
    echo "</tr>";
}
?>
        </tbody>
    </table>
</body>

</html>