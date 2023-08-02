drop trigger if exists `db-projekt`.tr_begriff;
drop trigger if exists `db-projekt`.tr_Erklaerung;

CREATE TRIGGER tr_begriff before INSERT ON `db-projekt`.begriff
       FOR EACH ROW
       call `db-projekt`.logger('begriff  : insert into -> ' + new.begriff_name);
       
CREATE TRIGGER tr_Erklaerung before INSERT ON `db-projekt`.erklaerung
       FOR EACH ROW
       call `db-projekt`.logger('erklaerung : insert into -> ' + new.erklaerung);
       
       