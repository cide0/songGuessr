-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: songguessr
-- ------------------------------------------------------
-- Server version	8.0.44

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picker`
--

LOCK TABLES `picker` WRITE;
/*!40000 ALTER TABLE `picker` DISABLE KEYS */;
INSERT INTO `picker` VALUES (1,'Elias','Böhm'),(6,'Martina','Böhm'),(7,'Ruth','Hörlin'),(8,'Doris','Hörlin'),(9,'Gerhard','Hörlin'),(10,'Katja','Mark'),(11,'Holger','Mark'),(12,'Tanja','Götz'),(13,'Rolf','Schwoche'),(14,'Leonhard','Böhm'),(15,'Marie','Hörlin'),(16,'Natia','Weinmann');
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
  `genre` varchar(255) NOT NULL,
  `artist_image_source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  UNIQUE KEY `song_pk_2` (`name`,`artist`),
  KEY `song_picker_id_fk` (`picked_by`),
  CONSTRAINT `song_picker_picker_id_fk` FOREIGN KEY (`picked_by`) REFERENCES `picker` (`picker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Beat it','Michael Jackson',0,NULL,'beat_it.mp3','beat_it.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(2,'Pink + White','Frank Ocean',0,1,'pink_white.mp3','pink_white.mp4','Blonde','blonde.jpg',2016,'r&b','frank-ocean.webp'),(9,'Thriller','Michael Jackson',0,NULL,'thriller.mp3','thriller.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(10,'Hymn for the Weekend','Coldplay',0,6,'hymn_for_the_weekend.mp3','hymn_for_the_weekend.mp4','A Head Full of Dreams','a_head_full_of_dreams.jpg',2015,'alternative','coldplay.jpeg'),(11,'Mockingbird','Eminem',0,NULL,'mockingbird.mp3','mockingbird.mp4','Encore','encore.jpg',2004,'rap','eminem.jpg'),(12,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA',0,NULL,'gimme_gimme_gimme.mp3','gimme_gimme_gimme.mp4','Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(13,'Sweet Caroline','Neil Diamond',0,7,'sweet_caroline.mp3',NULL,'Sweet Caroline','sweet_caroline.jpg',1969,'soft rock','neil_diamond.webp'),(14,'99 Luftballons','Nena',0,7,'99_luftballons.mp3','99_luftballons.mp4','Nena','nena.jpg',1983,'german pop','nena.jpg'),(16,'Ich war noch niemals in New York','Udo Jürgens',0,7,'ich_war_noch_niemals_in_new_york.mp3',NULL,'Silberstreifen','silberstreifen.jpg',1982,'german pop','udo_jürgens.jpeg'),(17,'I Will Always Love You','Whitney Houston',0,NULL,'i_will_always_love_you.mp3','i_will_always_love_you.mp4','The Bodyguard - Original Soundtrack Album','the_bodyguard.jpg',1992,'ballade','whitney_houston.jpg'),(18,'Ein Stern (der deinen Namen trägt)','DJ Ötzi',0,NULL,'ein_stern_der_deinen_namen_trägt.mp3','ein_stern_der_deinen_namen_trägt.mp4','Sternstunden','sternstunden.jpg',2007,'german pop','dj_ötzi.jpg'),(19,'Hab\' mich wieder mal an dir betrunken','Pur',0,NULL,'hab_mich_wieder_mal_an_dir_betrunken.mp3',NULL,'Pur','pur.jpg',1987,'schlager','pur.jpg'),(20,'Waterloo','ABBA',0,NULL,'waterloo.mp3','waterloo.mp4','Waterloo','waterloo.jpg',1974,'pop','abba.jpg'),(21,'I Have A Dream','ABBA',0,NULL,'i_have_a_dream.mp3',NULL,'Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(22,'Mamma Mia','ABBA',0,NULL,'mamma_mia.mp3','mamma_mia.mp4','Abba','abba.jpg',1975,'pop','abba.jpg'),(23,'Super Trouper','ABBA',0,NULL,'super_trouper.mp3','super_trouper.mp4','Super Trouper','super_trouper.jpg',1980,'pop','abba.jpg'),(24,'Lost on You','LP',0,NULL,'lost_on_you.mp3','lost_on_you.mp4','Lost On You','lost_on_you.jpg',2016,'alternative','lp.webp'),(25,'Stern des Südens','Bayern-Fans United',0,NULL,'stern_des_südens.mp3','stern_des_südens.mp4','Heimspiel','heimspiel.jpg',1999,'anthem',NULL),(26,'It\'s My Life','Bon Jovi',0,NULL,'its_my_life.mp3','its_my_life.mp4','Crush','crush.jpg',2000,'pop rock','bon_jovi.webp'),(27,'Westerland','Die Ärzte',0,8,'westerland.mp3',NULL,'Das Ist Nicht Die Ganze Wahrheit...','das_ist_nicht_die_ganze_wahrheit.jpg',1988,'punk','die_ärzte.jpg'),(28,'Hymn','Barclay James Harvest',0,8,'hymn.mp3',NULL,'Gone To Earth','gone_to_earth.jpg',1977,'alternative','barclay_james_harvest.jpeg'),(29,'If You Don\'t Know Me by Now','Simply Red',0,8,'if_you_dont_know_me_by_now.mp3','if_you_dont_know_me_by_now.mp4','A New Flame','a_new_flame.jpg',1989,'r&b','simply_red.png'),(30,'It\'s Raining Men','The Weather Girls',0,9,'its_raining_men.mp3','its_raining_men.mp4','Success','success.jpg',1982,'disco','weather_girls.jpg'),(31,'Skandal im Sperrbezirk','Spider Murphy Gang',0,9,'skandal_im_sperrbezirk.mp3',NULL,'Dolce Vita','dolce_vita.jpg',1981,'german rock','spider_murphy_gang.jpg'),(32,'Über sieben Brücken musst du gehn','Karat',0,9,'über_sieben_brücken_musst_du_gehn.mp3','über_sieben_brücken_musst_du_gehn.mp4',NULL,NULL,1979,'german rock','karat.jpg'),(33,'BIRDS OF A FEATHER','Billie Eilish',0,6,'birds_of_a_feather.mp3','birds_of_a_feather.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'bedroom pop','billie_eilish.jpeg'),(34,'Yeah!','USHER',0,6,'yeah.mp3','yeah.mp4','Confessions','confessions.png',2004,'r&b','usher.jpg'),(35,'Blinding Lights','The Weeknd',0,1,'blinding_lights.mp3','blinding_lights.mp4','After Hours','after_hours.png',2019,'synth-pop','the_weeknd.jpg'),(36,'Espresso','Sabrina Carpenter',0,NULL,'espresso.mp3','espresso.mp4','Short n\' Sweet','short_n_sweet.jpg',2024,'pop','sabrina_carpenter.webp'),(37,'Can\'t Catch Me Now','Olivia Rodrigo',0,1,'cant_catch_me_now.mp3','cant_catch_me_now.mp4','The Hunger Games: The Ballad of Songbirds & Snakes','the_hunger_games_ballad.jpeg',2023,'folk rock','olivia_rodrigo.jpg'),(38,'We Are The World','U.S.A. For Africa',0,10,'we_are_the_world.mp3','we_are_the_world.mp4',NULL,NULL,1985,'pop',NULL),(39,'Do They Know It\'s Christmas?','Band Aid',0,10,'do_they_know_its_christmas.mp3',NULL,NULL,NULL,1984,'seasonal',NULL),(40,'Buenos Dias Argentina','Udo Jürgens',0,10,'buenos_dias_argentina.mp3','buenos_dias_argentina.mp4','Buenos Dias Argentina','buenos_dias_argentina.jpg',1978,'schlager','udo_jürgens.jpeg'),(41,'Heal the World','Michael Jackson',0,NULL,'heal_the_world.mp3','heal_the_world.mp4','Dangerous','dangerous.jpg',1991,'pop','michael-jackson.jpeg'),(42,'Slipping Through My Fingers','ABBA',0,NULL,'slipping_through_my_fingers.mp3',NULL,'The Visitors','the_visitors.jpg',1981,'pop','abba.jpg'),(43,'Nothing Else Matters','Metallica',0,11,'nothing_else_matters.mp3','nothing_else_matters.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg'),(44,'Knockin\' On Heaven\'s Door','Guns N\' Roses',0,11,'knockin_on_heavens_door.mp3',NULL,'Use Your Illusion II','use_your_illusion_ll.jpg',1991,'hard rock','guns_n_roses.jpg'),(45,'Highway to Hell','AC/DC',0,11,'highway_to_hell.mp3','highway_to_hell.mp4','Highway to Hell','highway_to_hell.jpg',1979,'hard rock','acdc.jpg'),(46,'Das Model','Kraftwerk',0,NULL,'das_model.mp3',NULL,'Die Mensch-Maschine','die_mensch_maschine.jpg',1978,'german pop','kraftwerk.jpg'),(47,'Into the Groove','Madonna',0,NULL,'into_the_groove.mp3','into_the_groove.mp4','Like a Virgin','like_a_virgin.jpg',1984,'r&b','madonna.jpg'),(48,'Fast Car','Tracy Chapman',0,NULL,'fast_car.mp3','fast_car.mp4','Tracy Chapman','tracy_chapman.jpg',1988,'folk','tracy_chapman.webp'),(50,'Holiday','Madonna',0,12,'holiday.mp3',NULL,'Madonna','madonna.jpg',1983,'pop','madonna.jpg'),(51,'Glory Days','Bruce Springsteen',0,12,'glory_days.mp3','glory_days.mp4','Born In The U.S.A.','born_in_the_usa.jpg',1984,'rock','bruce_springsteen.webp'),(52,'True Colors','Cyndi Lauper',0,12,'true_colors.mp3','true_colors.mp4','True Colors','true_colors.jpg',1986,'electropop','cyndi_lauper.webp'),(53,'Last Train to London','Electric Light Orchestra',0,13,'last_train_to_london.mp3','last_train_to_london.mp4','Discovery','discovery.jpg',1979,'disco','elo.jpg'),(54,'Ich bin Klempner von Beruf','Reinhard Mey',0,13,'ich_bin_klempner_von_beruf.mp3',NULL,'Wie vor Jahr und Tag','wie_vor_jahr_und_tag.jpg',1974,'schlager','reinhard_mey.jpg'),(55,'Griechischer Wein','Udo Jürgens',0,13,'griechischer_wein.mp3',NULL,'Meine Lieder','meine_lieder.jpg',1974,'german pop','udo_jürgens.jpeg'),(56,'Here Comes The Sun','The Beatles',0,NULL,'here_comes_the_sun.mp3',NULL,'Abbey Road','abbey_road.jpg',1969,'folk','beatles.jpg'),(57,'Hall of Fame','The Script',0,14,'hall_of_fame.mp3','hall_of_fame.mp4','#3','hashtag3.jpg',2012,'pop rock','the_script.jpg'),(58,'rockstar','Post Malone',0,14,'rockstar.mp3',NULL,'beerbongs & bentleys','beerbongs_and_bentleys.jpg',2018,'trap','post_malone.jpg'),(59,'Papercut','Linkin Park',0,14,'papercut.mp3','papercut.mp4','Hybrid Theory','hybrid_theory.jpg',2000,'nu metal','linkin_park.jpg'),(60,'Dancing in the Moonlight','Toploader',0,NULL,'dancing_in_the_moonlight.mp3',NULL,'Onka\'s Big Moka','onkas_big_moka.jpg',2000,'pop','toploader.jpg'),(61,'Wouldn\'t It Be Nice','The Beach Boys',0,NULL,'wouldnt_it_be_nice.mp3','wouldnt_it_be_nice.mp4','Pet Sounds','pet_sounds.jpg',1966,'alternative','beach_boys.webp'),(62,'Rock Me Amadeus','Falco',0,NULL,'rock_me_amadeus.mp3','rock_me_amadeus.mp4','Falco 3','falco3.jpg',1985,'german pop','falco.jpg'),(63,'Major Tom (...völlig losgelöst)','Peter Schilling',0,NULL,'major_tom.mp3','major_tom.mp4','Fehler Im System','fehler_im_system.jpg',1982,'schlager','peter_schilling.jpg'),(64,'Moskau','Dschinghis Khan',0,NULL,'moskau.mp3','moskau.mp4','Dschinghis Khan','dschinghis_khan.jpg',1979,'schlager','dschinghis_khan.webp'),(65,'Auf uns','Andreas Bourani',0,15,'auf_uns.mp3','auf_uns.mp4','Hey','hey.jpg',2014,'german pop','andreas_bourani.jpeg'),(66,'Dark Horse','Katy Perry',0,15,'dark_horse.mp3','dark_horse.mp4','PRISM','prism.jpeg',2013,'pop','katy_perry.webp'),(68,'Wish I Could Fly','Roxette',0,16,'wish_i_could_fly.mp3','wish_i_could_fly.mp4','Have A Nice day','have_a_nice_day.jpg',1999,'alternative','roxette.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=20332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_hint`
--

LOCK TABLES `song_hint` WRITE;
/*!40000 ALTER TABLE `song_hint` DISABLE KEYS */;
INSERT INTO `song_hint` VALUES (20037,1,9,1,NULL),(20038,1,2,2,NULL),(20039,1,11,3,NULL),(20040,1,12,4,NULL),(20041,1,4,5,NULL),(20042,2,9,1,NULL),(20043,2,6,2,NULL),(20044,2,2,3,NULL),(20045,2,12,4,NULL),(20046,2,4,5,NULL),(20047,9,12,1,NULL),(20048,9,11,2,NULL),(20049,9,9,3,NULL),(20050,9,6,4,NULL),(20051,9,4,5,NULL),(20052,10,12,1,NULL),(20053,10,8,2,NULL),(20054,10,7,3,NULL),(20055,10,9,4,NULL),(20056,10,4,5,NULL),(20057,11,8,1,NULL),(20058,11,6,2,NULL),(20059,11,12,3,NULL),(20060,11,2,4,NULL),(20061,11,4,5,NULL),(20062,12,2,1,NULL),(20063,12,7,2,NULL),(20064,12,12,3,NULL),(20065,12,11,4,NULL),(20066,12,4,5,NULL),(20067,13,10,1,NULL),(20068,13,12,2,NULL),(20069,13,1,3,NULL),(20070,13,2,4,NULL),(20071,13,4,5,NULL),(20072,14,12,1,NULL),(20073,14,7,2,NULL),(20074,14,1,3,NULL),(20075,14,9,4,NULL),(20076,14,4,5,NULL),(20077,16,2,1,NULL),(20078,16,1,2,NULL),(20079,16,8,3,NULL),(20080,16,11,4,NULL),(20081,16,4,5,NULL),(20082,17,2,1,NULL),(20083,17,6,2,NULL),(20084,17,8,3,NULL),(20085,17,11,4,NULL),(20086,17,4,5,NULL),(20087,18,9,1,NULL),(20088,18,1,2,NULL),(20089,18,6,3,NULL),(20090,18,7,4,NULL),(20091,18,4,5,NULL),(20092,19,10,1,NULL),(20093,19,8,2,NULL),(20094,19,12,3,NULL),(20095,19,2,4,NULL),(20096,19,4,5,NULL),(20097,20,9,1,NULL),(20098,20,6,2,NULL),(20099,20,8,3,NULL),(20100,20,12,4,NULL),(20101,20,4,5,NULL),(20102,21,11,1,NULL),(20103,21,10,2,NULL),(20104,21,1,3,NULL),(20105,21,9,4,NULL),(20106,21,4,5,NULL),(20107,22,9,1,NULL),(20108,22,8,2,NULL),(20109,22,10,3,NULL),(20110,22,2,4,NULL),(20111,22,4,5,NULL),(20112,23,1,1,NULL),(20113,23,12,2,NULL),(20114,23,2,3,NULL),(20115,23,8,4,NULL),(20116,23,4,5,NULL),(20117,24,8,1,NULL),(20118,24,6,2,NULL),(20119,24,11,3,NULL),(20120,24,9,4,NULL),(20121,24,4,5,NULL),(20122,25,6,1,NULL),(20123,25,1,2,NULL),(20124,25,8,3,NULL),(20125,25,10,4,NULL),(20126,25,4,5,NULL),(20127,26,11,1,NULL),(20128,26,6,2,NULL),(20129,26,9,3,NULL),(20130,26,1,4,NULL),(20131,26,4,5,NULL),(20132,27,10,1,NULL),(20133,27,8,2,NULL),(20134,27,11,3,NULL),(20135,27,12,4,NULL),(20136,27,4,5,NULL),(20137,28,2,1,NULL),(20138,28,10,2,NULL),(20139,28,8,3,NULL),(20140,28,12,4,NULL),(20141,28,4,5,NULL),(20142,29,1,1,NULL),(20143,29,2,2,NULL),(20144,29,7,3,NULL),(20145,29,12,4,NULL),(20146,29,4,5,NULL),(20147,30,11,1,NULL),(20148,30,9,2,NULL),(20149,30,12,3,NULL),(20150,30,2,4,NULL),(20151,30,4,5,NULL),(20152,31,7,1,NULL),(20153,31,8,2,NULL),(20154,31,1,3,NULL),(20155,31,12,4,NULL),(20156,31,4,5,NULL),(20157,32,9,1,NULL),(20158,32,12,2,NULL),(20159,32,2,3,NULL),(20160,32,11,4,NULL),(20161,32,4,5,NULL),(20162,33,9,1,NULL),(20163,33,6,2,NULL),(20164,33,1,3,NULL),(20165,33,2,4,NULL),(20166,33,4,5,NULL),(20167,34,12,1,NULL),(20168,34,9,2,NULL),(20169,34,11,3,NULL),(20170,34,1,4,NULL),(20171,34,4,5,NULL),(20172,35,12,1,NULL),(20173,35,2,2,NULL),(20174,35,6,3,NULL),(20175,35,8,4,NULL),(20176,35,4,5,NULL),(20177,36,9,1,NULL),(20178,36,2,2,NULL),(20179,36,1,3,NULL),(20180,36,11,4,NULL),(20181,36,4,5,NULL),(20182,37,8,1,NULL),(20183,37,2,2,NULL),(20184,37,9,3,NULL),(20185,37,10,4,NULL),(20186,37,4,5,NULL),(20187,38,6,1,NULL),(20188,38,2,2,NULL),(20189,38,12,3,NULL),(20190,38,10,4,NULL),(20191,38,4,5,NULL),(20192,39,10,1,NULL),(20193,39,12,2,NULL),(20194,39,9,3,NULL),(20195,39,2,4,NULL),(20196,39,4,5,NULL),(20197,40,8,1,NULL),(20198,40,11,2,NULL),(20199,40,9,3,NULL),(20200,40,6,4,NULL),(20201,40,4,5,NULL),(20202,41,10,1,NULL),(20203,41,12,2,NULL),(20204,41,1,3,NULL),(20205,41,2,4,NULL),(20206,41,4,5,NULL),(20207,42,9,1,NULL),(20208,42,7,2,NULL),(20209,42,12,3,NULL),(20210,42,1,4,NULL),(20211,42,4,5,NULL),(20212,43,12,1,NULL),(20213,43,9,2,NULL),(20214,43,10,3,NULL),(20215,43,11,4,NULL),(20216,43,4,5,NULL),(20217,44,10,1,NULL),(20218,44,12,2,NULL),(20219,44,2,3,NULL),(20220,44,8,4,NULL),(20221,44,4,5,NULL),(20222,45,12,1,NULL),(20223,45,8,2,NULL),(20224,45,2,3,NULL),(20225,45,1,4,NULL),(20226,45,4,5,NULL),(20227,46,12,1,NULL),(20228,46,10,2,NULL),(20229,46,9,3,NULL),(20230,46,11,4,NULL),(20231,46,4,5,NULL),(20232,47,12,1,NULL),(20233,47,11,2,NULL),(20234,47,1,3,NULL),(20235,47,7,4,NULL),(20236,47,4,5,NULL),(20237,48,11,1,NULL),(20238,48,10,2,NULL),(20239,48,1,3,NULL),(20240,48,6,4,NULL),(20241,48,4,5,NULL),(20242,50,9,1,NULL),(20243,50,11,2,NULL),(20244,50,10,3,NULL),(20245,50,2,4,NULL),(20246,50,4,5,NULL),(20247,51,8,1,NULL),(20248,51,6,2,NULL),(20249,51,11,3,NULL),(20250,51,2,4,NULL),(20251,51,4,5,NULL),(20252,52,1,1,NULL),(20253,52,10,2,NULL),(20254,52,11,3,NULL),(20255,52,9,4,NULL),(20256,52,4,5,NULL),(20257,53,9,1,NULL),(20258,53,2,2,NULL),(20259,53,11,3,NULL),(20260,53,12,4,NULL),(20261,53,4,5,NULL),(20262,54,8,1,NULL),(20263,54,2,2,NULL),(20264,54,11,3,NULL),(20265,54,12,4,NULL),(20266,54,4,5,NULL),(20267,55,12,1,NULL),(20268,55,2,2,NULL),(20269,55,1,3,NULL),(20270,55,7,4,NULL),(20271,55,4,5,NULL),(20272,56,10,1,NULL),(20273,56,9,2,NULL),(20274,56,2,3,NULL),(20275,56,1,4,NULL),(20276,56,4,5,NULL),(20277,57,1,1,NULL),(20278,57,12,2,NULL),(20279,57,9,3,NULL),(20280,57,6,4,NULL),(20281,57,4,5,NULL),(20282,58,11,1,NULL),(20283,58,2,2,NULL),(20284,58,1,3,NULL),(20285,58,8,4,NULL),(20286,58,4,5,NULL),(20287,59,9,1,NULL),(20288,59,10,2,NULL),(20289,59,2,3,NULL),(20290,59,6,4,NULL),(20291,59,4,5,NULL),(20292,60,12,1,NULL),(20293,60,8,2,NULL),(20294,60,1,3,NULL),(20295,60,9,4,NULL),(20296,60,4,5,NULL),(20297,61,10,1,NULL),(20298,61,12,2,NULL),(20299,61,11,3,NULL),(20300,61,6,4,NULL),(20301,61,4,5,NULL),(20302,62,11,1,NULL),(20303,62,12,2,NULL),(20304,62,6,3,NULL),(20305,62,1,4,NULL),(20306,62,4,5,NULL),(20307,63,6,1,NULL),(20308,63,9,2,NULL),(20309,63,2,3,NULL),(20310,63,11,4,NULL),(20311,63,4,5,NULL),(20312,64,11,1,NULL),(20313,64,12,2,NULL),(20314,64,8,3,NULL),(20315,64,6,4,NULL),(20316,64,4,5,NULL),(20317,65,1,1,NULL),(20318,65,11,2,NULL),(20319,65,8,3,NULL),(20320,65,2,4,NULL),(20321,65,4,5,NULL),(20322,66,1,1,NULL),(20323,66,10,2,NULL),(20324,66,9,3,NULL),(20325,66,12,4,NULL),(20326,66,4,5,NULL),(20327,68,12,1,NULL),(20328,68,8,2,NULL),(20329,68,11,3,NULL),(20330,68,6,4,NULL),(20331,68,4,5,NULL);
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

-- Dump completed on 2025-10-28 19:43:04
