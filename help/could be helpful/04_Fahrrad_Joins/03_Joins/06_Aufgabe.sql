select 
	f.Bezeichnung
	, count(v.mietdatum) as WieOftGemietet
    , v.von, v.bis
from fahrrad as f
JOIN 
	vermietung AS v
USING (fahrradnr) 
Group by f.bezeichnung
Having WieOftGemietet = 1
;
