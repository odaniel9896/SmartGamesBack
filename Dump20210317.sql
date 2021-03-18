CREATE DATABASE  IF NOT EXISTS `dbsmartprime` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbsmartprime`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: dbsmartprime
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ação','2021-03-16 18:07:38','2021-03-16 18:07:38'),(2,'Aventura','2021-03-16 18:07:38','2021-03-16 18:07:38'),(3,'Estratégia','2021-03-16 18:07:38','2021-03-16 18:07:38'),(4,'RPG','2021-03-16 18:07:38','2021-03-16 18:07:38'),(5,'Esporte','2021-03-16 18:07:38','2021-03-16 18:07:38'),(6,'Corrida','2021-03-16 18:07:38','2021-03-16 18:07:38'),(7,'Mech','2021-03-16 18:07:38','2021-03-16 18:07:38'),(8,'FPS','2021-03-16 18:07:38','2021-03-16 18:07:38'),(9,'Battle Royale','2021-03-16 18:07:38','2021-03-16 18:07:38'),(10,'Fantasia','2021-03-16 18:07:38','2021-03-16 18:07:38'),(11,'music','2021-03-16 18:07:38','2021-03-16 18:07:38'),(12,'Romance','2021-03-16 18:07:38','2021-03-16 18:07:38');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_platform`
--

