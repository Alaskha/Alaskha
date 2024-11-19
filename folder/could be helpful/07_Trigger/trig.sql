CREATE TRIGGER tr2_mwst BEFORE INSERT ON table2
       FOR EACH ROW
       set NEW.nettopreis = NEW.nettopreis *1.2;
       
       
INSERT INTO `table2` (`name`, `nettopreis`) VALUES(250,250),(222,222);

Select `name`, nettopreis from `table2`;