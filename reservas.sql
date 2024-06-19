-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-06-2024 a las 01:01:20
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reservas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE IF NOT EXISTS `calificaciones` (
  `id` int NOT NULL,
  `cantidad` int NOT NULL,
  `comentario` text COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_habitacion` int NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `cantidad`, `comentario`, `fecha`, `id_habitacion`, `id_usuario`) VALUES
(1, 4, 'Hola que tal', '2024-03-21 21:21:02', 5, 5),
(2, 4, 'Excelente servicio, se los recomiendo', '2024-03-22 05:50:33', 4, 6),
(0, 4, 'esta super cómoda, muy tranquilo', '2024-06-16 22:47:47', 7, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `estado`) VALUES
(1, 'Habitación Estánda', 1),
(2, 'Habitación Familiar', 0),
(3, 'calidad', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_identidad` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `mensaje` text COLLATE utf8mb3_spanish_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `whatsapp` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `num_identidad`, `nombre`, `telefono`, `direccion`, `correo`, `mensaje`, `facebook`, `twitter`, `instagram`, `whatsapp`) VALUES
(1, '123456789', 'VILLA FANNY 2112', '3112753354', 'COLOMBIA -CUCUTA', 'villaF@gmail.com', 'Donde cada momento se transforma en una experiencia memorable. Disfruta de nuestra hospitalidad excepcional, comodidades de primer nivel y servicio impecable. ¡Tu escapada perfecta comienza aquí!', 'https://es-la.facebook.com/', 'https://twitter.com/?lang=es', 'https://www.instagram.com/', 'https://www.whatsapp.com/?lang=es_LA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb3_spanish_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `categorias` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estilo` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `numero` int NOT NULL,
  `capacidad` int NOT NULL,
  `slug` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb3_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id`, `estilo`, `numero`, `capacidad`, `slug`, `foto`, `video`, `descripcion`, `precio`, `estado`, `fecha`) VALUES
(1, 'Habitación Serenidad', 10, 3, 'habitacion-serenidad', '1.jpg', NULL, '<p>Un refugio tranquilo y relajante, perfecto para aquellos que buscan escapar del ajetreo y el bullicio de la vida cotidiana.</p>', '50000.00', 1, '2024-06-14 03:28:42'),
(2, 'Suite Ejecutiva', 150, 3, 'suite-ejecutiva', '2.jpg', NULL, '<p>Un espacio elegante y funcional diseñado para viajeros de negocios que valoran la comodidad y la eficiencia durante su estancia.</p>', '150000.00', 1, '2024-06-14 03:28:31'),
(3, 'Habitación Familiar', 50, 6, 'habitacion-familiar', '3.jpg', NULL, '<p>Amplia y acogedora, esta habitación es ideal para familias que desean compartir momentos especiales juntos mientras disfrutan de todas las comodidades del hogar.</p>', '70000.00', 1, '2024-06-14 03:28:23'),
(4, 'Suite Romántica', 150, 3, 'suite-romantica', '4.jpg', NULL, '<p>Una escapada íntima y lujosa diseñada para parejas que buscan reavivar la chispa del romance en un entorno elegante y privado.</p>', '35000.00', 1, '2024-06-14 03:28:15'),
(5, 'Habitación con Vistas al Mar', 50, 6, 'habitacion-vistas-mar', '5.jpg', NULL, 'Disfruta de impresionantes vistas al océano desde esta habitación, donde la brisa marina y el sonido de las olas crean un ambiente de tranquilidad y serenidad.', '100.00', 0, '2024-06-14 03:28:05'),
(6, 'Suite Deluxe', 150, 3, 'suite-deluxe', '6.jpg', NULL, '<p>Sumérgete en el lujo y la elegancia de esta suite excepcionalmente espaciosa, donde cada detalle está cuidadosamente diseñado para brindarte una experiencia inolvidable.</p>', '100000.00', 1, '2024-06-14 03:28:01'),
(7, 'Habitación Zen Garden', 50, 6, 'habitacion-zen-garden', '7.jpg', NULL, '<p>Encuentra paz y armonía en esta habitación inspirada en un jardín zen, donde la serenidad del entorno te invita a relajarte y renovar tus sentidos.</p>', '100.00', 0, '2024-06-14 03:27:46'),
(8, 'Suite Presidencial', 150, 3, 'suite-presidencial', '8.jpg', NULL, '<p>Experimenta el máximo nivel de lujo y privacidad en esta suite exclusiva, diseñada para satisfacer incluso los gustos más exigentes de nuestros huéspedes VIP.</p>', '50000.00', 0, '2024-06-14 03:28:51'),
(9, 'Habitación Loft Urbano', 50, 6, 'habitacion-loft-urbano', '9.jpg', NULL, '<p>Disfruta de un estilo moderno y sofisticado en este loft urbano, donde el diseño vanguardista se combina con comodidades de primera clase para una estancia inigualable.</p>', '30000.00', 1, '2024-06-14 03:27:10'),
(10, 'Suite Skyline', 50, 6, 'suite-skyline', '10.jpg', NULL, '<p>Contempla las impresionantes vistas de la ciudad desde esta suite de altura, donde la elegancia se combina con panorámicas inigualables para una experiencia verdaderamente espectacular.</p>', '25000.00', 1, '2024-06-14 03:27:00'),
(11, 'habitacion eliminar', 30, 20, 'habitacion-eliminar', '20240319155234.jpg', NULL, '<p>esta se eliminara</p>', '40.00', 0, '2024-03-19 19:52:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` decimal(10,2) NOT NULL,
  `num_transaccion` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `cod_reserva` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_reserva` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcion` text COLLATE utf8mb3_spanish_ci,
  `estado` int NOT NULL DEFAULT '1',
  `metodo` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_habitacion` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_habitacion` (`id_habitacion`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `monto`, `num_transaccion`, `cod_reserva`, `fecha_ingreso`, `fecha_salida`, `fecha_reserva`, `descripcion`, `estado`, `metodo`, `id_habitacion`, `id_usuario`) VALUES
(1, '100.00', '5W778472PD6438208', '65bbcd2f6c31f', '2024-02-01', '2024-02-03', '2024-02-01 21:56:15', '<ol><li>Primer info.</li><li>Segundo info</li></ol>', 1, 'Paypal', 1, 1),
(2, '100.00', '1316848668', '65bbcd9980413', '2024-02-01', '2024-02-03', '2024-06-14 02:05:50', '<p>segundo</p>', 1, 'Paypal', 1, 1),
(7, '400.00', '1321965051', '65fcd557eea59', '2024-03-22', '2024-03-30', '2024-06-14 02:06:06', '<p>VAMOS HACER UNA PRUEBA DE PAGO</p>', 1, 'Paypal', 4, 6),
(8, '800.00', '4NR02153TE658024E', '666bac2ece3a4', '2024-06-20', '2024-06-28', '2024-06-14 02:34:22', '', 1, 'Paypal', 7, 10),
(9, '450000.00', '6UH9979277744553P', '666f6eaba8dc5', '2024-06-16', '2024-06-19', '2024-06-16 23:00:59', '', 1, 'Paypal', 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `subtitulo` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `foto` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `titulo`, `subtitulo`, `url`, `foto`, `estado`) VALUES
(1, 'Hotel Villa Fanny', 'Vive Experiencias Inolvidables', 'http://localhost/reservas/', 'slider1.jpg', 1),
(2, 'Planifica Ahora', 'Comienza la Magia', 'http://localhost/reservas/', 'slider2.jpg', 1),
(3, 'Tu Hogar te Espera', 'Calidez y Comodidad', 'http://localhost/reservas/', 'slider3.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identidad` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `num_identidad` varchar(20) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb3_spanish_ci,
  `clave` varchar(150) COLLATE utf8mb3_spanish_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `verify` int NOT NULL DEFAULT '0',
  `rol` int NOT NULL,
  `foto` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `identidad`, `num_identidad`, `nombre`, `apellido`, `usuario`, `correo`, `telefono`, `direccion`, `clave`, `token`, `verify`, `rol`, `foto`, `estado`, `fecha`) VALUES
(1, NULL, NULL, 'JUAN', 'NEIRA', 'JUAN_N', 'DAVID@gmail.com', NULL, '', '$2y$10$tlr673uHS3cIkQIPH2N3T.pd4UAveHGLBtpjwRGSZor0H2Li6ZEoO', NULL, 0, 1, NULL, 1, '2024-06-01 04:32:23'),
(2, NULL, NULL, 'Magdy', 'Ascanio', 'Recepcionista1', 'CORREO1@GMAIL.COM', NULL, '', '$2y$10$ks2E5DumEWR2A54Jz.2/y.BvmDAqMa9IRRAeH0961hyS4wAIpch..', NULL, 0, 2, NULL, 1, '2024-06-14 03:25:46'),
(3, NULL, NULL, 'ESNEYDER', 'QUIÑONES', 'SNEIDER_Q', 'scneiderck@gmail.com', NULL, '', '$2y$10$zJe2Ytx0J83YphA4kYWZUeLLp75UvmAyeM4Y1anvh/tMmvKTCJYF6', NULL, 0, 1, NULL, 1, '2024-06-02 21:09:44'),
(4, NULL, NULL, 'hola', 'hola edit', 'hola', 'hola@gmail.com', NULL, 'hola', '$2y$10$0pTbMKFLXKUDjUJL7X4DROrjfNo63gV8M1Ldalo3P4G9Z86pE0Pom', NULL, 0, 1, NULL, 0, '2024-03-18 21:17:10'),
(5, 'DNI', '3423243243', 'CLIENTE', 'ADMIN', '', 'ADMINCLIENTE@GMAIL.COM', '8978798798', 'CUCUTA', '123456789', NULL, 0, 3, NULL, 1, '2024-06-01 04:34:51'),
(6, 'DNI', '15', 'Cliente', 'Para reserva', 'cliente', 'cliente@gmail.com', '2222222222', 'CUCUTA', '$2y$10$ZIAkUSNxd8bM.DNng141NucQbCBQv/Wk.XnmUDV.UJTvoT9oIPEna', NULL, 0, 3, NULL, 1, '2024-06-01 04:34:37'),
(7, 'DNI', '6', 'juan david', 'neira meza', 'JN', 'juan@gmail.com', '2244335566', 'CUCUTA', '$2y$10$mqbPruiiOMLi69X1m2g1lu9PtKkIXVauHdEKkTsBgSIdwrPeNH1C2', NULL, 0, 3, NULL, 1, '2024-06-01 04:34:00'),
(8, NULL, NULL, 'darly', 'neira', 'DN', 'neiradarly@gmail.com', NULL, NULL, '$2y$10$KiIf0/xl6WOn9/E04K/Tm.tjHyernnQ87t/Bf/Q2rqKNA8Uw5r3yO', NULL, 0, 3, NULL, 1, '2024-06-01 07:52:03'),
(9, NULL, NULL, 'daniel', 'perez', 'danyP', 'daniel@gmail.com', NULL, NULL, '$2y$10$obrgvdQBLd2r6XBzr9xMGOn8VLt3e5bDW11efzj3Xb7Kv3bMNXX0W', NULL, 0, 3, NULL, 1, '2024-06-03 01:37:41'),
(10, 'DNI', '88251069', 'jesus', 'figueroa', 'jesusF', 'jesusF@gmail.com', '3123909925', 'av2#20-30 Los Patios', '$2y$10$0TGvHdgA1.YxdhFWdjpdLOp3ue0Fan3S.MDmXU2mbnvY/TzDG5bLy', NULL, 0, 3, NULL, 1, '2024-06-07 12:53:36');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
