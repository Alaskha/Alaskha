Drop database if exists `db-projekt`;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DB-Projekt
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB-Projekt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB-Projekt` ;
USE `DB-Projekt` ;

-- -----------------------------------------------------
-- Table `DB-Projekt`.`Begriff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB-Projekt`.`Begriff` (
  `Begriff_ID` INT NOT NULL AUTO_INCREMENT,
  `Begriff_Name` VARCHAR(150) NULL,
  `Begriff_Group_ID` INT,
  PRIMARY KEY (`Begriff_ID`, `Begriff_Group_ID`),
  CONSTRAINT `fk_Begriff_Group`
    FOREIGN KEY (`Begriff_Group_ID`)
    REFERENCES `DB-Projekt`.`Group` (`Group_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB-Projekt`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB-Projekt`.`Group` (
  `Group_ID` INT NOT NULL AUTO_INCREMENT,
  `Group_Name` VARCHAR(150) NULL,
  PRIMARY KEY (`Group_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB-Projekt`.`Erklaerung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB-Projekt`.`Erklaerung` (
  `Erklaerung_ID` INT NOT NULL AUTO_INCREMENT,
  `Erklaerung` VARCHAR(500) NULL,
  `Erklaerung_Begriff_ID` INT NOT NULL,
  PRIMARY KEY (`Erklaerung_ID`, `Erklaerung_Begriff_ID`),
  CONSTRAINT `fk_Erklaerung_Begriff`
    FOREIGN KEY (`Erklaerung_Begriff_ID`)
    REFERENCES `DB-Projekt`.`Begriff` (`Begriff_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB-Projekt`.`Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB-Projekt`.`Log` (
  `Log_ID` INT NOT NULL AUTO_INCREMENT,
  `Log_Text` VARCHAR(500) NULL,
  `Log_DateTime` DATETIME NULL,
  PRIMARY KEY (`Log_ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
