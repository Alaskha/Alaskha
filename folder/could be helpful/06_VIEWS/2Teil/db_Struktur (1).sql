drop database if exists bike;
create database bike;
use bike;

create table ort(plz INT NOT NULL,
wohnort VARCHAR(32),
PRIMARY KEY (plz));

create table personal(personal_nr INT NOT NULL AUTO_INCREMENT,
nachname VARCHAR(32),
vorname VARCHAR(32),
beurteilung VARCHAR(32),
gehalt INT,
adresse_id INT,
Vorgesetzter_nr INT,
PRIMARY KEY (personal_nr),
FOREIGN KEY (adresse_id) REFERENCES adresse(adresse_id),
FOREIGN KEY (Vorgesetzter_nr) REFERENCES Vorgesetzter(Vorgesetzter_nr));

create table adresse(adresse_id INT NOT NULL AUTO_INCREMENT,
plz INT(5),
haus_nr INT,
straße VARCHAR(32),
PRIMARY KEY (adresse_id),
FOREIGN KEY (plz) REFERENCES ort (plz));

create table Vorgesetzter(Vorgesetzter_nr INT NOT NULL AUTO_INCREMENT,
nachname VARCHAR(32),
vorname VARCHAR(32),
adresse_id INT,
PRIMARY KEY (Vorgesetzter_nr),
FOREIGN KEY (adresse_id) REFERENCES adresse (adresse_id));

create table artikel(artikel_nr INT NOT NULL AUTO_INCREMENT,
produkt VARCHAR(32),
bezeichnung VARCHAR(32),
lager INT,
preis INT,
bestand INT,
PRIMARY KEY (artikel_nr));

create table bestellung(bestellung_nr INT NOT NULL AUTO_INCREMENT,
artikel_nr INT,
gesamtpreis INT,
menge INT,
Vorgesetzter_nr INT,
personal_nr INT,
PRIMARY KEY (bestellung_nr),
FOREIGN KEY (artikel_nr) REFERENCES artikel(artikel_nr),
FOREIGN KEY (personal_nr) REFERENCES personal(personal_nr));

create table rechnung(rechnung_nr INT NOT NULL AUTO_INCREMENT,
datum DATE,
summe INT,
MwSt INT,
bestellung_nr INT,
PRIMARY KEY (rechnung_nr),
FOREIGN KEY (bestellung_nr) REFERENCES bestellung (bestellung_nr));





