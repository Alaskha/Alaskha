-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Patientenverwaltung
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Patientenverwaltung
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Patientenverwaltung` DEFAULT CHARACTER SET utf8 ;
USE `Patientenverwaltung` ;

-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`Arztpraxis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`Arztpraxis` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`Arztpraxis` (
  `idArztpraxis` INT NOT NULL,
  `Adresse` VARCHAR(45) NULL,
  PRIMARY KEY (`idArztpraxis`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`Sozialversicherung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`Sozialversicherung` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`Sozialversicherung` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`terminverlauf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`terminverlauf` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`terminverlauf` (
  `id` INT NOT NULL,
  `terminverlaufcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`Patient` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`Patient` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL,
  `Sozialversicherung_id` INT NOT NULL,
  `Arztpraxis_idArztpraxis` INT NOT NULL,
  `terminverlauf_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Sozialversicherung_id`, `Arztpraxis_idArztpraxis`, `terminverlauf_id`),
  INDEX `fk_Patient_Sozialversicherung1_idx` (`Sozialversicherung_id` ASC),
  INDEX `fk_Patient_Arztpraxis1_idx` (`Arztpraxis_idArztpraxis` ASC),
  INDEX `fk_Patient_terminverlauf1_idx` (`terminverlauf_id` ASC),
  UNIQUE INDEX `terminverlauf_id_UNIQUE` (`terminverlauf_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_Patient_Sozialversicherung1`
    FOREIGN KEY (`Sozialversicherung_id`)
    REFERENCES `Patientenverwaltung`.`Sozialversicherung` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Arztpraxis1`
    FOREIGN KEY (`Arztpraxis_idArztpraxis`)
    REFERENCES `Patientenverwaltung`.`Arztpraxis` (`idArztpraxis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_terminverlauf1`
    FOREIGN KEY (`terminverlauf_id`)
    REFERENCES `Patientenverwaltung`.`terminverlauf` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`Befund`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`Befund` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`Befund` (
  `idtable1` INT NOT NULL,
  `Befundcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`medikamente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`medikamente` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`medikamente` (
  `id` INT NOT NULL,
  `medikamentecol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`Medikamentenverordnung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`Medikamentenverordnung` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`Medikamentenverordnung` (
  `Befund_idtable1` INT NOT NULL,
  `medikamente_id` INT NOT NULL,
  `Dosis` INT NULL,
  PRIMARY KEY (`Befund_idtable1`, `medikamente_id`),
  INDEX `fk_Befund_has_medikamente_medikamente1_idx` (`medikamente_id` ASC),
  INDEX `fk_Befund_has_medikamente_Befund_idx` (`Befund_idtable1` ASC),
  CONSTRAINT `fk_Befund_has_medikamente_Befund`
    FOREIGN KEY (`Befund_idtable1`)
    REFERENCES `Patientenverwaltung`.`Befund` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Befund_has_medikamente_medikamente1`
    FOREIGN KEY (`medikamente_id`)
    REFERENCES `Patientenverwaltung`.`medikamente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patientenverwaltung`.`Termin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patientenverwaltung`.`Termin` ;

CREATE TABLE IF NOT EXISTS `Patientenverwaltung`.`Termin` (
  `idTermin` INT NOT NULL,
  `Termin` DATETIME NULL,
  `Befund_idtable1` INT NOT NULL,
  `terminverlauf_id` INT NOT NULL,
  PRIMARY KEY (`idTermin`, `Befund_idtable1`, `terminverlauf_id`),
  INDEX `fk_Termin_Befund1_idx` (`Befund_idtable1` ASC),
  INDEX `fk_Termin_terminverlauf1_idx` (`terminverlauf_id` ASC),
  CONSTRAINT `fk_Termin_Befund1`
    FOREIGN KEY (`Befund_idtable1`)
    REFERENCES `Patientenverwaltung`.`Befund` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Termin_terminverlauf1`
    FOREIGN KEY (`terminverlauf_id`)
    REFERENCES `Patientenverwaltung`.`terminverlauf` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
