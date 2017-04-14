/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : gmalmacen

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-13 19:54:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for almacen
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of almacen
-- ----------------------------
INSERT INTO `almacen` VALUES ('1', 'Almacen Iluminacion', 'Calle del niño perdido 39 bis', '2017-04-12 21:07:32', '2017-04-12 21:07:32');
INSERT INTO `almacen` VALUES ('2', 'Almacen Automotriz', 'Av. siempre viva 742, springfield', '2017-04-12 21:41:24', '2017-04-12 21:41:24');
INSERT INTO `almacen` VALUES ('3', 'Almacen Otros', '1428 Elm Street', '2017-04-12 21:42:31', '2017-04-12 21:42:31');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idAlmacen` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `maxStock` int(11) NOT NULL,
  `minStock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `config_idalmacen_foreign` (`idAlmacen`),
  KEY `config_idproducto_foreign` (`idProducto`),
  CONSTRAINT `config_idalmacen_foreign` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`id`),
  CONSTRAINT `config_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of config
-- ----------------------------

-- ----------------------------
-- Table structure for existencia
-- ----------------------------
DROP TABLE IF EXISTS `existencia`;
CREATE TABLE `existencia` (
  `idProducto` int(10) unsigned NOT NULL,
  `idAlmacen` int(10) unsigned NOT NULL,
  `cantidad` int(11) NOT NULL,
  `observaciones` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProducto`,`idAlmacen`),
  KEY `existencia_idalmacen_foreign` (`idAlmacen`),
  CONSTRAINT `existencia_idalmacen_foreign` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`id`),
  CONSTRAINT `existencia_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of existencia
-- ----------------------------
INSERT INTO `existencia` VALUES ('1', '1', '3', 'factura 9899', '2017-04-13 19:09:48', '2017-04-13 19:15:38');
INSERT INTO `existencia` VALUES ('1', '2', '12', 'traspaso por espacio', '2017-04-13 19:15:38', '2017-04-13 19:15:38');
INSERT INTO `existencia` VALUES ('12', '2', '3', 'regalo de proveedor', '2017-04-13 19:14:57', '2017-04-13 19:14:57');
INSERT INTO `existencia` VALUES ('13', '1', '67', 'factura 56', '2017-04-13 19:10:05', '2017-04-13 19:10:05');
INSERT INTO `existencia` VALUES ('15', '1', '730', 'factura 68979', '2017-04-13 19:11:01', '2017-04-13 19:12:45');
INSERT INTO `existencia` VALUES ('15', '2', '50', 'traspaso por ajuste', '2017-04-13 19:12:45', '2017-04-13 19:12:45');
INSERT INTO `existencia` VALUES ('17', '1', '102', 'orden de compra 34 factura 8768', '2017-04-13 19:09:24', '2017-04-13 19:14:20');
INSERT INTO `existencia` VALUES ('17', '2', '20', 'traspaso por venta especial', '2017-04-13 19:14:20', '2017-04-13 19:14:20');
INSERT INTO `existencia` VALUES ('18', '1', '30', 'factura 783', '2017-04-13 19:10:33', '2017-04-13 19:10:33');
INSERT INTO `existencia` VALUES ('20', '1', '100', 'orden de compra 3 factura #9879', '2017-04-13 19:08:49', '2017-04-13 19:08:49');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2017_04_11_220624_create_movimiento_table', '1');

-- ----------------------------
-- Table structure for movimiento
-- ----------------------------
DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE `movimiento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idMovimiento` int(10) unsigned NOT NULL,
  `idAlmacen` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `idUsuario` int(10) unsigned NOT NULL,
  `cantidad` int(11) NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `movimiento_idmovimiento_foreign` (`idMovimiento`),
  KEY `movimiento_idalmacen_foreign` (`idAlmacen`),
  KEY `movimiento_idproducto_foreign` (`idProducto`),
  KEY `movimiento_idusuario_foreign` (`idUsuario`),
  CONSTRAINT `movimiento_idalmacen_foreign` FOREIGN KEY (`idAlmacen`) REFERENCES `almacen` (`id`),
  CONSTRAINT `movimiento_idmovimiento_foreign` FOREIGN KEY (`idMovimiento`) REFERENCES `tipomovimiento` (`id`),
  CONSTRAINT `movimiento_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`),
  CONSTRAINT `movimiento_idusuario_foreign` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of movimiento
-- ----------------------------
INSERT INTO `movimiento` VALUES ('1', '1', '1', '20', '1', '100', 'orden de compra 3 factura #9879', '2017-04-13 19:08:49', '2017-04-13 19:08:49');
INSERT INTO `movimiento` VALUES ('2', '1', '1', '17', '1', '122', 'orden de compra 34 factura 8768', '2017-04-13 19:09:24', '2017-04-13 19:09:24');
INSERT INTO `movimiento` VALUES ('3', '1', '1', '1', '1', '15', 'factura 9899', '2017-04-13 19:09:48', '2017-04-13 19:09:48');
INSERT INTO `movimiento` VALUES ('4', '1', '1', '13', '1', '67', 'factura 56', '2017-04-13 19:10:05', '2017-04-13 19:10:05');
INSERT INTO `movimiento` VALUES ('5', '1', '1', '18', '1', '30', 'factura 783', '2017-04-13 19:10:34', '2017-04-13 19:10:34');
INSERT INTO `movimiento` VALUES ('6', '1', '1', '15', '1', '780', 'factura 68979', '2017-04-13 19:11:01', '2017-04-13 19:11:01');
INSERT INTO `movimiento` VALUES ('7', '2', '1', '15', '1', '50', 'Traspaso(Salida) : traspaso por ajuste', '2017-04-13 19:12:45', '2017-04-13 19:12:45');
INSERT INTO `movimiento` VALUES ('8', '1', '2', '15', '1', '50', 'Traspaso(Entrada) : traspaso por ajuste', '2017-04-13 19:12:46', '2017-04-13 19:12:46');
INSERT INTO `movimiento` VALUES ('9', '2', '1', '17', '1', '20', 'Traspaso(Salida) : traspaso por venta especial', '2017-04-13 19:14:20', '2017-04-13 19:14:20');
INSERT INTO `movimiento` VALUES ('10', '1', '2', '17', '1', '20', 'Traspaso(Entrada) : traspaso por venta especial', '2017-04-13 19:14:20', '2017-04-13 19:14:20');
INSERT INTO `movimiento` VALUES ('11', '1', '2', '12', '1', '3', 'regalo de proveedor', '2017-04-13 19:14:57', '2017-04-13 19:14:57');
INSERT INTO `movimiento` VALUES ('12', '2', '1', '1', '1', '12', 'Traspaso(Salida) : traspaso por espacio', '2017-04-13 19:15:38', '2017-04-13 19:15:38');
INSERT INTO `movimiento` VALUES ('13', '1', '2', '1', '1', '12', 'Traspaso(Entrada) : traspaso por espacio', '2017-04-13 19:15:38', '2017-04-13 19:15:38');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1', 'L5071-1E0', 'Lampara de techo Downlight LUNA 9 SSD 166mm 3000 K Blanco - L5071-1E0', 'DEPO, cuenta con certificaciones de sus propios laboratorios fotométricos, son realizadas por el prestigiado grupo alemán TÜV Rheinland Group Technische Überwachungs - Vereine (Asociación de Inspecciones Técnicas). TÜV, es un grupo consultor independiente que examina todos los sistemas de empresas fabricantes, sus motores, instalaciones eléctricas, seguridad y la protección del medio ambiente. TÜV, es un grupo pionero a nivel mundial en procesos de monitoreo, con más de 130 años de experiencia, por lo que las guías de certificación de las empresas certificadoras TÜV son de las más estrictas del mundo.\r\n\r\n', '2017-04-12 18:25:06', '2017-04-12 20:47:18');
INSERT INTO `producto` VALUES ('2', 'OXG212/P', 'ARBOTANTE GRAPA CUADRADO RESPALDO DE ONIX. ONIX PI - OXG212/P', 'DEPO, cuenta con certificaciones de sus propios laboratorios fotométricos, son realizadas por el prestigiado grupo alemán TÜV Rheinland Group Technische Überwachungs - Vereine (Asociación de Inspecciones Técnicas). TÜV, es un grupo consultor independiente que examina todos los sistemas de empresas fabricantes, sus motores, instalaciones eléctricas, seguridad y la protección del medio ambiente. TÜV, es un grupo pionero a nivel mundial en procesos de monitoreo, con más de 130 años de experiencia, por lo que las guías de certificación de las empresas certificadoras TÜV son de las más estrictas del mundo.\r\n\r\n', '2017-04-12 18:34:29', '2017-04-12 20:47:08');
INSERT INTO `producto` VALUES ('3', 'Q3023', 'Empotrado 1 LED 1W Calido High Power.', '', '2017-04-12 18:35:21', '2017-04-12 18:35:21');
INSERT INTO `producto` VALUES ('4', 'LC1128', 'Kit de Xenón BAC SLIM AC H11', '', '2017-04-12 18:36:17', '2017-04-12 18:36:17');
INSERT INTO `producto` VALUES ('5', 'LT004', 'Tapon LED Tipo Neon Para Valvula De Rueda', '', '2017-04-12 18:37:24', '2017-04-12 18:37:24');
INSERT INTO `producto` VALUES ('6', 'X980', 'Kit de Xenón AMP AC 9006', 'EPO, es la marca líder de autopartes de iluminación en México, calificado por International Interbrand como una de las 20 mejores marcas de Taiwan por 5 años consecutivos. Ha exportado por más de 31 años a más de 100 países, rebasando las expectativas de estándares de calidad requeridos, especialmente, por las siguientes instituciones en Estados Unidos:', '2017-04-12 18:38:12', '2017-04-12 20:49:04');
INSERT INTO `producto` VALUES ('7', 'X210', 'Kit de Xenón USQ DC H1', '', '2017-04-12 18:39:32', '2017-04-12 18:39:32');
INSERT INTO `producto` VALUES ('8', 'LC517', 'kit de Xenon HID marca MICOTA Baja y Dual H4 Dual', '', '2017-04-12 18:40:23', '2017-04-12 18:40:23');
INSERT INTO `producto` VALUES ('9', 'R1-20-5128-05-1A', 'FARO CHEVROLET MALIBU IZQUIERDO 1997-2003 MR1-20-5128-05-1A', '', '2017-04-12 18:42:01', '2017-04-12 18:42:01');
INSERT INTO `producto` VALUES ('10', 'MR1-11-C433-05-1A', 'CALAVERA CHEVROLET TRAX DERECHO 2013-2016 MR1-11-C433-05-1A', '', '2017-04-12 18:49:46', '2017-04-12 18:49:46');
INSERT INTO `producto` VALUES ('11', 'XN1673', 'KIT XENON OSUN SLIM AC H7', '', '2017-04-12 18:50:30', '2017-04-12 18:50:30');
INSERT INTO `producto` VALUES ('12', 'LA1366', 'Foco LED S8 Festoon Lira 36mm 6w - - LA1366', '', '2017-04-12 18:52:19', '2017-04-12 18:52:19');
INSERT INTO `producto` VALUES ('13', 'RV0641', 'Barra led curva de 320W alta intensidad', '', '2017-04-12 18:53:04', '2017-04-12 18:53:04');
INSERT INTO `producto` VALUES ('14', 'X1722', 'Resistencia para Kit Xenón 50W - X1722', '', '2017-04-12 18:56:47', '2017-04-12 18:56:47');
INSERT INTO `producto` VALUES ('15', 'R1-PAR-19-5551-00-1A', 'PAR DE FARO DE NIEBLA FORD EXPLORER 2002-2005 MR1-PAR-19-5551-00-1A', '', '2017-04-12 18:57:41', '2017-04-12 18:57:41');
INSERT INTO `producto` VALUES ('16', 'MR1-019-0614-04', 'FARO CHEVROLET CHEVY C2 DERECHO 2004-2008 MR1-019-0614-04', '', '2017-04-12 18:59:03', '2017-04-12 18:59:03');
INSERT INTO `producto` VALUES ('17', 'LT004', 'apon LED Tipo Neon Para Valvula De Rueda', '', '2017-04-12 18:59:43', '2017-04-12 18:59:43');
INSERT INTO `producto` VALUES ('18', 'MR1-018-1226-08', 'ESPEJO ELECTRICO NEGRO FORD LOBO DERECHO 2010-2012 MR1-018-1226-08', 'DEPO, es la marca líder de autopartes de iluminación en México, calificado por International Interbrand como una de las 20 mejores marcas de Taiwan por 5 años consecutivos. Ha exportado por más de 31 años a más de 100 países, rebasando las expectativas de estándares de calidad requeridos, especialmente, por las siguientes instituciones en Estados Unidos:\r\n\r\nSAE : Society of Automotive Engineers\r\nDOT : Department of Transportation\r\nFMVSS : Federal Motor Vehicle Safety Standards', '2017-04-12 19:27:24', '2017-04-12 19:27:24');
INSERT INTO `producto` VALUES ('19', 'MR1-PAR-20-5695-A1-1', 'PAR DE FARO FORD MUSTANG 1999-2004 MR1-PAR-20-5695-A1-1A', 'Incluye Cristales	DERECHO', '2017-04-12 20:57:40', '2017-04-12 20:57:40');
INSERT INTO `producto` VALUES ('20', 'X1723', 'Capacitores para Xenón - X1723', 'Un capacitor almacena energía en la forma de un campo eléctrico como si fuera una batería pero a diferencia de esta no la retiene por mucho tiempo, la libera instantáneamente en el momento que se requiera. \r\nLos capacitores para Kit de Xenón HID, funcionan para vehículos que mandan falla a la computadora pero no marcan testigo de foco fundido y cortan la corriente a un voltaje menor, funcionan a 9-14v, suficientes para soportar la corriente del balastro.', '2017-04-12 20:59:03', '2017-04-12 20:59:03');

-- ----------------------------
-- Table structure for tipomovimiento
-- ----------------------------
DROP TABLE IF EXISTS `tipomovimiento`;
CREATE TABLE `tipomovimiento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipomovimiento
-- ----------------------------
INSERT INTO `tipomovimiento` VALUES ('1', 'Entrada', 'Ingreso de productos a almacen por compra, devolucion o cancelacion', '2017-04-12 21:33:25', '2017-04-12 21:33:25');
INSERT INTO `tipomovimiento` VALUES ('2', 'Salida', 'Salida de un producto de al macen ya sea por venta o garantia de fabricante', '2017-04-12 21:34:32', '2017-04-12 21:34:32');
INSERT INTO `tipomovimiento` VALUES ('3', 'Traspaso', 'Movimiento de un producto por traspaso entre almacenes.', '2017-04-12 21:35:17', '2017-04-12 21:35:17');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Norberto Gomez', 'xcapatemx@gmail.com', '$2y$10$4ks4iNO1nuY.rrnYjLZGIO/cWLUaobC9nhG1JLkyAHXgKbtPExgUy', 'gABhnitM2wbZWc44hMZHQtNWG6To8IfJDnupzcKdCQtgrPtNoHVmt1iPcfCu', '2017-04-12 17:24:32', '2017-04-14 00:44:54');

