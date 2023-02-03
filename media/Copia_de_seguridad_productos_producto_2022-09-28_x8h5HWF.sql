-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tejidos
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productos_producto`
--

DROP TABLE IF EXISTS `productos_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `stock` int NOT NULL,
  `precio` double NOT NULL,
  `precio_venta` double NOT NULL,
  `porcentaje` int NOT NULL,
  `valorPorcentaje` double NOT NULL,
  `estado` varchar(10) NOT NULL,
  `color_id` bigint DEFAULT NULL,
  `marca_id` bigint DEFAULT NULL,
  `rol_id` int DEFAULT NULL,
  `talla_id` bigint DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_producto_color_id_c45f44ec_fk_productos_color_id` (`color_id`),
  KEY `productos_producto_marca_id_fc6a9dea_fk_productos_marca_id` (`marca_id`),
  KEY `productos_producto_rol_id_1f4c3164_fk_usuarios_rol_Rid` (`rol_id`),
  KEY `productos_producto_talla_id_bc4cde63_fk_productos_talla_id` (`talla_id`),
  KEY `productos_producto_usuario_id_0fed4d8f_fk_usuarios_usuario_Uid` (`usuario_id`),
  CONSTRAINT `productos_producto_color_id_c45f44ec_fk_productos_color_id` FOREIGN KEY (`color_id`) REFERENCES `productos_color` (`id`),
  CONSTRAINT `productos_producto_marca_id_fc6a9dea_fk_productos_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `productos_marca` (`id`),
  CONSTRAINT `productos_producto_rol_id_1f4c3164_fk_usuarios_rol_Rid` FOREIGN KEY (`rol_id`) REFERENCES `usuarios_rol` (`Rid`),
  CONSTRAINT `productos_producto_talla_id_bc4cde63_fk_productos_talla_id` FOREIGN KEY (`talla_id`) REFERENCES `productos_talla` (`id`),
  CONSTRAINT `productos_producto_usuario_id_0fed4d8f_fk_usuarios_usuario_Uid` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_producto`
--

LOCK TABLES `productos_producto` WRITE;
/*!40000 ALTER TABLE `productos_producto` DISABLE KEYS */;
INSERT INTO `productos_producto` VALUES (1,'Ropa','Pantalon',50,32000,43200,35,11200,'Inactivo',1,1,3,1,1),(2,'Tejidos','Qwer',111,111,123.21000000000001,11,12.21,'Activo',1,1,3,1,1),(3,'Ropa','222',222,222,270.84000000000003,22,48.84,'Activo',1,1,3,2,1);
/*!40000 ALTER TABLE `productos_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-28 21:24:22
