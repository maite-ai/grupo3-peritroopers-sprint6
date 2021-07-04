-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2021 a las 02:55:05
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peritroopers`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `idbrand` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `idcategory` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

CREATE TABLE `colors` (
  `idcolors` int(10) UNSIGNED NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `idorders` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `product` int(10) UNSIGNED NOT NULL,
  `purchase` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `idproduct` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(180) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` blob NOT NULL,
  `category` int(10) UNSIGNED NOT NULL,
  `color` int(10) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchases`
--

CREATE TABLE `purchases` (
  `idpurchases` int(10) UNSIGNED NOT NULL,
  `voucherType` int(10) UNSIGNED NOT NULL,
  `voucherNumber` bigint(15) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total` decimal(12,2) UNSIGNED NOT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `shipping` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shippings`
--

CREATE TABLE `shippings` (
  `idshippings` int(10) UNSIGNED NOT NULL,
  `street` varchar(45) NOT NULL,
  `number` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `apartment` varchar(5) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `postalCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `idstatus` int(10) UNSIGNED NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usercategories`
--

CREATE TABLE `usercategories` (
  `iduserCategories` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idusers` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(120) NOT NULL,
  `email` varchar(95) NOT NULL,
  `password` varchar(16) NOT NULL,
  `userCategory` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vouchertype`
--

CREATE TABLE `vouchertype` (
  `idvoucherType` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`idbrand`),
  ADD UNIQUE KEY `idbrand_UNIQUE` (`idbrand`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idcategory`),
  ADD UNIQUE KEY `idcategory_UNIQUE` (`idcategory`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`idcolors`),
  ADD UNIQUE KEY `idcolors_UNIQUE` (`idcolors`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idorders`),
  ADD KEY `productId_idx` (`product`),
  ADD KEY `purchaseId_idx` (`purchase`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idproduct`),
  ADD UNIQUE KEY `idproduct_UNIQUE` (`idproduct`),
  ADD KEY `colorId_idx` (`color`),
  ADD KEY `categoryId_idx` (`category`),
  ADD KEY `brandId_idx` (`brand`);

--
-- Indices de la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`idpurchases`),
  ADD KEY `voucherTypeId_idx` (`voucherType`),
  ADD KEY `statusId_idx` (`status`),
  ADD KEY `userId_idx` (`user`),
  ADD KEY `shippingId_idx` (`shipping`);

--
-- Indices de la tabla `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`idshippings`),
  ADD UNIQUE KEY `idshippings_UNIQUE` (`idshippings`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idstatus`);

--
-- Indices de la tabla `usercategories`
--
ALTER TABLE `usercategories`
  ADD PRIMARY KEY (`iduserCategories`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `iduserCategories_UNIQUE` (`iduserCategories`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idusers`),
  ADD UNIQUE KEY `idusers_UNIQUE` (`idusers`),
  ADD KEY `userCategoryId_idx` (`userCategory`);

--
-- Indices de la tabla `vouchertype`
--
ALTER TABLE `vouchertype`
  ADD PRIMARY KEY (`idvoucherType`),
  ADD UNIQUE KEY `idinvoiceType_UNIQUE` (`idvoucherType`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `idbrand` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `idcategory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `idcolors` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `idproduct` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `shippings`
--
ALTER TABLE `shippings`
  MODIFY `idshippings` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usercategories`
--
ALTER TABLE `usercategories`
  MODIFY `iduserCategories` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idusers` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vouchertype`
--
ALTER TABLE `vouchertype`
  MODIFY `idvoucherType` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `productId` FOREIGN KEY (`product`) REFERENCES `products` (`idproduct`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchaseId` FOREIGN KEY (`purchase`) REFERENCES `purchases` (`idpurchases`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brandId` FOREIGN KEY (`brand`) REFERENCES `brands` (`idbrand`) ON UPDATE CASCADE,
  ADD CONSTRAINT `categoryId` FOREIGN KEY (`category`) REFERENCES `categories` (`idcategory`) ON UPDATE CASCADE,
  ADD CONSTRAINT `colorId` FOREIGN KEY (`color`) REFERENCES `colors` (`idcolors`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `shippingId` FOREIGN KEY (`shipping`) REFERENCES `shippings` (`idshippings`) ON UPDATE CASCADE,
  ADD CONSTRAINT `statusId` FOREIGN KEY (`status`) REFERENCES `status` (`idstatus`) ON UPDATE CASCADE,
  ADD CONSTRAINT `userId` FOREIGN KEY (`user`) REFERENCES `users` (`idusers`) ON UPDATE CASCADE,
  ADD CONSTRAINT `voucherTypeId` FOREIGN KEY (`voucherType`) REFERENCES `vouchertype` (`idvoucherType`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `userCategoryId` FOREIGN KEY (`userCategory`) REFERENCES `usercategories` (`iduserCategories`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
