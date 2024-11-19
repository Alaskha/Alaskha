<?php
echo "<title>Suchergebnis</title>";
echo "<link href='./CSS_Stylesheet.css' rel='stylesheet'>";

echo "<ul>
<li><a href='./Main.html'>Home</a></li>
<li><a href='./Search.php'>Search results</a></li>
</ul> ". nl2br("\n");

if (!empty($_POST['radChoice']) || isset($_POST['txtEingabe']))
{
    $sql = "";
    $txtEingabe = $_POST['txtEingabe'];
    $radChoice = $_POST['radChoice'];

    if($radChoice == "Firma"){
        $sql = "Select Filmtitel, Erscheinungsdatum, f.Name FROM Film JOIN Filmstudio AS f ON Filmstudio_ID = f.ID
        WHERE f.Name  like '%$txtEingabe%'
        ORDER BY Erscheinungsdatum ASC;";
        
        echo "Gesuchte Produktionsfirma: <b>$txtEingabe</b>". nl2br("\n");
    }
    else if($radChoice == "Schauspieler")
    {
        $sql = "Select Filmtitel, Erscheinungsdatum, f.Name, CONCAT(s.Vorname,' ', s.Nachname) As Schauspielername FROM Film 
        Join film_has_schauspieler As fs 
        JOIN Filmstudio AS f 
        JOIN Schauspieler AS s 
        ON (Filmstudio_ID = f.ID and s.id = fs.Schauspieler_ID and Film.Id = fs.Film_Id)
        WHERE (CONCAT(s.Vorname,' ', s.Nachname) like '%$txtEingabe%')
        ORDER BY Erscheinungsdatum ASC;";

        
        echo "Gesuchter Schauspieler: <b>$txtEingabe</b>". nl2br("\n");
    }else
    {
        echo "error radiobutton value not found";
        return;
    }

        echo "<h2>Suchergebniss</h2>";
                
        $conn = mysqli_connect('localhost', 'root', '', 'filmverwaltung');
        
        if ($conn->connect_error) 
        {
            echo "Connection failed: " . $conn->connect_error;
        }
            $result = $conn->query($sql);

            if ($result->num_rows > 0) 
            {
                $row = $result->fetch_assoc();
                if($radChoice == "Firma"){
                echo "Gefundene Produktionsfirma: <b>".$row["Name"]."</b>". nl2br("\n");
                }
                else if($radChoice == "Schauspieler")
                {
                echo "Gefundene Schauspieler: <b>".$row["Schauspielername"]."</b>". nl2br("\n");
                }
                echo "Anzahl Ergebnisse: <b>$result->num_rows</b>". nl2br("\n");
                echo "<br><fieldset><table>"; 
                
                echo "<tr>
                <th><h4>Filmtitel</h4></th>
                <th><h4>Erscheinungsdatum</h4></th>
                <th><h4>Productionsfirma</h4></th>
                </tr>";

                echo "<tr><td>" . $row["Filmtitel"]. "</td><td>"  . $row["Erscheinungsdatum"]. "</td><td>"  . $row["Name"]. "</td></tr>";
                while($row = $result->fetch_assoc()) 
                {
                    echo "<tr><td>" . $row["Filmtitel"]. "</td><td>"  . $row["Erscheinungsdatum"]. "</td><td>"  . $row["Name"]. "</td></tr>";
                }
                echo "</table></fieldset>";
            }  
            else{
                echo "No results found";
            }    
            mysqli_close($conn);
}
else{
    echo "Error. Es wurde keine Suchanfrage übertragen" . nl2br("\n");
}
?>
