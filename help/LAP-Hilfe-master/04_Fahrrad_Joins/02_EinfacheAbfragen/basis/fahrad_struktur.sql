-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fahrrad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fahrrad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fahrrad` DEFAULT CHARACTER SET utf8 ;
USE `fahrrad` ;

-- -----------------------------------------------------
-- Table `fahrrad`.`hersteller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrrad`.`hersteller` ;

CREATE TABLE IF NOT EXISTS `fahrrad`.`hersteller` (
  `Herstellernr` INT(11) NOT NULL,
  `Herstellername` VARCHAR(30) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Herstellernr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fahrrad`.`fahrrad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrrad`.`fahrrad` ;

CREATE TABLE IF NOT EXISTS `fahrrad`.`fahrrad` (
  `Fahrradnr` INT(11) NOT NULL,
  `Bezeichnung` VARCHAR(50) NULL DEFAULT NULL,
  `Rahmennummer` VARCHAR(10) NULL DEFAULT NULL,
  `Tagesmietpreis` DOUBLE(4,2) NULL DEFAULT NULL,
  `Wert` DOUBLE(6,2) NULL DEFAULT NULL,
  `Kaufdatum` DATE NULL DEFAULT NULL,
  `Herstellernr` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Fahrradnr`),
  INDEX `HerstellerFahrrad` (`Herstellernr` ASC),
  CONSTRAINT `HerstellerFahrrad`
    FOREIGN KEY (`Herstellernr`)
    REFERENCES `fahrrad`.`hersteller` (`Herstellernr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fahrrad`.`land`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrrad`.`land` ;

CREATE TABLE IF NOT EXISTS `fahrrad`.`land` (
  `Landnr` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `Countrycode` VARCHAR(3) NULL DEFAULT NULL,
  `Bezeichnung` VARCHAR(45) NULL,
  PRIMARY KEY (`Landnr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fahrrad`.`wohnort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrrad`.`wohnort` ;

CREATE TABLE IF NOT EXISTS `fahrrad`.`wohnort` (
  `Ortnr` INT(10) NOT NULL,
  `PLZ` VARCHAR(5) NULL DEFAULT NULL,
  `Ort` VARCHAR(50) NULL DEFAULT NULL,
  `Landnr` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`Ortnr`),
  INDEX `fk_Wohnort_Land1_idx` (`Landnr` ASC),
  CONSTRAINT `fk_Wohnort_Land1`
    FOREIGN KEY (`Landnr`)
    REFERENCES `fahrrad`.`land` (`Landnr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fahrrad`.`kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrrad`.`kunde` ;

CREATE TABLE IF NOT EXISTS `fahrrad`.`kunde` (
  `Kundennr` INT(11) NOT NULL,
  `Name` VARCHAR(30) NULL DEFAULT NULL,
  `Vorname` VARCHAR(20) NULL DEFAULT NULL,
  `Strasse` VARCHAR(30) NULL DEFAULT NULL,
  `Ortnr` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Kundennr`),
  INDEX `WohnortKunde` (`Ortnr` ASC),
  CONSTRAINT `WohnortKunde`
    FOREIGN KEY (`Ortnr`)
    REFERENCES `fahrrad`.`wohnort` (`Ortnr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fahrrad`.`vermietung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fahrrad`.`vermietung` ;

CREATE TABLE IF NOT EXISTS `fahrrad`.`vermietung` (
  `Mietnr` INT(11) NOT NULL,
  `Mietdatum` DATE NULL DEFAULT NULL,
  `von` DATE NULL DEFAULT NULL,
  `bis` DATE NULL DEFAULT NULL,
  `Fahrradnr` INT(11) NULL DEFAULT NULL,
  `Kundennr` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Mietnr`),
  INDEX `FahrraederVermietung` (`Fahrradnr` ASC),
  INDEX `KundeVermietung` (`Kundennr` ASC),
  CONSTRAINT `FahrraederVermietung`
    FOREIGN KEY (`Fahrradnr`)
    REFERENCES `fahrrad`.`fahrrad` (`Fahrradnr`),
  CONSTRAINT `KundeVermietung`
    FOREIGN KEY (`Kundennr`)
    REFERENCES `fahrrad`.`kunde` (`Kundennr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
