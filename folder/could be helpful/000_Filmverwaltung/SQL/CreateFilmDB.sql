Drop database if exists `Filmverwaltung`;
Create database `Filmverwaltung`;

Use `Filmverwaltung`;

-- -----------------------------------------------------
-- Table `Filmverwaltung`.`Filmstudio`
-- ----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Filmstudio` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Filmverwaltung`.`Schauspieler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schauspieler` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Vorname` VARCHAR(45) NULL,
  `Nachname` VARCHAR(45) NULL,
  `Herkunftsland` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Filmverwaltung`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Film` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Filmtitel` VARCHAR(45) NULL DEFAULT NULL,
  `Erscheinungsdatum` DATE NULL DEFAULT NULL,
  `Filmstudio_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`, `Filmstudio_ID`),
  INDEX `fk_Film_Filmstudio_idx` (`Filmstudio_ID` ASC),
  CONSTRAINT `fk_Film_Filmstudio`
    FOREIGN KEY (`Filmstudio_ID`)
    REFERENCES `Filmverwaltung`.`Filmstudio` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Filmverwaltung`.`Film_has_Schauspieler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Filmverwaltung`.`Film_has_Schauspieler` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Schauspieler_id` INT NOT NULL,
  `Film_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`, `Schauspieler_id`, `Film_ID`),
  INDEX `fk_Film_has_Schauspieler_Schauspieler1_idx` (`Schauspieler_id` ASC),
  INDEX `fk_Film_has_Schauspieler_Film1_idx` (`Film_ID` ASC),
  CONSTRAINT `fk_Film_has_Schauspieler_Film1`
    FOREIGN KEY (`Film_ID`)
    REFERENCES `Filmverwaltung`.`Film` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Schauspieler_Schauspieler1`
    FOREIGN KEY (`Schauspieler_id`)
    REFERENCES `Filmverwaltung`.`Schauspieler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

    