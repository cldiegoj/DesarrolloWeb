-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2023 a las 08:40:36
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `licoreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebida`
--

CREATE TABLE `bebida` (
  `cod` varchar(5) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `descrip` varchar(30) NOT NULL,
  `precio` double NOT NULL,
  `foto` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bebida`
--

INSERT INTO `bebida` (`cod`, `nom`, `descrip`, `precio`, `foto`) VALUES
('C0001', 'Cerveza Corona', 'CORONA Extra 6 Pack Lata 355ml', 23.9, 'C0001.png'),
('C0002', 'Cerveza Pilsen', '6 Pack Pilsen 310ml', 25.9, 'C0002.png'),
('W0001', 'Johnnie Walker', 'Johnnie Walker Blue Label 750m', 1206.6, 'W0001.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bed_env`
--

CREATE TABLE `bed_env` (
  `pedido` int(11) DEFAULT NULL,
  `envio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `dni` varchar(8) NOT NULL,
  `apelnom` varchar(40) NOT NULL,
  `licencia` varchar(10) NOT NULL,
  `foto` varchar(30) NOT NULL,
  `vehiculo` varchar(7) NOT NULL,
  `sucursal` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`dni`, `apelnom`, `licencia`, `foto`, `vehiculo`, `sucursal`) VALUES
('11111111', 'Maximiliano Coca Choque', 'Q11111111', 'imagenes/11111111.jpg', 'A9Y-326', 'S0001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id` int(11) NOT NULL,
  `cost_env` double NOT NULL,
  `cost_total` double NOT NULL,
  `h_env` time NOT NULL,
  `h_rec` time DEFAULT NULL,
  `estado` varchar(8) NOT NULL,
  `conductor` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `n_pedido` int(11) NOT NULL,
  `cost_acum` double NOT NULL,
  `cant` int(11) NOT NULL,
  `cliente` varchar(8) NOT NULL,
  `bebida` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_lugar` varchar(5) NOT NULL,
  `dtto` varchar(15) NOT NULL,
  `calle` varchar(15) NOT NULL,
  `ciudad` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_lugar`, `dtto`, `calle`, `ciudad`) VALUES
('S0001', 'La_Victoria', 'Balconcillo', 'Lima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `dni` varchar(8) NOT NULL,
  `apelnom` varchar(40) NOT NULL,
  `usrname` varchar(15) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `telef` int(11) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `dir` varchar(40) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`dni`, `apelnom`, `usrname`, `pass`, `telef`, `correo`, `dir`, `foto`) VALUES
('04427715', 'Juancholagarto', 'jl', '1111', 1977, 'aaaa@gmail.com', 'aaaa', 'pelado.jpg'),
('11111111', 'Abdeslam Gomez Perez', 'abdesGo', '123', 987769009, 'abdesGo@gmail.com', 'calle Toronto 301 - Chacarilla', '../otros recursos/USUARIOS/cap1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `placa` varchar(7) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `f_rev` date NOT NULL,
  `f_soat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`placa`, `marca`, `f_rev`, `f_soat`) VALUES
('A9Y-326', 'Suzuki', '2023-06-02', '2023-01-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bebida`
--
ALTER TABLE `bebida`
  ADD PRIMARY KEY (`cod`);

--
-- Indices de la tabla `bed_env`
--
ALTER TABLE `bed_env`
  ADD KEY `bebida` (`pedido`),
  ADD KEY `envio` (`envio`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `vehiculo` (`vehiculo`),
  ADD KEY `sucursal` (`sucursal`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conductor` (`conductor`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`n_pedido`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `bebida` (`bebida`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `n_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bed_env`
--
ALTER TABLE `bed_env`
  ADD CONSTRAINT `bed_env_ibfk_1` FOREIGN KEY (`envio`) REFERENCES `envio` (`id`),
  ADD CONSTRAINT `bed_env_ibfk_2` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`n_pedido`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`conductor`) REFERENCES `conductor` (`dni`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`bebida`) REFERENCES `bebida` (`cod`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_lugar`) REFERENCES `conductor` (`sucursal`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `conductor` (`vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
