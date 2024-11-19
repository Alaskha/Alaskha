select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Kaufdatum
from fahrrad.fahrrad
where (YEAR(now()) - YEAR(fahrrad.Kaufdatum)) = 2;