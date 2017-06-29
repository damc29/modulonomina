-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2017 a las 20:17:06
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_servicios_publicos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigo_cliente` int(11) NOT NULL,
  `fecha_afiliacion` date NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_periodo`
--

CREATE TABLE `config_periodo` (
  `idconfig_periodo` int(11) NOT NULL,
  `dia_mes_inicio` int(11) DEFAULT NULL COMMENT 'día del mes en que se inicia el periodo.',
  `dia_mes_cierre` int(11) DEFAULT NULL COMMENT 'día del mes en que se cierra el periodo.',
  `dias_factura` varchar(45) DEFAULT NULL COMMENT 'cantidad de días a facturar a partir del día de inicio o día de registro.',
  `estado` varchar(7) DEFAULT NULL COMMENT 'ACTIVO/INACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica`
--

CREATE TABLE `critica` (
  `idcritica` int(11) NOT NULL COMMENT 'autoincremental.',
  `lectura_medidor_serial` int(11) NOT NULL,
  `lectura_periodo_fecha_inicio` date NOT NULL,
  `lectura_periodo_fecha_fin` date NOT NULL,
  `lectura_ajustada` double DEFAULT NULL,
  `estado` varchar(7) DEFAULT NULL COMMENT 'ACTIVA/INACTIVA/CERRADA',
  `usuario_id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura`
--

CREATE TABLE `lectura` (
  `medidor_serial` int(11) NOT NULL,
  `periodo_fecha_inicio` date NOT NULL,
  `periodo_fecha_fin` date NOT NULL,
  `anterior_lectura` double NOT NULL,
  `nueva_lectura` double NOT NULL,
  `estado` varchar(7) NOT NULL COMMENT 'ACTIVA/INACTIVA',
  `fecha_lectura` date NOT NULL,
  `usuario_id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidor`
--

CREATE TABLE `medidor` (
  `serial` int(11) NOT NULL COMMENT 'Por confirmar si se permiten caracter alfabeticos.',
  `modelo_idmodelo` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_instalacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `idmodelo` int(11) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `marca_idmarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacion`
--

CREATE TABLE `organizacion` (
  `id_organizacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` double NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `fecha_inicio` date NOT NULL COMMENT 'dia/mes/año',
  `fecha_fin` date NOT NULL,
  `estado` varchar(7) NOT NULL COMMENT 'ACTIVO/CERRADO',
  `config_periodo_idconfig_periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono1` double DEFAULT NULL,
  `telefono2` double DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predio`
--

CREATE TABLE `predio` (
  `codigo_predio` int(11) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `tipo_predio_id` int(11) DEFAULT NULL,
  `tipo_construccion_id` int(11) DEFAULT NULL,
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
  `estado_predio` set('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predio_has_medidor`
--

CREATE TABLE `predio_has_medidor` (
  `predio_codigo_predio` int(11) NOT NULL,
  `medidor_serial` int(11) NOT NULL,
  `fecha_cambio` date NOT NULL,
  `estado` varchar(8) NOT NULL COMMENT 'ACTIVO/INACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predio_ruta`
--

CREATE TABLE `predio_ruta` (
  `id_predio` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` set('Activo','Inactivo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predio_servicio`
--

CREATE TABLE `predio_servicio` (
  `codigo_predio` int(11) NOT NULL,
  `codigo_servicio` int(11) NOT NULL,
  `fecha_conexion` date NOT NULL,
  `estado` set('V','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_construccion`
--

CREATE TABLE `tipo_construccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_predio`
--

CREATE TABLE `tipo_predio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_persona` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `rol` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_cliente`),
  ADD KEY `FK_cliente_persona` (`id_persona`);

--
-- Indices de la tabla `config_periodo`
--
ALTER TABLE `config_periodo`
  ADD PRIMARY KEY (`idconfig_periodo`);

--
-- Indices de la tabla `critica`
--
ALTER TABLE `critica`
  ADD PRIMARY KEY (`idcritica`,`lectura_medidor_serial`,`lectura_periodo_fecha_inicio`,`lectura_periodo_fecha_fin`),
  ADD KEY `fk_critica_lectura1_idx` (`lectura_medidor_serial`,`lectura_periodo_fecha_inicio`,`lectura_periodo_fecha_fin`),
  ADD KEY `fk_critica_usuario1_idx` (`usuario_id_persona`);

--
-- Indices de la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD PRIMARY KEY (`medidor_serial`,`periodo_fecha_inicio`,`periodo_fecha_fin`),
  ADD KEY `fk_predio_has_medidor1_medidor1_idx` (`medidor_serial`),
  ADD KEY `fk_lectura_periodo1_idx` (`periodo_fecha_inicio`,`periodo_fecha_fin`),
  ADD KEY `fk_lectura_usuario1_idx` (`usuario_id_persona`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idmarca`);

--
-- Indices de la tabla `medidor`
--
ALTER TABLE `medidor`
  ADD PRIMARY KEY (`serial`),
  ADD KEY `fk_medidor_modelo1_idx` (`modelo_idmodelo`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idmodelo`),
  ADD KEY `fk_modelo_marca1_idx` (`marca_idmarca`);

--
-- Indices de la tabla `organizacion`
--
ALTER TABLE `organizacion`
  ADD PRIMARY KEY (`id_organizacion`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`fecha_inicio`,`fecha_fin`),
  ADD KEY `fk_periodo_config_periodo1_idx` (`config_periodo_idconfig_periodo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `FK_persona_tipo_documento` (`tipo_documento`);

--
-- Indices de la tabla `predio`
--
ALTER TABLE `predio`
  ADD PRIMARY KEY (`codigo_predio`),
  ADD KEY `FK_predio_tipo_predio` (`tipo_predio_id`),
  ADD KEY `FK_predio_tipo_construccion` (`tipo_construccion_id`);

--
-- Indices de la tabla `predio_has_medidor`
--
ALTER TABLE `predio_has_medidor`
  ADD PRIMARY KEY (`predio_codigo_predio`,`medidor_serial`),
  ADD KEY `fk_predio_has_medidor_medidor1_idx` (`medidor_serial`),
  ADD KEY `fk_predio_has_medidor_predio1_idx` (`predio_codigo_predio`);

--
-- Indices de la tabla `predio_ruta`
--
ALTER TABLE `predio_ruta`
  ADD PRIMARY KEY (`id_ruta`,`id_predio`),
  ADD KEY `FK_predio_ruta_predio` (`id_predio`);

--
-- Indices de la tabla `predio_servicio`
--
ALTER TABLE `predio_servicio`
  ADD PRIMARY KEY (`codigo_predio`,`codigo_servicio`),
  ADD KEY `FK__servicio` (`codigo_servicio`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `tipo_construccion`
--
ALTER TABLE `tipo_construccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_predio`
--
ALTER TABLE `tipo_predio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `FK_usuario_rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `critica`
--
ALTER TABLE `critica`
  MODIFY `idcritica` int(11) NOT NULL AUTO_INCREMENT COMMENT 'autoincremental.';
--
-- AUTO_INCREMENT de la tabla `predio`
--
ALTER TABLE `predio`
  MODIFY `codigo_predio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_construccion`
--
ALTER TABLE `tipo_construccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_predio`
--
ALTER TABLE `tipo_predio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cliente_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `critica`
--
ALTER TABLE `critica`
  ADD CONSTRAINT `fk_critica_lectura1` FOREIGN KEY (`lectura_medidor_serial`,`lectura_periodo_fecha_inicio`,`lectura_periodo_fecha_fin`) REFERENCES `lectura` (`medidor_serial`, `periodo_fecha_inicio`, `periodo_fecha_fin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_critica_usuario1` FOREIGN KEY (`usuario_id_persona`) REFERENCES `usuario` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD CONSTRAINT `fk_lectura_periodo1` FOREIGN KEY (`periodo_fecha_inicio`,`periodo_fecha_fin`) REFERENCES `periodo` (`fecha_inicio`, `fecha_fin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lectura_usuario1` FOREIGN KEY (`usuario_id_persona`) REFERENCES `usuario` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_predio_has_medidor1_medidor1` FOREIGN KEY (`medidor_serial`) REFERENCES `medidor` (`serial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medidor`
--
ALTER TABLE `medidor`
  ADD CONSTRAINT `fk_medidor_modelo1` FOREIGN KEY (`modelo_idmodelo`) REFERENCES `modelo` (`idmodelo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `fk_modelo_marca1` FOREIGN KEY (`marca_idmarca`) REFERENCES `marca` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD CONSTRAINT `fk_periodo_config_periodo1` FOREIGN KEY (`config_periodo_idconfig_periodo`) REFERENCES `config_periodo` (`idconfig_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_persona_tipo_documento` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documento` (`id`);

--
-- Filtros para la tabla `predio`
--
ALTER TABLE `predio`
  ADD CONSTRAINT `FK_predio_tipo_construccion` FOREIGN KEY (`tipo_construccion_id`) REFERENCES `tipo_construccion` (`id`),
  ADD CONSTRAINT `FK_predio_tipo_predio` FOREIGN KEY (`tipo_predio_id`) REFERENCES `tipo_predio` (`id`);

--
-- Filtros para la tabla `predio_has_medidor`
--
ALTER TABLE `predio_has_medidor`
  ADD CONSTRAINT `fk_predio_has_medidor_medidor1` FOREIGN KEY (`medidor_serial`) REFERENCES `medidor` (`serial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_predio_has_medidor_predio1` FOREIGN KEY (`predio_codigo_predio`) REFERENCES `predio` (`codigo_predio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `predio_ruta`
--
ALTER TABLE `predio_ruta`
  ADD CONSTRAINT `FK_predio_ruta_predio` FOREIGN KEY (`id_predio`) REFERENCES `predio` (`codigo_predio`),
  ADD CONSTRAINT `FK_predio_ruta_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id`);

--
-- Filtros para la tabla `predio_servicio`
--
ALTER TABLE `predio_servicio`
  ADD CONSTRAINT `FK__predio` FOREIGN KEY (`codigo_predio`) REFERENCES `predio` (`codigo_predio`),
  ADD CONSTRAINT `FK__servicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `servicio` (`codigo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
