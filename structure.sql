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
CREATE SCHEMA IF NOT EXISTS `peritroopers` DEFAULT CHARACTER SET utf8mb4 ;
USE `peritroopers` ;

-- -----------------------------------------------------
-- Table `peritroopers`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`brands` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`categories` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`colors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`products` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `description` VARCHAR(180) NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `image` VARCHAR(150) NOT NULL,
  `categoryId` INT(10) UNSIGNED NOT NULL,
  `colorId` INT(10) UNSIGNED NOT NULL,
  `stock` INT(11) NULL DEFAULT NULL,
  `brandId` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `colorId_idx` (`colorId` ASC),
  INDEX `categoryId_idx` (`categoryId` ASC),
  INDEX `brandId_idx` (`brandId` ASC),
  CONSTRAINT `brandId`
    FOREIGN KEY (`brandId`)
    REFERENCES `peritroopers`.`brands` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `categoryId`
    FOREIGN KEY (`categoryId`)
    REFERENCES `peritroopers`.`categories` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `colorId`
    FOREIGN KEY (`colorId`)
    REFERENCES `peritroopers`.`colors` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`shippings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`shippings` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  `floor` INT(11) NULL DEFAULT NULL,
  `apartment` VARCHAR(5) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postalCode` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`status` (
  `id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`usercategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`usercategories` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `birthdate` DATE NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `lastname` VARCHAR(25) NOT NULL,
  `address` VARCHAR(120) NOT NULL,
  `email` VARCHAR(95) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `userCategoryId` INT(10) UNSIGNED NOT NULL,
  `avatar` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `userCategoryId_idx` (`userCategoryId` ASC),
  CONSTRAINT `userCategoryId`
    FOREIGN KEY (`userCategoryId`)
    REFERENCES `peritroopers`.`usercategories` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`vouchertype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`vouchertype` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`purchases` (
  `id` INT(10) UNSIGNED NOT NULL,
  `voucherTypeId` INT(10) UNSIGNED NOT NULL,
  `voucherNumber` BIGINT(15) UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `total` DECIMAL(12,2) UNSIGNED NOT NULL,
  `statusId` INT(10) UNSIGNED NOT NULL,
  `userId` INT(10) UNSIGNED NOT NULL,
  `shippingId` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `voucherTypeId_idx` (`voucherTypeId` ASC),
  INDEX `statusId_idx` (`statusId` ASC),
  INDEX `userId_idx` (`userId` ASC),
  INDEX `shippingId_idx` (`shippingId` ASC),
  CONSTRAINT `shippingId`
    FOREIGN KEY (`shippingId`)
    REFERENCES `peritroopers`.`shippings` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `statusId`
    FOREIGN KEY (`statusId`)
    REFERENCES `peritroopers`.`status` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `peritroopers`.`users` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `voucherTypeId`
    FOREIGN KEY (`voucherTypeId`)
    REFERENCES `peritroopers`.`vouchertype` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peritroopers`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peritroopers`.`orders` (
  `id` INT(11) UNSIGNED NOT NULL,
  `quantity` INT(11) NOT NULL,
  `subtotal` DECIMAL(11,2) NOT NULL,
  `discount` INT(11) NULL DEFAULT NULL,
  `productId` INT(10) UNSIGNED NOT NULL,
  `purchaseId` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `productId_idx` (`productId` ASC),
  INDEX `purchaseId_idx` (`purchaseId` ASC),
  CONSTRAINT `productId`
    FOREIGN KEY (`productId`)
    REFERENCES `peritroopers`.`products` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `purchaseId`
    FOREIGN KEY (`purchaseId`)
    REFERENCES `peritroopers`.`purchases` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
