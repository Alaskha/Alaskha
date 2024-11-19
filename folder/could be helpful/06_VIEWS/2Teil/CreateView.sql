use neuer;

Drop view if exists VSum;

Create View VSum As
Select
rechnung.bestellung_nr As Auftragnummer,
rechnung.datum As Datum,
kunde.nachname As Kundennachname, 
kunde.vorname As Kundenvorname,
bearbeiter.nachname As bearbeiternachname,
bearbeiter.vorname as bearbeitervorname,
bestellung.gesamtpreis As Auftragssumme
from bestellung
INNER JOIN Kunde ON kunde.kunde_nr=bestellung.kunde_nr
INNER JOIN Rechnung ON rechnung.bestellung_nr=bestellung.bestellung_nr
INNER JOIN Bearbeiter ON bearbeiter.bearbeiter_nr=bestellung.bearbeiter_nr
;

SELECT * FROM VSum;
