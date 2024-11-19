select 
fahrrad.Fahrradnr
, fahrrad.Bezeichnung
, fahrrad.Kaufdatum
from fahrrad.fahrrad
where (YEAR(fahrrad.Kaufdatum) = 2007);
