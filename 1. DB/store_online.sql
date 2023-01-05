CREATE SCHEMA `store_online` DEFAULT CHARACTER SET utf8 ;

USE `store_online` ;

-- -----------------------------------------------------
-- Table `store_online`.`clientes`
-- -----------------------------------------------------
CREATE TABLE `clientes` (
  `id_cliente` INT NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `edad` VARCHAR(2) NOT NULL,
  `cedula` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `num_celular` VARCHAR(10) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store_online`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE `ordenes` (
  `id_orden` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `fecha_venta` DATE NOT NULL,
  `clientes_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_ordenes_clientes1_idx` (`clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_clientes1`
    FOREIGN KEY (`clientes_id_cliente`)
    REFERENCES `mydb`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store_online`.`productos`
-- -----------------------------------------------------
CREATE TABLE `productos` (
  `id_producto` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `lote` VARCHAR(45) NULL,
  `fecha_ingreso` DATE NOT NULL,
  `fecha_vencimiento` DATE NULL,
  `codigo_barras` VARCHAR(45) NOT NULL,
  `precio_compra` INT NOT NULL,
  `precio_venta` INT NOT NULL,
  `promociones` VARCHAR(45) NULL,
  `ordenes_id_orden` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_productos_ordenes1_idx` (`ordenes_id_orden` ASC) VISIBLE,
  CONSTRAINT `fk_productos_ordenes1`
    FOREIGN KEY (`ordenes_id_orden`)
    REFERENCES `mydb`.`ordenes` (`id_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store_online`.`categorias`
-- -----------------------------------------------------
CREATE TABLE `categorias` (
  `id_categoria` INT NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `productos_id_producto` INT NOT NULL,
  PRIMARY KEY (`id_categoria`),
  INDEX `fk_categorias_productos_idx` (`productos_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_categorias_productos`
    FOREIGN KEY (`productos_id_producto`)
    REFERENCES `mydb`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

