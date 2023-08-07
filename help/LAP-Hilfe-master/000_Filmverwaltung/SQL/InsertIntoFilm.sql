Use `Filmverwaltung`;


INSERT INTO `Schauspieler` (`Vorname`, `Nachname`, `Herkunftsland`) VALUES("1","1","1"),("2","2","2"),("3","3","3");

-- DELETE FROM  `Filmstudio`;
INSERT INTO `Filmstudio` (`Name`) VALUES("Bavaria Filmstudio"),("Great American Films"),("Touchstones Picture"), ("Warner Brothers Pictures");

-- DELETE FROM  `Film`;
INSERT INTO `Film` (`ID`, `Filmtitel`, `Erscheinungsdatum`, `Filmstudio_ID`) VALUES
(3000, "Dirty Dancing", "1987-08-21", 2);

INSERT INTO `Film` (`Filmtitel`, `Erscheinungsdatum`, `Filmstudio_ID`) VALUES
("Sister Act", "1992-05-29", 3),
("Harry Potter u. der Stein der Weisen ", "2001-11-23", 4),
("Casanova", "2006-02-09", 3),
("Die unendliche Geschichte ", "1984-05-20", 1),
("Die Welle", "1992-05-29", 1),
("Krieg in Chinatown", "1992-05-29", 2),
("I Am Legend", "1992-05-29", 4),
("Transcendence", "1992-05-29", 4)
;

INSERT INTO `Film_has_Schauspieler` (Schauspieler_id , Film_ID)values
(1,3000),(2,3000),(3,3002),(1,3003);