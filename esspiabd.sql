-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2021 a las 20:51:53
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `esspiabd`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cotizacionreport` ()  BEGIN 
 SELECT cliente.compania,users.name as Ingeniero,product.name as nombreproducto, cotizationproducts.quantity,cotizationproducts.total,
images.image
 FROM cotizationproducts 
 INNER JOIN  users 
INNER JOIN  cliente
INNER JOIN  images
INNER JOIN  product
INNER JOIN cotizationreport
ON cliente.id=cotizationreport.idClient
AND cotizationreport.idServiceReport= images.idService
AND cotizationreport.idServiceReport= cotizationproducts.idService
AND cotizationproducts.idProduct=product.id
AND cotizationreport.idUser=users.id
AND cotizationreport.idServiceReport="C20210825172758";
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cotizacionreport1` ()  BEGIN

SELECT cliente.compania,users.name as Ingeniero,product.name as nombreproducto, cotizationproducts.quantity,cotizationproducts.total,
images.image,images.id, cotizationreport.namePerson, cotizationreport.firmImage 
 FROM cotizationproducts 
 INNER JOIN  users 
INNER JOIN  cliente
INNER JOIN  images
INNER JOIN  product
INNER JOIN cotizationreport
ON cliente.id=cotizationreport.idClient
AND cotizationreport.idServiceReport= images.idService
AND cotizationreport.idServiceReport= cotizationproducts.idService
AND cotizationproducts.idProduct=product.id
AND cotizationreport.idUser=users.id
AND cotizationreport.idServiceReport="C20210825183933";

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getusers` ()  BEGIN 
  select * from users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maintenance` ()  BEGIN
SELECT images.description, images.idService,users.name,cliente.compania FROM images 
INNER JOIN maintenance 
INNER JOIN users 
INNER JOIN cliente 
ON images.idService = maintenance.idMaintenance
AND users.id= maintenance.idUser
AND maintenance.idCompany= cliente.id;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

 --
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(20) NOT NULL,
  `tipoId` varchar(10) NOT NULL,
  `compania` varchar(70) NOT NULL,
  `representante` varchar(50) NOT NULL,
  `idRepresentante` int(11) NOT NULL,
  `email` varchar(70) NOT NULL,
  `telefono` int(20) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `createdAt` varchar(50) NOT NULL,
  `updatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `tipoId`, `compania`, `representante`, `idRepresentante`, `email`, `telefono`, `direccion`, `createdAt`, `updatedAt`) VALUES
(1, 'cedula', 'parmalat', 'leon valencia', 4545445, 'leon@gmail.com', 45454, 'cra 70 854', '', ''),
(2, 'nit', 'Comfenalco', 'alex', 866656, 'leonddd@gmail.com', 215421, 'calle 3 oeste', '2021-08-14 15:39:16', '2021-08-14 15:39:16'),
(54554, 'nit', 'xxxxxxx', 'GHGHGHG', 454545, 'alexcord47@gmail.com', 3231142, 'Carrera 7 C oeste # 4-5', '2021-08-13 19:14:06', '2021-08-13 19:14:06'),
(55556, 'nit', 'Fhjjj', 'Ghjjkk', 557888, 'alexcord47@gmail.com', 3231142, 'Carrera 7 C oeste # 4-5', '2021-08-13 19:58:29', '2021-08-13 19:58:29'),
(121212, 'nit', 'vcvcvcv', 'fgkkkkkkkkkkkkkkk', 12121212, 'alexcord47@gmail.com', 3231142, 'Carrera 7 C oeste # 4-5', '2021-08-13 19:12:10', '2021-08-13 19:12:10'),
(454545, 'nit', '45454', 'alex', 45454, '', 0, '454545', '2021-08-14 15:24:51', '2021-08-14 15:24:51'),
(455454, 'nit', 'xxxxxxx', 'yyyyyyyyyyyyyy', 454545, 'alexcord47@gmail.com', 3231142, 'Carrera 7 C oeste # 4-5', '2021-08-13 19:05:16', '2021-08-13 19:05:16'),
(666555, 'nit', 'Hjjgh', 'Fhjjj', 55885, 'alexcord47@gmail.com', 3231142, 'Carrera 7 C oeste # 4-5', '2021-08-13 20:00:49', '2021-08-13 20:00:49'),
(787878, 'nit', '78787878', 'fgfgfg', 45454545, '', 0, 'Carrera 7 C oeste # 4-5', '2021-08-14 15:21:30', '2021-08-14 15:21:30'),
(6655555, 'nit', 'Hucguh', 'Fhjjjk', 2147483647, 'alexcord47@gmail.com', 3231142, 'Carrera 7 C oeste # 4-5', '2021-08-13 20:02:55', '2021-08-13 20:02:55'),
(16537128, 'nit', 'CMSoftlutions', 'Alfonso', 25705805, 'alex@gmail.com', 0, 'Carrera 7 C oeste # 4-5', '2021-08-25 22:26:00', '2021-08-25 22:26:00'),
(2147483647, 'nit', 'alex', 'cord', 4545454, 'alexcord47@gmail.com', 0, 'Carrera 7 C oeste # 4-5', '2021-08-14 14:07:28', '2021-08-14 14:07:28');

-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `cotizationproducts`
--

CREATE TABLE `cotizationproducts` (
  `id` int(50) NOT NULL,
  `idService` varchar(50) NOT NULL,
  `idProduct` int(50) NOT NULL,
  `nameProduct` varchar(500) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `quantity` int(30) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `createdAt` varchar(70) NOT NULL,
  `updatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizationreport`
--

CREATE TABLE `cotizationreport` (
  `idClient` int(50) NOT NULL,
  `idUser` int(50) NOT NULL,
  `descriptionTypeService` text NOT NULL,
  `idServiceReport` varchar(50) NOT NULL,
  `idPerson` int(50) DEFAULT NULL,
  `namePerson` varchar(50) DEFAULT NULL,
  `firmImage` text DEFAULT NULL,
  `createdAt` varchar(50) NOT NULL,
  `updatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveryreport`
--

CREATE TABLE `deliveryreport` (
  `id` int(11) NOT NULL,
  `idClient` int(50) NOT NULL,
  `idUser` int(50) NOT NULL,
  `descriptionTypeService` text NOT NULL,
  `idServiceReport` varchar(50) NOT NULL,
  `idPerson` int(50) NOT NULL,
  `namePerson` varchar(50) NOT NULL,
  `firmImage` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(50) NOT NULL,
  `idService` varchar(50) NOT NULL,
  `image` mediumblob DEFAULT NULL,
  `imageString` text DEFAULT NULL,
  `description` text NOT NULL,
  `createdAt` varchar(50) NOT NULL,
  `updatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imgloads`
--

CREATE TABLE `imgloads` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(30) NOT NULL,
  `idMaintenance` varchar(50) NOT NULL,
  `idCompany` int(50) NOT NULL,
  `idUser` int(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maintenance`
