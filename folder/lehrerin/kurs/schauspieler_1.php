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
				echo "<p>Schauspieler <b>".$result[0]['Vorname']." ".$result[0]['Nachname']."</b> gefunden.</p>";
				
				$getFilmsFromActor = $dbh->prepare("SELECT filme.Titel, produktionsfirma.Bezeichnung FROM filme, schauspieler_has_filme, produktionsfirma WHERE schauspieler_has_filme.Schauspieler_id = :schauspielerID AND schauspieler_has_filme.Filme_Song_ID = filme.Song_ID AND filme.Produktionsfirma_ID = produktionsfirma.Produktionsfirma_ID ");
				$getFilmsFromActor->bindParam(':schauspielerID', $result[0]['id']);
				if($getFilmsFromActor->execute())
				{
					/*
					$result = $getFilms->fetch();
					print_r($result);
					*/
					$result = $getFilmsFromActor->fetchAll();
					if(empty($result))
					{
						echo "Der Schauspieler wirkte in keinen Filmen mit.";
					}
					else
					{
						foreach($result as $key)
						{
							echo "Filmtitel: <b>".$key['Titel']."</b> - Studio: <b>".$key['Bezeichnung']."</b><br />";
						}
					}
				}
				else
				{
					echo "Query zur Auflistung der Filme des Studios schlug fehl";
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