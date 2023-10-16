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
DROP DATABASE IF EXISTS licoreria;
CREATE DATABASE licoreria;
USE licoreria;

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

-- Inserta 50 registros adicionales con datos aleatorios en la tabla `bebida`
INSERT INTO `bebida` (`cod`, `nom`, `descrip`, `precio`, `foto`) VALUES
('C0003', 'Cerveza Modelo', 'Modelo Especial 6 Pack Botella 355ml', RAND() * 50 + 10, 'C0003.png'),
('C0004', 'Cerveza Guinness', 'Guinness Draught 6 Pack Lata 440ml', RAND() * 50 + 10, 'C0004.png'),
('W0002', 'Jack Daniel\'s', 'Jack Daniel\'s Tennessee Whiskey 750ml', RAND() * 100 + 50, 'W0002.jpg'),
('C0005', 'Cerveza Budweiser', 'Budweiser 6 Pack Botella 355ml', RAND() * 50 + 10, 'C0005.png'),
('C0006', 'Cerveza Red Stripe', 'Red Stripe Lager 6 Pack Lata 330ml', RAND() * 50 + 10, 'C0006.png'),
('W0003', 'Glenfiddich', 'Glenfiddich 12 Year Old 750ml', RAND() * 100 + 50, 'W0003.jpg'),
('C0007', 'Cerveza Amstel', 'Amstel Lager 6 Pack Botella 330ml', RAND() * 50 + 10, 'C0007.png'),
('C0008', 'Cerveza Dos Equis', 'Dos Equis Amber 6 Pack Botella 355ml', RAND() * 50 + 10, 'C0008.png'),
('W0004', 'Jameson', 'Jameson Irish Whiskey 750ml', RAND() * 100 + 50, 'W0004.jpg'),

('C0050', 'Cerveza Coors Light', 'Coors Light 6 Pack Lata 355ml', RAND() * 50 + 10, 'C0050.png');


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
('11111111', 'Abdeslam Gomez Perez', 'abdesGo', '123', 987769009, 'abdesGo@gmail.com', 'calle Toronto 301 - Chacarilla', '../otros recursos/USUARIOS/cap1.png'),
('11112222', 'Luisa Martínez', 'luisam', 'luisapass', 1122334455, 'luisa@example.com', 'Calle de los Pájaros 789', 'luisa.jpg'),
('33334444', 'Andrés Ramírez', 'andresr', 'andres123', 3344556677, 'andres@example.com', 'Avenida de las Flores 456', 'andres.jpg'),
('55556666', 'Sofía Pérez', 'sofiap', 'sofiapass', 5566778899, 'sofia@example.com', 'Calle de las Palmeras 123', 'sofia.jpg'),
('77778888', 'Miguel González', 'miguelg', 'miguelpass', 7788990011, 'miguel@example.com', 'Avenida de los Ríos 234', 'miguel.jpg'),
('99990000', 'Valentina López', 'valentinal', 'valentina123', 9900112233, 'valentina@example.com', 'Calle de las Estrellas 567', 'valentina.jpg'),
('12121212', 'Joaquín Sánchez', 'joaquins', 'joaquinspass', 1212123456, 'joaquin@example.com', 'Avenida de las Montañas 890', 'joaquin.jpg'),
('34343434', 'Camila Rodríguez', 'camilar', 'camilapass', 3434345678, 'camila@example.com', 'Calle de los Bosques 345', 'camila.jpg'),
('56565656', 'Diego Fernández', 'diegof', 'diegofpass', 5656567890, 'diego@example.com', 'Avenida de los Lagos 456', 'diego.jpg'),
('78787878', 'Isabella Pérez', 'isabellap', 'isabella123', 7878790012, 'isabella@example.com', 'Calle de los Ríos 789', 'isabella.jpg'),
('90909090', 'Daniel Martínez', 'danield', 'danielpass', 9090912234, 'daniel@example.com', 'Avenida de las Playas 123', 'daniel.jpg'),
('12345678', 'Juan Pérez', 'juanperez', 'password123', 987654321, 'juan@example.com', 'Calle Principal 123', 'juan.jpg'),
('87654321', 'María García', 'mariagarcia', 'maria1234', 123456789, 'maria@example.com', 'Avenida Secundaria 456', 'maria.jpg'),
('98765432', 'Carlos Rodríguez', 'carlosr', 'qwerty', 456789123, 'carlos@example.com', 'Calle Nueva 789', 'carlos.jpg'),
('23456789', 'Laura González', 'laurag', 'laurapass', 789123456, 'laura@example.com', 'Avenida Principal 567', 'laura.jpg'),
('34567890', 'Pedro López', 'pedrolopez', 'password456', 345678912, 'pedro@example.com', 'Calle Secundaria 890', 'pedro.jpg'),
('65432109', 'Ana Martínez', 'anam', 'ana123', 210987654, 'ana@example.com', 'Avenida Nueva 234', 'ana.jpg'),
('43210987', 'Javier Sánchez', 'javiers', 'javipass', 109876543, 'javier@example.com', 'Calle Principal 567', 'javier.jpg'),
('76543210', 'Sara Fernández', 'saraf', 'sara456', 765432109, 'sara@example.com', 'Avenida Secundaria 890', 'sara.jpg'),
('54321098', 'Manuel Pérez', 'manuelp', 'password789', 432109876, 'manuel@example.com', 'Calle Nueva 123', 'manuel.jpg'),
('89012345', 'Elena Rodríguez', 'elenar', 'elenapass', 901234567, 'elena@example.com', 'Avenida Principal 456', 'elena.jpg');

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

CREATE TABLE `reclamos` (
  `nom` varchar(40) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `dir` varchar(60) NOT NULL,
  `telef` int(11) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descrip` varchar(70) NOT NULL,
  `solucion` varchar(70) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
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
