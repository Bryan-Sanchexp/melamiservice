-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: melamiservice
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `contrasena` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (1,'bodegalucero@gmail.com','$2y$10$tdrpW.jUUaVnsEcRDkkoXOlUBlTdMKBZluAA5frChR1/lxglvdmyC','',1),(10,'jeanpi.jpct@gmail.com','$2y$10$tdrpW.jUUaVnsEcRDkkoXOlUBlTdMKBZluAA5frChR1/lxglvdmyC','',1),(15,'osbaldo@gmail.com','$2y$10$tdrpW.jUUaVnsEcRDkkoXOlUBlTdMKBZluAA5frChR1/lxglvdmyC','',1),(20,'emersonloc@yopmail.com','$2y$10$irH7vW12JBuq/5FV17R3QezPCUofFTvuGFBzV7s7n5TPnG5JBybma','',1),(21,'jeanherrera11@yotmail.com','$2y$10$Um0IajFhJs4cZcYIhINH8e52.hiB9eDIjXc9y3klm1LsnpDCPr30i','',1),(22,'luisalcantara@yopmail.com','$2y$10$tdrpW.jUUaVnsEcRDkkoXOlUBlTdMKBZluAA5frChR1/lxglvdmyC','',1),(23,'yosimardensel@gmail.com','$2y$10$ePVwX9bFhrFywDK7hATMRuMvS7RDcKIw9WDukAiDGVTEKNsJqe14y','',1),(24,'ysabel@gmail.com','$2y$10$83Kc8wmv/5qLiSXiPyGEX.Z9d.RzBEystroT7epekg1pspCntOwlS','b39e1180a1ecde3591637d0726de10c3bc0f093502d9f8875135315199b874b8ef200921e3',1);
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrativos`
--

DROP TABLE IF EXISTS `administrativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_acceso` int DEFAULT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `celular` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_acceso` (`id_acceso`) USING BTREE,
  CONSTRAINT `administrativos_ibfk_1` FOREIGN KEY (`id_acceso`) REFERENCES `acceso` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativos`
--

LOCK TABLES `administrativos` WRITE;
/*!40000 ALTER TABLE `administrativos` DISABLE KEYS */;
INSERT INTO `administrativos` VALUES (1,10,'Jean Pier','Carrasco Tamariz',NULL,NULL);
/*!40000 ALTER TABLE `administrativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodegas`
--

DROP TABLE IF EXISTS `bodegas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodegas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_acceso` int DEFAULT NULL,
  `ruc` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `celular` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `localizacion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `dni_propietario` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre_propietario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_acceso` (`id_acceso`) USING BTREE,
  CONSTRAINT `bodegas_ibfk_1` FOREIGN KEY (`id_acceso`) REFERENCES `acceso` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodegas`
--

