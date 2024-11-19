Select 
	l.Countrycode
    , COUNT(*) AS AnzahlKunden
FROM 
	Kunde AS k
JOIN 
	Wohnort AS w 
USING (Ortnr) 
JOIN 
	land AS l
ON l.Landnr = w.Landnr
GROUP BY l.Countrycode
ORDER BY AnzahlKunden DESC;