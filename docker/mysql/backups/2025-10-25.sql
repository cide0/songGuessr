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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picker`
--

LOCK TABLES `picker` WRITE;
/*!40000 ALTER TABLE `picker` DISABLE KEYS */;
INSERT INTO `picker` VALUES (1,'Elias','Böhm'),(6,'Martina','Böhm'),(7,'Ruth','Hörlin'),(8,'Doris','Hörlin'),(9,'Gerhard','Hörlin'),(10,'Katja','Mark'),(11,'Holger','Mark'),(12,'Tanja','Götz'),(13,'Rolf','Schwoche');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Beat it','Michael Jackson',0,NULL,'beat_it.mp3','beat_it.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(2,'Pink + White','Frank Ocean',0,1,'pink_white.mp3','pink_white.mp4','Blonde','blonde.jpg',2016,'r&b','frank-ocean.webp'),(9,'Thriller','Michael Jackson',0,NULL,'thriller.mp3','thriller.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(10,'Hymn for the Weekend','Coldplay',0,6,'hymn_for_the_weekend.mp3','hymn_for_the_weekend.mp4','A Head Full of Dreams','a_head_full_of_dreams.jpg',2015,'alternative','coldplay.jpeg'),(11,'Mockingbird','Eminem',0,NULL,'mockingbird.mp3','mockingbird.mp4','Encore','encore.jpg',2004,'rap','eminem.jpg'),(12,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA',0,NULL,'gimme_gimme_gimme.mp3','gimme_gimme_gimme.mp4','Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(13,'Sweet Caroline','Neil Diamond',0,7,'sweet_caroline.mp3',NULL,'Sweet Caroline','sweet_caroline.jpg',1969,'soft rock','neil_diamond.webp'),(14,'99 Luftballons','Nena',0,7,'99_luftballons.mp3','99_luftballons.mp4','Nena','nena.jpg',1983,'german pop','nena.jpg'),(16,'Ich war noch niemals in New York','Udo Jürgens',0,7,'ich_war_noch_niemals_in_new_york.mp3',NULL,'Silberstreifen','silberstreifen.jpg',1982,'german pop','udo_jürgens.jpeg'),(17,'I Will Always Love You','Whitney Houston',0,NULL,'i_will_always_love_you.mp3','i_will_always_love_you.mp4','The Bodyguard - Original Soundtrack Album','the_bodyguard.jpg',1992,'ballade','whitney_houston.jpg'),(18,'Ein Stern (der deinen Namen trägt)','DJ Ötzi',0,NULL,'ein_stern_der_deinen_namen_trägt.mp3','ein_stern_der_deinen_namen_trägt.mp4','Sternstunden','sternstunden.jpg',2007,'german pop','dj_ötzi.jpg'),(19,'Hab\' mich wieder mal an dir betrunken','Pur',0,NULL,'hab_mich_wieder_mal_an_dir_betrunken.mp3',NULL,'Pur','pur.jpg',1987,'schlager','pur.jpg'),(20,'Waterloo','ABBA',0,NULL,'waterloo.mp3','waterloo.mp4','Waterloo','waterloo.jpg',1974,'pop','abba.jpg'),(21,'I Have A Dream','ABBA',0,NULL,'i_have_a_dream.mp3',NULL,'Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(22,'Mamma Mia','ABBA',0,NULL,'mamma_mia.mp3','mamma_mia.mp4','Abba','abba.jpg',1975,'pop','abba.jpg'),(23,'Super Trouper','ABBA',0,NULL,'super_trouper.mp3','super_trouper.mp4','Super Trouper','super_trouper.jpg',1980,'pop','abba.jpg'),(24,'Lost on You','LP',0,NULL,'lost_on_you.mp3','lost_on_you.mp4','Lost On You','lost_on_you.jpg',2016,'alternative','lp.webp'),(25,'Stern des Südens','Bayern-Fans United',0,NULL,'stern_des_südens.mp3','stern_des_südens.mp4','Heimspiel','heimspiel.jpg',1999,'anthem',NULL),(26,'It\'s My Life','Bon Jovi',0,NULL,'its_my_life.mp3','its_my_life.mp4','Crush','crush.jpg',2000,'pop rock','bon_jovi.webp'),(27,'Westerland','Die Ärzte',0,8,'westerland.mp3',NULL,'Das Ist Nicht Die Ganze Wahrheit...','das_ist_nicht_die_ganze_wahrheit.jpg',1988,'punk','die_ärzte.jpg'),(28,'Hymn','Barclay James Harvest',0,8,'hymn.mp3',NULL,'Gone To Earth','gone_to_earth.jpg',1977,'alternative','barclay_james_harvest.jpeg'),(29,'If You Don\'t Know Me by Now','Simply Red',0,8,'if_you_dont_know_me_by_now.mp3','if_you_dont_know_me_by_now.mp4','A New Flame','a_new_flame.jpg',1989,'r&b','simply_red.png'),(30,'It\'s Raining Men','The Weather Girls',0,9,'its_raining_men.mp3','its_raining_men.mp4','Success','success.jpg',1982,'disco','weather_girls.jpg'),(31,'Skandal im Sperrbezirk','Spider Murphy Gang',0,9,'skandal_im_sperrbezirk.mp3',NULL,'Dolce Vita','dolce_vita.jpg',1981,'german rock','spider_murphy_gang.jpg'),(32,'Über sieben Brücken musst du gehn','Karat',0,9,'über_sieben_brücken_musst_du_gehn.mp3','über_sieben_brücken_musst_du_gehn.mp4',NULL,NULL,1979,'german rock','karat.jpg'),(33,'BIRDS OF A FEATHER','Billie Eilish',0,6,'birds_of_a_feather.mp3','birds_of_a_feather.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'bedroom pop','billie_eilish.jpeg'),(34,'Yeah!','USHER',0,6,'yeah.mp3','yeah.mp4','Confessions','confessions.png',2004,'r&b','usher.jpg'),(35,'Blinding Lights','The Weeknd',0,1,'blinding_lights.mp3','blinding_lights.mp4','After Hours','after_hours.png',2019,'synth-pop','the_weeknd.jpg'),(36,'Espresso','Sabrina Carpenter',0,NULL,'espresso.mp3','espresso.mp4','Short n\' Sweet','short_n_sweet.jpg',2024,'pop','sabrina_carpenter.webp'),(37,'Can\'t Catch Me Now','Olivia Rodrigo',0,1,'cant_catch_me_now.mp3','cant_catch_me_now.mp4','The Hunger Games: The Ballad of Songbirds & Snakes','the_hunger_games_ballad.jpeg',2023,'folk rock','olivia_rodrigo.jpg'),(38,'We Are The World','U.S.A. For Africa',0,10,'we_are_the_world.mp3','we_are_the_world.mp4',NULL,NULL,1985,'pop',NULL),(39,'Do They Know It\'s Christmas?','Band Aid',0,10,'do_they_know_its_christmas.mp3',NULL,NULL,NULL,1984,'seasonal',NULL),(40,'Buenos Dias Argentina','Udo Jürgens',0,10,'buenos_dias_argentina.mp3','buenos_dias_argentina.mp4','Buenos Dias Argentina','buenos_dias_argentina.jpg',1978,'schlager','udo_jürgens.jpeg'),(41,'Heal the World','Michael Jackson',0,NULL,'heal_the_world.mp3','heal_the_world.mp4','Dangerous','dangerous.jpg',1991,'pop','michael-jackson.jpeg'),(42,'Slipping Through My Fingers','ABBA',0,NULL,'slipping_through_my_fingers.mp3',NULL,'The Visitors','the_visitors.jpg',1981,'pop','abba.jpg'),(43,'Nothing Else Matters','Metallica',0,11,'nothing_else_matters.mp3','nothing_else_matters.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg'),(44,'Knockin\' On Heaven\'s Door','Guns N\' Roses',0,11,'knockin_on_heavens_door.mp3',NULL,'Use Your Illusion II','use_your_illusion_ll.jpg',1991,'hard rock','guns_n_roses.jpg'),(45,'Highway to Hell','AC/DC',0,11,'highway_to_hell.mp3','highway_to_hell.mp4','Highway to Hell','highway_to_hell.jpg',1979,'hard rock','acdc.jpg'),(46,'Das Model','Kraftwerk',0,NULL,'das_model.mp3',NULL,'Die Mensch-Maschine','die_mensch_maschine.jpg',1978,'german pop','kraftwerk.jpg'),(47,'Into the Groove','Madonna',0,NULL,'into_the_groove.mp3','into_the_groove.mp4','Like a Virgin','like_a_virgin.jpg',1984,'r&b','madonna.jpg'),(48,'Fast Car','Tracy Chapman',0,NULL,'fast_car.mp3','fast_car.mp4','Tracy Chapman','tracy_chapman.jpg',1988,'folk','tracy_chapman.webp'),(50,'Holiday','Madonna',0,12,'holiday.mp3',NULL,'Madonna','madonna.jpg',1983,'pop','madonna.jpg'),(51,'Glory Days','Bruce Springsteen',0,12,'glory_days.mp3','glory_days.mp4','Born In The U.S.A.','born_in_the_usa.jpg',1984,'rock','bruce_springsteen.webp'),(52,'True Colors','Cyndi Lauper',0,12,'true_colors.mp3','true_colors.mp4','True Colors','true_colors.jpg',1986,'electropop','cyndi_lauper.webp'),(53,'Last Train to London','Electric Light Orchestra',0,13,'last_train_to_london.mp3','last_train_to_london.mp4','Discovery','discovery.jpg',1979,'disco','elo.jpg'),(54,'Ich bin Klempner von Beruf','Reinhard Mey',0,13,'ich_bin_klempner_von_beruf.mp3',NULL,'Wie vor Jahr und Tag','wie_vor_jahr_und_tag.jpg',1974,'schlager','reinhard_mey.jpg'),(55,'Griechischer Wein','Udo Jürgens',0,13,'griechischer_wein.mp3',NULL,'Meine Lieder','meine_lieder.jpg',1974,'german pop','udo_jürgens.jpeg'),(56,'Here Comes The Sun','The Beatles',0,NULL,'here_comes_the_sun.mp3',NULL,'Abbey Road','abbey_road.jpg',1969,'folk','beatles.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=11607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_hint`
--