-- ----------------------------
-- Procedure structure for movimiento_almacen
-- ----------------------------
DROP PROCEDURE IF EXISTS `movimiento_almacen`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movimiento_almacen`(
	IN almacen INT,
	IN almacen_destino INT,
	IN numero INT,
	IN tipo_movimiento INT,
	IN id_producto INT,
	IN id_usuario INT,
	IN comentario LONGTEXT,
	OUT completado VARCHAR(200),
	OUT codestatus VARCHAR(10))
BEGIN
		DECLARE numrows INT;
		DECLARE affected INT;
		DECLARE stock INT;
		DECLARE nueva_existencia INT;
		set affected=0;
		if(tipo_movimiento='1') THEN
			set numrows=(SELECT count(*) from existencia where idProducto=id_producto and idAlmacen=almacen);
			if(numrows>0) then 
					/*update*/
					/*sumar cantidad a existencia */
					set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen);
					set nueva_existencia=stock+numero;
					update existencia SET cantidad=nueva_existencia, updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen;
					set affected=ROW_COUNT();
			else
					/*agregar existencia a tabla*/
					insert into existencia(idProducto,idAlmacen,cantidad,observaciones,created_at,updated_at) VALUES(id_producto,almacen,numero,comentario,NOW(),NOW());
					set affected=ROW_COUNT();
			end if;
			if (affected>0) THEN
				/* reportar el movimiento */
				insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(tipo_movimiento,almacen,id_producto,id_usuario,numero,comentario,NOW(),NOW());
				set completado='Se realizo la entrada con exito!';
				set codestatus='200';	
			ELSE
				set completado='Ocurrio un error al realizar la transaccion';
				set codestatus='500';	
			end if;
		ELSE
			/*verificar si existe suficiente stock en almacen para retirar*/
			set numrows=(select cantidad from existencia where idAlmacen=almacen and idProducto=id_producto);
			if(numrows>0 and numero<=numrows) then
					if(tipo_movimiento='3') then 
							/* restar cantidad de salida */
							set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen);
							set nueva_existencia=stock-numero;
							update existencia SET cantidad=nueva_existencia,updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen;
							/* verificar si en almacen destino existe el prodycto*/
							set numrows=(select cantidad from existencia where idAlmacen=almacen_destino and idProducto=id_producto);
							if(numrows>0) then 
									set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen_destino);
									set nueva_existencia=stock+numero;
									update existencia SET cantidad=nueva_existencia,updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen_destino;
									set affected=ROW_COUNT();
							else 
									insert into existencia(idProducto,idAlmacen,cantidad,observaciones,created_at,updated_at) VALUES(id_producto,almacen_destino,numero,comentario,NOW(),NOW());
									set affected=ROW_COUNT();
							end if;
							if (affected>0) THEN
								/* reportar movimiento de salida y entrada */
								insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(2,almacen,id_producto,id_usuario,numero,concat('Traspaso(Salida) : ',comentario),NOW(),NOW());
								insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(1,almacen_destino,id_producto,id_usuario,numero,concat('Traspaso(Entrada) : ',comentario),NOW(),NOW());
								set completado='Se realizo el traspaso con exito!';
								set codestatus='200';	
							ELSE
								set completado='Ocurrio un error al realizar la transaccion';
								set codestatus='500';	
							end if;
					ELSE
							set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen);
							
								set nueva_existencia=stock-numero;
								update existencia SET cantidad=nueva_existencia,updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen;
								set affected=ROW_COUNT();
								if (affected>0) THEN
									/* reportar el movimiento */
									insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(tipo_movimiento,almacen,id_producto,id_usuario,numero,comentario,NOW(),NOW());
									set completado='Se realizo la salida con exito!: ';
									set codestatus='200';	
								ELSE
									set completado='Ocurrio un error al realizar la transaccion';
									set codestatus='500';	
								end if;	
					end if;
			ELSE
				set completado='Imposible realizar el movimiento: No hay suficiente stock o el producto no existe en el almacen';
				set codestatus='500';	
			end if;
		end if;
		SELECT completado,codestatus;
END
;;
DELIMITER ;
