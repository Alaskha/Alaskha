/*
A view cannot be used for inserting if it fails any of the criteria for updating, and must also meet the following conditions:

the view contains all base table columns that don't have default values
there are no duplicate view column names
the view columns are all simple columns, and not derived in any way. The following are examples of derived columns
column_name + 25
LOWER(column_name)
(subquery)
9.5
column1 / column2
*/

Insert into VSum 
(Auftragnummer, Datum, Kundennachname, Kundenvorname,
bearbeiternachname, bearbeitervorname, Auftragssumme)
values
(123,CURDATE(), "Faber", "Christine", "Johann", "Krauser", 123398.92);