
Use `Filmverwaltung`;

Select 
	Filmtitel
	, Erscheinungsdatum
	, f.Name 
FROM 
	Film 
JOIN 
	Filmstudio AS f 
 ON Filmstudio_ID = f.ID
WHERE 
	f.Name like '%Touch%';