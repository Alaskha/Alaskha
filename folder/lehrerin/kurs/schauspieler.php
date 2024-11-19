<!DOCTYPE html>
<html>
<head>
<title>Title of the document</title>
</head>

<body>
<div>
<a href="./schauspieler.php">Schauspieler Suche</a> | <a href="./filme.php">Film Suche</a>
</div>
<form action="schauspieler.php" method="post">
<p>Suche nach Schauspielern:<p>
<p>Vorname: <input type="text" name="schauspielerVorname" /></p>
<p>Nachname: <input type="text" name="schauspielerNachname" /></p>
<input type="submit" name="SchauspielerSubmit" value="Suchen" />
</form>

<?php

if(isset($_POST['SchauspielerSubmit']))
{
	$_POST['schauspielerVorname'] = str_replace('%', '', $_POST['schauspielerVorname']);
	$_POST['schauspielerNachname'] = str_replace('%', '', $_POST['schauspielerNachname']);
	
	if(empty($_POST['schauspielerVorname']) && empty($_POST['schauspielerNachname'])) 
	{
		echo "<p>In beiden Feldern wurde nichts eingetragen</p>";
		die();
	}
	if($dbh = new PDO('mysql:host=localhost;dbname=filmverwaltung', 'root'))
	{
		$findSchauspieler = $dbh->prepare("SELECT Vorname, Nachname, id FROM schauspieler WHERE Vorname LIKE :vorname AND Nachname LIKE :nachname");
                $findVorname = trim($_POST['schauspielerVorname'].'%');
		$findSchauspieler->bindParam(':vorname', $findVorname);
                $findNachname = trim($_POST['schauspielerNachname'].'%');
		$findSchauspieler->bindParam(':nachname', $findNachname);
		if($findSchauspieler->execute())
		{
			$result = $findSchauspieler->fetchAll();
			if(empty($result))
			{
				echo "Schauspieler nicht gefunden.";
			}
			else
			{
				foreach ($result as $ss)
				{
				    echo "<p>Schauspieler <b>".$ss['Vorname']." ".$ss['Nachname']."</b> gefunden.</p>";
				
			    	$getFilmsFromActor = $dbh->prepare("SELECT filme.Titel, produktionsfirma.Bezeichnung FROM filme, schauspieler_has_filme, produktionsfirma 
														WHERE schauspieler_has_filme.Schauspieler_id = :schauspielerID 
														AND schauspieler_has_filme.Filme_Song_ID = filme.Song_ID 
														AND filme.Produktionsfirma_ID = produktionsfirma.Produktionsfirma_ID ");
					$getFilmsFromActor->bindParam(':schauspielerID', $ss['id']);
					if($getFilmsFromActor->execute())
					{
						/*
						$result = $getFilms->fetch();
						print_r($result);
						*/
						$resultfilms = $getFilmsFromActor->fetchAll();
						if(empty($result))
						{
							echo "Der Schauspieler wirkte in keinen Filmen mit.";
						}
						else
						{
							foreach($resultfilms as $films)
							{
								echo "Filmtitel: <b>".$films['Titel']."</b> - Studio: <b>".$films['Bezeichnung']."</b><br />";
							}
						}
					}	
					else
					{
						echo "Query zur Auflistung der Filme des Studios schlug fehl";
					}
				}
			}
		}
		else
		{
			echo "Query zum finden des Schauspieler schlug fehl";
		}
	}
	else
	{
		echo "Konnte keine Verbindung zur Datenbank aufbauen";
	}

}


?>

</body>

</html> 