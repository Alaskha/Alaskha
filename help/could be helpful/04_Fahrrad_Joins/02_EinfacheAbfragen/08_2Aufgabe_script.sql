select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Wert
from fahrrad.fahrrad
where (select MAX(fahrrad.Wert) from fahrrad.fahrrad) = fahrrad.Wert OR (select MIN(fahrrad.Wert) from fahrrad.fahrrad) = fahrrad.Wert;

/*
select 
SUM(fahrrad.Wert) AS Summe
, avg(fahrrad.Wert) AS Durchschnitt
, MAX(fahrrad.Wert) AS Maximum
, MIN(fahrrad.Wert) AS Minimum
from fahrrad.fahrrad
*/