INSERT INTO Kunde ( Name, Vorname, Strasse, Ortnr)
Values ('Janjic', 'Martina', 'Strassenname', 
(
select min(w.Ortnr)
From wohnort as w)
)
;

select 
 -- (k.kundennr),
k.kundennr
	,k.name
    , k.vorname
    , k.strasse
    , w.ort
    , w.plz
    , l.Countrycode
from kunde as k
JOIN 
	Wohnort AS w 
USING (Ortnr) 
JOIN 
	land AS l
Using (Landnr)
Where k.name = 'Janjic'
;