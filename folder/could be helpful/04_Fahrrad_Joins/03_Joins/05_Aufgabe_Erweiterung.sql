select 
	f.Bezeichnung
	, sum((f.tagesmietpreis * datediff(v.bis, v.von))) as Mieteinnahmen
    , v.von, v.bis
from fahrrad as f
JOIN 
	vermietung AS v
USING (fahrradnr) 
Group by f.bezeichnung
Having Mieteinnahmen > 800
Order by f.Bezeichnung asc
;
