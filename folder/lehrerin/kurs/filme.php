<!DOCTYPE html>
<html>
<head>
<title>Title of the document</title>
</head>

<body>
<div>
<div>
<a href="./schauspieler.php">Schauspieler Suche</a> | <a href="./filme.php">Film Suche</a>
</div>
<form action="filme.php" method="post">
<p>Suche Film nach Produktionsfirma: 
	<input type="text" name="produktionsfirma" /></p>
<input type="submit" name="FirmaSubmit" value="Suchen" />
</form>

<?php

if(isset($_POST['FirmaSubmit']))
{
	$_POST['produktionsfirma'] = str_replace('%', '', $_POST['produktionsfirma']);
	
	echo "<p> gesucht wird nach: <b>".$_POST['produktionsfirma']."</b></br>";
	if(empty($_POST['produktionsfirma']))
	{
		echo "<p>Diese Eingabe ist nicht erlaubt!</p>";
		die();
	}
	if($dbh = new PDO('mysql:host=localhost;dbname=filmverwaltung', 'root'))
	{
		$findStudio = $dbh->prepare("SELECT Bezeichnung, Produktionsfirma_ID FROM produktionsfirma WHERE Bezeichnung LIKE :studio");
                $findHelp = "%".trim($_POST['produktionsfirma'])."%";
		$findStudio->bindParam(':studio', $findHelp);
		//SELECT Bezeichnung, Produktionsfirma_ID FROM produktionsfirma WHERE Bezeichnung LIKE "%war%";
		if($findStudio->execute())
		{
			$result = $findStudio->fetchAll();
			if(empty($result))
			{
				echo "Produktionsfirma nicht gefunden.";
			}
			else
			{
				                               //0 bedeutet mehrre ergebnisse
				Echo "<p>Filmstudio <b>".$result[0]['Bezeichnung']."</b> gefunden.</p>";

				$getFilms = $dbh->prepare("SELECT filme.Titel, filme.Erscheinungsdatum, produktionsfirma.Bezeichnung FROM filme, produktionsfirma WHERE filme.Produktionsfirma_ID = ".$result[0]['Produktionsfirma_ID'] ." AND filme.Produktionsfirma_ID = produktionsfirma.Produktionsfirma_ID ORDER BY filme.Erscheinungsdatum ASC");
				//$getFilms->bindParam(':studioID', $result[0]['Produktionsfirma_ID']);
				if($getFilms->execute())
				{
					/*
					$result = $getFilms->fetch();
					print_r($result);
					*/
					echo "
					<table>
					<tr>
					<th>Titel</th><th>Erscheinungsdatum</th><th>Studio</th>
					</tr>";
					$studioFilmCount = 0;
					while($result = $getFilms->fetch())
					{
						$studioFilmCount++;
						echo "<tr><td>".$result['Titel']."</td><td>".$result['Erscheinungsdatum']."</td><td>".$result['Bezeichnung']."</td>
						</tr>";
					}
					if($studioFilmCount === 0)
					{
						echo "<tr><td></td><td>Dieses Filmstudio hat derzeit keine Filme</td><td></td>";
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
			echo "Query zum finden des Studios schlug fehl";
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