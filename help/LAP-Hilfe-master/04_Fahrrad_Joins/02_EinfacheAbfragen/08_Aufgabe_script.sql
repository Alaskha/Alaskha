select 
SUM(fahrrad.Wert) AS Summe
, avg(fahrrad.Wert) AS Durchschnitt
, MAX(fahrrad.Wert) AS Maximum
, MIN(fahrrad.Wert) AS Minimum
from fahrrad.fahrrad
