Select 
	l.Countrycode
    , COUNT(*) AS AnzahlMietvertraege
FROM 
	Kunde AS k
JOIN 
	Wohnort AS w 
USING (Ortnr) 
JOIN 
	land AS l
ON l.Landnr = w.Landnr
JOIN 
	Vermietung AS v 
USING (Kundennr) 
GROUP BY l.Countrycode
ORDER BY AnzahlMietvertraege DESC;