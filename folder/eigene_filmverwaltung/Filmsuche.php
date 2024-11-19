<?php
include('header.php');

?>


<html>

<script>
function suchefilme(){
let prodfirma = $('#suche').val();
$.ajax({
    type: "POST",
    url: "/eigene_filmverwaltung/returnsearch.php",
    data: {prodfirma: prodfirma},
    success: function(result){
        if(result){
           $("#tabelleErgebnis").html(JSON.parse(result));
        }
    }
})
}
    </script>
<body>

    <label>Filmsuche nach Produktionsfirma</label>
    <input class="form-control mr-sm-2" name="suche" id="suche" placeholder="Produktionsfirma">
    <button type="button"  onclick="suchefilme()">suche</button> <br>
    
    <label name="tabelleErgebnis" id="tabelleErgebnis"></label>

    
</body>
</html>