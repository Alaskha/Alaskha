Select 
	k.Vorname
	, k.Name
    , k.Strasse
--    , k.Ortnr
--    , w.Ortnr
    , w.PLZ
    , w.Ort
--    , w.Landnr
--    , l.Landnr
    , l.Countrycode
--    , l.Bezeichnung
FROM 
	Kunde AS k
JOIN 
	Wohnort AS w 
USING (Ortnr) 

JOIN 
	land AS l
ON l.Landnr = w.Landnr
WHERE 
	l.Countrycode like 'AUT';