
use myDB;

update AusgelieheneMedien 
	set Rueckgabefristende = curdate() + interval 14 Day
where Nutzer_NutzerID = "2";