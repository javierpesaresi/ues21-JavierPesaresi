-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2024 a las 02:58:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tourmate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acuerdocolaborador`
--

CREATE TABLE `acuerdocolaborador` (
  `id_acuerdo` int(8) NOT NULL,
  `idf_tipoacuerdo` int(8) NOT NULL,
  `idf_puesto` int(8) NOT NULL,
  `fechaAltaAcuerdo` date NOT NULL,
  `fechaBajaAcuerdo` date DEFAULT NULL,
  `comisionvalor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aqueaplica`
--

CREATE TABLE `aqueaplica` (
  `id_aqueaplica` int(8) NOT NULL,
  `aqueaplica` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajamotivo`
--

CREATE TABLE `bajamotivo` (
  `id_motivobaja` int(8) NOT NULL,
  `motivobaja` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `idf_calif` int(8) NOT NULL,
  `calificacion` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaevento`
--

CREATE TABLE `categoriaevento` (
  `id_categoria` int(8) NOT NULL,
  `categoria` int(1) NOT NULL,
  `descripcioncategoria` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(8) NOT NULL,
  `ciudad` varchar(8) NOT NULL,
  `idf_provincia` int(8) NOT NULL,
  `codigoPostal` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaborador`
--

CREATE TABLE `colaborador` (
  `id_colaborador` int(8) NOT NULL,
  `idf_persona` int(8) NOT NULL,
  `idf_acuerdo` int(8) NOT NULL,
  `fechaalta` date NOT NULL,
  `fechabaja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(8) NOT NULL,
  `idf_cotizacion` int(8) NOT NULL,
  `idf_precontrato` int(8) NOT NULL,
  `idf_firmantecontrato` int(8) NOT NULL,
  `idf_contratomodelo` int(8) NOT NULL,
  `idf_estadogestion` int(8) NOT NULL,
  `fechagestion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratomodelo`
--

CREATE TABLE `contratomodelo` (
  `id_modelo` int(8) NOT NULL,
  `modelocontrato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_cotizacion` int(8) NOT NULL,
  `idf_evento` int(8) NOT NULL,
  `idf_tipocontrato` int(8) NOT NULL,
  `idf_origen` int(8) NOT NULL,
  `idf_monedatipo` int(8) NOT NULL,
  `idf_tiposhow` int(8) NOT NULL,
  `idf_pagos` int(8) NOT NULL,
  `monedacotizacion` float NOT NULL,
  `montocachet` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizseguimiento`
--

CREATE TABLE `cotizseguimiento` (
  `id_movimiento` int(8) NOT NULL,
  `idf_cotizacion` int(8) NOT NULL,
  `idf_estadotramite` int(8) NOT NULL,
  `idf_motivobaja` int(8) NOT NULL,
  `idf_colaboradoractual` int(8) NOT NULL,
  `idf_colaboradorproximo` int(8) NOT NULL,
  `fechanovedad` date NOT NULL,
  `fechaproxgestion` date DEFAULT NULL,
  `detallenovedad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datoscontacto`
--

CREATE TABLE `datoscontacto` (
  `id_datosContacto` int(8) NOT NULL,
  `telefono1` varchar(20) DEFAULT NULL,
  `telefono2` varchar(20) DEFAULT NULL,
  `email1` varchar(80) DEFAULT NULL,
  `email2` varchar(80) DEFAULT NULL,
  `linkFB` varchar(255) DEFAULT NULL,
  `linkIG` varchar(255) DEFAULT NULL,
  `linkLin` varchar(255) DEFAULT NULL,
  `linkweb` varchar(255) DEFAULT NULL,
  `idf_personas` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersona`
--

CREATE TABLE `datospersona` (
  `id_datosPersona` int(8) NOT NULL,
  `idf_tipoDoc` int(1) DEFAULT NULL,
  `numeroDoc` varchar(12) DEFAULT NULL,
  `idf_domicilio` int(8) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id_domicilio` int(8) NOT NULL,
  `idf_ciudad` int(8) NOT NULL,
  `calle` varchar(80) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `piso` varchar(12) DEFAULT NULL,
  `depto` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadogestion`
--

CREATE TABLE `estadogestion` (
  `id_estadogestion` int(8) NOT NULL,
  `estadogestion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopago`
--

CREATE TABLE `estadopago` (
  `id_estadopago` int(8) NOT NULL,
  `estadopago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadotramite`
--

CREATE TABLE `estadotramite` (
  `id_estado` int(8) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(8) NOT NULL,
  `idf_categoriaevento` int(8) NOT NULL,
  `idf_predioevento` int(8) NOT NULL,
  `idf_gestorevento` int(8) NOT NULL,
  `eventonombre` varchar(120) NOT NULL,
  `descripcionevento` varchar(255) DEFAULT NULL,
  `fechaevento` date NOT NULL,
  `idf_localidadevento` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestor`
--

CREATE TABLE `gestor` (
  `id_gestor` int(8) NOT NULL,
  `idf_persona` int(8) NOT NULL,
  `idf_tipoGestor` int(8) NOT NULL,
  `comision` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id_moneda` int(8) NOT NULL,
  `monedanombre` varchar(50) NOT NULL,
  `monedasimbolo` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen`
--

CREATE TABLE `origen` (
  `id_origen` int(8) NOT NULL,
  `origen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(8) NOT NULL,
  `idf_tipopago` int(8) NOT NULL,
  `idf_estadopago` int(8) NOT NULL,
  `idf_aqueaplica` int(8) NOT NULL,
  `monto` float NOT NULL,
  `fechapago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(8) NOT NULL,
  `pais` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(8) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `nombres` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precontrato`
--

CREATE TABLE `precontrato` (
  `id_precontrato` int(8) NOT NULL,
  `idf_cotizacion` int(8) NOT NULL,
  `firmante1nombres` varchar(80) NOT NULL,
  `firmante1apellidos` varchar(80) NOT NULL,
  `firmante1tipodoc` varchar(15) NOT NULL,
  `firmante1nrodoc` varchar(15) NOT NULL,
  `firmante2nombres` varchar(80) DEFAULT NULL,
  `firmante2apellidos` varchar(80) DEFAULT NULL,
  `firmante2tipodoc` varchar(15) DEFAULT NULL,
  `firmante2nrodoc` varchar(15) DEFAULT NULL,
  `contratanterazonsoc` varchar(80) NOT NULL,
  `contratanteidtributario` varchar(15) NOT NULL,
  `contratantecondicioniva` varchar(50) NOT NULL,
  `contratantedomicilio_calle` varchar(80) NOT NULL,
  `contratantedomicilio_numero` varchar(80) NOT NULL,
  `contratantedomicilio_piso` varchar(80) NOT NULL,
  `contratantedomicilio_depto` varchar(80) NOT NULL,
  `contratantedomicilio_localidad` varchar(80) NOT NULL,
  `contratantedomicilio_cpostal` varchar(80) NOT NULL,
  `contratantedomicilio_ciudad` varchar(80) NOT NULL,
  `contratantedomicilio_provincia` varchar(80) NOT NULL,
  `contratantedomicilio_pais` varchar(80) NOT NULL,
  `predioshow_nombre` varchar(120) NOT NULL,
  `predioshow_domicilio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predioevento`
--

CREATE TABLE `predioevento` (
  `id_predio` int(8) NOT NULL,
  `id_domicilio` int(8) NOT NULL,
  `nombrePredio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(8) NOT NULL,
  `provincia` varchar(80) NOT NULL,
  `idf_pais` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id_puesto` int(8) NOT NULL,
  `descripcionpuesto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoacuerdo`
--

CREATE TABLE `tipoacuerdo` (
  `id_tipoacuerdo` int(8) NOT NULL,
  `tipoacuerdo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocontrato`
--

CREATE TABLE `tipocontrato` (
  `id_tipocontrato` int(8) NOT NULL,
  `tipocontrato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodoc`
--

CREATE TABLE `tipodoc` (
  `id_tipoDoc` int(1) NOT NULL,
  `tipoDoc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipogestor`
--

CREATE TABLE `tipogestor` (
  `id_tipogestor` int(8) NOT NULL,
  `tipogestor` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `id_tipo` int(8) NOT NULL,
  `tipopago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposhow`
--

CREATE TABLE `tiposhow` (
  `id_tiposhow` int(8) NOT NULL,
  `tiposhow` varchar(50) NOT NULL,
  `duracion` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acuerdocolaborador`
--
ALTER TABLE `acuerdocolaborador`
  ADD PRIMARY KEY (`id_acuerdo`),
  ADD KEY `idf_tipoacuerdo` (`idf_tipoacuerdo`),
  ADD KEY `idf_puesto` (`idf_puesto`);

--
-- Indices de la tabla `aqueaplica`
--
ALTER TABLE `aqueaplica`
  ADD PRIMARY KEY (`id_aqueaplica`);

--
-- Indices de la tabla `bajamotivo`
--
ALTER TABLE `bajamotivo`
  ADD PRIMARY KEY (`id_motivobaja`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`idf_calif`);

--
-- Indices de la tabla `categoriaevento`
--
ALTER TABLE `categoriaevento`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `idf_provincia` (`idf_provincia`);

--
-- Indices de la tabla `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`id_colaborador`),
  ADD KEY `idf_persona` (`idf_persona`),
  ADD KEY `idf_acuerdo` (`idf_acuerdo`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `idf_cotizacion` (`idf_cotizacion`),
  ADD KEY `idf_precontrato` (`idf_precontrato`),
  ADD KEY `idf_firmantecontrato` (`idf_firmantecontrato`),
  ADD KEY `idf_contratomodelo` (`idf_contratomodelo`),
  ADD KEY `idf_estadogestion` (`idf_estadogestion`);

--
-- Indices de la tabla `contratomodelo`
--
ALTER TABLE `contratomodelo`
  ADD PRIMARY KEY (`id_modelo`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `idf_evento` (`idf_evento`),
  ADD KEY `idf_tipocontrato` (`idf_tipocontrato`),
  ADD KEY `idf_origen` (`idf_origen`),
  ADD KEY `idf_monedatipo` (`idf_monedatipo`),
  ADD KEY `idf_tiposhow` (`idf_tiposhow`),
  ADD KEY `idf_pagos` (`idf_pagos`);

--
-- Indices de la tabla `cotizseguimiento`
--
ALTER TABLE `cotizseguimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `idf_cotizacion` (`idf_cotizacion`),
  ADD KEY `idf_estadotramite` (`idf_estadotramite`),
  ADD KEY `idf_motivobaja` (`idf_motivobaja`),
  ADD KEY `idf_colaboradoractual` (`idf_colaboradoractual`),
  ADD KEY `idf_colaboradorproximo` (`idf_colaboradorproximo`);

--
-- Indices de la tabla `datoscontacto`
--
ALTER TABLE `datoscontacto`
  ADD PRIMARY KEY (`id_datosContacto`);

--
-- Indices de la tabla `datospersona`
--
ALTER TABLE `datospersona`
  ADD KEY `idf_tipoDoc` (`idf_tipoDoc`),
  ADD KEY `idf_domicilio` (`idf_domicilio`),
  ADD KEY `id_datosPersona` (`id_datosPersona`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id_domicilio`),
  ADD KEY `idf_ciudad` (`idf_ciudad`);

--
-- Indices de la tabla `estadogestion`
--
ALTER TABLE `estadogestion`
  ADD PRIMARY KEY (`id_estadogestion`);

--
-- Indices de la tabla `estadopago`
--
ALTER TABLE `estadopago`
  ADD PRIMARY KEY (`id_estadopago`);

--
-- Indices de la tabla `estadotramite`
--
ALTER TABLE `estadotramite`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `idf_categoriaevento` (`idf_categoriaevento`),
  ADD KEY `idf_predioevento` (`idf_predioevento`),
  ADD KEY `idf_gestorevento` (`idf_gestorevento`);

--
-- Indices de la tabla `gestor`
--
ALTER TABLE `gestor`
  ADD PRIMARY KEY (`id_gestor`),
  ADD KEY `idf_persona` (`idf_persona`),
  ADD KEY `idf_tipoGestor` (`idf_tipoGestor`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `origen`
--
ALTER TABLE `origen`
  ADD PRIMARY KEY (`id_origen`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `idf_tipopago` (`idf_tipopago`),
  ADD KEY `idf_estadopago` (`idf_estadopago`),
  ADD KEY `idf_aqueaplica` (`idf_aqueaplica`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `precontrato`
--
ALTER TABLE `precontrato`
  ADD PRIMARY KEY (`id_precontrato`),
  ADD KEY `idf_cotizacion` (`idf_cotizacion`);

--
-- Indices de la tabla `predioevento`
--
ALTER TABLE `predioevento`
  ADD PRIMARY KEY (`id_predio`),
  ADD KEY `id_domicilio` (`id_domicilio`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `idf_pais` (`idf_pais`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id_puesto`);

--
-- Indices de la tabla `tipoacuerdo`
--
ALTER TABLE `tipoacuerdo`
  ADD PRIMARY KEY (`id_tipoacuerdo`);

--
-- Indices de la tabla `tipocontrato`
--
ALTER TABLE `tipocontrato`
  ADD PRIMARY KEY (`id_tipocontrato`);

--
-- Indices de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  ADD PRIMARY KEY (`id_tipoDoc`);

--
-- Indices de la tabla `tipogestor`
--
ALTER TABLE `tipogestor`
  ADD PRIMARY KEY (`id_tipogestor`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tiposhow`
--
ALTER TABLE `tiposhow`
  ADD PRIMARY KEY (`id_tiposhow`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acuerdocolaborador`
--
ALTER TABLE `acuerdocolaborador`
  MODIFY `id_acuerdo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aqueaplica`
--
ALTER TABLE `aqueaplica`
  MODIFY `id_aqueaplica` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bajamotivo`
--
ALTER TABLE `bajamotivo`
  MODIFY `id_motivobaja` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `idf_calif` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoriaevento`
--
ALTER TABLE `categoriaevento`
  MODIFY `id_categoria` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colaborador`
--
ALTER TABLE `colaborador`
  MODIFY `id_colaborador` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contratomodelo`
--
ALTER TABLE `contratomodelo`
  MODIFY `id_modelo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizseguimiento`
--
ALTER TABLE `cotizseguimiento`
  MODIFY `id_movimiento` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_domicilio` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estadogestion`
--
ALTER TABLE `estadogestion`
  MODIFY `id_estadogestion` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadopago`
--
ALTER TABLE `estadopago`
  MODIFY `id_estadopago` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadotramite`
--
ALTER TABLE `estadotramite`
  MODIFY `id_estado` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gestor`
--
ALTER TABLE `gestor`
  MODIFY `id_gestor` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `origen`
--
ALTER TABLE `origen`
  MODIFY `id_origen` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `precontrato`
--
ALTER TABLE `precontrato`
  MODIFY `id_precontrato` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `predioevento`
--
ALTER TABLE `predioevento`
  MODIFY `id_predio` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `id_puesto` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoacuerdo`
--
ALTER TABLE `tipoacuerdo`
  MODIFY `id_tipoacuerdo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocontrato`
--
ALTER TABLE `tipocontrato`
  MODIFY `id_tipocontrato` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  MODIFY `id_tipoDoc` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipogestor`
--
ALTER TABLE `tipogestor`
  MODIFY `id_tipogestor` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `id_tipo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposhow`
--
ALTER TABLE `tiposhow`
  MODIFY `id_tiposhow` int(8) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acuerdocolaborador`
--
ALTER TABLE `acuerdocolaborador`
  ADD CONSTRAINT `acuerdocolaborador_ibfk_1` FOREIGN KEY (`idf_tipoacuerdo`) REFERENCES `tipoacuerdo` (`id_tipoacuerdo`),
  ADD CONSTRAINT `acuerdocolaborador_ibfk_2` FOREIGN KEY (`idf_puesto`) REFERENCES `puesto` (`id_puesto`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idf_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Filtros para la tabla `colaborador`
--
ALTER TABLE `colaborador`
  ADD CONSTRAINT `colaborador_ibfk_1` FOREIGN KEY (`idf_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `colaborador_ibfk_2` FOREIGN KEY (`idf_acuerdo`) REFERENCES `acuerdocolaborador` (`id_acuerdo`);

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`idf_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`idf_precontrato`) REFERENCES `precontrato` (`id_precontrato`),
  ADD CONSTRAINT `contrato_ibfk_3` FOREIGN KEY (`idf_firmantecontrato`) REFERENCES `colaborador` (`id_colaborador`),
  ADD CONSTRAINT `contrato_ibfk_4` FOREIGN KEY (`idf_contratomodelo`) REFERENCES `contratomodelo` (`id_modelo`),
  ADD CONSTRAINT `contrato_ibfk_5` FOREIGN KEY (`idf_estadogestion`) REFERENCES `estadogestion` (`id_estadogestion`);

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idf_evento`) REFERENCES `evento` (`id_evento`),
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`idf_tipocontrato`) REFERENCES `tipocontrato` (`id_tipocontrato`),
  ADD CONSTRAINT `cotizacion_ibfk_3` FOREIGN KEY (`idf_origen`) REFERENCES `origen` (`id_origen`),
  ADD CONSTRAINT `cotizacion_ibfk_4` FOREIGN KEY (`idf_monedatipo`) REFERENCES `moneda` (`id_moneda`),
  ADD CONSTRAINT `cotizacion_ibfk_5` FOREIGN KEY (`idf_tiposhow`) REFERENCES `tiposhow` (`id_tiposhow`),
  ADD CONSTRAINT `cotizacion_ibfk_6` FOREIGN KEY (`idf_pagos`) REFERENCES `pago` (`id_pago`);

--
-- Filtros para la tabla `cotizseguimiento`
--
ALTER TABLE `cotizseguimiento`
  ADD CONSTRAINT `cotizseguimiento_ibfk_1` FOREIGN KEY (`idf_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `cotizseguimiento_ibfk_2` FOREIGN KEY (`idf_estadotramite`) REFERENCES `estadotramite` (`id_estado`),
  ADD CONSTRAINT `cotizseguimiento_ibfk_3` FOREIGN KEY (`idf_motivobaja`) REFERENCES `bajamotivo` (`id_motivobaja`),
  ADD CONSTRAINT `cotizseguimiento_ibfk_4` FOREIGN KEY (`idf_colaboradoractual`) REFERENCES `colaborador` (`id_colaborador`),
  ADD CONSTRAINT `cotizseguimiento_ibfk_5` FOREIGN KEY (`idf_colaboradorproximo`) REFERENCES `colaborador` (`id_colaborador`);

--
-- Filtros para la tabla `datoscontacto`
--
ALTER TABLE `datoscontacto`
  ADD CONSTRAINT `datoscontacto_ibfk_2` FOREIGN KEY (`idf_personas`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `datospersona`
--
ALTER TABLE `datospersona`
  ADD CONSTRAINT `datospersona_ibfk_1` FOREIGN KEY (`idf_tipoDoc`) REFERENCES `tipodoc` (`id_tipoDoc`),
  ADD CONSTRAINT `datospersona_ibfk_2` FOREIGN KEY (`idf_domicilio`) REFERENCES `domicilio` (`id_domicilio`),
  ADD CONSTRAINT `datospersona_ibfk_3` FOREIGN KEY (`id_datosPersona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`idf_ciudad`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`idf_categoriaevento`) REFERENCES `categoriaevento` (`id_categoria`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`idf_predioevento`) REFERENCES `predioevento` (`id_predio`),
  ADD CONSTRAINT `evento_ibfk_3` FOREIGN KEY (`idf_gestorevento`) REFERENCES `gestor` (`id_gestor`);

--
-- Filtros para la tabla `gestor`
--
ALTER TABLE `gestor`
  ADD CONSTRAINT `gestor_ibfk_1` FOREIGN KEY (`idf_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `gestor_ibfk_2` FOREIGN KEY (`idf_tipoGestor`) REFERENCES `tipogestor` (`id_tipogestor`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idf_tipopago`) REFERENCES `tipopago` (`id_tipo`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idf_estadopago`) REFERENCES `estadopago` (`id_estadopago`),
  ADD CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`idf_aqueaplica`) REFERENCES `aqueaplica` (`id_aqueaplica`);

--
-- Filtros para la tabla `precontrato`
--
ALTER TABLE `precontrato`
  ADD CONSTRAINT `precontrato_ibfk_1` FOREIGN KEY (`idf_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`);

--
-- Filtros para la tabla `predioevento`
--
ALTER TABLE `predioevento`
  ADD CONSTRAINT `predioevento_ibfk_1` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilio` (`id_domicilio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`idf_pais`) REFERENCES `pais` (`id_pais`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
