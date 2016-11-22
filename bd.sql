-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.27 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para bd_servicios_publicos
CREATE DATABASE IF NOT EXISTS `bd_servicios_publicos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_servicios_publicos`;


-- Volcando estructura para tabla bd_servicios_publicos.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `codigo_cliente` int(11) NOT NULL,
  `fecha_afiliacion` date NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`codigo_cliente`),
  KEY `FK_cliente_persona` (`id_persona`),
  CONSTRAINT `FK_cliente_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.organizacion
CREATE TABLE IF NOT EXISTS `organizacion` (
  `id_organizacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` double NOT NULL,
  `correo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_organizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.organizacion: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `organizacion` DISABLE KEYS */;
INSERT INTO `organizacion` (`id_organizacion`, `nombre`, `direccion`, `telefono`, `correo`) VALUES
	(1, 'Empresa2', 'Calle falsa ', 4398765, 'empresa1@gmail.com'),
	(2, 'Empresa 3', 'direc', 3241, 'cads@gmail.com'),
	(34, 'asfd', 'asf', 343, 'asdf');
/*!40000 ALTER TABLE `organizacion` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono1` double DEFAULT NULL,
  `telefono2` double DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `FK_persona_tipo_documento` (`tipo_documento`),
  CONSTRAINT `FK_persona_tipo_documento` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.predio
CREATE TABLE IF NOT EXISTS `predio` (
  `codigo_predio` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) DEFAULT NULL,
  `tipo_predio_id` int(11),
  `tipo_construccion_id` int(11),
  `ficha_catastral` varchar(50) DEFAULT NULL,
  `matricula_inmobiliaria` varchar(50) DEFAULT NULL,
  `numero_predial_nacional` varchar(50) DEFAULT NULL,
  `codigo_dane` varchar(50) DEFAULT NULL,
  `chip` varchar(50) DEFAULT NULL,
  `numero_personas` int(11) DEFAULT NULL,
  `estrato` int(11) DEFAULT NULL,
  `unidades_habitacionales` int(11) DEFAULT NULL,
  `id_cartografico` int(11) DEFAULT NULL,
  `dest_economico` varchar(50) DEFAULT NULL,
  `uso_economico` varchar(50) DEFAULT NULL,
  `ciclo` varchar(50) DEFAULT NULL,
  `area_construida` double DEFAULT NULL,
  `area_terreno` double DEFAULT NULL,
  `manzana` varchar(50) DEFAULT NULL,
  `direccion_comercial` varchar(50) DEFAULT NULL,
  `direccion_catastral` varchar(50) DEFAULT NULL,
  `posicion_inmueble` varchar(50) DEFAULT NULL,
  `estado_atipico` varchar(50) DEFAULT NULL,
  `estado_alcaldia` varchar(50) DEFAULT NULL,
  `desocupado` set('V','F') DEFAULT NULL,
  `servicios_contratados` varchar(50) DEFAULT NULL,
  `facturar_sin_servicios` set('V','F') DEFAULT NULL,
  `cons_predeterminado` set('V','F') DEFAULT NULL,
  `tipo_productor` set('V','F') DEFAULT NULL,
  `valor_consumo_predeterminado` double DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `documentos_previos` varchar(50) DEFAULT NULL,
  `medido` set('V','F') DEFAULT NULL,
  `estado_predio` set('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`codigo_predio`),
  KEY `FK_predio_tipo_predio` (`tipo_predio_id`),
  KEY `FK_predio_tipo_construccion` (`tipo_construccion_id`),
  CONSTRAINT `FK_predio_tipo_construccion` FOREIGN KEY (`tipo_construccion_id`) REFERENCES `tipo_construccion` (`id`),
  CONSTRAINT `FK_predio_tipo_predio` FOREIGN KEY (`tipo_predio_id`) REFERENCES `tipo_predio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.predio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `predio` DISABLE KEYS */;
/*!40000 ALTER TABLE `predio` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.predio_ruta
CREATE TABLE IF NOT EXISTS `predio_ruta` (
  `id_predio` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` set('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`id_ruta`,`id_predio`),
  KEY `FK_predio_ruta_predio` (`id_predio`),
  CONSTRAINT `FK_predio_ruta_predio` FOREIGN KEY (`id_predio`) REFERENCES `predio` (`codigo_predio`),
  CONSTRAINT `FK_predio_ruta_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.predio_ruta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `predio_ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `predio_ruta` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.predio_servicio
CREATE TABLE IF NOT EXISTS `predio_servicio` (
  `codigo_predio` int(11) NOT NULL,
  `codigo_servicio` int(11) NOT NULL,
  `fecha_conexion` date NOT NULL,
  `estado` set('V','F') NOT NULL,
  PRIMARY KEY (`codigo_predio`,`codigo_servicio`),
  KEY `FK__servicio` (`codigo_servicio`),
  CONSTRAINT `FK__predio` FOREIGN KEY (`codigo_predio`) REFERENCES `predio` (`codigo_predio`),
  CONSTRAINT `FK__servicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `servicio` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.predio_servicio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `predio_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `predio_servicio` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.rol: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.ruta
CREATE TABLE IF NOT EXISTS `ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.ruta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.servicio: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` (`codigo`, `nombre`, `estado`, `descripcion`) VALUES
	(1, 'Servicio modificado', 'A', 'servicio de prueba'),
	(2, 'servicio 2', 'A', 'servicio de prueba 2'),
	(3, 'servicio 3', 'A', 'este servicio');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.tipo_construccion
CREATE TABLE IF NOT EXISTS `tipo_construccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.tipo_construccion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_construccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_construccion` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.tipo_documento
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.tipo_documento: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` (`id`, `nombre`) VALUES
	(1, 'Cédula');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.tipo_predio
CREATE TABLE IF NOT EXISTS `tipo_predio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.tipo_predio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_predio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_predio` ENABLE KEYS */;


-- Volcando estructura para tabla bd_servicios_publicos.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_persona` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `rol` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `FK_usuario_rol` (`rol`),
  CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_servicios_publicos.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