--

INSERT INTO `maintenance` (`id`, `idMaintenance`, `idCompany`, `idUser`, `description`) VALUES
(1, '2021-08-21 15:34:43', 1, 1, 'descripcion ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenancereport`
--

CREATE TABLE `maintenancereport` (
  `id` int(50) NOT NULL,
  `idClient` int(50) NOT NULL,
  `idUser` int(50) NOT NULL,
  `descriptionTypeService` text NOT NULL,
  `idServiceReport` varchar(50) NOT NULL,
  `idPerson` int(50) NOT NULL,
  `namePerson` varchar(50) NOT NULL,
  `firmImage` text NOT NULL,
  `createdAt` varchar(50) NOT NULL,
  `updatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(50) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `image` text DEFAULT NULL,
  `createdAt` varchar(50) NOT NULL,
  `updatedAt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `createdAt`, `updatedAt`) VALUES
(1, 'Cable red', 'UTP calibre', '6000.00', '', '', ''),
(2, 'JAck rj45', 'blindado', '8000.00', NULL, '', ''),
(3, 'Camara web', '16 mpx', '145555.00', NULL, '', ''),
(4, 'Router', 'WIFI g5', '125000.41', NULL, '', ''),
(5, 'Cable  electrico', '120v calibre', '45222.00', NULL, '', ''),
(6, 'Teclado', 'mgd45', '45000.00', NULL, '', ''),
(7, 'Pantalla lcd', 'LG 45l', '4577000.00', NULL, '', ''),
(8, 'Procesador ntel I7', '5.4Gh 8 nucleos', '1450000.00', NULL, '', ''),
(9, 'Celular Samsumg', 'Sm4444', '755000.00', NULL, '', ''),
(10, 'Mouse Genius', 'MG44tydd', '42155.00', NULL, '', ''),
(11, 'Servicio de mantenimiento a brazos hidráulicos con cambio de aceite, cambio de empaquetadura de carcasa y empaquetadura interna', 'Servicio de mantenimiento a brazos hidráulicos con cambio de aceite, cambio de empaquetadura de carcasa y empaquetadura interna', '45000.00', '', '', ''),
(12, 'Servicio de mantenimiento a brazos hidráulicos con cambio de aceite, cambio de empaquetadura de carcasa y empaquetadura interna', 'Servicio de mantenimiento a brazos hidráulicos con cambio de aceite, cambio de empaquetadura de carcasa y empaquetadura interna', '0.00', NULL, '', ''),
(13, 'Servicio de mantenimiento a brazos hidráulicos con cambio de aceite, cambio de empaquetadura de carcasa y empaquetadura interna', 'Servicio de mantenimiento a brazos hidráulicos con cambio de aceite, cambio de empaquetadura de carcasa y empaquetadura interna', '48000.00', NULL, '', ''),
(14, 'Calculadora', '10 numeros', '25000.00', NULL, '', ''),
(15, 'A', 'B', '4.20', NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `originalName` varchar(255) NOT NULL,
  `newNameWithPath` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `cedula` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `cedula`, `name`, `email`, `password`, `phone`, `createdAt`, `updatedAt`) VALUES
(1, 54555, 'alex', 'alex@gmail.com', '$2a$10$shhnMxXr2v.uciDq3YxhLeSClcBtaUiQdnVYFllcFxSMqZpBuV3pm', 0, '2021-08-14 13:39:21', '2021-08-14 13:39:21'),
(3, 654, 'oscar', 'alexcord@gmail.com', '$2a$10$XZUOnDXWXo3Zg.pAJetbreRvp1lVQT.NO4rVRh44vMB7H9wdRVbF.', 0, '2021-08-14 13:42:34', '2021-08-14 13:42:34'),
(4, 454545, 'maria', 'a@gmail.com', '$2a$10$4PYBCtF8eYbT1J.gOinEie4uveIP0AwhCOpXR8iCsRlAIUr9poowK', 0, '2021-08-14 13:43:28', '2021-08-14 13:43:28'),
(5, 45656, 'alfonso', 'as@gmail.com', '$2a$10$uDjGRKmngrz5iNZfWXKdYuQPOxMWEOuSOJ2iSYWlOeEP4/sOg7HOi', 0, '2021-08-14 13:45:59', '2021-08-14 13:45:59'),
(6, 16537128, 'alexcord', 'alexleoncordbbbbb@gmail.com', '$2a$10$QV/OQMKQG75trnlneA1rleKBCzdp2DjBzYZG02v42Zpj7Ymlqsn5i', 121212, '2021-08-14 14:47:12', '2021-08-14 14:47:12'),
(7, 4112, 'sdsdsd', 'alexccc@gmail.com', '$2a$10$K8xFzGFHiOhEziddBAMwbevSRZlzPa6GIsKlGvMlp8VNJydIQ42Xm', 3231142, '2021-08-14 14:58:40', '2021-08-14 14:58:40'),
(8, 8787, '78787', 'llllllll@gmail.com', '$2a$10$IRdDUm0hQEjSzvjaZa2mieYhb2XqD6OgbBsgU0MdSO57Pw7iHxB1e', 5454, '2021-08-14 15:20:47', '2021-08-14 15:20:47'),
(9, 123, 'Alex', 'alexcohhhssghhhh@hotmail.com', '$2a$10$EjHCKOPXYHBD7zbMW4lVE.Nz5fjrGI0OLHZqHDBMC4vnwj.QKInQ2', 5588, '2021-08-14 15:40:32', '2021-08-14 15:40:32'),
(10, 12345, 'alex', 'alex1@gmail.com', '$2a$10$TfVtWs4mMJRfw/Xm97xyUOOpxMsdiIc5T8KcPVV1WNU8dxIPiParq', 2147483647, '2021-08-14 17:35:10', '2021-08-14 17:35:10'),
(12, 121212121, 'sabrina', 'sabrina@gmail.com', '$2a$10$J18BRZp/UWajbTgUdtoSqOnYwGClkgpnul6vm0PUZdCTevnIzLiZi', 6565656, '2021-08-16 01:06:45', '2021-08-16 01:06:45'),
(13, 123456789, 'maria', 'm@gmail.com', '$2a$10$9TYTWCH2jHUzGXzA2jqoy.jLRKiEU4JFdeJXzJ2InVnhRSxPUGJoS', 31145125, '2021-08-16 22:36:38', '2021-08-16 22:36:38'),
(14, 25, 'user', 'user@gmail.com', '$2a$10$uF8.hSmk/CDX7bNcODS01eyLDwZYJiE1JY/C/BPmvkyYzgFPQIvPi', 528, '2021-08-31 17:47:39', '2021-08-31 17:47:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizationproducts`
--
ALTER TABLE `cotizationproducts`
  ADD PRIMARY KEY (`id`,`idService`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indices de la tabla `cotizationreport`
--
ALTER TABLE `cotizationreport`
  ADD PRIMARY KEY (`idServiceReport`),
  ADD KEY `idClient` (`idClient`);

--
-- Indices de la tabla `deliveryreport`
--
ALTER TABLE `deliveryreport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClient` (`idClient`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imgloads`
--
ALTER TABLE `imgloads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maintenancereport`
--
ALTER TABLE `maintenancereport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClient` (`idClient`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cotizationproducts`
--
ALTER TABLE `cotizationproducts`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=664;

--
-- AUTO_INCREMENT de la tabla `deliveryreport`
--
ALTER TABLE `deliveryreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT de la tabla `imgloads`
--
ALTER TABLE `imgloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `maintenancereport`
--
ALTER TABLE `maintenancereport`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cotizationproducts`
--
ALTER TABLE `cotizationproducts`
  ADD CONSTRAINT `cotizationproducts_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `cotizationreport`
--
ALTER TABLE `cotizationreport`
  ADD CONSTRAINT `cotizationreport_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `deliveryreport`
--
ALTER TABLE `deliveryreport`
  ADD CONSTRAINT `deliveryreport_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `maintenancereport`
--
ALTER TABLE `maintenancereport`
  ADD CONSTRAINT `maintenancereport_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
