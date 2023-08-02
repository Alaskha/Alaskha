SET SQL_SAFE_UPDATES=0;

USE Patientenverwaltung;

-- DELETE FROM  `Arztpraxis`;
INSERT INTO `Arztpraxis` (`Adresse`) VALUES("Adresse1"),("Adresse2"),("Adresse2");

-- DELETE FROM  `Sozialversicherung`;
INSERT INTO `Sozialversicherung` (`name`) VALUES("SV"),("SV2"),("SV3");

-- DELETE FROM  `Befund`;
INSERT INTO `Befund` (`Befundcol`) VALUES("Befund"),("Befund2"),("Befund3");

-- DELETE FROM  `medikamente`;
INSERT INTO `medikamente` (`medikamentecol`) VALUES("med1"),("med2"),("med3");

DELETE FROM  `Medikamentenverordnung`;
INSERT INTO `Medikamentenverordnung` (`Befund_idtable1`, `medikamente_id`, `Dosis`) VALUES(10,9,200),(11,8,20),(11,7,40);
