/* Aufgabe 1*/
select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Wert
, fahrrad.Kaufdatum
from fahrrad.fahrrad
where fahrrad.Bezeichnung LIKE "Scott%";

