/* Aufgabe 1*/
select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Tagesmietpreis
, (fahrrad.Tagesmietpreis * 6) AS Wochenpreis
from fahrrad.fahrrad
order by Wochenpreis ASC;

