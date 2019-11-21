-- MySQL Script generated by MySQL Workbench
-- Thu 21 Nov 2019 02:46:22 PM +03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema achievementRD
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `achievementRD` ;

-- -----------------------------------------------------
-- Schema achievementRD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `achievementRD` DEFAULT CHARACTER SET utf8 ;
USE `achievementRD` ;

-- -----------------------------------------------------
-- Table `achievementRD`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `achievementRD`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `achievementRD`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `achievementRD`.`user_role` (
  `user_role` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `user_role_UNIQUE` (`user_role` ASC),
  PRIMARY KEY (`user_role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `achievementRD`.`activation_key`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `achievementRD`.`activation_key` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `user_activation_key` VARCHAR(45) NOT NULL,
  INDEX `fk_table1_user_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `key_UNIQUE` (`user_activation_key` ASC),
  CONSTRAINT `fk_table1_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `achievementRD`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `achievementRD`.`user_has_user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `achievementRD`.`user_has_user_role` (
  `user_id` INT NOT NULL,
  `user_role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`, `user_role`),
  INDEX `fk_user_role_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_user_role_has_user_user_role1_idx` (`user_role` ASC),
  CONSTRAINT `fk_user_role_has_user_user_role1`
    FOREIGN KEY (`user_role`)
    REFERENCES `achievementRD`.`user_role` (`user_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `achievementRD`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `achievementRD`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `achievementRD`;
INSERT INTO `achievementRD`.`user` (`id`, `username`, `password`) VALUES (1, 'JProtos', '12345');

COMMIT;


-- -----------------------------------------------------
-- Data for table `achievementRD`.`user_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `achievementRD`;
INSERT INTO `achievementRD`.`user_role` (`user_role`) VALUES ('ADMIN');

COMMIT;


-- -----------------------------------------------------
-- Data for table `achievementRD`.`activation_key`
-- -----------------------------------------------------
START TRANSACTION;
USE `achievementRD`;
INSERT INTO `achievementRD`.`activation_key` (`id`, `user_id`, `user_activation_key`) VALUES (DEFAULT, 1, '1234-1234-1234-1234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `achievementRD`.`user_has_user_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `achievementRD`;
INSERT INTO `achievementRD`.`user_has_user_role` (`user_id`, `user_role`) VALUES (1, DEFAULT);

COMMIT;

