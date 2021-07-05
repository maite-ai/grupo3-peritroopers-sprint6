-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2021 a las 00:49:48
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

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(7, 'Blue'),
(3, 'Corsair'),
(4, 'HyperX'),
(1, 'Logitech'),
(5, 'Razer'),
(2, 'Redragon'),
(6, 'Shure');

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(3, 'Aurículares'),
(1, 'Micrófonos'),
(4, 'Mouses'),
(2, 'Teclados');

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(5, 'Azul'),
(2, 'Blanco'),
(6, 'Celeste'),
(3, 'Negro'),
(1, 'Rojo'),
(7, 'Rosa'),
(4, 'Verde'),
(8, 'Violeta');

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `categoryId`, `colorId`, `stock`, `brandId`) VALUES
(1, 'Teclado Redragon ergonómico retroiluminado RGB', 'Teclado fachero', '4571.51', 0x7465636c61646f526564447261676f6e4e6f766564616465732e6a7067, 2, 3, 5748, 2);

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'En proceso'),
(2, 'Completado'),
(3, 'Entregado'),
(4, 'Cancelado');

--
-- Volcado de datos para la tabla `usercategories`
--

INSERT INTO `usercategories` (`id`, `name`) VALUES
(2, 'Cliente'),
(3, 'Invitado'),
(1, 'root');

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `birthdate`, `address`, `email`, `password`, `userCategoryId`) VALUES
(1, 'admin', 'admin', '0000-00-00', 'Calle 123', 'admin@peritroopers', 'asdf123', 1),
(2, 'Matias', 'Benavide', '2000-07-08', 'Malabia 123', 'yisus@peritroopers', 'asdf123', 2),
(3, 'Fernanda', 'Rios', '1989-05-27', 'Corrientes 123', 'pei@peritroopers', 'asdf123', 2),
(4, 'Clara', 'Mayorga', '1992-06-19', 'Mendoza 123', 'clarita@peritroopers', 'asdf123', 2);

--
-- Volcado de datos para la tabla `vouchertype`
--

INSERT INTO `vouchertype` (`id`, `name`) VALUES
(1, 'Factura A'),
(2, 'Factura B'),
(3, 'Factura C');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
