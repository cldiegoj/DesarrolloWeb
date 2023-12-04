DROP DATABASE IF EXISTS licoreria2;
CREATE DATABASE licoreria2;
USE licoreria2;



CREATE TABLE `bebida` (
  `beb_cod` char(5) NOT NULL PRIMARY KEY,
  `beb_nom` varchar(45) NOT NULL,
  `beb_des` varchar(45) NOT NULL,
  `beb_pre` double NOT NULL,
  `beb_stk` int NOT NULL,
  `beb_foto` varchar(40) NOT NULL,
  `cat_cod` char(5) NOT NULL,
  `pro_cod` char(5) NOT NULL
);



CREATE TABLE `proveedor` (
  `pro_cod` char(5) NOT NULL PRIMARY KEY,
  `pro_nom` varchar(45) NOT NULL,
  `pro_ruc` char(11) NOT NULL
);



CREATE TABLE `categoria` (
  `cat_cod` char(5) NOT NULL PRIMARY KEY,
  `cat_nom` varchar(45) NOT NULL,
  `cat_des` varchar(80) NOT NULL,
  `cat_img` varchar(60) NOT NULL
);


CREATE TABLE `fac_cabe` (
  `fac_num` char(5) NOT NULL PRIMARY KEY,
  `fac_fec` datetime NOT NULL,
  `id_usuario` varchar(8) NOT NULL,
  `mtotal` decimal(10,0) NOT NULL,
  `vec_cod` char(5) NOT NULL
);



CREATE TABLE `fac_deta` (
  `fac_num` char(5) NOT NULL PRIMARY KEY,
  `beb_cod` char(5) NOT NULL,
  `beb_can` int NOT NULL
);



CREATE TABLE `usuario` (
  `id_usuario` char(5) NOT NULL PRIMARY KEY,
  `dni` varchar(8) NOT NULL,
  `apelnom` varchar(45) NOT NULL,
  `usrname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `telef` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `dir` varchar(45) NOT NULL,
  `categoria` int(1) NOT NULL
);

CREATE TABLE `reclamos` (
  `rec_cod` char(5) NOT NULL PRIMARY KEY,
  `id_usuario` varchar(8) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `descrip` varchar(45) NOT NULL,
  `solucion` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
);



CREATE TABLE `vehiculo` (
  `vec_cod` char(5) NOT NULL PRIMARY KEY,
  `vec_placa` varchar(7) NOT NULL,
  `vec_marca` varchar(45) NOT NULL,
  `vec_soat` date NOT NULL,
  `con_cod` int
);



CREATE TABLE `conductor` (
  `con_cod` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `con_nom` varchar(45) NOT NULL,
  `con_ape` varchar(45) NOT NULL,
  `con_lic` varchar(10) NOT NULL,
  `con_foto` varchar(60) NOT NULL,
  `con_edad` int NOT NULL
);

ALTER TABLE `bebida`
ADD CONSTRAINT `fk_bebida_categoria` FOREIGN KEY (`cat_cod`) REFERENCES `categoria` (`cat_cod`);

ALTER TABLE `bebida`
ADD CONSTRAINT `fk_bebida_proveedor` FOREIGN KEY (`pro_cod`) REFERENCES `proveedor` (`pro_cod`);

ALTER TABLE `fac_deta`
ADD CONSTRAINT `fk_facdeta_faccabe` FOREIGN KEY (`fac_num`) REFERENCES `fac_cabe` (`fac_num`);

ALTER TABLE `fac_deta`
ADD CONSTRAINT `fk_facdeta_bebida` FOREIGN KEY (`beb_cod`) REFERENCES `bebida` (`beb_cod`);

ALTER TABLE `reclamos` ADD CONSTRAINT `fk_reclamos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);