LOCK TABLES `bodegas` WRITE;
/*!40000 ALTER TABLE `bodegas` DISABLE KEYS */;
INSERT INTO `bodegas` VALUES (1,1,'20145151256','BODEGA LUCERO',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `bodegas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Bebidas',1),(2,'Golosinas',1),(3,'Abarrotes',1),(4,'Limpieza',1),(5,'Carnes y pescados',1),(6,'Lácteos',1),(7,'Aseo personal',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Coca Cola',1),(2,'Gloria',1),(3,'Laive',0),(4,'Nestle',1),(5,'Lays',0),(6,'Bimbo',1),(7,'',0),(8,'Ajinomoto',1),(9,'Colgate',1),(10,'Inka cola',1),(11,'Big Cola',1);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `marca` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
INSERT INTO `materiales` VALUES (1,'Roble Rustico','Vesto',246,12),(2,'Blanco Soft','Duratex',168,22);
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `fecha` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (27,'Bryan Sanchez','San Pedro, Lima','Lima','985365147','bryan@gmail.com','2024-07-07');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_bodega` int DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `stock` decimal(11,2) DEFAULT NULL,
  `stock_minimo` decimal(11,2) DEFAULT NULL,
  `precio_compra` decimal(11,2) DEFAULT NULL,
  `precio_venta` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  `img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_marca` (`id_marca`) USING BTREE,
  KEY `id_bodega` (`id_bodega`) USING BTREE,
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_bodega`) REFERENCES `bodegas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (44,1,2,'Leche Gloria Azul de 400g','Leche gloria de etiqueta azul de 400 gramos',10.00,0.00,3.50,4.50,1.00,'1684294698_leche_gloria.jpg',1),(45,1,2,'Leche Gloria Azul de 170g','Leche gloria azul de 170 gramos con abre fácil',10.00,0.00,1.50,2.20,0.00,'1684294779_leche_gloria_chica.jpg',1),(46,1,4,'Café Instantáneo Nescafé Tradición Frasco 170g','',8.00,0.00,11.50,15.00,0.00,'1684295057_Mesa-de-trabajo-21-3.jpg',1),(47,1,4,'zzz','z',5.00,0.00,11.50,6.00,0.00,'1684295057_Mesa-de-trabajo-21-3.jpg',0),(48,1,2,'Yogurt ','',100.00,10.00,3.50,3.90,0.00,'1684722119_Yogurt Gloria.jpg',0),(49,1,2,'Atun ','',50.00,5.00,4.00,4.50,0.00,'1684722166_Atun Gloria.jpg',0),(50,1,2,'Atun Gloria','',0.00,5.00,4.00,4.50,0.00,'1684722316_Atun Gloria.jpg',1),(51,1,4,'Leche condensada 185g','',10.00,5.00,5.00,5.20,0.00,'1684722522_Leche condensada Nestle.png',1),(52,1,4,'Sublime 30g','',10.00,5.00,0.80,1.00,0.00,'1684722730_Sublime.jpeg',1),(53,1,10,'Inca Kola 1.5L','',10.00,10.00,5.50,6.00,0.00,'1684722860_Inca Kola.jpg',1),(54,1,11,'Big Cola 3L','',100.00,5.00,6.80,7.00,0.00,'1684725886_big-cola 3L.png',0),(55,1,11,'Big Cola 3L','',0.00,5.00,7.90,8.00,0.00,'1684726207_big-cola 3L.png',1),(56,1,9,'Colgate Triple Accion 150ml','',6.00,2.00,3.90,4.50,0.00,'1684726256_Colgate Triple Accion.jpg',1),(57,1,9,'Colgate Luminus White 150ml','',6.00,10.00,6.20,6.70,0.00,'1684726298_Colgate Luminus White.jpg',1),(58,1,4,'Lentejas Nestle  16g','',10.00,5.00,0.90,1.00,0.00,'1684726344_lentejasss-16g.jpg',1),(59,1,4,'Morochas 240g','',10.00,3.00,0.80,1.20,0.00,'1684726405_morochas-240g.jpg',1),(60,1,6,'Pan Bimbo 480g','',10.00,10.00,5.50,6.00,0.00,'1684726461_Pan Bimbo 480g.jpeg',1),(61,1,6,'Paneton Bimbo 900g','',10.00,5.00,20.00,25.00,0.00,'1684726503_Paneton Bimbo 900g.png',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_categorias`
--

DROP TABLE IF EXISTS `productos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_categorias` (
  `id_producto` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  KEY `id_producto` (`id_producto`) USING BTREE,
  KEY `id_categoria` (`id_categoria`) USING BTREE,
  CONSTRAINT `productos_categorias_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productos_categorias_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_categorias`
--

LOCK TABLES `productos_categorias` WRITE;
/*!40000 ALTER TABLE `productos_categorias` DISABLE KEYS */;
INSERT INTO `productos_categorias` VALUES (44,6),(45,6),(46,3),(47,3),(48,6),(49,5),(50,5),(51,6),(52,2),(53,1),(54,1),(55,1),(56,7),(57,7),(58,2),(59,2),(60,3),(61,3);
/*!40000 ALTER TABLE `productos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_historial`
--

DROP TABLE IF EXISTS `productos_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_historial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `fecha_creada` datetime DEFAULT CURRENT_TIMESTAMP,
  `cantidad` decimal(11,2) DEFAULT NULL,
  `precio_venta` decimal(11,2) DEFAULT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE,
  CONSTRAINT `productos_historial_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_historial`
--

LOCK TABLES `productos_historial` WRITE;
/*!40000 ALTER TABLE `productos_historial` DISABLE KEYS */;
INSERT INTO `productos_historial` VALUES (1,44,'2023-06-14 15:42:11',222.00,12.00,0.00),(2,44,'2023-06-14 16:01:25',15.00,4.50,1.00),(3,44,'2023-06-14 16:02:34',3.00,4.50,1.00);
/*!40000 ALTER TABLE `productos_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_acceso` int DEFAULT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `celular` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_acceso` (`id_acceso`) USING BTREE,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_acceso`) REFERENCES `acceso` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,15,'Osbaldo','Laurencio','984545451','Av. los jasmines 351 - Comas'),(3,20,'Emerso','Carranza','984784512','Av. larco 141 - Los Olivos'),(4,21,'Jean Pier','Herrera','987845121','Av. san luis 123 - San Martin'),(5,22,'Luis','Alcantara','996521451','Av. los girasoles 123 - Puente Piedra'),(6,23,'Yosimar','Ramirez','987845123','AV. Los libertadores 14 - Carabayllo'),(7,24,'ysabel','regina','','');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuarios` int DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `celular` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `metodo_envio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `metodo_pago` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `responsable_venta` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `igv` decimal(10,2) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `fecha_venta` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_usuarios` (`id_usuarios`) USING BTREE,
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (23,6,'AV. Los libertadores 14 - Carabayllo','987845123','DELIVERY','EFECTIVO','CLIENTE',24.00,4.32,10.00,34.00,1,'2022-06-02 11:13:14'),(24,6,'AV. Los libertadores 14 - Carabayllo','987845123','DELIVERY','EFECTIVO','BODEGA',6.40,1.15,10.00,16.40,1,'2023-06-14 13:15:11'),(25,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',29.50,5.31,10.00,39.50,1,'2022-06-14 19:06:25'),(27,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-06-14 19:15:37'),(28,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-05-14 19:17:29'),(29,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-06-14 19:18:43'),(30,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-06-14 19:20:01'),(31,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-04-14 19:21:50'),(32,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2022-06-14 19:25:34'),(33,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',16.00,2.88,10.00,26.00,1,'2023-06-14 19:31:40'),(34,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',8.00,1.44,10.00,18.00,1,'2023-06-14 19:52:21'),(35,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',8.00,1.44,10.00,18.00,1,'2023-06-14 19:57:42'),(36,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-06-14 20:17:22'),(37,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',12.50,2.25,10.00,22.50,1,'2023-06-14 20:19:56'),(38,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',20.50,3.69,10.00,30.50,1,'2023-06-14 20:32:48'),(39,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',8.00,1.44,10.00,18.00,1,'2023-06-14 20:33:36'),(40,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',16.00,2.88,10.00,26.00,1,'2023-06-14 20:34:31'),(41,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',20.10,3.62,10.00,30.10,1,'2023-06-14 20:35:48'),(42,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-06-14 20:38:14'),(43,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',9.00,1.62,10.00,19.00,1,'2023-06-14 20:41:31'),(44,5,'Av. los girasoles 123 - Puente Piedra','996521451','DELIVERY','CARD','CLIENTE',19.50,3.51,10.00,29.50,1,'2023-06-14 21:32:49'),(45,5,'Av. los girasoles 123 - Puente Piedra','996521451','DELIVERY','CARD','CLIENTE',4.50,0.81,10.00,14.50,1,'2023-06-14 21:35:14'),(46,1,'Av. los jasmines 351 - Comas','984545451','DELIVERY','CARD','CLIENTE',21.70,3.91,10.00,31.70,1,'2023-06-16 23:59:28');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_venta` (`id_venta`) USING BTREE,
  KEY `id_producto` (`id_producto`) USING BTREE,
  CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
INSERT INTO `ventas_detalle` VALUES (37,23,55,8.00,3,24.00,1),(38,24,44,4.20,1,4.20,1),(39,24,45,2.20,1,2.20,1),(40,25,50,4.50,3,13.50,1),(41,25,55,8.00,2,16.00,1),(56,27,50,4.50,1,4.50,1),(57,28,50,4.50,1,4.50,1),(58,29,50,4.50,1,4.50,1),(59,30,50,4.50,1,4.50,1),(60,31,50,4.50,1,4.50,1),(61,32,50,4.50,1,4.50,1),(62,33,55,8.00,2,16.00,1),(63,34,55,8.00,1,8.00,1),(64,35,55,8.00,1,8.00,1),(65,36,50,4.50,1,4.50,1),(66,37,50,4.50,1,4.50,1),(67,37,55,8.00,1,8.00,1),(68,38,50,4.50,1,4.50,1),(69,38,55,8.00,2,16.00,1),(70,39,55,8.00,1,8.00,1),(71,40,55,8.00,2,16.00,1),(72,41,57,6.70,3,20.10,1),(73,42,56,4.50,1,4.50,1),(74,43,56,4.50,2,9.00,1),(75,44,46,15.00,1,15.00,1),(76,44,56,4.50,1,4.50,1),(77,45,50,4.50,1,4.50,1),(78,46,46,15.00,1,15.00,1),(79,46,57,6.70,1,6.70,1);
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'melamiservice'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_ACCESO_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_ACCESO_USUARIO`(IN _correo VARCHAR(255), IN _contrasena VARCHAR(255), IN _nombres VARCHAR(255), IN _apellidos VARCHAR(255), IN _celular VARCHAR(20), IN _direccion VARCHAR(255))
BEGIN
	DECLARE _idAcceso INT;
	START TRANSACTION;
		INSERT INTO acceso(correo,contrasena) VALUES(_correo,_contrasena);
		SET _idAcceso = LAST_INSERT_ID();
		INSERT INTO usuarios(id_acceso,nombres,apellidos,celular,direccion)
		VALUES(_idAcceso,_nombres,_apellidos,_celular,_direccion);
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_BODEGAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_BODEGAS`(IN _ruc VARCHAR(20), IN _nombre VARCHAR(255), IN _direccion VARCHAR(255), IN _telefono VARCHAR(10), IN _celular VARCHAR(15), IN _localizacion VARCHAR(255), IN _dniPropietario VARCHAR(8), IN _nombrePropietario VARCHAR(255), IN _password VARCHAR(255), IN _correo VARCHAR(255))
BEGIN
	DECLARE _idAcceso INT;
	START TRANSACTION;
	INSERT INTO acceso(correo,contrasena) VALUES(_correo,_password);
	SET _idAcceso = LAST_INSERT_ID();
	INSERT INTO bodegas(id_acceso,ruc,nombre,direccion,telefono,celular,localizacion,dni_propietario,nombre_propietario) VALUES(_idAcceso,_ruc,_nombre,_direccion,_telefono,_celular,_localizacion,_dniPropietario,_nombrePropietario);
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_CATEGORIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_CATEGORIAS`(IN _nombre VARCHAR(255))
BEGIN
	INSERT INTO categorias(nombre) VALUES(_nombre);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_MARCAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_MARCAS`(IN _nombre VARCHAR(255))
BEGIN
	INSERT INTO marcas(nombre) VALUES(_nombre);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_PEDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_PEDIDOS`(IN _cliente VARCHAR(255),IN _ciudad VARCHAR(255),IN _direccion VARCHAR(255),IN _telefono VARCHAR(255),IN _correo VARCHAR(255),IN _fecha VARCHAR(255))
BEGIN
	INSERT INTO pedido(cliente,ciudad,direccion,telefono,correo,fecha) VALUES(_cliente,_ciudad,_direccion,_telefono,_correo,_fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_PRODUCTOS`(IN _idBodega INT,IN _idMarca INT, _nombre VARCHAR(255),IN _descripcion VARCHAR(255), IN _stock DECIMAL(11,2), IN _stockMinimo DECIMAL(11,2),IN _precioCompra DECIMAL(11,2),IN _precioVenta DECIMAL(11,2),IN _descuento DECIMAL(11,2),IN _img VARCHAR(255), IN _listaCategorias JSON)
BEGIN
/*DECLARAMOS LAS VARIABLES NECESARIAS
PARA ASIGNAR VARIAS CATEGORIAS A UN PRODUCTO
*/
DECLARE i INT DEFAULT 0;
DECLARE idProducto INT;
DECLARE idCategoria INT;
DECLARE numItems INT DEFAULT JSON_LENGTH(_listaCategorias);
/*INICIAMOS LA TRANSACCION*/
START TRANSACTION;
	/*INSERTAMOS A LA TABLA PRODUCTOS*/
	INSERT productos(id_bodega,id_marca,nombre,descripcion,stock,stock_minimo,precio_compra,precio_venta,descuento,img)VALUES(_idBodega,_idMarca,_nombre,_descripcion,_stock,_stockMinimo,_precioCompra,_precioVenta,_descuento,_img);
	/*OBTENEMOS EL ID INSERTADO*/
	SET idProducto = LAST_INSERT_ID();
	/*RECORREMOS EL OBJETO CATEGORIA*/
	WHILE i < numItems DO
		/*EXTRAEMOS E INSERTAMOS*/
		SET idCategoria = JSON_EXTRACT(_listaCategorias,CONCAT('$[', i, '].categoria'));
		INSERT INTO productos_categorias VALUES(idProducto,idCategoria);
		/*SUMAMOS EN UNO PARA QUE EL WHILE CONTINUE*/
		SET i = i + 1;
	END WHILE;
/*SI TODO ESTA BIEN SE GUARDA LOS CAMBIOS*/
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_PRODUCTOS_HISTORIAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_PRODUCTOS_HISTORIAL`(IN _producto INT,
	IN _cantidad DECIMAL(11,2),
	IN _descuento DECIMAL(11,2),
	IN _precio_venta DECIMAL(11,2))
BEGIN
START TRANSACTION;
	INSERT INTO productos_historial(id_producto,cantidad,precio_venta,descuento)
	VALUES(_producto,_cantidad,_precio_venta,_descuento);
	
	UPDATE productos SET stock = _cantidad,precio_venta=_precio_venta,descuento=_descuento
	WHERE id = _producto;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_C_T_VENTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_T_VENTAS`(IN _idUsuario INT,
IN _direccion VARCHAR(255),
IN _celular VARCHAR(20), 
IN _metodoEnvio VARCHAR(50),
IN _metodoPago VARCHAR(50),
IN _responsableVenta VARCHAR(50),
IN _subtotal DECIMAL(10,2),
IN _envio DECIMAL(10,2),
IN _total DECIMAL(10,2),
IN _igv DECIMAL(10,2),
IN _detalleVentas JSON)
BEGIN
/*DECLARAMOS LAS VARIABLES NECESARIAS
PARA ASIGNAR VARIOS DETALLES A UNA VENTA
*/
DECLARE i INT DEFAULT 0;
DECLARE idVenta INT;
DECLARE idProducto INT;
DECLARE precioVenta,cantidad,subTotal DECIMAL(10,2);
DECLARE numItems INT DEFAULT JSON_LENGTH(_detalleVentas);
/*INICIAMOS LA TRANSACCION*/
START TRANSACTION;
	/*INSERTAMOS A LA TABLA VENTAS*/
	INSERT ventas(id_usuarios,direccion,celular,metodo_envio,metodo_pago,responsable_venta,subtotal,envio,total,igv)VALUES(_idUsuario,_direccion,_celular,_metodoEnvio,_metodoPago,_responsableVenta,_subtotal,_envio,_total,_igv);
	/*OBTENEMOS EL ID INSERTADO*/
	SET idVenta = LAST_INSERT_ID();
	/*RECORREMOS EL OBJETO DETALLE VENTAS*/
	WHILE i < numItems DO
		/*EXTRAEMOS E INSERTAMOS*/
		SET idProducto = JSON_EXTRACT(_detalleVentas,CONCAT('$[', i, '].id'));
		SET precioVenta = JSON_EXTRACT(_detalleVentas,CONCAT('$[', i, '].precio_venta'));
		SET cantidad = JSON_EXTRACT(_detalleVentas,CONCAT('$[', i, '].cantidad'));
		SET subTotal = JSON_EXTRACT(_detalleVentas,CONCAT('$[', i, '].sub_total'));
		INSERT INTO ventas_detalle(id_venta,id_producto,precio_venta,cantidad,subtotal) VALUES(idVenta,idProducto,precioVenta,cantidad,subTotal);
		/*SUMAMOS EN UNO PARA QUE EL WHILE CONTINUE*/
		UPDATE productos SET stock = stock - cantidad WHERE id = idProducto AND estado = 1;
		SET i = i + 1;
	END WHILE;
/*SI TODO ESTA BIEN SE GUARDA LOS CAMBIOS*/
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DASHBOARD_PRODUCTOS_VENDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DASHBOARD_PRODUCTOS_VENDIDOS`(IN _fechaInicio DATE, IN _fechaFin DATE, IN _idBodega INT)
BEGIN
	SELECT
	p.nombre,
	SUM( v.cantidad ) AS cantidadVendida 
FROM
	productos p
	INNER JOIN (
	SELECT
		vd.* 
	FROM
		ventas_detalle vd
		INNER JOIN ventas ve ON ve.id = vd.id_venta 
	WHERE
		DATE_FORMAT( ve.fecha_venta, '%Y-%m-%d' ) BETWEEN _fechaInicio 
		AND _fechaFin 
	) AS v ON p.id = v.id_producto
	INNER JOIN bodegas b ON p.id_bodega = b.id 
WHERE
	b.id = _idBodega 
GROUP BY
	p.id 
ORDER BY
	cantidadVendida DESC 
	LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DASHBOARD_PRODUCTOS_VENDIDOS_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DASHBOARD_PRODUCTOS_VENDIDOS_CATEGORIA`(IN _fechaInicio DATE, 
IN _fechaFin DATE, 
IN _idBodega INT)
BEGIN
	SELECT
	pc.nombreCategoria,
	SUM( v.cantidad ) AS cantidadVendida 
FROM
	productos p
	INNER JOIN (
	SELECT
		vd.* 
	FROM
		ventas_detalle vd
		INNER JOIN ventas ve ON ve.id = vd.id_venta 
	WHERE
		DATE_FORMAT( ve.fecha_venta, '%Y-%m-%d' ) BETWEEN _fechaInicio 
		AND _fechaFin 
	) AS v ON p.id = v.id_producto
	INNER JOIN bodegas b ON p.id_bodega = b.id
	INNER JOIN (
	SELECT
		c.id AS idCategoria,
		c.nombre AS nombreCategoria,
		pc.id_producto 
	FROM
		categorias c
		INNER JOIN productos_categorias pc ON c.id = pc.id_categoria 
	) pc ON pc.id_producto = p.id 
WHERE
	b.id = _idBodega 
GROUP BY
	pc.idCategoria 
ORDER BY
	cantidadVendida DESC 
	LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DASHBOARD_PRODUCTOS_VENDIDOS_YEAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DASHBOARD_PRODUCTOS_VENDIDOS_YEAR`(IN _fechaInicio DATE, 
IN _fechaFin DATE, 
IN _idBodega INT)
BEGIN
SET lc_time_names = 'es_ES';
SET sql_mode = '';
WITH RECURSIVE mes ( n ) AS ( SELECT MONTH ( _fechaInicio ) UNION ALL SELECT n + 1 FROM mes WHERE n < MONTH ( _fechaFin ) ) SELECT
UPPER(
	MONTHNAME(
	CONCAT( '2022-', LPAD( n, 2, 0 ), '-01' ))) AS nombreMes,(
	SELECT
	IF
		( SUM( vd.subtotal ) IS NULL, 0, vd.subtotal ) 
	FROM
		ventas_detalle vd
		INNER JOIN ( SELECT p.* FROM productos p INNER JOIN bodegas b ON p.id_bodega = b.id WHERE b.id = _idBodega ) AS b ON b.id = vd.id_producto
		INNER JOIN ventas v ON v.id = vd.id_venta 
	WHERE
		DATE_FORMAT( v.fecha_venta, '%Y-%m-%d' ) BETWEEN _fechaInicio 
		AND _fechaFin 
		AND MONTH ( fecha_venta ) = n 
	) AS montoVendido 
FROM
	mes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DASHBOARD_RANKIN_BODEGAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DASHBOARD_RANKIN_BODEGAS`(IN _fechaInicio DATE, 
IN _fechaFin DATE)
BEGIN
	SELECT
	b.nombre AS nombreBodega,
	SUM( v.subtotal ) AS montoVendido 
FROM
	bodegas b
	INNER JOIN (
	SELECT
		vd.subtotal,
		p.id_bodega 
	FROM
		ventas_detalle vd
		INNER JOIN productos p ON vd.id_producto = p.id
		INNER JOIN ventas ve ON ve.id = vd.id_venta 
	WHERE
		DATE_FORMAT( ve.fecha_venta, '%Y-%m-%d' ) BETWEEN _fechaInicio 
		AND _fechaFin 
	) AS v ON b.id = v.id_bodega 
GROUP BY
	b.id 
ORDER BY
	montoVendido DESC 
	LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_T_CATEGORIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_T_CATEGORIAS`(IN _idCategoria INT)
BEGIN
	UPDATE categorias SET  estado=0 WHERE id = _idCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_T_MARCAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_T_MARCAS`(IN _idMarca INT)
BEGIN
	UPDATE marcas SET estado = 0 WHERE id = _idMarca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_T_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_T_PEDIDO`(IN _idPedido INT)
BEGIN
	DELETE FROM pedido WHERE id = _idPedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_D_T_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_T_PRODUCTOS`(IN _idProducto INT, IN _idBodega INT)
BEGIN
	/*HACEMOS UN UPDATE EN ESTADO PARA QUE SE OCULTE */
	UPDATE 	productos SET estado = 0 
	/*APLICANDO LA CONDICIONAL PARA OBTENER EL PRODUCTO*/
	WHERE id = _idProducto AND id_bodega = _idBodega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_ACCESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_ACCESO`(IN _token VARCHAR(255))
BEGIN
	SELECT 
	c.id AS idAcceso,
	CASE 
		WHEN b.id IS NOT NULL THEN b.id
		WHEN a.id IS NOT NULL THEN a.id
		WHEN u.id IS NOT NULL THEN u.id
		ELSE NULL
	END AS idAccesoRol,
	CASE 
		WHEN b.id IS NOT NULL THEN 'rol_bodega'
		WHEN a.id IS NOT NULL THEN 'rol_administrador'
		WHEN u.id IS NOT NULL THEN 'rol_usuario'
		ELSE NULL
		END AS rol,
	CASE 
		WHEN b.id IS NOT NULL THEN b.nombre
		WHEN a.id IS NOT NULL THEN a.nombres
		WHEN u.id IS NOT NULL THEN u.nombres
		ELSE NULL
		END AS nombres,
	CASE 
		WHEN b.id IS NOT NULL THEN NULL
		WHEN a.id IS NOT NULL THEN a.apellidos
		WHEN u.id IS NOT NULL THEN u.apellidos
		ELSE NULL
		END AS apellidos,
	CASE 
		WHEN b.id IS NOT NULL THEN NULL
		WHEN a.id IS NOT NULL THEN NULL
		WHEN u.id IS NOT NULL THEN u.direccion
		ELSE NULL
		END AS direccion,
	CASE 
		WHEN b.id IS NOT NULL THEN NULL
		WHEN a.id IS NOT NULL THEN NULL
		WHEN u.id IS NOT NULL THEN u.celular
		ELSE NULL
		END AS celular,
	c.correo
 FROM acceso c 
 LEFT JOIN bodegas b 
 ON b.id_acceso = c.id 
 LEFT JOIN administrativos a 
 ON a.id_acceso = c.id 
 LEFT JOIN usuarios u ON u.id_acceso = c.id
 WHERE c.token = _token AND _token != '' LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_ACCESO_VERIFICAR_DUPLICIDAD_CORREO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_ACCESO_VERIFICAR_DUPLICIDAD_CORREO`(IN _correo VARCHAR(255))
BEGIN
	SELECT correo FROM acceso WHERE correo LIKE CONCAT('%',_correo,'%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_BODEGAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_BODEGAS`()
BEGIN
	SELECT 
	b.id,b.ruc,b.nombre,b.direccion,a.correo,b.telefono,b.celular,b.nombre_propietario 
	FROM bodegas b
	INNER JOIN acceso a
	ON b.id_acceso = a.id
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_CATEGORIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_CATEGORIAS`()
BEGIN
	SELECT id,nombre AS nombreCategoria FROM categorias WHERE estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_CATEGORIAS_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_CATEGORIAS_PRODUCTOS`()
BEGIN
	SELECT c.id,c.nombre AS categoria,COUNT(*) AS numeroProductos FROM categorias c
	INNER JOIN productos_categorias pc
	ON c.id = pc.id_categoria
	INNER JOIN productos p
	ON p.id = pc.id_producto
	WHERE c.estado = 1
	AND p.estado = 1 GROUP BY c.id ORDER BY c.nombre ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_MARCAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_MARCAS`()
BEGIN
	SELECT id,nombre AS nombreMarca FROM marcas WHERE estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_MARCAS_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_MARCAS_PRODUCTOS`()
BEGIN
	SELECT m.id,m.nombre AS marcas,COUNT(*) AS numeroProductos FROM marcas m
	INNER JOIN productos p
	ON p.id_marca = m.id
	WHERE m.estado = 1
	AND p.estado = 1 GROUP BY m.id ORDER BY m.nombre ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PEDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PEDIDOS`()
BEGIN
	SELECT 
	p.id,p.cliente,p.ciudad,p.direccion,p.telefono,p.correo,p.fecha
	FROM pedido p
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS`()
BEGIN
/*SELECCIONAMOS LOS CAMPOS NECESARIOS*/
	SELECT p.nombre,descripcion,GROUP_CONCAT(c.nombre SEPARATOR ';') AS categorias,m.nombre AS nombre_marca,
	precio_compra,precio_venta,stock,stock_minimo,p.id AS id_producto
FROM productos p 
/*RELACIONAMOS CON LA TABLA DETALLE CATEGORIAS*/
	INNER JOIN productos_categorias pc
	ON p.id = pc.id_producto
/*RELACIONAMOS CON LAS CATEGORIAS*/
	INNER JOIN categorias c
	ON c.id = pc.id_categoria
/*RELACIONAMOS CON LA TABLA MARCA*/
	INNER JOIN marcas m
	ON m.id = p.id_marca
/*SOLO MOSTRAMOS LOS QUE ESTAN ACTIVOS*/
	WHERE p.estado = 1 GROUP BY p.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS_BODEGA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS_BODEGA`(IN _bodega INT,
	IN _idProducto INT)
BEGIN
	SELECT id,nombre,stock,precio_venta,descuento FROM productos p
	WHERE id_bodega = _bodega AND IF(_idProducto = 0, p.id LIKE CONCAT('%','','%'),p.id = _idProducto) AND estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS_COMPRAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS_COMPRAS`(IN _nombreProduct VARCHAR(255), IN _ordenaras VARCHAR(255), IN _categorias VARCHAR(255), IN _marcas VARCHAR(255))
BEGIN
	/*AUTOR: JEAN PIER CARRASCO*/
	/*SELECCIONAMOS LAS COLUMNAS NECESARIAS*/
	SELECT p.id,p.nombre,p.img,p.precio_venta,p.stock,b.nombre AS bodega,m.nombre AS marca FROM productos p
	/*RELACIONAMOS CON LAS TABLAS CORRESPONDIENTES*/
	INNER JOIN productos_categorias pc
	ON pc.id_producto = p.id
	INNER JOIN bodegas b
	ON p.id_bodega = b.id
	INNER JOIN marcas m
	ON p.id_marca = m.id
	/*APLICAMOS LAS CONDICIONALES*/
	WHERE p.estado = 1 AND b.estado = 1 AND p.stock > 0
	AND IF(_categorias != '',FIND_IN_SET(pc.id_categoria,_categorias) > 0,p.id LIKE CONCAT('%','','%'))
	AND IF(_marcas != '',FIND_IN_SET(p.id_marca,_marcas) > 0,p.id LIKE CONCAT('%','','%'))
	AND p.nombre LIKE CONCAT('%',_nombreProduct,'%') 
	/*ORDENAMOS DE ACUERDO AL FILTRO */
	ORDER BY
	IF(_ordenaras = 'precio-menor',p.precio_venta,NULL) ASC,
	IF(_ordenaras = 'precio-mayor',p.precio_venta,NULL) DESC,
	IF(_ordenaras = 'nombre-asc',p.nombre,NULL) ASC,
	IF(_ordenaras = 'nombre-desc',p.nombre,NULL) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS_COMPRAS_CARRITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS_COMPRAS_CARRITO`(IN _idProductos VARCHAR(255))
BEGIN
	/*AUTOR: JEAN PIER CARRASCO*/
	/*SELECCIONAMOS LAS COLUMNAS NECESARIAS*/
	SELECT p.id,p.nombre,p.img,p.precio_venta,p.stock,b.nombre AS bodega FROM productos p
		/*RELACIONAMOS CON LAS TABLAS CORRESPONDIENTES*/
	INNER JOIN bodegas b
	ON p.id_bodega = b.id
		/*APLICAMOS LAS CONDICIONALES*/
	WHERE p.estado = 1 AND b.estado = 1 
	AND IF(_idProductos != '',FIND_IN_SET(p.id,_idProductos) > 0,p.id LIKE CONCAT('%','','%'))
	/*ORDENAMOS POR NOMBRE*/
	ORDER BY p.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS_HISTORIAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS_HISTORIAL`(IN _idProducto INT,
	IN _idBodega INT)
BEGIN
	SELECT ph.id,ph.cantidad,ph.descuento,ph.precio_venta,DATE_FORMAT(ph.fecha_creada,'%d/%m/%Y %h:%i %p')AS fechaHr FROM productos_historial ph 
	INNER JOIN productos p
	ON ph.id_producto = p.id
	WHERE ph.id_producto = _idProducto
	AND p.id_bodega = _idBodega ORDER BY ph.fecha_creada DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS_VERIFICAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS_VERIFICAR_CLIENTE`(IN _idProducto VARCHAR(250))
BEGIN
	SELECT id,nombre,stock,precio_venta FROM productos p
	WHERE estado = 1 AND FIND_IN_SET(id,_idProducto) > 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_PRODUCTOS_VERIFICAR_STOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_PRODUCTOS_VERIFICAR_STOCK`(IN _bodega INT,
	IN _idProducto VARCHAR(255))
BEGIN
	SELECT id,nombre,stock,precio_venta FROM productos p
	WHERE id_bodega = _bodega AND estado = 1 AND FIND_IN_SET(id,_idProducto) > 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_USUARIOS_MOSTRAR_CLIENTES_BODEGA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_USUARIOS_MOSTRAR_CLIENTES_BODEGA`(IN _idUsuario INT)
BEGIN
	SELECT u.id,u.celular,u.direccion,a.correo,u.nombres,u.apellidos FROM usuarios u
	INNER JOIN acceso a
	ON u.id_acceso = a.id 
	WHERE a.estado = 1 AND IF(_idUsuario = 0, u.id LIKE CONCAT('%','','%'),u.id = _idUsuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_VENTAS_BODEGAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_VENTAS_BODEGAS`(IN _bodega INT,
	IN _fechaInicio DATE,
	IN _fechaFin DATE)
BEGIN
	SELECT
	v.id,
	DATE_FORMAT( v.fecha_venta, '%d/%m/%Y' ) AS fecha,
	LPAD( v.id, 5, '0' ) AS nroVenta,
	CONCAT( u.nombres, ' ', u.apellidos ) AS nombresCliente,
	v.celular,
	v.metodo_pago,
	v.direccion,
	SUM( vd.cantidad ) AS cantidadProductos,
	COUNT( vd.id ) AS nroProductos,
	ROUND(( SUM( vd.subtotal ) - SUM( vd.subtotal ) * 0.18 ), 2 ) AS subtotal,
	ROUND(( SUM( vd.subtotal ) * 0.18 ), 2 ) AS igv,
	SUM( vd.subtotal ) AS total 
FROM
	ventas_detalle vd
	INNER JOIN ventas v ON vd.id_venta = v.id
	INNER JOIN productos p ON vd.id_producto = p.id
	INNER JOIN usuarios u ON u.id = v.id_usuarios 
WHERE
	v.estado != 0 
	AND p.id_bodega = _bodega 
	AND DATE_FORMAT( v.fecha_venta, '%Y-%m-%d' ) BETWEEN _fechaInicio 
	AND _fechaFin 
GROUP BY
	v.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_R_T_VENTAS_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_T_VENTAS_PRODUCTOS`(IN _idVenta INT)
BEGIN
	SELECT p.nombre,vd.cantidad,vd.precio_venta,vd.subtotal FROM ventas_detalle vd
	LEFT JOIN productos p
	ON vd.id_producto = p.id
	WHERE vd.id_venta =  _idVenta AND vd.estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_T_CATEGORIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_T_CATEGORIAS`(IN _idCategoria INT, IN _nombre VARCHAR(255))
BEGIN
	UPDATE categorias SET  nombre=_nombre WHERE id = _idCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_T_MARCAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_T_MARCAS`(IN _idMarca INT, IN _nombre VARCHAR(255))
BEGIN
	UPDATE marcas SET  nombre=_nombre WHERE id=_idMarca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_U_T_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_T_PRODUCTOS`(IN _idProducto INT, IN _idBodega INT,IN _idMarca INT, _nombre VARCHAR(255),IN _descripcion VARCHAR(255), IN _stock DECIMAL(11,2), IN _stockMinimo DECIMAL(11,2),IN _precioCompra DECIMAL(11,2),IN _precioVenta DECIMAL(11,2),IN _descuento DECIMAL(11,2),IN _img VARCHAR(255), IN _listaCategorias JSON)
BEGIN
/*DECLARAMOS LAS VARIABLES NECESARIAS
PARA ASIGNAR VARIAS CATEGORIAS A UN PRODUCTO
*/
DECLARE i INT DEFAULT 0;
DECLARE idCategoria INT;
DECLARE numItems INT DEFAULT JSON_LENGTH(_listaCategorias);
/*INICIAMOS LA TRANSACCION*/
START TRANSACTION;
	/*ACTUALIZAMOS LA TABLA PRODUCTOS CONDICIONANDO SU ID Y SU ID BODEGA*/
	UPDATE productos SET id_marca = _idMarca,nombre=_nombre,descripcion=_descripcion,stock=_stock,stock_minimo=_stockMinimo,precio_compra=_precioCompra,precio_venta=_precioVenta,descuento=_descuento,img=_img WHERE id = _idProducto AND id_bodega = _idBodega;
	/*ELIMINAMOS TODOS LOS DETALLES DE LA CATEGORIA*/
	DELETE FROM productos_categorias WHERE id_producto = _idProducto;
	/*RECORREMOS EL OBJETO CATEGORIA PARA INSERTAR LAS CATEGORIAS NUEVAS*/
	WHILE i < numItems DO
		/*EXTRAEMOS E INSERTAMOS*/
		SET idCategoria = JSON_EXTRACT(_listaCategorias,CONCAT('$[', i, '].categoria'));
		INSERT INTO productos_categorias VALUES(_idProducto,idCategoria);
		/*SUMAMOS EN UNO PARA QUE EL WHILE CONTINUE*/
		SET i = i + 1;
	END WHILE;
/*SI TODO ESTA BIEN SE GUARDA LOS CAMBIOS*/
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10  1:43:57
