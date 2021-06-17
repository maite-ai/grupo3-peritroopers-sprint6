-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema peritroopers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peritroopers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peritroopers` DEFAULT CHARACTER SET utf8 ;
USE `peritroopers` ;

-- -----------------------------------------------------
-- Table `peritroopers`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`categories` (
  `idcategory` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE INDEX `idcategory_UNIQUE` (`idcategory` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`colors` (
  `idcolors` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idcolors`),
  UNIQUE INDEX `idcolors_UNIQUE` (`idcolors` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`products` (
  `idproduct` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `description` VARCHAR(180) NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `image` BLOB NOT NULL,
  `category` INT(10) UNSIGNED NOT NULL,
  `color` INT(10) UNSIGNED NOT NULL,
  `stock` INT(11) NOT NULL,
  PRIMARY KEY (`idproduct`),
  UNIQUE INDEX `idproduct_UNIQUE` (`idproduct` ASC),
  INDEX `colorId_idx` (`color` ASC),
  INDEX `categoryId_idx` (`category` ASC),
  CONSTRAINT `categoryId`
    FOREIGN KEY (`category`)
    REFERENCES `peritroopers`.`categories` (`idcategory`)
    ON UPDATE CASCADE,
  CONSTRAINT `colorId`
    FOREIGN KEY (`color`)
    REFERENCES `peritroopers`.`colors` (`idcolors`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`status` (
  `idstatus` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idstatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`usercategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`usercategories` (
  `iduserCategories` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`iduserCategories`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `iduserCategories_UNIQUE` (`iduserCategories` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`users` (
  `idusers` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `lastname` VARCHAR(25) NOT NULL,
  `birthdate` DATE NOT NULL,
  `address` VARCHAR(120) NOT NULL,
  `email` VARCHAR(95) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `userCategory` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC),
  INDEX `userCategoryId_idx` (`userCategory` ASC),
  CONSTRAINT `userCategoryId`
    FOREIGN KEY (`userCategory`)
    REFERENCES `peritroopers`.`usercategories` (`iduserCategories`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`vouchertype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`vouchertype` (
  `idvoucherType` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idvoucherType`),
  UNIQUE INDEX `idinvoiceType_UNIQUE` (`idvoucherType` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`shippings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`shippings` (
  `idshippings` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `floor` INT NULL,
  `apartment` VARCHAR(5) NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postalCode` INT NOT NULL,
  PRIMARY KEY (`idshippings`),
  UNIQUE INDEX `idshippings_UNIQUE` (`idshippings` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `peritroopers`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`purchases` (
  `idpurchases` INT(10) UNSIGNED NOT NULL,
  `voucherType` INT(10) UNSIGNED NOT NULL,
  `voucherNumber` BIGINT(15) UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `total` DECIMAL(12,2) UNSIGNED NOT NULL,
  `status` INT(10) UNSIGNED NOT NULL,
  `user` INT(10) UNSIGNED NOT NULL,
  `shipping` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpurchases`),
  INDEX `voucherTypeId_idx` (`voucherType` ASC),
  INDEX `statusId_idx` (`status` ASC),
  INDEX `userId_idx` (`user` ASC),
  INDEX `shippingId_idx` (`shipping` ASC),
  CONSTRAINT `statusId`
    FOREIGN KEY (`status`)
    REFERENCES `peritroopers`.`status` (`idstatus`)
    ON UPDATE CASCADE,
  CONSTRAINT `userId`
    FOREIGN KEY (`user`)
    REFERENCES `peritroopers`.`users` (`idusers`)
    ON UPDATE CASCADE,
  CONSTRAINT `voucherTypeId`
    FOREIGN KEY (`voucherType`)
    REFERENCES `peritroopers`.`vouchertype` (`idvoucherType`)
    ON UPDATE CASCADE,
  CONSTRAINT `shippingId`
    FOREIGN KEY (`shipping`)
    REFERENCES `peritroopers`.`shippings` (`idshippings`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`orders` (
  `idorders` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `subtotal` DECIMAL(11,2) NOT NULL,
  `discount` INT(11) NULL DEFAULT NULL,
  `product` INT(10) UNSIGNED NOT NULL,
  `purchase` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idorders`),
  INDEX `productId_idx` (`product` ASC),
  INDEX `purchaseId_idx` (`purchase` ASC),
  CONSTRAINT `productId`
    FOREIGN KEY (`product`)
    REFERENCES `peritroopers`.`products` (`idproduct`)
    ON UPDATE CASCADE,
  CONSTRAINT `purchaseId`
    FOREIGN KEY (`purchase`)
    REFERENCES `peritroopers`.`purchases` (`idpurchases`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