ALTER TABLE `fac_cabe`
ADD CONSTRAINT `fk_faccabe_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `fac_cabe`
ADD CONSTRAINT `fk_faccabe_vehiculo` FOREIGN KEY (`vec_cod`) REFERENCES `vehiculo` (`vec_cod`);

ALTER TABLE `vehiculo`
ADD CONSTRAINT `fk_vehiculo_conductor` FOREIGN KEY (`con_cod`) REFERENCES `conductor` (`con_cod`) ON DELETE CASCADE;


--
-- INSERT DE DATOS
--

INSERT INTO categoria VALUES('C0001','Vinos','Bebidas alcoholicas hechas a base de uva','C0001');
INSERT INTO categoria VALUES('C0002','Espumantes','Vinos con gas disuelto','C0002');
INSERT INTO categoria VALUES('C0003','Whiskys','Bebidas alcoholicas proveniente de maltas fermentadas','C0003');
INSERT INTO categoria VALUES('C0004','Tequilas','Bebidas alcoholicas obtenidas del destilado','C0004');
INSERT INTO categoria VALUES('C0005','Rones','Bebidas alcoholicas elaboradas de melaza destilada','C0005');
INSERT INTO categoria VALUES('C0006','Vermouths','Licores aromatizados con hierbas','C0006');
INSERT INTO categoria VALUES('C0007','Vodkas','Bebidas destiladas de origen ruso','C0007');
INSERT INTO categoria VALUES('C0008','Gins','Destilados neutros de grano con frutas, semillas y especias','C0008');
INSERT INTO categoria VALUES('C0009','Piscos','Aguardiente obtenido de destilacion de uvas','C0009');
INSERT INTO categoria VALUES('C0010','Otros Licores','Otras bebidas alcoholicas','C0010');
INSERT INTO categoria VALUES('C0011','Extras','Bebidas alcoholicas extras','C0011');

INSERT INTO `usuario` (`id_usuario`, `dni`, `apelnom`, `usrname`, `pass`, `telef`, `correo`, `dir`, `categoria`) VALUES
('04427715', 'Juancholagarto', 'jl', '1111', '1977', 'aaaa@gmail.com', 'aaaa', 'pelado.jpg', 1),
('11111111', 'Abdeslam Gomez Perez', 'abdesGo', '123', '987769009', 'abdesGo@gmail.com', 'calle Toronto 301 - Chacarilla', '../otros recursos/USUARIOS/cap1.png',1);


INSERT INTO proveedor VALUES('P0001','BACKUS (Cristal)','12345678891');
INSERT INTO proveedor VALUES('P0002','Johnnie Walker','92831906212');
INSERT INTO proveedor VALUES('P0003','Penfolds','72359312742');
INSERT INTO proveedor VALUES('P0004','19Crimes','92327358428');
INSERT INTO proveedor VALUES('P0005', 'Bacardi', '54238912876');
INSERT INTO proveedor VALUES('P0006', 'Moët & Chandon', '67238791289');
INSERT INTO proveedor VALUES('P0007', 'Jose Cuervo', '41237891234');
INSERT INTO proveedor VALUES('P0008', 'Absolut', '12837691245');
INSERT INTO proveedor VALUES('P0009', 'Jack Daniel\'s', '89372198672');
INSERT INTO proveedor VALUES('P0010', 'Smirnoff', '73428931287');
INSERT INTO proveedor VALUES('P0011', 'Patrón', '92172389216');
INSERT INTO proveedor VALUES('P0012', 'Hennessy', '78236798124');
INSERT INTO proveedor VALUES('P0013', 'Jameson', '83492387129');
INSERT INTO proveedor VALUES('P0014', 'Coca-Cola', '12347298125');


-- Categoría: Vinos
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0001', 'Vino Tinto 1', 'Vino tinto de la región de Bordeaux', 29.99, 50, 'vino_tinto_1.jpg', 'C0001', 'P0001'),
('B0002', 'Vino Tinto 2', 'Vino tinto de la región de Borgoña', 34.99, 40, 'vino_tinto_2.jpg', 'C0001', 'P0002'),
('B0003', 'Vino Blanco 1', 'Vino blanco fresco y afrutado', 19.99, 60, 'vino_blanco_1.jpg', 'C0001', 'P0003'),
('B0004', 'Vino Blanco 2', 'Vino blanco seco de alta calidad', 24.99, 55, 'vino_blanco_2.jpg', 'C0001', 'P0004'),
('B0005', 'Vino Rosado 1', 'Vino rosado suave y afrutado', 17.99, 70, 'vino_rosado_1.jpg', 'C0001', 'P0005'),
('B0006', 'Vino Rosado 2', 'Vino rosado seco y refrescante', 21.99, 65, 'vino_rosado_2.jpg', 'C0001', 'P0006'),
('B0007', 'Malbec 1', 'Vino Malbec argentino', 27.99, 50, 'malbec_1.jpg', 'C0001', 'P0007'),
('B0008', 'Malbec 2', 'Vino Malbec chileno', 26.99, 45, 'malbec_2.jpg', 'C0001', 'P0008'),
('B0009', 'Merlot 1', 'Vino Merlot suave y afrutado', 23.99, 60, 'merlot_1.jpg', 'C0001', 'P0009'),
('B0010', 'Merlot 2', 'Vino Merlot envejecido', 31.99, 40, 'merlot_2.jpg', 'C0001', 'P0010');

-- Categoría: Espumantes
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0011', 'Espumante Brut 1', 'Espumante brut de alta calidad', 19.99, 30, 'espumante_brut_1.jpg', 'C0002', 'P0001'),
('B0012', 'Espumante Brut 2', 'Espumante brut premium', 22.99, 25, 'espumante_brut_2.jpg', 'C0002', 'P0002'),
('B0013', 'Champagne Extra Brut', 'Champagne extra seco', 39.99, 20, 'champagne_extra_brut.jpg', 'C0002', 'P0003'),
('B0014', 'Prosecco 1', 'Prosecco italiano fresco', 17.99, 40, 'prosecco_1.jpg', 'C0002', 'P0004'),
('B0015', 'Prosecco 2', 'Prosecco italiano espumante', 21.99, 35, 'prosecco_2.jpg', 'C0002', 'P0005'),
('B0016', 'Cava Brut', 'Cava brut de la región de Penedès', 24.99, 30, 'cava_brut.jpg', 'C0002', 'P0006'),
('B0017', 'Espumante Rosado 1', 'Espumante rosado seco', 18.99, 40, 'espumante_rosado_1.jpg', 'C0002', 'P0007'),
('B0018', 'Espumante Rosado 2', 'Espumante rosado italiano', 22.99, 35, 'espumante_rosado_2.jpg', 'C0002', 'P0008'),
('B0019', 'Asti Spumante', 'Asti Spumante italiano', 25.99, 30, 'asti_spumante.jpg', 'C0002', 'P0009'),
('B0020', 'Cava Semi-Seco', 'Cava semi-seco de calidad', 23.99, 35, 'cava_semi_seco.jpg', 'C0002', 'P0010');

-- Categoría: Whiskys
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0021', 'Scotch Whisky 1', 'Scotch whisky envejecido', 49.99, 30, 'scotch_whisky_1.jpg', 'C0003', 'P0001'),
('B0022', 'Scotch Whisky 2', 'Whisky escocés de malta', 54.99, 25, 'scotch_whisky_2.jpg', 'C0003', 'P0002'),
('B0023', 'Bourbon Kentucky', 'Bourbon de Kentucky', 39.99, 35, 'bourbon_kentucky.jpg', 'C0003', 'P0003'),
('B0024', 'Whisky Irlandés', 'Whisky irlandés suave', 44.99, 30, 'whisky_irlandes.jpg', 'C0003', 'P0004'),
('B0025', 'Whisky Japonés 1', 'Whisky japonés de calidad', 64.99, 20, 'whisky_japones_1.jpg', 'C0003', 'P0005'),
('B0026', 'Whisky Japonés 2', 'Whisky japonés de malta', 74.99, 15, 'whisky_japones_2.jpg', 'C0003', 'P0006'),
('B0027', 'Rye Whisky', 'Whisky de centeno', 42.99, 30, 'rye_whisky.jpg', 'C0003', 'P0007'),
('B0028', 'Whisky de Malta', 'Whisky escocés de malta', 59.99, 25, 'whisky_de_malta.jpg', 'C0003', 'P0008'),
('B0029', 'Otro Whisky', 'Whisky de sabor único', 36.99, 40, 'otro_whisky.jpg', 'C0003', 'P0009'),
('B0030', 'Whisky de Centeno', 'Whisky de centeno americano', 49.99, 35, 'whisky_de_centeno.jpg', 'C0003', 'P0010');

-- Categoría: Tequilas
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0031', 'Tequila Reposado', 'Tequila reposado suave y aromático', 24.99, 20, 'tequila_reposado.jpg', 'C0004', 'P0001'),
('B0032', 'Tequila Añejo 1', 'Tequila añejo premium', 34.99, 15, 'tequila_anejo_1.jpg', 'C0004', 'P0002'),
('B0033', 'Tequila Añejo 2', 'Tequila añejo envejecido', 39.99, 20, 'tequila_anejo_2.jpg', 'C0004', 'P0003'),
('B0034', 'Tequila Blanco 1', 'Tequila blanco suave', 19.99, 25, 'tequila_blanco_1.jpg', 'C0004', 'P0004'),
('B0035', 'Tequila Blanco 2', 'Tequila blanco de alta calidad', 27.99, 20, 'tequila_blanco_2.jpg', 'C0004', 'P0005'),
('B0036', 'Tequila Extra Añejo', 'Tequila extra añejo de lujo', 49.99, 10, 'tequila_extra_anejo.jpg', 'C0004', 'P0006'),
('B0037', 'Mezcal Joven 1', 'Mezcal joven suave', 29.99, 15, 'mezcal_joven_1.jpg', 'C0004', 'P0007'),
('B0038', 'Mezcal Joven 2', 'Mezcal joven de agave', 34.99, 10, 'mezcal_joven_2.jpg', 'C0004', 'P0008'),
('B0039', 'Tequila Oro', 'Tequila oro de calidad', 22.99, 30, 'tequila_oro.jpg', 'C0004', 'P0009'),
('B0040', 'Tequila Plata', 'Tequila plata suave', 19.99, 35, 'tequila_plata.jpg', 'C0004', 'P0010');

-- Categoría: Rones
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0041', 'Ron Añejo 1', 'Ron añejo de calidad', 29.99, 40, 'ron_anejo_1.jpg', 'C0005', 'P0001'),
('B0042', 'Ron Añejo 2', 'Ron añejo en barricas de roble', 34.99, 35, 'ron_anejo_2.jpg', 'C0005', 'P0002'),
('B0043', 'Ron Dorado 1', 'Ron dorado suave', 24.99, 50, 'ron_dorado_1.jpg', 'C0005', 'P0003'),
('B0044', 'Ron Dorado 2', 'Ron dorado de calidad', 27.99, 45, 'ron_dorado_2.jpg', 'C0005', 'P0004'),
('B0045', 'Ron Oscuro', 'Ron oscuro de sabor intenso', 32.99, 30, 'ron_oscuro.jpg', 'C0005', 'P0005'),
('B0046', 'Ron Blanco 1', 'Ron blanco suave y seco', 19.99, 60, 'ron_blanco_1.jpg', 'C0005', 'P0006'),
('B0047', 'Ron Blanco 2', 'Ron blanco de alta calidad', 23.99, 55, 'ron_blanco_2.jpg', 'C0005', 'P0007'),
('B0048', 'Ron Especial', 'Ron especial con notas de vainilla', 25.99, 50, 'ron_especial.jpg', 'C0005', 'P0008'),
('B0049', 'Ron Premium', 'Ron premium envejecido', 39.99, 40, 'ron_premium.jpg', 'C0005', 'P0009'),
('B0050', 'Ron Extra Seco', 'Ron extra seco de calidad', 29.99, 55, 'ron_extra_seco.jpg', 'C0005', 'P0010');

-- Categoría: Vermouths
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0051', 'Vermouth Rojo', 'Vermouth rojo aromático', 14.99, 45, 'vermouth_rojo.jpg', 'C0006', 'P0001'),
('B0052', 'Vermouth Blanco 1', 'Vermouth blanco suave', 13.99, 50, 'vermouth_blanco_1.jpg', 'C0006', 'P0002'),
('B0053', 'Vermouth Blanco 2', 'Vermouth blanco de calidad', 17.99, 40, 'vermouth_blanco_2.jpg', 'C0006', 'P0003'),
('B0054', 'Vermouth Seco', 'Vermouth seco y refrescante', 15.99, 55, 'vermouth_seco.jpg', 'C0006', 'P0004'),
('B0055', 'Vermouth Dulce', 'Vermouth dulce con notas de caramelo', 16.99, 45, 'vermouth_dulce.jpg', 'C0006', 'P0005'),
('B0056', 'Vermouth Extra Seco', 'Vermouth extra seco italiano', 18.99, 40, 'vermouth_extra_seco.jpg', 'C0006', 'P0006'),
('B0057', 'Vermouth Rosado', 'Vermouth rosado suave', 14.99, 50, 'vermouth_rosado.jpg', 'C0006', 'P0007'),
('B0058', 'Vermouth Aromático 1', 'Vermouth aromático de calidad', 19.99, 45, 'vermouth_aromatico_1.jpg', 'C0006', 'P0008'),
('B0059', 'Vermouth Aromático 2', 'Vermouth aromático de origen español', 20.99, 35, 'vermouth_aromatico_2.jpg', 'C0006', 'P0009'),
('B0060', 'Vermouth de Hierbas', 'Vermouth de hierbas mediterráneas', 21.99, 30, 'vermouth_de_hierbas.jpg', 'C0006', 'P0010');

-- Categoría: Vodkas
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0061', 'Vodka Clásico', 'Vodka clásico ruso', 19.99, 50, 'vodka_clasico.jpg', 'C0007', 'P0001'),
('B0062', 'Vodka Premium 1', 'Vodka premium de calidad', 29.99, 40, 'vodka_premium_1.jpg', 'C0007', 'P0002'),
('B0063', 'Vodka Premium 2', 'Vodka premium importado', 34.99, 35, 'vodka_premium_2.jpg', 'C0007', 'P0003'),
('B0064', 'Vodka Saborizado', 'Vodka saborizado con frutas', 24.99, 55, 'vodka_saborizado.jpg', 'C0007', 'P0004'),
('B0065', 'Vodka Ultra Premium', 'Vodka ultra premium destilado', 49.99, 30, 'vodka_ultra_premium.jpg', 'C0007', 'P0005'),
('B0066', 'Vodka de Lujo', 'Vodka de lujo en botella de cristal', 69.99, 20, 'vodka_de_lujo.jpg', 'C0007', 'P0006'),
('B0067', 'Vodka Clásico 2', 'Otro vodka clásico ruso', 21.99, 60, 'vodka_clasico_2.jpg', 'C0007', 'P0007'),
('B0068', 'Vodka Nacional', 'Vodka nacional de calidad', 25.99, 45, 'vodka_nacional.jpg', 'C0007', 'P0008'),
('B0069', 'Vodka con Sabor 1', 'Vodka saborizado con vainilla', 27.99, 50, 'vodka_con_sabor_1.jpg', 'C0007', 'P0009'),
('B0070', 'Vodka con Sabor 2', 'Vodka saborizado con canela', 29.99, 45, 'vodka_con_sabor_2.jpg', 'C0007', 'P0010');

-- Categoría: Gins
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0071', 'Ginebra Clásica', 'Ginebra clásica inglesa', 21.99, 45, 'ginebra_clasica.jpg', 'C0008', 'P0001'),
('B0072', 'Ginebra Premium 1', 'Ginebra premium de calidad', 31.99, 35, 'ginebra_premium_1.jpg', 'C0008', 'P0002'),
('B0073', 'Ginebra Premium 2', 'Ginebra premium con botánicos', 35.99, 30, 'ginebra_premium_2.jpg', 'C0008', 'P0003'),
('B0074', 'Ginebra Seca', 'Ginebra seca y aromática', 27.99, 50, 'ginebra_seca.jpg', 'C0008', 'P0004'),
('B0075', 'Ginebra de Lujo', 'Ginebra de lujo en botella especial', 49.99, 25, 'ginebra_de_lujo.jpg', 'C0008', 'P0005'),
('B0076', 'Ginebra con Sabor 1', 'Ginebra saborizada con frutas', 28.99, 45, 'ginebra_con_sabor_1.jpg', 'C0008', 'P0006'),
('B0077', 'Ginebra con Sabor 2', 'Ginebra saborizada con enebro', 26.99, 55, 'ginebra_con_sabor_2.jpg', 'C0008', 'P0007'),
('B0078', 'Ginebra Nacional', 'Ginebra nacional de calidad', 23.99, 60, 'ginebra_nacional.jpg', 'C0008', 'P0008'),
('B0079', 'Ginebra Floral', 'Ginebra floral con toques cítricos', 29.99, 40, 'ginebra_floral.jpg', 'C0008', 'P0009'),
('B0080', 'Ginebra de Hierbas', 'Ginebra con notas de hierbas', 24.99, 55, 'ginebra_de_hierbas.jpg', 'C0008', 'P0010');

-- Categoría: Piscos
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0081', 'Pisco Peruano', 'Pisco peruano de calidad', 22.99, 40, 'pisco_peruano.jpg', 'C0009', 'P0001'),
('B0082', 'Pisco Mosto Verde 1', 'Pisco mosto verde de alta calidad', 32.99, 35, 'pisco_mosto_verde_1.jpg', 'C0009', 'P0002'),
('B0083', 'Pisco Mosto Verde 2', 'Pisco mosto verde premium', 36.99, 30, 'pisco_mosto_verde_2.jpg', 'C0009', 'P0003'),
('B0084', 'Pisco Acholado', 'Pisco acholado tradicional', 28.99, 45, 'pisco_acholado.jpg', 'C0009', 'P0004'),
('B0085', 'Pisco Quebranta 1', 'Pisco quebranta de calidad', 24.99, 50, 'pisco_quebranta_1.jpg', 'C0009', 'P0005'),
('B0086', 'Pisco Quebranta 2', 'Pisco quebranta suave', 26.99, 50, 'pisco_quebranta_2.jpg', 'C0009', 'P0006'),
('B0087', 'Pisco Aromatico', 'Pisco aromático con notas florales', 30.99, 40, 'pisco_aromatico.jpg', 'C0009', 'P0007'),
('B0088', 'Pisco Italia', 'Pisco de variedad Italia', 31.99, 45, 'pisco_italia.jpg', 'C0009', 'P0008'),
('B0089', 'Pisco Acholado 2', 'Otro pisco acholado', 27.99, 50, 'pisco_acholado_2.jpg', 'C0009', 'P0009'),
('B0090', 'Pisco Mosto Verde 3', 'Pisco mosto verde refinado', 39.99, 35, 'pisco_mosto_verde_3.jpg', 'C0009', 'P0010');

-- Categoría: Otros Licores
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0091', 'Licor de Café', 'Licor de café de calidad', 23.99, 40, 'licor_cafe.jpg', 'C0010', 'P0001'),
('B0092', 'Licor de Chocolate', 'Licor de chocolate suave', 22.99, 45, 'licor_chocolate.jpg', 'C0010', 'P0002'),
('B0093', 'Licor de Frutas 1', 'Licor de frutas variadas', 26.99, 35, 'licor_frutas_1.jpg', 'C0010', 'P0003'),
('B0094', 'Licor de Frutas 2', 'Licor de frutas tropicales', 29.99, 30, 'licor_frutas_2.jpg', 'C0010', 'P0004'),
('B0095', 'Licor de Menta', 'Licor de menta refrescante', 21.99, 50, 'licor_menta.jpg', 'C0010', 'P0005'),
('B0096', 'Licor de Avellana', 'Licor de avellana suave', 24.99, 45, 'licor_avellana.jpg', 'C0010', 'P0006'),
('B0097', 'Licor de Vainilla', 'Licor de vainilla con toques caramelo', 25.99, 40, 'licor_vainilla.jpg', 'C0010', 'P0007'),
('B0098', 'Licor de Almendras', 'Licor de almendras refinado', 27.99, 35, 'licor_almendras.jpg', 'C0010', 'P0008'),
('B0099', 'Licor de Ciruela', 'Licor de ciruela de calidad', 26.99, 45, 'licor_ciruela.jpg', 'C0010', 'P0009'),
('B0100', 'Licor de Cereza', 'Licor de cereza con toques frutales', 22.99, 50, 'licor_cereza.jpg', 'C0010', 'P0010');

-- Categoría: Refrescos
INSERT INTO bebida (`beb_cod`, `beb_nom`, `beb_des`, `beb_pre`, `beb_stk`, `beb_foto`, `cat_cod`, `pro_cod`) VALUES
('B0101', 'Coca-Cola', 'Refresco de cola carbonatado', 2.99, 100, 'coca_cola.jpg', 'C0011', 'P0001'),
('B0102', 'Pepsi', 'Refresco de cola alternativo', 2.79, 90, 'pepsi.jpg', 'C0011', 'P0002'),
('B0103', 'Sprite', 'Refresco de limón carbonatado', 2.49, 80, 'sprite.jpg', 'C0011', 'P0003'),
('B0104', 'Fanta Naranja', 'Refresco de naranja carbonatado', 2.69, 85, 'fanta_naranja.jpg', 'C0011', 'P0004'),
('B0105', 'Fanta Lima-Limón', 'Refresco de lima-limón carbonatado', 2.69, 85, 'fanta_lima_limón.jpg', 'C0011', 'P0005'),
('B0106', 'Mountain Dew', 'Refresco cítrico y energizante', 2.79, 75, 'mountain_dew.jpg', 'C0011', 'P0006'),
('B0107', 'Dr. Pepper', 'Refresco con sabores variados', 2.89, 70, 'dr_pepper.jpg', 'C0011', 'P0007'),
('B0108', '7UP', 'Refresco de limón-lima carbonatado', 2.49, 80, '7up.jpg', 'C0011', 'P0008'),
('B0109', 'Ginger Ale', 'Refresco de jengibre carbonatado', 2.59, 75, 'ginger_ale.jpg', 'C0011', 'P0009'),
('B0110', 'Root Beer', 'Refresco de raíz con sabor a vainilla', 2.69, 70, 'root_beer.jpg', 'C0011', 'P0010');

-- Conductor 1
INSERT INTO conductor (`con_cod`, `con_nom`, `con_ape`, `con_lic`, `con_foto`, `con_edad`) VALUES
('1', 'Carlos', 'Pérez', 'LIC12345', 'carlos_foto.jpg', 32);

-- Conductor 2
INSERT INTO conductor (`con_cod`, `con_nom`, `con_ape`, `con_lic`, `con_foto`, `con_edad`) VALUES
('2', 'Luisa', 'Gómez', 'LIC67890', 'luisa_foto.jpg', 28);

-- Conductor 3
INSERT INTO conductor (`con_cod`, `con_nom`, `con_ape`, `con_lic`, `con_foto`, `con_edad`) VALUES
('3', 'Ana', 'Martínez', 'LIC23456', 'ana_foto.jpg', 35);

-- Conductor 4
INSERT INTO conductor (`con_cod`, `con_nom`, `con_ape`, `con_lic`, `con_foto`, `con_edad`) VALUES
('4', 'Javier', 'Sánchez', 'LIC78901', 'javier_foto.jpg', 30);

-- Conductor 5
INSERT INTO conductor (`con_cod`, `con_nom`, `con_ape`, `con_lic`, `con_foto`, `con_edad`) VALUES
('5', 'Sara', 'Fernández', 'LIC34567', 'sara_foto.jpg', 33);

-- Vehículo 1
INSERT INTO vehiculo (`vec_cod`, `vec_placa`, `vec_marca`, `vec_soat`, `con_cod`) VALUES
('V0001', 'ABC123', 'Toyota Corolla', '2023-02-15', '1');

-- Vehículo 2
INSERT INTO vehiculo (`vec_cod`, `vec_placa`, `vec_marca`, `vec_soat`, `con_cod`) VALUES
('V0002', 'XYZ456', 'Honda Civic', '2023-03-20', '2');

-- Vehículo 3
INSERT INTO vehiculo (`vec_cod`, `vec_placa`, `vec_marca`, `vec_soat`, `con_cod`) VALUES
('V0003', 'DEF789', 'Ford Escape', '2023-04-25', '3');

-- Vehículo 4
INSERT INTO vehiculo (`vec_cod`, `vec_placa`, `vec_marca`, `vec_soat`, `con_cod`) VALUES
('V0004', 'GHI012', 'Nissan Altima', '2023-05-30', '4');

-- Vehículo 5
INSERT INTO vehiculo (`vec_cod`, `vec_placa`, `vec_marca`, `vec_soat`, `con_cod`) VALUES
('V0005', 'JKL345', 'Chevrolet Malibu', '2023-06-05', '5');


DELIMITER @@
DROP PROCEDURE IF EXISTS SPdetalle @@
CREATE PROCEDURE SPdetalle(fac CHAR(5), coda char(5),  can int)
BEGIN
insert into fac_deta values (fac,coda, can);
update bebida set beb_stk= beb_stk - can where beb_cod=coda;
END@@

DROP PROCEDURE IF EXISTS SPFACTURA @@
CREATE PROCEDURE SPFACTURA(in codc char(5),in tot numeric(8,1))
BEGIN
declare nro int;
declare fac char(5);
select ifnull(max(nrofactura),0) + 1  from fac_cabe into nro;
set fac = lpad(nro,5,'0');
insert into fac_cabe values (fac,current_date(),codc,tot);
select fac;
END@@
DELIMITER ;
