<?php include('header.php');
include('nav.php');
include('fahrplanData.php');
?>
<html>
  <script>
    function nextTaxiTime() {
    /* var divStations = document.getElementById("dom-target-stations");
     var divDays = document.getElementById("dom-target-days");
     var stationsData = JSON.parse(divStations.textContent);
     var daysData = JSON.parse(divDays.textContent);*/

    var stationID = $('#stations option:selected').val();
    var dayID = $('#weekdays option:selected').val();
    var timeEntered = $("#time").val();

    $.ajax({
        type: "POST",  //type of method
        url: "/wandertaxi/nextTaxiCalc.php",  //your page
        data: { stationID: stationID, dayID: dayID, timeEntered: timeEntered },// passing the values
        success: function (res) {
            if (res) {
                $("#isEndstation").html(JSON.parse(res));
            }
        }
    });

    return false;
}
  </script>
  <body>
    <form onsubmit="return nextTaxiTime()" method="POST">
      <div class="form-group">
        <fieldset>
          <label for="stations">Station:</label>
          <select name="stations" id="stations">
<?php
for ($x = 0; $x < sizeof($stationsAll); $x++) {
    echo "<option value=".$stationsAll[$x][1].">".$stationsAll[$x][0]."</option>";
}
?> 
          </select>
        </fieldset>
        <fieldset>
          <label for="weekdays">Wochentag:</label>
          <select name="weekdays" id="weekdays"> 
<?php
for ($x = 0; $x < sizeof($rowsDays); $x++) {
  if($rowsDays[$x][1] == $weekday){
    echo "<option selected='selected' value=".$rowsDays[$x][1].">".$rowsDays[$x][0]."</option>";
  }else{
    echo "<option value=".$rowsDays[$x][1].">".$rowsDays[$x][0]."</option>";
  }
}
?>
            </select>
        </fieldset>
        <fieldset>
          <label for="time">Uhrzeit:</label>
          <input class="form-control" id="time" name="time" pattern="[0-9]{2}:[0-9]{2}" value=<?php echo $time;?> required>
        </fieldset>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <label name="isEndstation" id="isEndstation"></label>

    <div id="dom-target-stations" style="display: none;">
        <?php
        echo json_encode($stationsAll); 
    ?>
    </div>
    <div id="dom-target-days" style="display: none;">
        <?php
        echo json_encode($rowsDays); 
    ?>
    </div>
</body>

</html>