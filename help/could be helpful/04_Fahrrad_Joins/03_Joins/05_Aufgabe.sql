select 
	f.Bezeichnung
	, sum((f.tagesmietpreis * datediff(v.bis, v.von))) as Mieteinnahmen
	, f.tagesmietpreis
    , v.von, v.bis
from fahrrad as f
JOIN 
	vermietung AS v
USING (fahrradnr) 
Group by f.bezeichnung
Order by f.Bezeichnung asc
;
