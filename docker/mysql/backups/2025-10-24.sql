-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: songguessr
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_status` (
  `game_running` tinyint(1) NOT NULL,
  `current_song_id` int NOT NULL,
  `started` datetime NOT NULL,
  KEY `game_status_song_song_id_fk` (`current_song_id`),
  CONSTRAINT `game_status_song_song_id_fk` FOREIGN KEY (`current_song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hint`
--

DROP TABLE IF EXISTS `hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hint` (
  `hint_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`hint_id`),
  UNIQUE KEY `hint_type_uindex` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hint`
--

LOCK TABLES `hint` WRITE;
/*!40000 ALTER TABLE `hint` DISABLE KEYS */;
INSERT INTO `hint` VALUES (1,'albumCover'),(8,'albumName'),(11,'artistImage'),(2,'artistName'),(4,'audio'),(12,'genre'),(6,'musicVideo10Seconds'),(9,'releaseYear'),(10,'revealLetter'),(7,'revealVowels');
/*!40000 ALTER TABLE `hint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picker`
--

DROP TABLE IF EXISTS `picker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picker` (
  `picker_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`picker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picker`
--

LOCK TABLES `picker` WRITE;
/*!40000 ALTER TABLE `picker` DISABLE KEYS */;
INSERT INTO `picker` VALUES (1,'Elias','Böhm'),(6,'Martina','Böhm'),(7,'Ruth','Hörlin'),(8,'Doris','Hörlin'),(9,'Gerhard','Hörlin'),(10,'Katja','Mark');
/*!40000 ALTER TABLE `picker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `guessed` tinyint(1) DEFAULT NULL,
  `picked_by` int DEFAULT NULL,
  `audio_source` varchar(255) NOT NULL,
  `video_source` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `album_cover_source` varchar(255) DEFAULT NULL,
  `released` int NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `artist_image_source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  UNIQUE KEY `song_pk_2` (`name`,`artist`),
  KEY `song_picker_id_fk` (`picked_by`),
  CONSTRAINT `song_picker_picker_id_fk` FOREIGN KEY (`picked_by`) REFERENCES `picker` (`picker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Beat it','Michael Jackson',0,NULL,'beat_it.mp3','beat_it.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(2,'Pink + White','Frank Ocean',0,1,'pink_white.mp3','pink_white.mp4','Blonde','blonde.jpg',2016,'r&b','frank-ocean.webp'),(9,'Thriller','Michael Jackson',0,NULL,'thriller.mp3','thriller.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(10,'Hymn for the Weekend','Coldplay',0,6,'hymn_for_the_weekend.mp3','hymn_for_the_weekend.mp4','A Head Full of Dreams','a_head_full_of_dreams.jpg',2015,'alternative','coldplay.jpeg'),(11,'Mockingbird','Eminem',0,NULL,'mockingbird.mp3','mockingbird.mp4','Encore','encore.jpg',2004,'rap','eminem.jpg'),(12,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA',0,NULL,'gimme_gimme_gimme.mp3','gimme_gimme_gimme.mp4','Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(13,'Sweet Caroline','Neil Diamond',0,7,'sweet_caroline.mp3',NULL,'Sweet Caroline','sweet_caroline.jpg',1969,'soft rock','neil_diamond.webp'),(14,'99 Luftballons','Nena',0,7,'99_luftballons.mp3','99_luftballons.mp4','Nena','nena.jpg',1983,'german pop','nena.jpg'),(16,'Ich war noch niemals in New York','Udo Jürgens',0,7,'ich_war_noch_niemals_in_new_york.mp3',NULL,'Silberstreifen','silberstreifen.jpg',1982,'german pop','udo_jürgens.jpeg'),(17,'I Will Always Love You','Whitney Houston',0,NULL,'i_will_always_love_you.mp3','i_will_always_love_you.mp4','The Bodyguard - Original Soundtrack Album','the_bodyguard.jpg',1992,'ballade','whitney_houston.jpg'),(18,'Ein Stern (der deinen Namen trägt)','DJ Ötzi',0,NULL,'ein_stern_der_deinen_namen_trägt.mp3','ein_stern_der_deinen_namen_trägt.mp4','Sternstunden','sternstunden.jpg',2007,'german pop','dj_ötzi.jpg'),(19,'Hab\' mich wieder mal an dir betrunken','Pur',0,NULL,'hab_mich_wieder_mal_an_dir_betrunken.mp3',NULL,'Pur','pur.jpg',1987,'schlager','pur.jpg'),(20,'Waterloo','ABBA',0,NULL,'waterloo.mp3','waterloo.mp4','Waterloo','waterloo.jpg',1974,'pop','abba.jpg'),(21,'I Have A Dream','ABBA',0,NULL,'i_have_a_dream.mp3',NULL,'Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(22,'Mamma Mia','ABBA',0,NULL,'mamma_mia.mp3','mamma_mia.mp4','Abba','abba.jpg',1975,'pop','abba.jpg'),(23,'Super Trouper','ABBA',0,NULL,'super_trouper.mp3','super_trouper.mp4','Super Trouper','super_trouper.jpg',1980,'pop','abba.jpg'),(24,'Lost on You','LP',0,NULL,'lost_on_you.mp3','lost_on_you.mp4','Lost On You','lost_on_you.jpg',2016,'alternative','lp.webp'),(25,'Stern des Südens','Bayern-Fans United',0,NULL,'stern_des_südens.mp3','stern_des_südens.mp4','Heimspiel','heimspiel.jpg',1999,'anthem',NULL),(26,'It\'s My Life','Bon Jovi',0,NULL,'its_my_life.mp3','its_my_life.mp4','Crush','crush.jpg',2000,'pop rock','bon_jovi.webp'),(27,'Westerland','Die Ärzte',0,8,'westerland.mp3',NULL,'Das Ist Nicht Die Ganze Wahrheit...','das_ist_nicht_die_ganze_wahrheit.jpg',1988,'punk','die_ärzte.jpg'),(28,'Hymn','Barclay James Harvest',0,8,'hymn.mp3',NULL,'Gone To Earth','gone_to_earth.jpg',1977,'alternative','barclay_james_harvest.jpeg'),(29,'If You Don\'t Know Me by Now','Simply Red',0,8,'if_you_dont_know_me_by_now.mp3','if_you_dont_know_me_by_now.mp4','A New Flame','a_new_flame.jpg',1989,'r&b','simply_red.png'),(30,'It\'s Raining Men','The Weather Girls',0,9,'its_raining_men.mp3','its_raining_men.mp4','Success','success.jpg',1982,'disco','weather_girls.jpg'),(31,'Skandal im Sperrbezirk','Spider Murphy Gang',0,9,'skandal_im_sperrbezirk.mp3',NULL,'Dolce Vita','dolce_vita.jpg',1981,'german rock','spider_murphy_gang.jpg'),(32,'Über sieben Brücken musst du gehn','Karat',0,9,'über_sieben_brücken_musst_du_gehn.mp3','über_sieben_brücken_musst_du_gehn.mp4',NULL,NULL,1979,'german rock','karat.jpg'),(33,'BIRDS OF A FEATHER','Billie Eilish',0,6,'birds_of_a_feather.mp3','birds_of_a_feather.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'bedroom pop','billie_eilish.jpeg'),(34,'Yeah!','USHER',0,6,'yeah.mp3','yeah.mp4','Confessions','confessions.png',2004,'r&b','usher.jpg'),(35,'Blinding Lights','The Weeknd',0,1,'blinding_lights.mp3','blinding_lights.mp4','After Hours','after_hours.png',2019,'synth-pop','the_weeknd.jpg'),(36,'Espresso','Sabrina Carpenter',0,NULL,'espresso.mp3','espresso.mp4','Short n\' Sweet','short_n_sweet.jpg',2024,'pop','sabrina_carpenter.webp'),(37,'Can\'t Catch Me Now','Olivia Rodrigo',0,1,'cant_catch_me_now.mp3','cant_catch_me_now.mp4','The Hunger Games: The Ballad of Songbirds & Snakes','the_hunger_games_ballad.jpeg',2023,'folk rock','olivia_rodrigo.jpg'),(38,'We Are The World','U.S.A. For Africa',0,10,'we_are_the_world.mp3','we_are_the_world.mp4',NULL,NULL,1985,'pop',NULL),(39,'Do They Know It\'s Christmas?','Band Aid',0,10,'do_they_know_its_christmas.mp3',NULL,NULL,NULL,1984,'seasonal',NULL),(40,'Buenos Dias Argentina','Udo Jürgens',0,10,'buenos_dias_argentina.mp3','buenos_dias_argentina.mp4','Buenos Dias Argentina','buenos_dias_argentina.jpg',1978,'schlager','udo_jürgens.jpeg'),(41,'Heal the World','Michael Jackson',0,NULL,'heal_the_world.mp3','heal_the_world.mp4','Dangerous','dangerous.jpg',1991,'pop','michael-jackson.jpeg'),(42,'Slipping Through My Fingers','ABBA',0,NULL,'slipping_through_my_fingers.mp3',NULL,'The Visitors','the_visitors.jpg',1981,'pop','abba.jpg');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_hint`
--

DROP TABLE IF EXISTS `song_hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_hint` (
  `song_hint_id` int NOT NULL AUTO_INCREMENT,
  `song_id` int NOT NULL,
  `hint_id` int NOT NULL,
  `sequence` int NOT NULL,
  `content_replace_1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`song_hint_id`),
  UNIQUE KEY `song_hint_hint_id_song_id_uindex` (`hint_id`,`song_id`),
  UNIQUE KEY `song_hint_song_id_order_uindex` (`song_id`,`sequence`),
  CONSTRAINT `song_hint_hint_id_fk` FOREIGN KEY (`hint_id`) REFERENCES `hint` (`hint_id`),
  CONSTRAINT `song_hint_song_id_fk` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7932 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_hint`
--

LOCK TABLES `song_hint` WRITE;
/*!40000 ALTER TABLE `song_hint` DISABLE KEYS */;
INSERT INTO `song_hint` VALUES (7757,1,11,1,NULL),(7758,1,10,2,NULL),(7759,1,6,3,NULL),(7760,1,7,4,NULL),(7761,1,4,5,NULL),(7762,2,12,1,NULL),(7763,2,7,2,NULL),(7764,2,6,3,NULL),(7765,2,2,4,NULL),(7766,2,4,5,NULL),(7767,9,2,1,NULL),(7768,9,10,2,NULL),(7769,9,12,3,NULL),(7770,9,11,4,NULL),(7771,9,4,5,NULL),(7772,10,6,1,NULL),(7773,10,11,2,NULL),(7774,10,7,3,NULL),(7775,10,12,4,NULL),(7776,10,4,5,NULL),(7777,11,12,1,NULL),(7778,11,9,2,NULL),(7779,11,6,3,NULL),(7780,11,11,4,NULL),(7781,11,4,5,NULL),(7782,12,8,1,NULL),(7783,12,12,2,NULL),(7784,12,2,3,NULL),(7785,12,11,4,NULL),(7786,12,4,5,NULL),(7787,13,8,1,NULL),(7788,13,2,2,NULL),(7789,13,1,3,NULL),(7790,13,7,4,NULL),(7791,13,4,5,NULL),(7792,14,6,1,NULL),(7793,14,10,2,NULL),(7794,14,11,3,NULL),(7795,14,8,4,NULL),(7796,14,4,5,NULL),(7797,16,10,1,NULL),(7798,16,11,2,NULL),(7799,16,2,3,NULL),(7800,16,1,4,NULL),(7801,16,4,5,NULL),(7802,17,11,1,NULL),(7803,17,8,2,NULL),(7804,17,12,3,NULL),(7805,17,10,4,NULL),(7806,17,4,5,NULL),(7807,18,10,1,NULL),(7808,18,7,2,NULL),(7809,18,9,3,NULL),(7810,18,8,4,NULL),(7811,18,4,5,NULL),(7812,19,9,1,NULL),(7813,19,2,2,NULL),(7814,19,7,3,NULL),(7815,19,11,4,NULL),(7816,19,4,5,NULL),(7817,20,11,1,NULL),(7818,20,2,2,NULL),(7819,20,8,3,NULL),(7820,20,10,4,NULL),(7821,20,4,5,NULL),(7822,21,11,1,NULL),(7823,21,9,2,NULL),(7824,21,8,3,NULL),(7825,21,7,4,NULL),(7826,21,4,5,NULL),(7827,22,1,1,NULL),(7828,22,7,2,NULL),(7829,22,2,3,NULL),(7830,22,12,4,NULL),(7831,22,4,5,NULL),(7832,23,1,1,NULL),(7833,23,8,2,NULL),(7834,23,6,3,NULL),(7835,23,11,4,NULL),(7836,23,4,5,NULL),(7837,24,12,1,NULL),(7838,24,9,2,NULL),(7839,24,7,3,NULL),(7840,24,10,4,NULL),(7841,24,4,5,NULL),(7842,25,2,1,NULL),(7843,25,8,2,NULL),(7844,25,10,3,NULL),(7845,25,1,4,NULL),(7846,25,4,5,NULL),(7847,26,2,1,NULL),(7848,26,12,2,NULL),(7849,26,7,3,NULL),(7850,26,9,4,NULL),(7851,26,4,5,NULL),(7852,27,9,1,NULL),(7853,27,1,2,NULL),(7854,27,12,3,NULL),(7855,27,11,4,NULL),(7856,27,4,5,NULL),(7857,28,10,1,NULL),(7858,28,11,2,NULL),(7859,28,9,3,NULL),(7860,28,2,4,NULL),(7861,28,4,5,NULL),(7862,29,1,1,NULL),(7863,29,10,2,NULL),(7864,29,12,3,NULL),(7865,29,8,4,NULL),(7866,29,4,5,NULL),(7867,30,2,1,NULL),(7868,30,7,2,NULL),(7869,30,11,3,NULL),(7870,30,8,4,NULL),(7871,30,4,5,NULL),(7872,31,12,1,NULL),(7873,31,7,2,NULL),(7874,31,10,3,NULL),(7875,31,8,4,NULL),(7876,31,4,5,NULL),(7877,32,12,1,NULL),(7878,32,11,2,NULL),(7879,32,6,3,NULL),(7880,32,10,4,NULL),(7881,32,4,5,NULL),(7882,33,12,1,NULL),(7883,33,6,2,NULL),(7884,33,9,3,NULL),(7885,33,7,4,NULL),(7886,33,4,5,NULL),(7887,34,7,1,NULL),(7888,34,8,2,NULL),(7889,34,9,3,NULL),(7890,34,6,4,NULL),(7891,34,4,5,NULL),(7892,35,9,1,NULL),(7893,35,1,2,NULL),(7894,35,6,3,NULL),(7895,35,10,4,NULL),(7896,35,4,5,NULL),(7897,36,11,1,NULL),(7898,36,2,2,NULL),(7899,36,8,3,NULL),(7900,36,10,4,NULL),(7901,36,4,5,NULL),(7902,37,10,1,NULL),(7903,37,8,2,NULL),(7904,37,11,3,NULL),(7905,37,9,4,NULL),(7906,37,4,5,NULL),(7907,38,10,1,NULL),(7908,38,9,2,NULL),(7909,38,6,3,NULL),(7910,38,7,4,NULL),(7911,38,4,5,NULL),(7912,39,9,1,NULL),(7913,39,10,2,NULL),(7914,39,7,3,NULL),(7915,39,12,4,NULL),(7916,39,4,5,NULL),(7917,40,7,1,NULL),(7918,40,11,2,NULL),(7919,40,2,3,NULL),(7920,40,9,4,NULL),(7921,40,4,5,NULL),(7922,41,9,1,NULL),(7923,41,2,2,NULL),(7924,41,10,3,NULL),(7925,41,12,4,NULL),(7926,41,4,5,NULL),(7927,42,10,1,NULL),(7928,42,12,2,NULL),(7929,42,7,3,NULL),(7930,42,11,4,NULL),(7931,42,4,5,NULL);
/*!40000 ALTER TABLE `song_hint` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-24 22:54:18