LOCK TABLES `song_hint` WRITE;
/*!40000 ALTER TABLE `song_hint` DISABLE KEYS */;
INSERT INTO `song_hint` VALUES (11367,1,11,1,NULL),(11368,1,1,2,NULL),(11369,1,7,3,NULL),(11370,1,6,4,NULL),(11371,1,4,5,NULL),(11372,2,9,1,NULL),(11373,2,7,2,NULL),(11374,2,6,3,NULL),(11375,2,2,4,NULL),(11376,2,4,5,NULL),(11377,9,2,1,NULL),(11378,9,6,2,NULL),(11379,9,11,3,NULL),(11380,9,7,4,NULL),(11381,9,4,5,NULL),(11382,10,7,1,NULL),(11383,10,12,2,NULL),(11384,10,8,3,NULL),(11385,10,11,4,NULL),(11386,10,4,5,NULL),(11387,11,8,1,NULL),(11388,11,6,2,NULL),(11389,11,10,3,NULL),(11390,11,7,4,NULL),(11391,11,4,5,NULL),(11392,12,10,1,NULL),(11393,12,12,2,NULL),(11394,12,7,3,NULL),(11395,12,11,4,NULL),(11396,12,4,5,NULL),(11397,13,12,1,NULL),(11398,13,10,2,NULL),(11399,13,1,3,NULL),(11400,13,9,4,NULL),(11401,13,4,5,NULL),(11402,14,12,1,NULL),(11403,14,8,2,NULL),(11404,14,6,3,NULL),(11405,14,1,4,NULL),(11406,14,4,5,NULL),(11407,16,2,1,NULL),(11408,16,7,2,NULL),(11409,16,10,3,NULL),(11410,16,11,4,NULL),(11411,16,4,5,NULL),(11412,17,6,1,NULL),(11413,17,1,2,NULL),(11414,17,8,3,NULL),(11415,17,10,4,NULL),(11416,17,4,5,NULL),(11417,18,10,1,NULL),(11418,18,8,2,NULL),(11419,18,12,3,NULL),(11420,18,7,4,NULL),(11421,18,4,5,NULL),(11422,19,7,1,NULL),(11423,19,10,2,NULL),(11424,19,1,3,NULL),(11425,19,9,4,NULL),(11426,19,4,5,NULL),(11427,20,1,1,NULL),(11428,20,11,2,NULL),(11429,20,10,3,NULL),(11430,20,7,4,NULL),(11431,20,4,5,NULL),(11432,21,11,1,NULL),(11433,21,12,2,NULL),(11434,21,9,3,NULL),(11435,21,8,4,NULL),(11436,21,4,5,NULL),(11437,22,6,1,NULL),(11438,22,12,2,NULL),(11439,22,7,3,NULL),(11440,22,8,4,NULL),(11441,22,4,5,NULL),(11442,23,12,1,NULL),(11443,23,10,2,NULL),(11444,23,9,3,NULL),(11445,23,6,4,NULL),(11446,23,4,5,NULL),(11447,24,9,1,NULL),(11448,24,1,2,NULL),(11449,24,11,3,NULL),(11450,24,8,4,NULL),(11451,24,4,5,NULL),(11452,25,1,1,NULL),(11453,25,12,2,NULL),(11454,25,10,3,NULL),(11455,25,8,4,NULL),(11456,25,4,5,NULL),(11457,26,8,1,NULL),(11458,26,10,2,NULL),(11459,26,6,3,NULL),(11460,26,9,4,NULL),(11461,26,4,5,NULL),(11462,27,7,1,NULL),(11463,27,1,2,NULL),(11464,27,8,3,NULL),(11465,27,9,4,NULL),(11466,27,4,5,NULL),(11467,28,12,1,NULL),(11468,28,2,2,NULL),(11469,28,11,3,NULL),(11470,28,8,4,NULL),(11471,28,4,5,NULL),(11472,29,2,1,NULL),(11473,29,8,2,NULL),(11474,29,6,3,NULL),(11475,29,9,4,NULL),(11476,29,4,5,NULL),(11477,30,1,1,NULL),(11478,30,12,2,NULL),(11479,30,9,3,NULL),(11480,30,11,4,NULL),(11481,30,4,5,NULL),(11482,31,7,1,NULL),(11483,31,10,2,NULL),(11484,31,1,3,NULL),(11485,31,11,4,NULL),(11486,31,4,5,NULL),(11487,32,10,1,NULL),(11488,32,9,2,NULL),(11489,32,2,3,NULL),(11490,32,7,4,NULL),(11491,32,4,5,NULL),(11492,33,8,1,NULL),(11493,33,10,2,NULL),(11494,33,9,3,NULL),(11495,33,12,4,NULL),(11496,33,4,5,NULL),(11497,34,8,1,NULL),(11498,34,12,2,NULL),(11499,34,2,3,NULL),(11500,34,11,4,NULL),(11501,34,4,5,NULL),(11502,35,7,1,NULL),(11503,35,12,2,NULL),(11504,35,10,3,NULL),(11505,35,8,4,NULL),(11506,35,4,5,NULL),(11507,36,7,1,NULL),(11508,36,1,2,NULL),(11509,36,6,3,NULL),(11510,36,8,4,NULL),(11511,36,4,5,NULL),(11512,37,9,1,NULL),(11513,37,10,2,NULL),(11514,37,2,3,NULL),(11515,37,6,4,NULL),(11516,37,4,5,NULL),(11517,38,2,1,NULL),(11518,38,12,2,NULL),(11519,38,6,3,NULL),(11520,38,7,4,NULL),(11521,38,4,5,NULL),(11522,39,2,1,NULL),(11523,39,12,2,NULL),(11524,39,7,3,NULL),(11525,39,10,4,NULL),(11526,39,4,5,NULL),(11527,40,1,1,NULL),(11528,40,7,2,NULL),(11529,40,11,3,NULL),(11530,40,10,4,NULL),(11531,40,4,5,NULL),(11532,41,11,1,NULL),(11533,41,9,2,NULL),(11534,41,10,3,NULL),(11535,41,7,4,NULL),(11536,41,4,5,NULL),(11537,42,8,1,NULL),(11538,42,2,2,NULL),(11539,42,1,3,NULL),(11540,42,7,4,NULL),(11541,42,4,5,NULL),(11542,43,8,1,NULL),(11543,43,1,2,NULL),(11544,43,12,3,NULL),(11545,43,10,4,NULL),(11546,43,4,5,NULL),(11547,44,12,1,NULL),(11548,44,11,2,NULL),(11549,44,10,3,NULL),(11550,44,9,4,NULL),(11551,44,4,5,NULL),(11552,45,10,1,NULL),(11553,45,6,2,NULL),(11554,45,8,3,NULL),(11555,45,11,4,NULL),(11556,45,4,5,NULL),(11557,46,2,1,NULL),(11558,46,7,2,NULL),(11559,46,11,3,NULL),(11560,46,10,4,NULL),(11561,46,4,5,NULL),(11562,47,12,1,NULL),(11563,47,11,2,NULL),(11564,47,7,3,NULL),(11565,47,6,4,NULL),(11566,47,4,5,NULL),(11567,48,1,1,NULL),(11568,48,2,2,NULL),(11569,48,10,3,NULL),(11570,48,9,4,NULL),(11571,48,4,5,NULL),(11572,50,10,1,NULL),(11573,50,2,2,NULL),(11574,50,11,3,NULL),(11575,50,1,4,NULL),(11576,50,4,5,NULL),(11577,51,1,1,NULL),(11578,51,12,2,NULL),(11579,51,6,3,NULL),(11580,51,8,4,NULL),(11581,51,4,5,NULL),(11582,52,2,1,NULL),(11583,52,11,2,NULL),(11584,52,9,3,NULL),(11585,52,1,4,NULL),(11586,52,4,5,NULL),(11587,53,10,1,NULL),(11588,53,11,2,NULL),(11589,53,7,3,NULL),(11590,53,8,4,NULL),(11591,53,4,5,NULL),(11592,54,2,1,NULL),(11593,54,10,2,NULL),(11594,54,9,3,NULL),(11595,54,8,4,NULL),(11596,54,4,5,NULL),(11597,55,9,1,NULL),(11598,55,2,2,NULL),(11599,55,7,3,NULL),(11600,55,12,4,NULL),(11601,55,4,5,NULL),(11602,56,7,1,NULL),(11603,56,11,2,NULL),(11604,56,1,3,NULL),(11605,56,2,4,NULL),(11606,56,4,5,NULL);
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

-- Dump completed on 2025-10-25 14:39:16
