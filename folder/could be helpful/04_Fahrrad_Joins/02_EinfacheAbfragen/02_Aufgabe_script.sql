/* Aufgabe 1*/
select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Wert
, fahrrad.Tagesmietpreis
from fahrrad.fahrrad
where fahrrad.Tagesmietpreis < 15;

