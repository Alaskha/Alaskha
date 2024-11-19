
Use `Filmverwaltung`;

Select 
	Film.Filmtitel
	, Film.Erscheinungsdatum
	, f.Name 
FROM 
	film_has_schauspieler As fs
JOIN 	
	Filmstudio AS f 
JOIN 	
	Film 
 JOIN 	
	Schauspieler AS s 
 ON (Filmstudio_ID = f.ID and s.id = fs.Schauspieler_ID and Film.Id = fs.Film_Id)
WHERE 
	(CONCAT(s.Vorname,' ', s.Nachname) like '%erbhard Zaunemann%') or s.Vorname like '%erbhard Zaunemann%' or s.Nachname like '%erbhard Zaunemann%';