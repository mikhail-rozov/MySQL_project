-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: sc2_project
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `id` int unsigned NOT NULL,
  `points_given` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES (1,50),(2,30),(3,50),(4,60),(5,20),(6,30),(7,10),(8,10),(9,60),(10,30);
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievement_user`
--

DROP TABLE IF EXISTS `achievement_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement_user` (
  `achievement_id` int unsigned NOT NULL,
  `profile_user_id` int unsigned NOT NULL,
  `achieved_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`achievement_id`,`profile_user_id`),
  KEY `fk_achievement_has_profile_profile1_idx` (`profile_user_id`),
  KEY `fk_achievement_has_profile_achievement1_idx` (`achievement_id`),
  CONSTRAINT `fk_achievement_has_profile_achievement1` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`id`),
  CONSTRAINT `fk_achievement_has_profile_profile1` FOREIGN KEY (`profile_user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement_user`
--

LOCK TABLES `achievement_user` WRITE;
/*!40000 ALTER TABLE `achievement_user` DISABLE KEYS */;
INSERT INTO `achievement_user` VALUES (2,2,'2020-11-10 21:14:30'),(2,6,'2020-12-14 15:30:19'),(2,7,'2021-03-14 04:18:55'),(3,7,'2020-11-01 07:09:57'),(4,2,'2021-03-24 16:17:41'),(4,8,'2021-05-11 15:16:57'),(5,3,'2020-10-20 21:23:20'),(8,3,'2021-04-27 15:18:16'),(9,2,'2020-07-19 09:46:52'),(9,6,'2021-05-12 00:27:54');
/*!40000 ALTER TABLE `achievement_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0 - request sent; 1 - request accepted; -1 - request rejected',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_request_user2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_request_user1` FOREIGN KEY (`from_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_friend_request_user2` FOREIGN KEY (`to_user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES (1,3,1),(3,2,0),(4,3,1),(4,6,-1),(5,2,0),(5,3,0),(5,6,1),(6,7,1),(6,8,-1),(7,9,1);
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league` (
  `id` tinyint unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,'Bronze'),(5,'Diamond'),(3,'Gold'),(7,'Grandmaster'),(6,'Master'),(0,'Not placed'),(4,'Platinum'),(2,'Silver');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `metadata` json NOT NULL,
  `path` varchar(255) NOT NULL,
  `ladder_map` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `path_UNIQUE` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'Romanticide','{\"size\": \"96x64\", \"players\": \"2\"}','model/vnd.gdl',_binary ''),(2,'Jagannatha','{\"size\": \"64x108\", \"players\": \"2\"}','application/vnd.syncml+xml',_binary ''),(3,'Fighting spirit','{\"size\": \"108x108\", \"players\": \"4\"}','application/x-msdownload',_binary '\0'),(4,'Efflorescence','{\"size\": \"108x108\", \"players\": \"4\"}','application/vnd.ezpix-package',_binary ''),(5,'Lost temple','{\"size\": \"128x128\", \"players\": \"4\"}','image/x-xpixmap',_binary '\0'),(6,'Nightscape','{\"size\": \"128x128\", \"players\": \"4\"}','audio/x-pn-realaudio-plugin',_binary ''),(7,'Distant platform','{\"size\": \"64x64\", \"players\": \"2\"}','application/x-blorb',_binary '\0'),(8,'Augustine fall','{\"size\": \"178x128\", \"players\": \"6\"}','text/x-uuencode',_binary ''),(9,'Concord','{\"size\": \"256x256\", \"players\": \"8\"}','application/vnd.lotus-approach',_binary '');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `player_1_id` int unsigned NOT NULL,
  `player_2_id` int unsigned NOT NULL,
  `player_1_race_id` tinyint unsigned NOT NULL,
  `player_2_race_id` tinyint unsigned NOT NULL,
  `map_id` int unsigned NOT NULL,
  `match_duration` time NOT NULL,
  `played_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_won` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `player_1_mmr_change` smallint NOT NULL,
  `player_2_mmr_change` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_match_profile1_idx` (`player_1_id`),
  KEY `fk_match_profile2_idx` (`player_2_id`),
  KEY `fk_match_race1_idx` (`player_1_race_id`),
  KEY `fk_match_race2_idx` (`player_2_race_id`),
  KEY `fk_match_map1_idx` (`map_id`),
  CONSTRAINT `fk_match_map1` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`),
  CONSTRAINT `fk_match_profile1` FOREIGN KEY (`player_1_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_match_profile2` FOREIGN KEY (`player_2_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_match_race1` FOREIGN KEY (`player_1_race_id`) REFERENCES `race` (`id`),
  CONSTRAINT `fk_match_race2` FOREIGN KEY (`player_2_race_id`) REFERENCES `race` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,10,6,1,2,7,'15:40:00','2021-03-22 11:08:00','2',-2,6),(2,2,7,3,3,8,'09:16:00','2021-02-13 16:24:00','2',-7,10),(3,5,1,3,1,2,'21:02:00','2021-05-21 04:50:00','1',5,-18),(4,10,2,3,3,5,'08:39:00','2020-06-04 01:19:00','1',7,-15),(5,9,6,1,1,5,'17:00:00','2021-02-17 01:02:00','1',13,-9),(6,7,1,3,3,8,'06:12:00','2021-05-21 09:45:00','1',14,-18),(7,10,3,2,2,1,'06:12:00','2020-10-15 04:10:00','2',-10,11),(8,6,5,1,3,5,'01:31:00','2021-03-28 21:59:00','1',15,-9),(9,1,5,3,3,4,'13:22:00','2021-06-10 18:06:00','2',-9,15),(10,2,10,1,2,5,'10:17:00','2020-09-26 16:08:00','1',16,-2);
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `match_AFTER_INSERT` AFTER INSERT ON `match` FOR EACH ROW BEGIN
    call count_mmr(new.player_1_id, new.player_2_id, new.player_1_mmr_change, new.player_2_mmr_change);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `match_history`
--

DROP TABLE IF EXISTS `match_history`;
/*!50001 DROP VIEW IF EXISTS `match_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `match_history` AS SELECT 
 1 AS `id`,
 1 AS `Player 1`,
 1 AS `P1_League`,
 1 AS `P1_Race`,
 1 AS `Player 2`,
 1 AS `P2_League`,
 1 AS `P2_Race`,
 1 AS `Map`,
 1 AS `Duration`,
 1 AS `Played`,
 1 AS `Winner`,
 1 AS `Player 1 MMR`,
 1 AS `Player 2 MMR`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` bit(1) NOT NULL DEFAULT b'0' COMMENT '0 - not read; 1 - read',
  PRIMARY KEY (`id`),
  KEY `fk_message_profile1_idx` (`from_user_id`),
  KEY `fk_message_profile2_idx` (`to_user_id`),
  CONSTRAINT `fk_message_profile1` FOREIGN KEY (`from_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_message_profile2` FOREIGN KEY (`to_user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,4,7,'Consequatur ut eveniet unde mollitia.','2021-06-11 16:34:52',_binary '\0'),(2,7,5,'Quaerat quia ducimus est possimus porro enim.','2021-06-11 16:34:52',_binary ''),(3,2,6,'Placeat aliquid saepe autem debitis qui et.','2021-06-11 16:34:52',_binary ''),(4,6,2,'Hic doloremque rem dolores vero dolorem dolor maxime dignissimos.','2021-06-11 16:34:52',_binary '\0'),(5,7,8,'Labore exercitationem praesentium id sunt quas.','2021-06-11 16:34:52',_binary ''),(6,6,1,'Iste ducimus sequi voluptatem expedita hic ex iusto.','2021-06-11 16:34:52',_binary ''),(7,2,3,'Dolores in ut laudantium blanditiis quas ipsam doloremque dolores.','2021-06-11 16:34:52',_binary '\0'),(8,7,9,'Quaerat minus ipsum voluptas aspernatur assumenda iusto.','2021-06-11 16:34:52',_binary ''),(9,10,3,'Sed nobis delectus tenetur alias facere porro.','2021-06-11 16:34:52',_binary '\0'),(10,3,6,'Id tempora asperiores ut quae tenetur harum dicta.','2021-06-11 16:34:52',_binary '');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `league_id` tinyint unsigned NOT NULL DEFAULT '0',
  `mmr` smallint unsigned NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  KEY `fk_profile_league_idx` (`league_id`),
  CONSTRAINT `fk_profile_league` FOREIGN KEY (`league_id`) REFERENCES `league` (`id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'cali45','Melvina','Eichmann',3,1314,'2021-06-12 18:01:04'),(2,'Myles N','Myles','Nienow',1,587,'2021-06-12 18:01:04'),(3,'mhill','Alisa','Trantow',5,2600,NULL),(4,'gzulauf','Aubree','Lemke',3,1450,'2020-10-23 03:00:54'),(5,'eddieD','Eddie','Douglas',0,0,NULL),(6,'maverick46','Barney','Kovacek',2,1100,NULL),(7,'smonahan','Malinda','Bernhard',6,3300,'2021-02-08 15:11:33'),(8,'isabelle52','Madge','Bosco',4,2050,NULL),(9,'romaine29','Sid','Daniel',7,6200,NULL),(10,'francesco01','Talia','Homenick',6,3600,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `id` tinyint unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (3,'Protoss'),(1,'Terran'),(2,'Zerg');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `hash_password` char(64) GENERATED ALWAYS AS (sha2(sha(`email`),256)) VIRTUAL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `created_at`, `deleted_at`) VALUES (1,'cali45@example.org','2021-06-11 14:07:43',NULL),(2,'myles.nienow@example.com','2021-06-11 14:07:43',NULL),(3,'mhilll@example.org','2021-06-11 14:07:43',NULL),(4,'gzulauf@example.com','2021-06-11 14:07:43',NULL),(5,'eddie.douglas@example.com','2021-06-11 14:07:43',NULL),(6,'maverick46@example.net','2021-06-11 14:07:43',NULL),(7,'smonahan@example.org','2021-06-11 14:07:43',NULL),(8,'isabelle52@example.net','2021-06-11 14:07:43',NULL),(9,'romaine29@example.net','2021-06-11 14:07:43',NULL),(10,'francesco01@example.net','2021-06-11 14:07:43',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sc2_project'
--
/*!50003 DROP PROCEDURE IF EXISTS `count_mmr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_mmr`(in player_1_id int, in player_2_id int, in mmr_1 smallint, in mmr_2 smallint)
BEGIN
UPDATE `profile` 
SET 
    mmr = mmr + mmr_1
WHERE
    user_id = player_1_id;
UPDATE `profile` 
SET 
    mmr = mmr + mmr_2
WHERE
    user_id = player_2_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `match_history`
--

/*!50001 DROP VIEW IF EXISTS `match_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `match_history` AS select `m`.`id` AS `id`,`p1`.`nickname` AS `Player 1`,`l1`.`name` AS `P1_League`,`r1`.`name` AS `P1_Race`,`p2`.`nickname` AS `Player 2`,`l2`.`name` AS `P2_League`,`r2`.`name` AS `P2_Race`,`mp`.`name` AS `Map`,`m`.`match_duration` AS `Duration`,`m`.`played_at` AS `Played`,(case `m`.`player_won` when 1 then `p1`.`nickname` when 2 then `p2`.`nickname` end) AS `Winner`,`m`.`player_1_mmr_change` AS `Player 1 MMR`,`m`.`player_2_mmr_change` AS `Player 2 MMR` from (((((((`match` `m` join `profile` `p1` on((`m`.`player_1_id` = `p1`.`user_id`))) join `profile` `p2` on((`m`.`player_2_id` = `p2`.`user_id`))) join `race` `r1` on((`m`.`player_1_race_id` = `r1`.`id`))) join `race` `r2` on((`m`.`player_2_race_id` = `r2`.`id`))) join `map` `mp` on((`m`.`map_id` = `mp`.`id`))) join `league` `l1` on((`p1`.`league_id` = `l1`.`id`))) join `league` `l2` on((`p2`.`league_id` = `l2`.`id`))) order by `m`.`played_at` desc limit 10 */;
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

-- Dump completed on 2021-06-13 16:33:55
