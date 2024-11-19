use mydb;

Insert into historie (Nutzer_NutzerID, Suchebegriff, ergebnissanzahl) Values (
1, "Rowling",
(Select count(*) from bestand 
inner join Author on authorID = bestand.author_authorID
Where author.authorname sounds like "Rowling" 
	OR bestand.titel sounds like "Rowling")
/*dev.mysql.com/doc/refman/8.0/en/string-functions.html#operator_sounds-like*/);

Select count(*) from bestand 
inner join Author on authorID = bestand.author_authorID
Where author.authorname sounds like "Rowling" 
	OR bestand.titel sounds like "Rowling";
