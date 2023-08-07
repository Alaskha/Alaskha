drop database if exists neuer;
create database neuer;
use neuer;

create table ort(plz INT NOT NULL,
wohnort VARCHAR(32),
PRIMARY KEY (plz));

create table bearbeiter(bearbeiter_nr INT NOT NULL AUTO_INCREMENT,
nachname VARCHAR(32),
vorname VARCHAR(32),
kürzel VARCHAR(32),
PRIMARY KEY (bearbeiter_nr));

create table adresse(adresse_id INT NOT NULL AUTO_INCREMENT,
plz INT(5),
haus_nr INT,
straße VARCHAR(32),
PRIMARY KEY (adresse_id),
FOREIGN KEY (plz) REFERENCES ort (plz));

create table kunde(kunde_nr INT NOT NULL AUTO_INCREMENT,
nachname VARCHAR(32),
vorname VARCHAR(32),
adresse_id INT,
PRIMARY KEY (kunde_nr),
FOREIGN KEY (adresse_id) REFERENCES adresse (adresse_id));

create table artikel(art_nr INT NOT NULL AUTO_INCREMENT,
produkt VARCHAR(32),
bezeichnung VARCHAR(32),
lager INT,
preis INT,
bestand INT,
PRIMARY KEY (art_nr));

create table bestellung(bestellung_nr INT NOT NULL AUTO_INCREMENT,
art_nr INT,
gesamtpreis INT,
menge INT,
kunde_nr INT,
bearbeiter_nr INT,
PRIMARY KEY (bestellung_nr),
FOREIGN KEY (art_nr) REFERENCES artikel(art_nr),
FOREIGN KEY (bearbeiter_nr) REFERENCES bearbeiter(bearbeiter_nr));

create table rechnung(rechnung_nr INT NOT NULL AUTO_INCREMENT,
datum DATE,
summe INT,
MwSt INT,
bestellung_nr INT,
PRIMARY KEY (rechnung_nr),
FOREIGN KEY (bestellung_nr) REFERENCES bestellung (bestellung_nr));





