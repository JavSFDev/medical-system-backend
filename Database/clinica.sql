-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2023 a las 06:56:03
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biclicletadb`
--
CREATE DATABASE IF NOT EXISTS `biclicletadb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `biclicletadb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `idAlquiler` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaDesde` date NOT NULL,
  `cantidadDias` tinyint(4) NOT NULL,
  `idBicicleta` int(11) NOT NULL,
  `idTalla` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `seguroAsistencia` tinyint(1) NOT NULL,
  `total` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`idAlquiler`, `idUsuario`, `fechaDesde`, `cantidadDias`, `idBicicleta`, `idTalla`, `comentarios`, `seguroAsistencia`, `total`) VALUES
(1, 1, '2023-02-12', 1, 8, 5, 'Ninguno', 1, '41000.00'),
(2, 2, '2023-02-12', 2, 3, 4, 'Revisión exahustiva', 0, '56000.00'),
(3, 3, '2023-02-13', 1, 7, 4, 'Agregar más tallas', 1, '46000.00'),
(4, 3, '2023-02-14', 2, 4, 4, 'Ninguno', 1, '74000.00'),
(5, 3, '2023-02-14', 2, 4, 4, 'Ninguno', 1, '74000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta`
--

CREATE TABLE `bicicleta` (
  `idBicicleta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precioDia` decimal(18,2) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `bicicleta`
--

INSERT INTO `bicicleta` (`idBicicleta`, `nombre`, `descripcion`, `precioDia`, `idCategoria`) VALUES
(1, 'Sunday BluePrint', 'Ideal para los pequeños, ajustable, piñon de 13T', '20000.00', 1),
(2, 'Coluer Rockband Rojo', 'Cuadro Rockband en acero Hi-Ten, Horquilla rígida en acero reforzada y eje 14mm', '24000.00', 1),
(3, 'Subrosa Black (2021)', 'BMX SUBROSA TIRO XL – edición 2021, Tamaño del ciclista desde 1,75 m', '28000.00', 1),
(4, 'Orbea Orca M30i Amarillo/negro 2023', 'Orbea ha lanzado como adelanteo de gama un modelo con su cuadro de carbono OMR', '35000.00', 2),
(5, 'BMC Roadmachine One ora/pet/pet (2022)', 'Roadmachine Tiene una estructura ligera y una excelente transmisión de energía. Su diseño orientado al DNA rendimiento la convierte en una máquina muy eficiente en una amplia gama de terrenos.', '45000.00', 2),
(6, 'Orbea Orca M20 Bla/iri', 'CUADRO Orbea Orca carbon OMR Disc, monocoque construction, HS 1,5″, BB 386mm, powermeter compatible, Rear Thru Axle 12x142mm, thread M12x2 P1, Speed release compatible dropout, Internal Cable.', '40000.00', 2),
(7, 'Focus Thron2 6.8 750 WH F.White (2023)', 'El eficaz motor Bosch Performance CX (4ª gen.) te ofrece asistencia hasta los 25 km/h con unos potentes 85 Nm. El motor más potente de Bosch está perfectamente integrado, la THRON² tiene un comportamiento muy equilibrado. ', '42000.00', 3),
(8, 'Focus Jarifa2 6.7 Nine 29″ negro (2023)', 'Bosch Smart system personalizable con motor performance cx, pantalla intuvia y batería de 625 wh. Geometría mtb preparada para la montaña con ruedas de 29″ (talla xs: 27,5″) y cambios shimano deore de 10 velocidades. Cómodo puesto de mandos y potencia', '36000.00', 3),
(9, 'Test', 'Test-Description', '298000.00', 2),
(10, 'BMC', 'Bici de Ruta', '998800.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta_talla`
--

CREATE TABLE `bicicleta_talla` (
  `idBicicleta` int(11) NOT NULL,
  `idTalla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `bicicleta_talla`
--

INSERT INTO `bicicleta_talla` (`idBicicleta`, `idTalla`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 4),
(3, 5),
(3, 6),
(4, 3),
(4, 4),
(4, 5),
(5, 3),
(5, 4),
(5, 5),
(6, 4),
(6, 5),
(6, 6),
(7, 3),
(7, 4),
(7, 5),
(9, 6),
(10, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
(1, 'BMX'),
(2, 'Carretera'),
(3, 'Eléctricas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `idTalla` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`idTalla`, `nombre`, `descripcion`) VALUES
(1, '5 a 8 años', 'Bicicleta infantil para edades entre 5 a 8 años'),
(2, '8 a 11 años', 'Bicicleta infantil para edades entre 8 a 11 años'),
(3, 'S', '15-16 pulgadas'),
(4, 'M', '17-18 pulgas'),
(5, 'L', '19-20 pulgadas'),
(6, 'XL', '21-22 pulgadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `rol_id` int(11) NOT NULL DEFAULT 2,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `rol_id`, `date_created`, `date_updated`) VALUES
(1, 'Usuario Administrador', 'admin@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 1, '2023-01-04 23:54:45', '2023-01-04 23:54:45'),
(2, 'Usuario 1', 'usuario1@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 2, '2023-01-23 21:54:45', '2023-01-23 21:54:45'),
(3, 'Usuario 2', 'usuario2@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 2, '2023-01-23 21:54:45', '2023-01-23 21:54:45'),
(4, 'NameN', 'namen@arroba.com', '$2y$10$6SGyS/VK9B8vENFyI5FlY.smffrk3VMNSKUEt/PdWWd4YKmOI0plu', 2, '2023-04-25 06:01:36', '2023-04-25 06:01:36');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`idAlquiler`),
  ADD KEY `fk_alquiler_usuario_idx` (`idUsuario`),
  ADD KEY `fk_alquiler_talla_idx` (`idTalla`),
  ADD KEY `fk_alquiler_bicicleta_idx` (`idBicicleta`);

--
-- Indices de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD PRIMARY KEY (`idBicicleta`),
  ADD KEY `fk_bicicleta_categoria_idx` (`idCategoria`);

--
-- Indices de la tabla `bicicleta_talla`
--
ALTER TABLE `bicicleta_talla`
  ADD PRIMARY KEY (`idBicicleta`,`idTalla`),
  ADD KEY `fk_bicicleta_talla_talla_idx` (`idTalla`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`idTalla`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`email`),
  ADD KEY `fk_user_rol_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `idAlquiler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  MODIFY `idBicicleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `idTalla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_alquiler_bicicleta` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_talla` FOREIGN KEY (`idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD CONSTRAINT `fk_bicicleta_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bicicleta_talla`
--
ALTER TABLE `bicicleta_talla`
  ADD CONSTRAINT `fk_bicicleta_talla_bicicleta` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bicicleta_talla_talla` FOREIGN KEY (`idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de datos: `clinica`
--
CREATE DATABASE IF NOT EXISTS `clinica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `clinica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `idAdgenda` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idCita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergia`
--

CREATE TABLE `alergia` (
  `idAlergia` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `alergia`
--

INSERT INTO `alergia` (`idAlergia`, `nombre`, `idCategoria`) VALUES
(1, 'Rinitis', 3),
(2, 'Asma', 3),
(3, 'Anafilaxia', 2),
(4, 'Alergia a la insulina', 2),
(5, 'Alergia al gluten', 1),
(6, 'Alergia Cutanea', 1),
(7, 'Semillas', 1),
(8, 'Voltaren', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergiaexpediente`
--

CREATE TABLE `alergiaexpediente` (
  `idAlergia` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `reaccion` varchar(100) NOT NULL,
  `observacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaalergia`
--

CREATE TABLE `categoriaalergia` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoriaalergia`
--

INSERT INTO `categoriaalergia` (`idCategoria`, `nombre`) VALUES
(1, 'Alimentos'),
(2, 'Medicamentos'),
(3, 'Ambiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cirugia`
--

CREATE TABLE `cirugia` (
  `idCirugia` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `lugar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`idCita`, `idMedico`, `fecha`, `hora`, `estado`) VALUES
(1, 2, '2023-05-01', '08:00:00', 'Disponible'),
(2, 2, '2023-05-01', '09:00:00', 'Disponible'),
(3, 2, '2023-05-01', '10:00:00', 'Disponible'),
(4, 2, '2023-05-02', '08:00:00', 'Disponible'),
(5, 2, '2023-05-02', '09:00:00', 'Disponible'),
(6, 2, '2023-05-02', '10:00:00', 'Disponible'),
(7, 2, '2023-05-03', '08:00:00', 'Disponible'),
(8, 2, '2023-05-03', '09:00:00', 'Disponible'),
(9, 2, '2023-05-03', '10:10:00', 'Disponible'),
(10, 2, '2023-05-04', '08:00:00', 'Disponible'),
(11, 2, '2023-05-04', '09:00:00', 'Disponible'),
(12, 2, '2023-05-04', '10:00:00', 'Disponible'),
(13, 2, '2023-05-05', '08:00:00', 'Disponible'),
(14, 2, '2023-05-05', '09:00:00', 'Disponible'),
(15, 2, '2023-05-05', '10:00:00', 'Disponible'),
(16, 2, '2023-05-06', '08:00:00', 'Disponible'),
(17, 2, '2023-05-06', '09:00:00', 'Disponible'),
(18, 2, '2023-05-06', '10:00:00', 'Disponible'),
(19, 2, '2023-05-01', '13:00:00', 'Disponible'),
(20, 2, '2023-05-02', '13:00:00', 'Disponible'),
(21, 2, '2023-05-02', '13:00:00', 'Disponible'),
(35, 2, '2023-04-13', '00:00:00', 'Cancelada'),
(36, 2, '2023-04-13', '00:00:00', 'Agendada'),
(40, 2, '2023-05-01', '00:00:00', 'Agendada'),
(42, 2, '0000-00-00', '00:00:00', 'Disponible'),
(43, 2, '0000-00-00', '00:00:00', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `idConsulta` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `ubicacion` varchar(200) NOT NULL,
  `precio` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`idConsulta`, `idMedico`, `idEspecialidad`, `ubicacion`, `precio`) VALUES
(1, 2, 1, 'Alajuela centro', '700000'),
(2, 34, 1, 'Alajuela', '15500'),
(3, 18, 4, 'Heredia Frente al Hospital', '40800'),
(6, 18, 4, 'Heredia Frente al Hospital', '40800'),
(9, 18, 2, 'Heredia Frente al Hospital', '40800'),
(12, 9, 2, 'Santo Domingp', '62500'),
(16, 9, 2, 'Santo Domingp', '62500'),
(21, 2, 3, 'Guadalupe', '12800'),
(22, 2, 3, 'Guadalupe', '12800'),
(23, 2, 3, 'Guadalupe', '12800'),
(24, 2, 3, 'Guadalupe', '12800'),
(25, 34, 3, 'Guadalupe', '12800');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `idEnfermedad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `enfermedad`
--

INSERT INTO `enfermedad` (`idEnfermedad`, `nombre`) VALUES
(1, 'Sinusitis'),
(2, 'Infección urinaria'),
(3, 'Resfriado'),
(4, 'Artritis'),
(5, 'Diabetes'),
(6, 'VIH/sida'),
(7, 'Presión arterial alta'),
(8, 'Mononucleosis'),
(9, 'Parkinson'),
(10, 'Diabetes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedadexpediente`
--

CREATE TABLE `enfermedadexpediente` (
  `idEnfermedad` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `nombre`) VALUES
(1, 'Consulta General'),
(2, 'Nutriología'),
(3, 'Pediatría'),
(4, 'Psiquiatría'),
(5, 'Neumología'),
(6, 'Urología'),
(7, 'Dermatología'),
(8, 'Ortopedia\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `idExpediente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `tipoSangre` varchar(11) NOT NULL,
  `lugarResidencia` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `contactoEmergencia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedienteacceso`
--

CREATE TABLE `expedienteacceso` (
  `idUsuario` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `estado` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL,
  `nombre` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`idMedicamento`, `nombre`) VALUES
(1, 'Diazepam'),
(2, 'Morfina'),
(3, 'Prometazina'),
(4, 'Ibuprofeno'),
(5, 'Penicilamina'),
(6, 'Dexametasona'),
(7, 'Famotidina'),
(8, 'Acetaminofen'),
(9, 'Aspirina'),
(10, 'Iberzartan'),
(11, 'Medikinert');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentoexpediente`
--

CREATE TABLE `medicamentoexpediente` (
  `idMedicamento` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Medico'),
(3, 'Paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `rol_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `cedula`, `name`, `apellido1`, `apellido2`, `email`, `password`, `sexo`, `rol_id`) VALUES
(1, '301640952', 'Lucia', 'Villareal', 'Mora', 'luciamora@hotmail.com', '123', 'Femenino', 3),
(2, '206790312', 'Lucas', 'Corrales', 'Varela', 'lucascorrales@hotmail.com', '123', 'Masculino', 2),
(3, '119660345', 'Karol', 'Blanco', 'Rodriguez', 'karolblanco@hotmail.com', '123', 'Femenino', 3),
(4, '205490587', 'Joaquin', 'Rojas', 'Torres', 'joselynrojas@gmail.com', '123', 'Masculino', 2),
(5, '4020200588', 'Beatriz', 'Tribinho', 'Samper', 'btrr@gmail.com', '$2y$10$x1e6/a4Tf74hQbHwSuqIpefsbhHkifWxKerf0o8MCru', 'Femenino', 3),
(6, '7020200588', 'Calcetin', 'Con', 'Rombos', 'parD@media.com', '$2y$10$dGaaI6hspaHpaX.FBqQ.4On93ytnniUKRnM0h1f.vkd', 'Intersexua', 3),
(7, '702330318', 'Mary', 'Christmas', 'Claus', 'north@frozen.com', '$2y$10$m/EPT65qRIe0Mfk9z2zEiOnbo6F3RVP1k7qerlT8Cif', 'Femenino', 3),
(8, '9000874516', 'Oso', 'Yogui', 'Bubu', 'yobu@park.com', '$2y$10$irrb96IhGAijLYX5k1STzeEjp9GgRdRKdLhbxf3dvP9', 'Femenino', 3),
(9, '123456789', 'Triz', 'Wolves', 'xxx', 'btr@exx.com', '$2y$10$WQn8w9urmbgT3TSjwVETe.xsqqGxW/1eEIAtG1W.x8l', 'Femenino', 3),
(10, '897236504', 'Sii', 'Funciona', 'Esta VIVO', 'frankein@stein.com', '$2y$10$zeipGBLk19G1Lcy/Rs22cuf0EwUg5QmMIilgeVXGMxO', 'Femenino', 3),
(11, '852147960', 'Fer', 'De La', 'Suerte', 'lobito@aullar.com', '$2y$10$0HGZF/rhqAi1QgclpyHujuyYRjDtgYsGwskW.fOq8Yh', 'Femenino', 3),
(12, '741023985', 'eft', 'Tubarao', 'Jacare', 'zoo@animal.com', '$2y$10$3zp6i7MT5NaXmBWEqD7uTO.CdZEv.eJyRtCmisHCZ4X', 'Femenino', 3),
(15, '7020200589', 'Trixzz', 'Dinclher', 'Ezkuanchy', 'success98@prueba.com', '123456', 'Masculino', 1),
(16, '900830494', 'Mary', 'Love', 'You', 'best@momy.com', '$2y$10$uBB/RvlVwLp7eZj5.RExT.GS1dohJjHEkt9sM/ZrIng', 'Femenino', 3),
(17, '123456789', 'Yen', 'Rod', 'God', 'yenkgr08@outlook.com', '$2y$10$0aa25VIn4lBGzsgviyUkouzcHCzSqyLuOUicQCwqjkkUGMkHeafIu', 'Femenino', 3),
(18, '9887513609', 'Anno', 'Nimmo', ' Ano-nimos', 'ass@asterisco.com', '123456', 'Femenino', 3),
(27, '4020200588', 'Beatriz', 'Samper', 'Samper', 'sam@per.com', '$2y$10$rJ4mPLperG0L.D3Op6d3qeobSm4pnegWB5A17NnUCadEB7ccQZ4PS', 'Femenino', 3),
(28, '702330318', 'Dankiss', 'Karin', 'Samper', 'yenkageereceroocho@bb.com', '$2y$10$/J0h4sZo8iPK9pk00weWQOO5uJuW/ggV4/epRy266HPvXvxAnVa/S', 'Femenino', 3),
(33, '702020058', 'admin', 'adminA1', 'adminA2', 'admin@admin.com', '$2y$10$t6f8hc3HkDphAVoUBVc6nOUEf/9F1rTQ3O9hUV9cl3WvuP48eraKm', 'Masculino', 1),
(34, '123654789', 'Medico', 'Medico', 'Medico', 'medico@patito.com', '$2y$10$.wZ2TzB.xyRmKXgF2LgyxeYHA42.ZRuKEjVQp.TljG9F1uX0woCae', 'N/R', 2),
(36, '897485155', 'SeJodio', 'Zassss', 'SoS', 'test@jmail.com', '$2y$10$/oWqC5gCp12bQxenUq.8UeCVexcZxZB/5M1HuYnYLoCX50a/2ok0G', 'Femenino', 3),
(37, '29183047109', 'Profee', 'Apellido', 'Villalobos', 'medico@correo.com', '123456', 'Femenino', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`idAdgenda`),
  ADD KEY `idCita` (`idCita`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- Indices de la tabla `alergia`
--
ALTER TABLE `alergia`
  ADD PRIMARY KEY (`idAlergia`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `alergiaexpediente`
--
ALTER TABLE `alergiaexpediente`
  ADD KEY `idAlergia` (`idAlergia`),
  ADD KEY `idExpediente` (`idExpediente`);

--
-- Indices de la tabla `categoriaalergia`
--
ALTER TABLE `categoriaalergia`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cirugia`
--
ALTER TABLE `cirugia`
  ADD PRIMARY KEY (`idCirugia`),
  ADD KEY `idExpediente` (`idExpediente`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idMedico` (`idMedico`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`idConsulta`),
  ADD KEY `idEspecialidad` (`idEspecialidad`),
  ADD KEY `idMedico` (`idMedico`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`idEnfermedad`);

--
-- Indices de la tabla `enfermedadexpediente`
--
ALTER TABLE `enfermedadexpediente`
  ADD KEY `idEnfermedad` (`idEnfermedad`),
  ADD KEY `idExpediente` (`idExpediente`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`idExpediente`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `expedienteacceso`
--
ALTER TABLE `expedienteacceso`
  ADD PRIMARY KEY (`idUsuario`,`idExpediente`),
  ADD KEY `idExpediente` (`idExpediente`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idMedicamento`);

--
-- Indices de la tabla `medicamentoexpediente`
--
ALTER TABLE `medicamentoexpediente`
  ADD KEY `idMedicamento` (`idMedicamento`),
  ADD KEY `idExpediente` (`idExpediente`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `idTipo` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `idAdgenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alergia`
--
ALTER TABLE `alergia`
  MODIFY `idAlergia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categoriaalergia`
--
ALTER TABLE `categoriaalergia`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `idEnfermedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `idExpediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`idCita`) REFERENCES `cita` (`idCita`),
  ADD CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `alergia`
--
ALTER TABLE `alergia`
  ADD CONSTRAINT `alergia_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoriaalergia` (`idCategoria`);

--
-- Filtros para la tabla `alergiaexpediente`
--
ALTER TABLE `alergiaexpediente`
  ADD CONSTRAINT `alergiaexpediente_ibfk_1` FOREIGN KEY (`idAlergia`) REFERENCES `alergia` (`idAlergia`),
  ADD CONSTRAINT `alergiaexpediente_ibfk_3` FOREIGN KEY (`idExpediente`) REFERENCES `expediente` (`idExpediente`);

--
-- Filtros para la tabla `cirugia`
--
ALTER TABLE `cirugia`
  ADD CONSTRAINT `cirugia_ibfk_1` FOREIGN KEY (`idExpediente`) REFERENCES `expediente` (`idExpediente`);

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`idMedico`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `enfermedadexpediente`
--
ALTER TABLE `enfermedadexpediente`
  ADD CONSTRAINT `enfermedadexpediente_ibfk_1` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`),
  ADD CONSTRAINT `enfermedadexpediente_ibfk_2` FOREIGN KEY (`idExpediente`) REFERENCES `expediente` (`idExpediente`);

--
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `expedienteacceso`
--
ALTER TABLE `expedienteacceso`
  ADD CONSTRAINT `expedienteacceso_ibfk_1` FOREIGN KEY (`idExpediente`) REFERENCES `expediente` (`idExpediente`),
  ADD CONSTRAINT `expedienteacceso_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `medicamentoexpediente`
--
ALTER TABLE `medicamentoexpediente`
  ADD CONSTRAINT `medicamentoexpediente_ibfk_1` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamento` (`idMedicamento`),
  ADD CONSTRAINT `medicamentoexpediente_ibfk_2` FOREIGN KEY (`idExpediente`) REFERENCES `expediente` (`idExpediente`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);
--
-- Base de datos: `clinica_web_db`
--
CREATE DATABASE IF NOT EXISTS `clinica_web_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `clinica_web_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `idCatAlergia` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaalergia`
--

CREATE TABLE `categoriaalergia` (
  `idCatAlergia` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cirugias`
--

CREATE TABLE `cirugias` (
  `idCirugia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `donde` varchar(50) NOT NULL,
  `idExpediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `idEnfermedad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedadexpediente`
--

CREATE TABLE `enfermedadexpediente` (
  `idEnfermedad` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `observaciones` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `idExpediente` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `tipoSamgre` varchar(10) NOT NULL,
  `lugarResidencia` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `contactoEmergencias` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedienteacceso`
--

CREATE TABLE `expedienteacceso` (
  `idUsuario` int(11) NOT NULL,
  `idExpendiente` int(11) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `idMedicamento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentosexpediente`
--

CREATE TABLE `medicamentosexpediente` (
  `idMedicamento` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`idCatAlergia`);

--
-- Indices de la tabla `categoriaalergia`
--
ALTER TABLE `categoriaalergia`
  ADD PRIMARY KEY (`idCatAlergia`);

--
-- Indices de la tabla `cirugias`
--
ALTER TABLE `cirugias`
  ADD UNIQUE KEY `idCirugia` (`idCirugia`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD UNIQUE KEY `idEnfermedad` (`idEnfermedad`);

--
-- Indices de la tabla `enfermedadexpediente`
--
ALTER TABLE `enfermedadexpediente`
  ADD UNIQUE KEY `idEnfermedad` (`idEnfermedad`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD UNIQUE KEY `idExpediente` (`idExpediente`);

--
-- Indices de la tabla `expedienteacceso`
--
ALTER TABLE `expedienteacceso`
  ADD PRIMARY KEY (`idUsuario`,`idExpendiente`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD UNIQUE KEY `idMedicamento` (`idMedicamento`);

--
-- Indices de la tabla `medicamentosexpediente`
--
ALTER TABLE `medicamentosexpediente`
  ADD UNIQUE KEY `idMedicamento` (`idMedicamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `idCatAlergia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoriaalergia`
--
ALTER TABLE `categoriaalergia`
  MODIFY `idCatAlergia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cirugias`
--
ALTER TABLE `cirugias`
  MODIFY `idCirugia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `idEnfermedad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enfermedadexpediente`
--
ALTER TABLE `enfermedadexpediente`
  MODIFY `idEnfermedad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expediente`
--
ALTER TABLE `expediente`
  MODIFY `idExpediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentosexpediente`
--
ALTER TABLE `medicamentosexpediente`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `moviedb`
--
CREATE DATABASE IF NOT EXISTS `moviedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `moviedb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`id`, `fname`, `lname`) VALUES
(1, 'Sam', 'Worthington'),
(2, 'Zoe', 'Saldana'),
(3, 'Sigourney', 'Weaver'),
(4, 'Tom', 'Cruise'),
(5, 'Miles', 'Teller'),
(6, 'Jennifer', 'Connelly'),
(7, 'Jon', 'Hamm'),
(8, 'Letitia', 'Wright'),
(9, 'Lupita', 'Nyongo'),
(10, 'Danai', 'Gurira'),
(11, 'Tim', 'Robbins'),
(12, 'Morgan', 'Freeman'),
(13, 'Bob\r\n\r\n', 'Gunton'),
(14, 'Chris', 'Pratt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`id`, `title`) VALUES
(1, 'Aventura'),
(2, 'Acción'),
(3, 'Ciencia Ficción'),
(4, 'Comedia'),
(5, 'Drama'),
(6, 'Fantasía'),
(7, 'Musical'),
(8, 'Terror');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `year` smallint(4) UNSIGNED NOT NULL,
  `time` tinyint(4) UNSIGNED NOT NULL,
  `lang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`id`, `title`, `year`, `time`, `lang`) VALUES
(1, 'Top Gun: Maverick', 2022, 130, 'Inglés'),
(2, 'Avatar', 2009, 162, 'Inglés'),
(3, 'Black Panther: Wakanda Forever', 2022, 161, 'Inglés'),
(4, 'Cadena perpetua', 1994, 142, 'Inglés'),
(5, 'Guardianes de la Galaxia', 2014, 121, 'Inglés'),
(12, 'Demonio BE', 1995, 80, 'Ingles'),
(13, 'DEMONIO DANKY', 1995, 255, 'Monstruso'),
(14, 'Titulo', 2222, 255, 'Thai');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_cast`
--

CREATE TABLE `movie_cast` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `movie_cast`
--

INSERT INTO `movie_cast` (`actor_id`, `movie_id`, `role`) VALUES
(1, 2, 'Jake Sully'),
(2, 2, 'Neytiri Sully'),
(2, 5, 'Gamora'),
(2, 13, 'Princess'),
(3, 2, 'Doctora Grace Augustine'),
(4, 1, 'Pete Mitchell'),
(5, 1, 'Bradley Bradshaw'),
(6, 1, 'Penny Benjamin'),
(7, 1, 'Beau Simpson'),
(8, 3, 'Shuri'),
(8, 12, 'Activa'),
(8, 14, 'Ninguno'),
(9, 3, 'Nakia'),
(10, 3, 'Okoye'),
(11, 4, 'Andy Dufresne'),
(12, 4, 'Ellis Boyd, Red'),
(13, 4, 'Warden Notron'),
(14, 5, 'Peter Quill');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_genre`
--

CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `movie_genre`
--

INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1, 2),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(3, 1),
(3, 2),
(3, 5),
(4, 5),
(5, 1),
(5, 2),
(5, 4),
(12, 5),
(12, 8),
(13, 1),
(13, 5),
(13, 6),
(14, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rating`
--

CREATE TABLE `rating` (
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stars` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rating`
--

INSERT INTO `rating` (`movie_id`, `user_id`, `stars`) VALUES
(1, 1, 4),
(1, 2, 4),
(2, 1, 3),
(2, 2, 4),
(3, 1, 5),
(3, 2, 4),
(4, 1, 3),
(4, 2, 4),
(5, 1, 4),
(5, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `rol_id` int(11) NOT NULL DEFAULT 2,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `rol_id`, `date_created`, `date_updated`) VALUES
(1, 'Prueba Usuario1', 'prueba-usuario1@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 1, '2023-01-04 17:54:45', '2023-01-04 17:54:45'),
(2, 'Prueba Usuario2', 'prueba-usuario2@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 2, '2023-01-23 15:54:45', '2023-01-23 15:54:45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`actor_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indices de la tabla `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indices de la tabla `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`movie_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`email`),
  ADD KEY `fk_user_rol_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Filtros para la tabla `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Filtros para la tabla `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"clinica\",\"table\":\"consulta\"},{\"db\":\"clinica\",\"table\":\"user\"},{\"db\":\"biclicletadb\",\"table\":\"user\"},{\"db\":\"clinica\",\"table\":\"usuario\"},{\"db\":\"clinica\",\"table\":\"rol\"},{\"db\":\"clinica\",\"table\":\"tipousuario\"},{\"db\":\"clinica\",\"table\":\"userrr\"},{\"db\":\"clinica_web_db\",\"table\":\"alergias\"},{\"db\":\"clinica_web_db\",\"table\":\"alergiasexpediente\"},{\"db\":\"clinica_web_db\",\"table\":\"alergiasExpediente\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'clinica', 'user', '{\"sorted_col\":\"`usuario`.`contrasenha` ASC\"}', '2023-04-25 07:50:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-04-26 04:55:46', '{\"Console\\/Mode\":\"show\",\"lang\":\"es\",\"Console\\/Height\":261.9981,\"NavigationWidth\":297}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tourdb`
--
CREATE DATABASE IF NOT EXISTS `tourdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tourdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `nombre`, `date_updated`, `date_created`) VALUES
(1, 'Desayuno', '2023-04-17 20:46:18', '2023-04-17 20:46:18'),
(2, 'Almuerzo', '2023-04-17 20:46:18', '2023-04-17 20:46:18'),
(3, 'Transporte ida y regreso', '2023-04-17 20:46:18', '2023-04-17 20:46:18'),
(4, 'Guía', '2023-04-17 20:46:18', '2023-04-17 20:46:18'),
(5, 'Entrada(s)', '2023-04-17 20:46:18', '2023-04-17 20:46:18'),
(6, 'Equipo', '2023-04-17 20:46:18', '2023-04-17 20:46:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristica_tour`
--

CREATE TABLE `caracteristica_tour` (
  `tour_id` int(11) NOT NULL,
  `caracteristica_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `caracteristica_tour`
--

INSERT INTO `caracteristica_tour` (`tour_id`, `caracteristica_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 3),
(4, 4),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `date_updated`, `date_created`) VALUES
(1, 'Excursión', '2023-04-17 20:45:33', '2023-04-17 20:45:33'),
(2, 'Naturaleza', '2023-04-17 20:45:33', '2023-04-17 20:45:33'),
(3, 'Mar', '2023-04-17 20:45:33', '2023-04-17 20:45:33'),
(4, 'Familiar', '2023-04-17 20:45:33', '2023-04-17 20:45:33'),
(5, 'Cultural', '2023-04-17 20:45:33', '2023-04-17 20:45:33'),
(6, 'Aventura', '2023-04-17 20:45:33', '2023-04-17 20:45:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidadDias` tinyint(4) NOT NULL,
  `precioPersona` decimal(18,2) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tours`
--

INSERT INTO `tours` (`id`, `nombre`, `descripcion`, `cantidadDias`, `precioPersona`, `tipo_id`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 'Combo Tour: Tour de Café Doka, Volcán Poas y Jardín de Cataratas La Paz', 'La estadía total dentro del Parque Nacional Volcán Poás será de 40 minutos: 10 minutos en la caminata hacia el mirador del cráter, 20 minutos de permanencia el mirador y 10 minutos en la caminata de salida. No hay acceso a la Laguna Botos y en caso de neblina, no hay tiempo extra de espera como en el pasado.Camino al Volcán Poás visitaremos la Plantación de Café Doka, para degustar de un delicioso desayuno y una visita guiada por la plantación de café donde aprenderemos sobre las actuales y antiguas técnicas usadas por expertos para procesar nuestro grano de oro, y producir uno de los mejores cafés de Costa Rica.', 1, '50.00', 1, 1, '2023-04-17 20:44:37', '2023-04-17 20:44:37'),
(2, 'Combo de Aventura', 'Costa Rica ofrece una experiencia única de navegación por los rápidos, así como fascinantes tours de canopy sobre las copas de los árboles. Ahora usted puede disfrutar de ambas actividades en una extraordinaria combinación de aventuras, mientras descubre las maravillas de Sarapiquí; territorio ubicado en la zona noreste del país, con abundantes ríos de aguas cristalinas, bosques tropicales y gente laboriosa y amigable que habita y embellece el lugar.', 1, '115.00', 6, 3, '2023-04-17 20:44:37', '2023-04-17 20:44:37'),
(3, 'Parque Nacional Manuel Antonioo', 'Relájese disfrute de la Playa y la Naturaleza.Este parque nacional está considerado como uno de los más bellos del país.La combinación de una paradisíaca playa de aguas cristalinas con bancos de coral, bordeada por una exuberante vegetación y los encantos naturales del bosque tropical húmedo. Sus playas se cuentan entre las mejores del país, donde el buceo y el surf son muy populares.', 1, '150.00', 2, 1, '2023-04-17 20:44:37', '2023-04-17 20:44:37'),
(4, 'Expedición Tropical con Monteverde', '7 noches de hospedaje (habitación estándar, desayuno e impuestos incluidos)', 8, '1000.00', 3, 3, '2023-04-17 20:44:37', '2023-04-17 20:44:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `rol_id` int(11) NOT NULL DEFAULT 2,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `rol_id`, `date_created`, `date_updated`) VALUES
(1, 'Administrador 1', 'admin1@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 1, '2023-04-17 20:52:09', '2023-04-17 20:52:09'),
(2, 'Usuario 2', 'usuario2@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 2, '2023-04-17 20:52:09', '2023-04-17 20:52:09'),
(3, 'Administrador 2', 'admin2@prueba.com', '$2y$10$1ueeLDj8HL5ghcusBD/byOYhlcDBSiailMADfTkQ76dgU4IevRmNK', 1, '2023-04-17 20:52:09', '2023-04-17 20:52:09'),
(4, 'Nombre', 'yendri.gonzalez.08@gmail.com', '$2y$10$2FIONxFUyU64lBvXsmyOqeSfRYAz.OWFvZOyWbWMqZTMaNu5sDLX.', 2, '2023-04-24 20:06:28', '2023-04-24 20:06:28'),
(5, 'Test00', 'test00@gmail.com', '$2y$10$TbfJ34/YeTF1padVKm7ueuM9HPYbYYwQzW419U9egvtNzCbFbXaua', 2, '2023-04-24 20:33:13', '2023-04-24 20:33:13'),
(6, 'Be', 'admin@prueba.com', '$2y$10$atldf5oMUFlENdKRDiosgec3UowJK1qtR/r7G2UvIajZxHbfaK06K', 2, '2023-04-24 20:59:55', '2023-04-24 20:59:55'),
(7, 'name2', 'name2@nam.com', '$2y$10$nt.LSqJ3bf8znST10WcZPONOwcu7FNIZA24sQ3b3TTliSn71301Cm', 2, '2023-04-24 21:12:49', '2023-04-24 21:12:49');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caracteristica_tour`
--
ALTER TABLE `caracteristica_tour`
  ADD PRIMARY KEY (`tour_id`,`caracteristica_id`),
  ADD KEY `fk_caracteristica_tour_caracteristicas` (`caracteristica_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tours_tipos` (`tipo_id`),
  ADD KEY `fk_tours_user` (`user_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`email`),
  ADD KEY `fk_user_rol_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caracteristica_tour`
--
ALTER TABLE `caracteristica_tour`
  ADD CONSTRAINT `fk_caracteristica_tour_caracteristicas` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caracteristica_tour_tours` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `fk_tours_tipos` FOREIGN KEY (`tipo_id`) REFERENCES `tipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tours_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
