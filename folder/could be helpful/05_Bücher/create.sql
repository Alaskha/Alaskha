Drop database mydb;

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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Nutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nutzer` (
  `NutzerID` INT NOT NULL AUTO_INCREMENT,
  `Nutzername` VARCHAR(45) NULL,
  `NutzerVN` VARCHAR(45) NULL,
  PRIMARY KEY (`NutzerID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Angestellter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Angestellter` (
  `AngestellterID` INT NOT NULL AUTO_INCREMENT,
  `AngestellterName` VARCHAR(45) NULL,
  `AngestellterVN` VARCHAR(45) NULL,
  PRIMARY KEY (`AngestellterID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `AuthorID` INT NOT NULL AUTO_INCREMENT,
  `Authorname` VARCHAR(45) NULL,
  PRIMARY KEY (`AuthorID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Bestand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bestand` (
  `MedienID` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(45) NULL,
  `Author_AuthorID` INT NULL,
  `Anzahl` INT NULL,
  PRIMARY KEY (`MedienID`),
  INDEX `fk_Author_Medien_idx` (`Author_AuthorID` ASC) ,
  CONSTRAINT `fk_Author_Medien`
    FOREIGN KEY (`Author_AuthorID`)
    REFERENCES `mydb`.`Author` (`AuthorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`AusgelieheneMedien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AusgelieheneMedien` (
  `AusgelieheneMedienID` INT NOT NULL AUTO_INCREMENT,
  `Nutzer_NutzerID` INT NOT NULL,
  `Bestand_MedienID` INT NOT NULL,
  `Ausleihdatum` datetime, 
  `Rueckgabefristende` datetime, 
  PRIMARY KEY (`AusgelieheneMedienID`, `Nutzer_NutzerID`, `Bestand_MedienID`),
  INDEX `fk_AusgelieheneMedien_Nutzer1_idx` (`Nutzer_NutzerID` ASC) ,
  INDEX `fk_AusgelieheneMedien_Bestand1_idx` (`Bestand_MedienID` ASC) ,
  CONSTRAINT `fk_AusgelieheneMedien_Nutzer1`
    FOREIGN KEY (`Nutzer_NutzerID`)
    REFERENCES `mydb`.`Nutzer` (`NutzerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AusgelieheneMedien_Bestand1`
    FOREIGN KEY (`Bestand_MedienID`)
    REFERENCES `mydb`.`Bestand` (`MedienID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vorbestellung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vorbestellung` (
  `VorbestellungID` INT NOT NULL AUTO_INCREMENT,
  `Nutzer_NutzerID` INT NOT NULL,
  `Bestand_MedienID` INT NOT NULL,
  PRIMARY KEY (`VorbestellungID`, `Nutzer_NutzerID`, `Bestand_MedienID`),
  INDEX `fk_Vorbestellung_Nutzer_idx` (`Nutzer_NutzerID` ASC) ,
  INDEX `fk_Vorbestellung_Bestand1_idx` (`Bestand_MedienID` ASC) ,
  CONSTRAINT `fk_Vorbestellung_Nutzer`
    FOREIGN KEY (`Nutzer_NutzerID`)
    REFERENCES `mydb`.`Nutzer` (`NutzerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vorbestellung_Bestand1`
    FOREIGN KEY (`Bestand_MedienID`)
    REFERENCES `mydb`.`Bestand` (`MedienID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Historie` (
  `HistorieID` INT NOT NULL AUTO_INCREMENT,
  `Nutzer_NutzerID` INT NOT NULL,
  `Suchebegriff` VARCHAR(45) NULL,
  `ergebnissanzahl` VARCHAR(45) NULL,
  PRIMARY KEY (`HistorieID`),
  INDEX `fk_Historie_Nutzer_idx` (`Nutzer_NutzerID` ASC) ,
  CONSTRAINT `fk_Historie_Nutzer`
    FOREIGN KEY (`Nutzer_NutzerID`)
    REFERENCES `mydb`.`Nutzer` (`NutzerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
