-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemondb` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemondb` ;

-- -----------------------------------------------------
-- Table `LittleLemondb`.`Order Delivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemondb`.`Order Delivery Status` (
  `StatusID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemondb`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemondb`.`CustomerDetails` (
  `CustomerID` INT NOT NULL,
  `Contacts` VARCHAR(255) NOT NULL,
  `Names` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemondb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemondb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` INT NOT NULL,
  `StatusID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerDetails_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `OrderDeliveryStatus_fk_idx` (`StatusID` ASC) VISIBLE,
  CONSTRAINT `CustomerDetails_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemondb`.`CustomerDetails` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderDeliveryStatus_fk`
    FOREIGN KEY (`StatusID`)
    REFERENCES `LittleLemondb`.`Order Delivery Status` (`StatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemondb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemondb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemondb`.`Staff Information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemondb`.`Staff Information` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemondb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemondb`.`Menus` (
  `MenuID` INT NOT NULL,
  `Starters` VARCHAR(255) NOT NULL,
  `Cuisines` VARCHAR(255) NOT NULL,
  `Courses` VARCHAR(255) NOT NULL,
  `Drinks` VARCHAR(255) NOT NULL,
  `Desserts` VARCHAR(255) NOT NULL,
  `OrderID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `Bookings_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `Orders_fk_idx` (`OrderID` ASC) VISIBLE,
  INDEX `StaffInformation_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `Bookings_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemondb`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Orders_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemondb`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StaffInformation`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemondb`.`Staff Information` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;