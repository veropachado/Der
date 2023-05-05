-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolioVP
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolioVP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolioVP` DEFAULT CHARACTER SET utf8 ;
USE `portfolioVP` ;

-- -----------------------------------------------------
-- Table `portfolioVP`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(50) NULL,
  `info_profesional` VARCHAR(200) NULL,
  `provincia` VARCHAR(50) NULL,
  `pais` VARCHAR(50) NULL,
  `img_perfil` VARCHAR(100) NULL,
  `img_fondo` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`experiencia_laboral` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(60) NOT NULL,
  `puesto` VARCHAR(50) NOT NULL,
  `fecha_inicio` VARCHAR(30) NULL,
  `fecha_fin` VARCHAR(30) NULL,
  `tareas` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
   CONSTRAINT `fk_experiencia_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioVP`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(60) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(50) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_usuario_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioVP`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`educacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `institucion` VARCHAR(100) NOT NULL,
  `fecha_inicio` VARCHAR(30) NULL,
  `fecha_fin` VARCHAR(30) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
   CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioVP`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`habilidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `porcentaje` INT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
   CONSTRAINT `fk_habilidad_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioVP`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `fecha_realizacion` VARCHAR(30) NULL,
  `descripcion` VARCHAR(100) NULL,
  `link` VARCHAR(100) NULL,
  `img_proyecto` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
   CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolioVP`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol_nombre` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioVP`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioVP`.`usuario_rol` (
  `usuario_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `rol_id`),
    CONSTRAINT `fk_usuario_has_rol_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `portfolioVP`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `portfolioVP`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
