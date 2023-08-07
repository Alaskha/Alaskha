select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Kaufdatum
from fahrrad.fahrrad
where fahrrad.Bezeichnung LIKE "Scott%" AND YEAR(fahrrad.Kaufdatum) < 2009
order by fahrrad.Kaufdatum DESC;