-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema peritroopers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peritroopers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peritroopers` DEFAULT CHARACTER SET utf8 ;
USE `peritroopers` ;

-- -----------------------------------------------------
-- Table `peritroopers`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`brands` (
  `idbrand` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbrand`),
  UNIQUE INDEX `idbrand_UNIQUE` (`idbrand` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`categories` (
  `idcategory` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE INDEX `idcategory_UNIQUE` (`idcategory` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`colors` (
  `idcolors` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idcolors`),
  UNIQUE INDEX `idcolors_UNIQUE` (`idcolors` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
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
  `brand` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idproduct`),
  UNIQUE INDEX `idproduct_UNIQUE` (`idproduct` ASC) VISIBLE,
  INDEX `colorId_idx` (`color` ASC) VISIBLE,
  INDEX `categoryId_idx` (`category` ASC) VISIBLE,
  INDEX `brandId_idx` (`brand` ASC) VISIBLE,
  CONSTRAINT `brandId`
    FOREIGN KEY (`brand`)
    REFERENCES `peritroopers`.`brands` (`idbrand`)
    ON UPDATE CASCADE,
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
-- Table `peritroopers`.`shippings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`shippings` (
  `idshippings` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  `floor` INT(11) NULL DEFAULT NULL,
  `apartment` VARCHAR(5) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postalCode` INT(11) NOT NULL,
  PRIMARY KEY (`idshippings`),
  UNIQUE INDEX `idshippings_UNIQUE` (`idshippings` ASC) VISIBLE)
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
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `iduserCategories_UNIQUE` (`iduserCategories` ASC) VISIBLE)
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
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC) VISIBLE,
  INDEX `userCategoryId_idx` (`userCategory` ASC) VISIBLE,
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
  UNIQUE INDEX `idinvoiceType_UNIQUE` (`idvoucherType` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  `shipping` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idpurchases`),
  INDEX `voucherTypeId_idx` (`voucherType` ASC) VISIBLE,
  INDEX `statusId_idx` (`status` ASC) VISIBLE,
  INDEX `userId_idx` (`user` ASC) VISIBLE,
  INDEX `shippingId_idx` (`shipping` ASC) VISIBLE,
  CONSTRAINT `shippingId`
    FOREIGN KEY (`shipping`)
    REFERENCES `peritroopers`.`shippings` (`idshippings`)
    ON UPDATE CASCADE,
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
  INDEX `productId_idx` (`product` ASC) VISIBLE,
  INDEX `purchaseId_idx` (`purchase` ASC) VISIBLE,
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
