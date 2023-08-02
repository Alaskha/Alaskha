/* Aufgabe 1*/
select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Rahmennummer
, fahrrad.Kaufdatum
from fahrrad.fahrrad
where fahrrad.Kaufdatum < '2009-01-01'
order by fahrrad.Kaufdatum DESC;

