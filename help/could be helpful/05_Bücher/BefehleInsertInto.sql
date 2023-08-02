use mydb;

insert into nutzer (Nutzername, NutzerVN) values ("nutzername","nutzername");
insert into Bestand (Titel, Anzahl) values ("mediumname",2);

insert into ausgelieheneMedien (Nutzer_NutzerID, Bestand_MedienID, `Ausleihdatum`, `Rueckgabefristende`) 
				values (2,1, CURDATE(), (curdate() + interval 14 DAY));

insert into vorbestellung (Nutzer_NutzerID, Bestand_MedienID) 
		values (2,1);
                



