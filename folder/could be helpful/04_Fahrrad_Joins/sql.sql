-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema phpmyadmin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema phpmyadmin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ort`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ort` (
  `idOrt` INT NOT NULL,
  `PLZ` VARCHAR(45) NOT NULL,
  `Ort` VARCHAR(45) NOT NULL,
  `Laendercode ISO3166 Alpha-3` VARCHAR(45) NULL DEFAULT NULL,
  UNIQUE INDEX `idOrt_UNIQUE` (`idOrt` ASC) VISIBLE,
  PRIMARY KEY (`idOrt`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Adresse` (
  `idAdresse` INT NOT NULL,
  `Straßenname` VARCHAR(45) NOT NULL,
  `Hausnummer` VARCHAR(45) NOT NULL,
  `Ort_idOrt` INT NOT NULL,
  PRIMARY KEY (`idAdresse`, `Ort_idOrt`),
  UNIQUE INDEX `idAdresse_UNIQUE` (`idAdresse` ASC) VISIBLE,
  INDEX `fk_Adresse_Ort1_idx` (`Ort_idOrt` ASC) VISIBLE,
  CONSTRAINT `fk_Adresse_Ort1`
    FOREIGN KEY (`Ort_idOrt`)
    REFERENCES `mydb`.`Ort` (`idOrt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Person` (
  `idPerson` INT NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Nachname` VARCHAR(45) NOT NULL,
  `Adresse_idAdresse` INT NOT NULL,
  PRIMARY KEY (`idPerson`),
  UNIQUE INDEX `idPerson_UNIQUE` (`idPerson` ASC) VISIBLE,
  INDEX `fk_Person_Adresse1_idx` (`Adresse_idAdresse` ASC) VISIBLE,
  CONSTRAINT `fk_Person_Adresse1`
    FOREIGN KEY (`Adresse_idAdresse`)
    REFERENCES `mydb`.`Adresse` (`idAdresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fahrradherstelle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fahrradherstelle` (
  `idHersteller` INT NOT NULL,
  `Vorname` VARCHAR(45) NULL DEFAULT NULL,
  `Nachname` VARCHAR(45) NULL DEFAULT NULL,
  `E-Mail Adresse` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idHersteller`),
  UNIQUE INDEX `idHersteller_UNIQUE` (`idHersteller` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fahrrad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fahrrad` (
  `idFahrrad` INT NOT NULL,
  `Rahmennummer` VARCHAR(45) NOT NULL,
  `Fahrradname` VARCHAR(45) NOT NULL,
  `Marke` VARCHAR(45) NOT NULL,
  `Jahr der Anschaffung` INT NULL DEFAULT NULL,
  `Anschaffungskosten` FLOAT NULL DEFAULT NULL,
  `Mietpreis pro Tag` FLOAT NOT NULL,
  `Fahrradherstelle_idHersteller` INT NOT NULL,
  PRIMARY KEY (`idFahrrad`),
  UNIQUE INDEX `idFahrrad_UNIQUE` (`idFahrrad` ASC) VISIBLE,
  UNIQUE INDEX `Rahmennummer_UNIQUE` (`Rahmennummer` ASC) VISIBLE,
  INDEX `fk_Fahrrad_Fahrradherstelle1_idx` (`Fahrradherstelle_idHersteller` ASC) VISIBLE,
  CONSTRAINT `fk_Fahrrad_Fahrradherstelle1`
    FOREIGN KEY (`Fahrradherstelle_idHersteller`)
    REFERENCES `mydb`.`Fahrradherstelle` (`idHersteller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mietvorgang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mietvorgang` (
  `idMietvorgang` INT NOT NULL,
  `Mietdatum` DATETIME(4) NOT NULL,
  `Mietbeginn` TIMESTAMP(4) NOT NULL,
  `Mietende` TIMESTAMP(4) NOT NULL,
  `Person_idPerson` INT NOT NULL,
  `Fahrrad_idFahrrad` INT NOT NULL,
  PRIMARY KEY (`idMietvorgang`, `Person_idPerson`, `Fahrrad_idFahrrad`),
  UNIQUE INDEX `idMietvorgang_UNIQUE` (`idMietvorgang` ASC) VISIBLE,
  INDEX `fk_Mietvorgang_Person1_idx` (`Person_idPerson` ASC) VISIBLE,
  INDEX `fk_Mietvorgang_Fahrrad1_idx` (`Fahrrad_idFahrrad` ASC) VISIBLE,
  CONSTRAINT `fk_Mietvorgang_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `mydb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mietvorgang_Fahrrad1`
    FOREIGN KEY (`Fahrrad_idFahrrad`)
    REFERENCES `mydb`.`Fahrrad` (`idFahrrad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `phpmyadmin` ;

-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__bookmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__bookmark` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dbase` VARCHAR(255) NOT NULL DEFAULT '',
  `user` VARCHAR(255) NOT NULL DEFAULT '',
  `label` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `query` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Bookmarks';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__central_columns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__central_columns` (
  `db_name` VARCHAR(64) NOT NULL,
  `col_name` VARCHAR(64) NOT NULL,
  `col_type` VARCHAR(64) NOT NULL,
  `col_length` TEXT NULL DEFAULT NULL,
  `col_collation` VARCHAR(64) NOT NULL,
  `col_isNull` TINYINT(1) NOT NULL,
  `col_extra` VARCHAR(255) NULL DEFAULT '',
  `col_default` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`db_name`, `col_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Central list of columns';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__column_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__column_info` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `db_name` VARCHAR(64) NOT NULL DEFAULT '',
  `table_name` VARCHAR(64) NOT NULL DEFAULT '',
  `column_name` VARCHAR(64) NOT NULL DEFAULT '',
  `comment` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `mimetype` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `transformation` VARCHAR(255) NOT NULL DEFAULT '',
  `transformation_options` VARCHAR(255) NOT NULL DEFAULT '',
  `input_transformation` VARCHAR(255) NOT NULL DEFAULT '',
  `input_transformation_options` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `db_name` (`db_name` ASC, `table_name` ASC, `column_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Column information for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__designer_settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__designer_settings` (
  `username` VARCHAR(64) NOT NULL,
  `settings_data` TEXT NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Settings related to Designer';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__export_templates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__export_templates` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NOT NULL,
  `export_type` VARCHAR(10) NOT NULL,
  `template_name` VARCHAR(64) NOT NULL,
  `template_data` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `u_user_type_template` (`username` ASC, `export_type` ASC, `template_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Saved export templates';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__favorite` (
  `username` VARCHAR(64) NOT NULL,
  `tables` TEXT NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Favorite tables';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__history` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NOT NULL DEFAULT '',
  `db` VARCHAR(64) NOT NULL DEFAULT '',
  `table` VARCHAR(64) NOT NULL DEFAULT '',
  `timevalue` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `username` (`username` ASC, `db` ASC, `table` ASC, `timevalue` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'SQL history for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__navigationhiding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__navigationhiding` (
  `username` VARCHAR(64) NOT NULL,
  `item_name` VARCHAR(64) NOT NULL,
  `item_type` VARCHAR(64) NOT NULL,
  `db_name` VARCHAR(64) NOT NULL,
  `table_name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`username`, `item_name`, `item_type`, `db_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Hidden items of navigation tree';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__pdf_pages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__pdf_pages` (
  `db_name` VARCHAR(64) NOT NULL DEFAULT '',
  `page_nr` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_descr` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  INDEX `db_name` (`db_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'PDF relation pages for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__recent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__recent` (
  `username` VARCHAR(64) NOT NULL,
  `tables` TEXT NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Recently accessed tables';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__relation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__relation` (
  `master_db` VARCHAR(64) NOT NULL DEFAULT '',
  `master_table` VARCHAR(64) NOT NULL DEFAULT '',
  `master_field` VARCHAR(64) NOT NULL DEFAULT '',
  `foreign_db` VARCHAR(64) NOT NULL DEFAULT '',
  `foreign_table` VARCHAR(64) NOT NULL DEFAULT '',
  `foreign_field` VARCHAR(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`, `master_table`, `master_field`),
  INDEX `foreign_field` (`foreign_db` ASC, `foreign_table` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Relation table';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__savedsearches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__savedsearches` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NOT NULL DEFAULT '',
  `db_name` VARCHAR(64) NOT NULL DEFAULT '',
  `search_name` VARCHAR(64) NOT NULL DEFAULT '',
  `search_data` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `u_savedsearches_username_dbname` (`username` ASC, `db_name` ASC, `search_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Saved searches';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__table_coords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__table_coords` (
  `db_name` VARCHAR(64) NOT NULL DEFAULT '',
  `table_name` VARCHAR(64) NOT NULL DEFAULT '',
  `pdf_page_number` INT NOT NULL DEFAULT '0',
  `x` FLOAT UNSIGNED NOT NULL DEFAULT '0',
  `y` FLOAT UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`, `table_name`, `pdf_page_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Table coordinates for phpMyAdmin PDF output';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__table_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__table_info` (
  `db_name` VARCHAR(64) NOT NULL DEFAULT '',
  `table_name` VARCHAR(64) NOT NULL DEFAULT '',
  `display_field` VARCHAR(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Table information for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__table_uiprefs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__table_uiprefs` (
  `username` VARCHAR(64) NOT NULL,
  `db_name` VARCHAR(64) NOT NULL,
  `table_name` VARCHAR(64) NOT NULL,
  `prefs` TEXT NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`, `db_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Tables\' UI preferences';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__tracking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__tracking` (
  `db_name` VARCHAR(64) NOT NULL,
  `table_name` VARCHAR(64) NOT NULL,
  `version` INT UNSIGNED NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NOT NULL,
  `schema_snapshot` TEXT NOT NULL,
  `schema_sql` TEXT NULL DEFAULT NULL,
  `data_sql` LONGTEXT NULL DEFAULT NULL,
  `tracking` SET('UPDATE', 'REPLACE', 'INSERT', 'DELETE', 'TRUNCATE', 'CREATE DATABASE', 'ALTER DATABASE', 'DROP DATABASE', 'CREATE TABLE', 'ALTER TABLE', 'RENAME TABLE', 'DROP TABLE', 'CREATE INDEX', 'DROP INDEX', 'CREATE VIEW', 'ALTER VIEW', 'DROP VIEW') NULL DEFAULT NULL,
  `tracking_active` INT UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`, `table_name`, `version`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Database changes tracking for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__userconfig`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__userconfig` (
  `username` VARCHAR(64) NOT NULL,
  `timevalue` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` TEXT NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User preferences storage for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__usergroups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__usergroups` (
  `usergroup` VARCHAR(64) NOT NULL,
  `tab` VARCHAR(64) NOT NULL,
  `allowed` ENUM('Y', 'N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`usergroup`, `tab`, `allowed`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User groups with configured menu items';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__users` (
  `username` VARCHAR(64) NOT NULL,
  `usergroup` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`username`, `usergroup`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Users and their assignments to user groups';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
