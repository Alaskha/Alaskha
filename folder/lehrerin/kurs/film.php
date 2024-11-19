<!DOCTYPE html>
<html>
<head>
<title>Title of the document</title>
</head>

<body>
<div>
<div>
<a href="./schauspieler.php">Schauspieler Suche</a> | <a href="./film.php">Film Suche</a>
</div>
<form action="film.php" method="post">
<p>Suche Film nach Produktionsfirma: <input type="text" name="produktionsfirma" /></p>
<input type="submit" name="FirmaSubmit" value="Suchen" />
</form>

<?php

if(isset($_POST['FirmaSubmit']))
{
	$_POST['produktionsfirma'] = str_replace('%', '', $_POST['produktionsfirma']);
	
	echo $_POST['produktionsfirma'];
	if(empty($_POST['produktionsfirma']))
	{
		echo "<p>Diese Eingabe ist nicht erlaubt!</p>";
		die();
	}
	if($dbh = new PDO('mysql:host=localhost;dbname=filmverwaltung', 'root'))
	{
		$findStudio = $dbh->prepare("SELECT Filmstudio, ID_Produktionsfirma FROM produktionsfirma WHERE Filmstudio LIKE :studio");
		$findStudio->bindParam(':studio', trim($_POST['produktionsfirma'].'%'));
		if($findStudio->execute())
		{
			$result = $findStudio->fetchAll();
			if(empty($result))
			{
				echo "Produktionsfirma nicht gefunden.";
			}
			else
			{
				Echo "<p>Filmstudio ".$result[0]['Filmstudio']." gefunden.</p>";
				
				$getFilms = $dbh->prepare("SELECT film.Filmtitel, film.Erscheinungsdatum, produktionsfirma.Filmstudio FROM film, produktionsfirma WHERE film.FK_Produktionsfirma = :studioID AND film.FK_Produktionsfirma = produktionsfirma.ID_Produktionsfirma ORDER BY film.Erscheinungsdatum ASC");
				$getFilms->bindParam(':studioID', $result[0]['ID_Produktionsfirma']);
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
						echo "<tr><td>".$result['Filmtitel']."</td><td>".$result['Erscheinungsdatum']."</td><td>".$result['Filmstudio']."</td>
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