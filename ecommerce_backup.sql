-- MySQL dump 10.13  Distrib 5.7.20, for Win32 (AMD64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ecommerce`;

--
-- Table structure for table `client_pf`
--

DROP TABLE IF EXISTS `client_pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_pf` (
  `idClient` int(11) NOT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `cpf` (`cpf`),
  CONSTRAINT `client_pf_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_pf`
--

LOCK TABLES `client_pf` WRITE;
/*!40000 ALTER TABLE `client_pf` DISABLE KEYS */;
INSERT INTO `client_pf` VALUES (1,'00012346789'),(3,'00045678913'),(6,'00065478912'),(4,'00078912345'),(5,'00098745631'),(2,'00098765432');
/*!40000 ALTER TABLE `client_pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_pj`
--

DROP TABLE IF EXISTS `client_pj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_pj` (
  `idClient` int(11) NOT NULL,
  `cnpj` char(14) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `cnpj` (`cnpj`),
  CONSTRAINT `client_pj_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_pj`
--

LOCK TABLES `client_pj` WRITE;
/*!40000 ALTER TABLE `client_pj` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_pj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_client` (`cpf`),
  UNIQUE KEY `idx_clients_cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','M','Silva','12346789','Rua Nova, 123'),(2,'Matheus','O','Pimentel','987654321','Rua Alameda 289, Centro - Cidade das Flores'),(3,'Ricardo','F','Silva','45678913','Avenida Alameda Vinha 1009, Centro - Cidade das Flores'),(4,'Julia','S','França','789123456','Rua Lareijras 861, Centro - Cidade das Flores'),(5,'Roberta','G','Assis','98745631','Avenida de Koller 19, Centro - Cidade das Flores'),(6,'Isabela','M','Cruz','654789123','Rua Alameda das Flores 28, Centro - Cidade das Flores'),(7,'Paulo','P','Silva','12345678901','Rua das Flores, 456');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_delete_client
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    INSERT INTO deleted_clients_history (
        idClient, Fname, Minit, Lname, cpf, address, deleted_at
    )
    VALUES (
        OLD.idClient, OLD.Fname, OLD.Minit, OLD.Lname, OLD.cpf, OLD.address, NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `deleted_clients_history`
--

DROP TABLE IF EXISTS `deleted_clients_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_clients_history` (
  `idClient` int(11) DEFAULT NULL,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_clients_history`
--

LOCK TABLES `deleted_clients_history` WRITE;
/*!40000 ALTER TABLE `deleted_clients_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_clients_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `idDelivery` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) DEFAULT NULL,
  `deliveryStatus` enum('Pendente','Em Transporte','Entregue','Cancelado') DEFAULT 'Pendente',
  `trackingCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDelivery`),
  KEY `idOrder` (`idOrder`),
  KEY `idx_delivery_status` (`deliveryStatus`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,'Em Transporte','BR1234567890BR'),(2,2,'Entregue','BR9876543210BR'),(3,3,'Pendente',NULL),(4,4,'Cancelado',NULL);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `idDepartment` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`idDepartment`),
  KEY `idx_department_city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'TI','São Paulo'),(2,'RH','São Paulo'),(3,'Marketing','Rio de Janeiro'),(4,'Financeiro','Brasília');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependents`
--

DROP TABLE IF EXISTS `dependents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependents` (
  `idDependent` int(11) NOT NULL AUTO_INCREMENT,
  `idEmployee` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDependent`),
  KEY `idEmployee` (`idEmployee`),
  CONSTRAINT `dependents_ibfk_1` FOREIGN KEY (`idEmployee`) REFERENCES `employees` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependents`
--

LOCK TABLES `dependents` WRITE;
/*!40000 ALTER TABLE `dependents` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `idEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `idDepartment` int(11) DEFAULT NULL,
  `baseSalary` float DEFAULT '0',
  PRIMARY KEY (`idEmployee`),
  KEY `idx_employee_department` (`idDepartment`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`idDepartment`) REFERENCES `departments` (`idDepartment`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'João','Silva',1,0),(2,'Maria','Oliveira',1,0),(3,'Carlos','Pereira',2,0),(4,'Ana','Souza',2,0),(5,'Paulo','Almeida',2,0),(6,'Fernanda','Costa',3,0),(7,'Juliana','Lima',4,0),(8,'Bruno','Ferraz',1,0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_update_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.baseSalary <> NEW.baseSalary THEN
        INSERT INTO salary_update_log (
            idEmployee, oldSalary, newSalary, updated_at
        ) VALUES (
            OLD.idEmployee, OLD.baseSalary, NEW.baseSalary, NOW()
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idOrderClient` int(11) DEFAULT NULL,
  `orderStatus` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `orderDescription` varchar(255) DEFAULT NULL,
  `sendValue` float DEFAULT '10',
  `paymentCash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idOrder`),
  KEY `idx_orders_idOrderClient` (`idOrderClient`),
  KEY `idx_orders_status` (`orderStatus`),
  CONSTRAINT `fk_orders_client` FOREIGN KEY (`idOrderClient`) REFERENCES `clients` (`idClient`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Em processamento','Compra via aplicativo',NULL,1),(2,2,'Em processamento','Compra via aplicativo',50,0),(3,3,'Confirmado',NULL,NULL,1),(4,4,'Em processamento','Compra via web site',150,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `idPayment` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) DEFAULT NULL,
  `method` enum('Cartão de Crédito','Cartão de Débito','Pix','Boleto','Dinheiro') NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`idPayment`),
  KEY `idOrder` (`idOrder`),
  CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,1,'Dinheiro',100),(2,2,'Pix',50),(3,3,'Dinheiro',75),(4,4,'Cartão de Crédito',150);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `Pname` varchar(255) NOT NULL,
  `classification_kids` tinyint(1) DEFAULT '0',
  `category` enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') DEFAULT 'Eletronico',
  `avaliacao` float DEFAULT '0',
  `size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `idx_product_category` (`category`),
  KEY `idx_product_Pname` (`Pname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fone de ouvido',0,'Eletronico',4,NULL),(2,'Barbie Elsa',1,'Brinquedos',3,NULL),(3,'Body Carters',1,'Vestimenta',5,NULL),(4,'Microfone Vedo - Youtuber',0,'Eletronico',4,NULL),(5,'Sofá retrátil',0,'Moveis',3,'3x57x80'),(6,'Farinha de arroz',0,'Alimentos',2,NULL),(7,'Fire Stick Amazon',0,'Eletronico',3,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productorder` (
  `idPOproduct` int(11) NOT NULL,
  `idPOorder` int(11) NOT NULL,
  `poQuantity` int(11) DEFAULT '1',
  `poStatus` enum('Disponivel','Sem Estoque') DEFAULT 'Disponivel',
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `idx_productOrder_idPOorder` (`idPOorder`),
  CONSTRAINT `fk_productorder_product` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_productorder_seller` FOREIGN KEY (`idPOproduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (1,1,2,NULL),(2,1,1,NULL),(3,2,1,NULL);
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productseller` (
  `idPSeller` int(11) NOT NULL,
  `idPproduct` int(11) NOT NULL,
  `prodQuantity` int(11) DEFAULT '1',
  PRIMARY KEY (`idPSeller`,`idPproduct`),
  KEY `fk_product_product` (`idPproduct`),
  CONSTRAINT `fk_product_product` FOREIGN KEY (`idPproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`idPSeller`) REFERENCES `seller` (`idSeller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstorage`
--

DROP TABLE IF EXISTS `productstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productstorage` (
  `idProdStorage` int(11) NOT NULL AUTO_INCREMENT,
  `storageLocation` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`idProdStorage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstorage`
--

LOCK TABLES `productstorage` WRITE;
/*!40000 ALTER TABLE `productstorage` DISABLE KEYS */;
INSERT INTO `productstorage` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',100),(5,'São Paulo',10),(6,'Brasília',60);
/*!40000 ALTER TABLE `productstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsupplier`
--

DROP TABLE IF EXISTS `productsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productsupplier` (
  `idPsSupplier` int(11) NOT NULL,
  `idPsProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`idPsSupplier`,`idPsProduct`),
  KEY `idx_productSupplier_idPsProduct` (`idPsProduct`),
  CONSTRAINT `fk_product_supplier_product` FOREIGN KEY (`idPsProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_supplier_supplier` FOREIGN KEY (`idPsSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsupplier`
--

LOCK TABLES `productsupplier` WRITE;
/*!40000 ALTER TABLE `productsupplier` DISABLE KEYS */;
INSERT INTO `productsupplier` VALUES (1,1,500),(1,2,400),(2,4,633),(2,5,10),(3,3,5);
/*!40000 ALTER TABLE `productsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_update_log`
--

DROP TABLE IF EXISTS `salary_update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_update_log` (
  `idLog` int(11) NOT NULL AUTO_INCREMENT,
  `idEmployee` int(11) DEFAULT NULL,
  `oldSalary` float DEFAULT NULL,
  `newSalary` float DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_update_log`
--

LOCK TABLES `salary_update_log` WRITE;
/*!40000 ALTER TABLE `salary_update_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_update_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `idSeller` int(11) NOT NULL AUTO_INCREMENT,
  `socialName` varchar(255) NOT NULL,
  `abstName` varchar(255) DEFAULT NULL,
  `cnpj` char(15) DEFAULT NULL,
  `cpf` char(9) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `unique_cnpj_seller` (`cnpj`),
  UNIQUE KEY `unique_cpf_seller` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Tech eletronics',NULL,'123456789456321',NULL,'Rio de Janeiro','219946287'),(2,'Botique Durgas',NULL,NULL,'123456783','Rio de Janeiro','219567895'),(3,'Kids World',NULL,'456789123654485',NULL,'São Paulo','1198657484');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagelocation`
--

DROP TABLE IF EXISTS `storagelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagelocation` (
  `idLproduct` int(11) NOT NULL,
  `idLStorage` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduct`,`idLStorage`),
  KEY `fk_storage_location_storage` (`idLStorage`),
  CONSTRAINT `fk_storage_location_product` FOREIGN KEY (`idLproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_storage_location_storage` FOREIGN KEY (`idLStorage`) REFERENCES `productstorage` (`idProdStorage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagelocation`
--

LOCK TABLES `storagelocation` WRITE;
/*!40000 ALTER TABLE `storagelocation` DISABLE KEYS */;
INSERT INTO `storagelocation` VALUES (1,2,'RJ'),(2,6,'GO');
/*!40000 ALTER TABLE `storagelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `socialName` varchar(255) NOT NULL,
  `cnpj` char(15) NOT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `unique_supplier` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Almeida e filhos','123456789123456','21985474'),(2,'Eletrônicos Silva','854519649143457','21985484'),(3,'Eletrônicos Valma','934567893934695','21975474');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_departments_and_managers`
--

DROP TABLE IF EXISTS `vw_departments_and_managers`;
/*!50001 DROP VIEW IF EXISTS `vw_departments_and_managers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_departments_and_managers` AS SELECT 
 1 AS `idDepartment`,
 1 AS `department_name`,
 1 AS `city`,
 1 AS `manager_firstname`,
 1 AS `manager_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_employees_by_department_city`
--

DROP TABLE IF EXISTS `vw_employees_by_department_city`;
/*!50001 DROP VIEW IF EXISTS `vw_employees_by_department_city`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_employees_by_department_city` AS SELECT 
 1 AS `department_name`,
 1 AS `city`,
 1 AS `total_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_employees_with_dependents_and_manager_status`
--

DROP TABLE IF EXISTS `vw_employees_with_dependents_and_manager_status`;
/*!50001 DROP VIEW IF EXISTS `vw_employees_with_dependents_and_manager_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_employees_with_dependents_and_manager_status` AS SELECT 
 1 AS `idEmployee`,
 1 AS `Fname`,
 1 AS `Lname`,
 1 AS `department_name`,
 1 AS `num_dependents`,
 1 AS `is_manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_projects_by_employee_count`
--

DROP TABLE IF EXISTS `vw_projects_by_employee_count`;
/*!50001 DROP VIEW IF EXISTS `vw_projects_by_employee_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_projects_by_employee_count` AS SELECT 
 1 AS `project_name`,
 1 AS `total_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_projects_departments_managers`
--

DROP TABLE IF EXISTS `vw_projects_departments_managers`;
/*!50001 DROP VIEW IF EXISTS `vw_projects_departments_managers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_projects_departments_managers` AS SELECT 
 1 AS `department_name`,
 1 AS `city`,
 1 AS `manager_firstname`,
 1 AS `manager_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `ecommerce`
--

USE `ecommerce`;

--
-- Final view structure for view `vw_departments_and_managers`
--

/*!50001 DROP VIEW IF EXISTS `vw_departments_and_managers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_departments_and_managers` AS select `d`.`idDepartment` AS `idDepartment`,`d`.`name` AS `department_name`,`d`.`city` AS `city`,`e`.`Fname` AS `manager_firstname`,`e`.`Lname` AS `manager_lastname` from (`departments` `d` join `employees` `e` on((`e`.`idEmployee` = (select min(`employees`.`idEmployee`) from `employees` where (`employees`.`idDepartment` = `d`.`idDepartment`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employees_by_department_city`
--

/*!50001 DROP VIEW IF EXISTS `vw_employees_by_department_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employees_by_department_city` AS select `d`.`name` AS `department_name`,`d`.`city` AS `city`,count(`e`.`idEmployee`) AS `total_employees` from (`departments` `d` left join `employees` `e` on((`d`.`idDepartment` = `e`.`idDepartment`))) group by `d`.`name`,`d`.`city` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employees_with_dependents_and_manager_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_employees_with_dependents_and_manager_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employees_with_dependents_and_manager_status` AS select `e`.`idEmployee` AS `idEmployee`,`e`.`Fname` AS `Fname`,`e`.`Lname` AS `Lname`,`d`.`name` AS `department_name`,count(`dep`.`idDependent`) AS `num_dependents`,(case when (`e`.`idEmployee` = (select min(`e2`.`idEmployee`) from `employees` `e2` where (`e2`.`idDepartment` = `e`.`idDepartment`))) then 'Sim' else 'Não' end) AS `is_manager` from ((`employees` `e` left join `dependents` `dep` on((`e`.`idEmployee` = `dep`.`idEmployee`))) join `departments` `d` on((`e`.`idDepartment` = `d`.`idDepartment`))) group by `e`.`idEmployee`,`e`.`Fname`,`e`.`Lname`,`d`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_projects_by_employee_count`
--

/*!50001 DROP VIEW IF EXISTS `vw_projects_by_employee_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_projects_by_employee_count` AS select `d`.`name` AS `project_name`,count(`e`.`idEmployee`) AS `total_employees` from (`departments` `d` join `employees` `e` on((`d`.`idDepartment` = `e`.`idDepartment`))) group by `d`.`name` order by `total_employees` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_projects_departments_managers`
--

/*!50001 DROP VIEW IF EXISTS `vw_projects_departments_managers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_projects_departments_managers` AS select `d`.`name` AS `department_name`,`d`.`city` AS `city`,`e`.`Fname` AS `manager_firstname`,`e`.`Lname` AS `manager_lastname` from (`departments` `d` join `employees` `e` on((`e`.`idEmployee` = (select min(`employees`.`idEmployee`) from `employees` where (`employees`.`idDepartment` = `d`.`idDepartment`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 10:32:00
