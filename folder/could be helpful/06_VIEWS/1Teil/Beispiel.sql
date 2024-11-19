SET SQL_SAFE_UPDATES = 0;
CREATE VIEW test AS 
SELECT Vorname, Nachname, GebDatum as Geburtsdatum 
FROM personal;

SELECT * FROM name_der_view;

UPDATE test
SET BerufsBez = 'Chef'
WHERE BerufsBez like 'Meister';

CREATE VIEW myplz1 as
SELECT Vorname, Nachname, GebDatum as Geburtsdatum, adresse_plz, land
from personal p
where p.adresse_plz IN (Select plz from adresse a where land like 'GER'
ORDER by plz);
Select * from adresse;
ALTER VIEW VLand AS SELECT Vorname, Nachname, GebDatum as Geburtsdatum, adresse_plz, land
from personal p JOIN adresse a on  p.adresse_plz = a.plz;

Select * from VLand;
Insert into Vland(vorname, nachname, Gebu, adresse_plz, land) VALUES ('test', 'tester','28.01.2020',2323,'AUT') ;

UPDATE VLand
SET Nachname = 'Forster'
WHERE Nachname like 'Forster1';
select * from adresse;
UPDATE adresse
SET land = 'ger'
WHERE land like 'xx' AND plz = 5400;

ALTER VIEW VLand AS SELECT Vorname, Nachname, GebDatum as Geburtsdatum, adresse_plz
from personal;

Select MIN(Netto) as Gesamt, MAX(Netto) as Maximal from artikel;