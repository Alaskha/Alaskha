select 
	f.Bezeichnung
	, f.Wert
    , (select avg(f.wert) from fahrrad as f) as Durchschnittspreis 
from fahrrad as f
where f.wert > (select avg(f.wert) from fahrrad as f)
Order by f.wert desc
;