DROP TABLE IF EXISTS `game_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_platform` (
  `gameId` int(11) NOT NULL,
  `platformId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  KEY `gameId` (`gameId`),
  KEY `platformId` (`platformId`),
  CONSTRAINT `game_platform_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `game_platform_ibfk_2` FOREIGN KEY (`platformId`) REFERENCES `platforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_platform`
--

LOCK TABLES `game_platform` WRITE;
/*!40000 ALTER TABLE `game_platform` DISABLE KEYS */;
INSERT INTO `game_platform` VALUES (1,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(1,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(1,6,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(3,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(4,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,6,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,5,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,5,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,8,'2021-03-16 00:00:00','2021-03-16 00:00:00');
/*!40000 ALTER TABLE `game_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_store`
--

DROP TABLE IF EXISTS `game_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_store` (
  `gameId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  KEY `gameId` (`gameId`),
  KEY `storeId` (`storeId`),
  CONSTRAINT `game_store_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `game_store_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_store`
--

LOCK TABLES `game_store` WRITE;
/*!40000 ALTER TABLE `game_store` DISABLE KEYS */;
INSERT INTO `game_store` VALUES (1,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(1,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(3,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(3,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(4,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(4,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,3,'2021-03-16 00:00:00','2021-03-16 00:00:00');
/*!40000 ALTER TABLE `game_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` text NOT NULL,
  `releaseDate` varchar(255) NOT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Overwatch',160,'Overwatch é um jogo de tiro em equipe que conta com um elenco diversificado de heróis poderosíssimos. Viaje pelo mundo, monte uma equipe e dispute objetivos em combates 6v6 de tirar o fôlego.','2016-08-20 12:00:00','Blizzard',20,'2021-03-16 18:36:37','2021-03-17 16:35:38','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/overwatch.png?alt=media&token=ce388510-56c0-4149-abba-ac5b0b03cee5'),(2,'Spider-Man',116.9,'Spider-Man é um jogo eletrônico de ação-aventura desenvolvido pela Insomniac Games e publicado pela Sony Interactive Entertainment. É baseado nos personagens, mitologia e adaptações em outras mídias do super-herói de histórias em quadrinhos Homem-Aranha da Marvel Comics, tendo sido lançado exclusivamente para PlayStation 4 em 7 de setembro de 2018. Na história, o criminoso super-humano Senhor Negativo organiza um plano para se vingar do prefeito Norman Osborn e assumir o controle do submundo criminal de Nova Iorque. O Homem-Aranha precisa proteger a cidade assim que o Senhor Negativo ameaça lançar um vírus mortal por toda a área, ao mesmo tempo que é forçado a lidar com seus problemas pessoais como Peter Parker.','2016-05-24 12:00:00','Sony',20,'2021-03-16 18:36:37','2021-03-17 16:53:42','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/spider.jpg?alt=media&token=17941cf3-9602-45ed-ac5d-654803fd9f17'),(3,'God of War',69.9,'É um novo começo para Kratos. Vivendo como um homem longe da sombra dos deuses, ele se aventura pelas selvagens florestas nórdicas com seu filho Atreus, lutando para cumprir uma missão profundamente pessoal. O Santa Monica Studio e o diretor de criação Cory Barlog lançam um novo começo para um dos personagens mais conhecidos dos jogos. Vivendo como um homem, fora da sombra dos deuses, Kratos deve se adaptar a terras desconhecidas, ameaças inesperadas e a uma segunda oportunidade de ser pai. Junto ao seu filho, Atreus, os dois vão se aventurar pelas selvagens florestas nórdicas e lutar para cumprir uma missão profundamente pessoal.','2016-05-20 12:00:00','Sony',0,'2021-03-16 18:36:37','2021-03-16 18:36:37','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/GOD.jpg?alt=media&token=5f7dce8d-c6a4-4365-a046-33da769f024c'),(4,'Ghost of Thushima',249.99,'No final do século XIII, o império mongol devastou nações inteiras durante sua campanha para conquistar o Oriente. A Ilha de Tsushima é tudo o que está entre o Japão continental e uma enorme frota invasora mongol comandada pelo implacável e sagaz general Khotun Khan. À medida que a ilha queima na esteira da primeira onda do assalto mongol, o guerreiro samurai Jin Sakai mantém-se como um dos último membros sobreviventes de seu clã. Ele está decidido a proteger seu povo e recuperar seu lar, independente do que aconteça, custe o que custar. Será preciso romper com as tradições que o tornaram um guerreiro para forjar um novo caminho do Fantasma e declarar uma guerra incomum pela liberdade de Tsushima.','2016-08-20 12:00:00','Sony',0,'2021-03-16 18:36:37','2021-03-16 18:36:37','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/ghost.jpg?alt=media&token=6462c660-afa1-4da9-8711-8c73f4191523'),(5,'Tom Clancy\'s Splinter Cell: Double Agent',36,'Vivencie a tensão incessante e os dilemas da vida de um agente duplo. Minta. Mate. Prejudique. Traia. Tudo para proteger os inocentes. Até onde você iria para ganhar a confiança do inimigo? Como o agente secreto Sam Fisher, você deve se infiltrar num grupo terrorista cruel e destruí-lo internamente. Você precisará ponderar muito bem as consequências dos seus atos. Mate terroristas demais e estragará seu disfarce. Hesite e milhões morrerão. Faça o que for preciso para completar a missão, mas procure sobreviver.','2006-08-20 12:00:00','Ubisoft',0,'2021-03-16 18:36:37','2021-03-16 18:36:37','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/tom.jpg?alt=media&token=27290a81-f7ee-4761-ab9f-ebc161ab308c'),(6,'God of War 3',50,'Kratos está devolta, ainda com a vingança pulsando forte em suas veias. O Olimpo e seus deuses é o seu alvo, não importa o preço que o Deus da Guerra irá pagar. Neste terceiro e épico capítulo você irá controlar Kratos através de batalhas celestiais contra os deuses mais poderosos de todo o Olimpo – inclusive voltará ao inferno e acertar as contas com seu pai colossal e poderoso, Kronos. Deuses como Hermes e Hades não serão páreo para seu poder, os olhos ardentes daquele que busca vingança que nem a mais cruel das mortes pode deter. Enfrente desafios arrasadores e enfrente monstros poderosos como a Quimera, o Cérberus e muitos outros seres místicos que estão ali apenas para acabar com sua existência. Não pare por nada até enfrentar o deus dos deuses: Zeus, e acabar com isso de uma vez por todas.','2016-08-20 12:00:00','Sony',0,'2021-03-16 18:36:37','2021-03-16 18:36:37','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/god3.webp?alt=media&token=d9936724-b6fa-4feb-95ea-cdadee0c89ea'),(7,'Watch Dogs 2',60,'Junte-se ao Dedsec, um grupo notório de hackers, para executar o maior hack da história; Derrube o ctOS 2.0, um sistema operacional invasivo que está sendo usado por um gênio do crime para monitorar e manipular os cidadãos em uma escala massiva.','2016-08-20 12:00:00','Ubisoft',20,'2021-03-16 18:36:37','2021-03-17 16:57:02','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/watch.jpg?alt=media&token=27c07a07-5e79-4f60-a3a1-de4519c70dc7'),(8,'Batman Arkham City',31,'Batman: Arkham City é um jogo eletrônico de Ação-Aventura e Stealth, baseado na série de quadrinhos Batman da DC Comics. O jogo é distribuído para: PlayStation 3, Xbox 360 e Microsoft Windows. Foi desenvolvido pela Rocksteady Studios e foi publicado pela Warner Bros. Interactive Entertainment e DC Entertainment.','2016-08-20 12:00:00','WBGames',20,'2021-03-16 18:36:37','2021-03-17 22:22:50','https://firebasestorage.googleapis.com/v0/b/smartgames-d13a6.appspot.com/o/batman.png?alt=media&token=5443fa62-6b93-4960-8765-4bcea1dca1c8');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_category`
--

DROP TABLE IF EXISTS `games_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_category` (
  `gameId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  KEY `gameId` (`gameId`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `games_category_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `games_category_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_category`
--

LOCK TABLES `games_category` WRITE;
/*!40000 ALTER TABLE `games_category` DISABLE KEYS */;
INSERT INTO `games_category` VALUES (1,8,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,8,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(5,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(8,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(7,5,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,5,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(6,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(3,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(3,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(3,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,2,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(2,3,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(4,1,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(4,4,'2021-03-16 00:00:00','2021-03-16 00:00:00'),(4,5,'2021-03-16 00:00:00','2021-03-16 00:00:00');
/*!40000 ALTER TABLE `games_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameId` int(11) NOT NULL,
  `pricePaid` decimal(10,0) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gameId` (`gameId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,69,'2021-03-17 21:06:37','2021-03-17 21:06:37'),(2,1,160,'2021-03-17 21:22:01','2021-03-17 21:22:01'),(3,1,160,'2021-03-17 21:22:13','2021-03-17 21:22:13'),(4,1,160,'2021-03-17 21:22:25','2021-03-17 21:22:25'),(5,1,160,'2021-03-17 21:22:37','2021-03-17 21:22:37'),(6,1,160,'2021-03-17 21:22:48','2021-03-17 21:22:48'),(7,1,160,'2021-03-17 21:22:51','2021-03-17 21:22:51'),(8,1,160,'2021-03-17 21:23:04','2021-03-17 21:23:04'),(9,1,160,'2021-03-17 21:23:49','2021-03-17 21:23:49'),(10,1,160,'2021-03-17 21:24:11','2021-03-17 21:24:11'),(11,1,160,'2021-03-17 21:24:19','2021-03-17 21:24:19'),(12,4,250,'2021-03-17 22:18:42','2021-03-17 22:18:42'),(13,1,160,'2021-03-17 22:19:15','2021-03-17 22:19:15'),(14,1,160,'2021-03-17 22:19:24','2021-03-17 22:19:24'),(15,2,117,'2021-03-17 23:07:36','2021-03-17 23:07:36'),(16,2,117,'2021-03-17 23:10:08','2021-03-17 23:10:08'),(17,2,117,'2021-03-17 23:10:35','2021-03-17 23:10:35'),(18,2,117,'2021-03-17 23:27:37','2021-03-17 23:27:37'),(19,2,117,'2021-03-17 23:28:59','2021-03-17 23:28:59'),(20,2,117,'2021-03-17 23:53:27','2021-03-17 23:53:27'),(21,5,36,'2021-03-18 01:00:45','2021-03-18 01:00:45');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'PS4','2021-03-16 18:08:25','2021-03-16 18:08:25'),(2,'PS3','2021-03-16 18:08:25','2021-03-16 18:08:25'),(3,'PS2','2021-03-16 18:08:25','2021-03-16 18:08:25'),(4,'PC','2021-03-16 18:08:25','2021-03-16 18:08:25'),(5,'XBOXONE','2021-03-16 18:08:25','2021-03-16 18:08:25'),(6,'XBOX360','2021-03-16 18:08:25','2021-03-16 18:08:25'),(7,'NINTENDOSWITCH','2021-03-16 18:08:25','2021-03-16 18:08:25'),(8,'WIIU','2021-03-16 18:08:25','2021-03-16 18:08:25');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20210313121144-TabelaEndereco.js'),('20210313135335-TabelaLoja.js'),('20210313135349-TabelaCategorias.js'),('20210313140215-TabelaCategoriasJogos.js'),('20210313140221-TabelaJogosLoja.js'),('20210314135729-AdicionarCampoImagem.js'),('20210316174649-TabelaDePedidos.js'),('20210316175405-TabelaPlatform.js'),('20210316175414-TabelaPlatformGame.js'),('20210317180325-AdicionarCampoLatitude.js'),('20210317180331-AdicionarCampoAltitude.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `latitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Tambore','Tambore','Loja Tambore',421,'12578-478','2021-03-16 00:00:00','2021-03-16 00:00:00',-23.50259194373549,-46.83209660808968),(2,'União','União','Loja União',574,'12578-478','2021-03-16 00:00:00','2021-03-16 00:00:00',-23.54141945396496,-46.84835147327825),(3,'Iguatemi','Iguatemi','Loja Iguatemi',641,'12578-478','2021-03-16 00:00:00','2021-03-16 00:00:00',-23.50442594351248,-46.84835147327825);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-17 23:45:23
