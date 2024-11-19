DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `logger`(
	IN sqlText VARCHAR(255))
BEGIN
 insert into `db-projekt`.`log`(Log_Text, Log_Datetime) 
	values (sqlText, now());
END$$
DELIMITER ;
