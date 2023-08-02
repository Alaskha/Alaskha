Select 
	Vorname
	, Name
	, Ort 
FROM 
	Kunde AS k 
JOIN 
	Wohnort AS w 
USING (Ortnr) 
-- ON k.Ortnr = w.Ortnr
WHERE 
	Ort like 'London';