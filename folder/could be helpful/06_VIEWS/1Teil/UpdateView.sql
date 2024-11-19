/* mariadb.com/kb/en/inserting-and-updating-with-views/
ALGORITHM=TEMPTABLE (use of a temporary table always makes a view nonupdatable)
HAVING
GROUP BY
DISTINCT
UNION
UNION ALL
An aggregate function, such as MAX(), MIN(), SUM() or COUNT()
subquery in the SELECT list (
	Nondependent subqueries in the select list fail for INSERT, but are okay for UPDATE, DELETE. For dependent subqueries in the select list, no data change statements are permitted.)
subquery in the WHERE clause referring to a table in the FROM clause
if it has no underlying table because it refers only to literal values
the FROM clause contains a non-updatdable view.
multiple references to any base table column
an outer join
an inner join where more than one table in the view definition is being updated
if there's a LIMIT clause, the view does not contain all primary or not null unique key columns from the underlying table and the updatable_views_with_limit system variable is set to 0.
*/
use neuer;

SET SQL_SAFE_UPDATES = 0;

UPDATE VSum 
SET datum='2021-12-12'
WHERE kundennachname Like "M%";

UPDATE VSum 
SET kundennachname='Gerler'
WHERE kundennachname='Gerl';

UPDATE VSum 
SET bearbeiternachname='Gerler'
WHERE auftragnummer=4;

SELECT * FROM VSum;