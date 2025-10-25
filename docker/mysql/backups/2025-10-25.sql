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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picker`
--

LOCK TABLES `picker` WRITE;
/*!40000 ALTER TABLE `picker` DISABLE KEYS */;
INSERT INTO `picker` VALUES (1,'Elias','Böhm'),(6,'Martina','Böhm'),(7,'Ruth','Hörlin'),(8,'Doris','Hörlin'),(9,'Gerhard','Hörlin'),(10,'Katja','Mark'),(11,'Holger','Mark'),(12,'Tanja','Götz'),(13,'Rolf','Schwoche'),(14,'Leonhard','Böhm');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Beat it','Michael Jackson',0,NULL,'beat_it.mp3','beat_it.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(2,'Pink + White','Frank Ocean',0,1,'pink_white.mp3','pink_white.mp4','Blonde','blonde.jpg',2016,'r&b','frank-ocean.webp'),(9,'Thriller','Michael Jackson',0,NULL,'thriller.mp3','thriller.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(10,'Hymn for the Weekend','Coldplay',0,6,'hymn_for_the_weekend.mp3','hymn_for_the_weekend.mp4','A Head Full of Dreams','a_head_full_of_dreams.jpg',2015,'alternative','coldplay.jpeg'),(11,'Mockingbird','Eminem',0,NULL,'mockingbird.mp3','mockingbird.mp4','Encore','encore.jpg',2004,'rap','eminem.jpg'),(12,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA',0,NULL,'gimme_gimme_gimme.mp3','gimme_gimme_gimme.mp4','Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(13,'Sweet Caroline','Neil Diamond',0,7,'sweet_caroline.mp3',NULL,'Sweet Caroline','sweet_caroline.jpg',1969,'soft rock','neil_diamond.webp'),(14,'99 Luftballons','Nena',0,7,'99_luftballons.mp3','99_luftballons.mp4','Nena','nena.jpg',1983,'german pop','nena.jpg'),(16,'Ich war noch niemals in New York','Udo Jürgens',0,7,'ich_war_noch_niemals_in_new_york.mp3',NULL,'Silberstreifen','silberstreifen.jpg',1982,'german pop','udo_jürgens.jpeg'),(17,'I Will Always Love You','Whitney Houston',0,NULL,'i_will_always_love_you.mp3','i_will_always_love_you.mp4','The Bodyguard - Original Soundtrack Album','the_bodyguard.jpg',1992,'ballade','whitney_houston.jpg'),(18,'Ein Stern (der deinen Namen trägt)','DJ Ötzi',0,NULL,'ein_stern_der_deinen_namen_trägt.mp3','ein_stern_der_deinen_namen_trägt.mp4','Sternstunden','sternstunden.jpg',2007,'german pop','dj_ötzi.jpg'),(19,'Hab\' mich wieder mal an dir betrunken','Pur',0,NULL,'hab_mich_wieder_mal_an_dir_betrunken.mp3',NULL,'Pur','pur.jpg',1987,'schlager','pur.jpg'),(20,'Waterloo','ABBA',0,NULL,'waterloo.mp3','waterloo.mp4','Waterloo','waterloo.jpg',1974,'pop','abba.jpg'),(21,'I Have A Dream','ABBA',0,NULL,'i_have_a_dream.mp3',NULL,'Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(22,'Mamma Mia','ABBA',0,NULL,'mamma_mia.mp3','mamma_mia.mp4','Abba','abba.jpg',1975,'pop','abba.jpg'),(23,'Super Trouper','ABBA',0,NULL,'super_trouper.mp3','super_trouper.mp4','Super Trouper','super_trouper.jpg',1980,'pop','abba.jpg'),(24,'Lost on You','LP',0,NULL,'lost_on_you.mp3','lost_on_you.mp4','Lost On You','lost_on_you.jpg',2016,'alternative','lp.webp'),(25,'Stern des Südens','Bayern-Fans United',0,NULL,'stern_des_südens.mp3','stern_des_südens.mp4','Heimspiel','heimspiel.jpg',1999,'anthem',NULL),(26,'It\'s My Life','Bon Jovi',0,NULL,'its_my_life.mp3','its_my_life.mp4','Crush','crush.jpg',2000,'pop rock','bon_jovi.webp'),(27,'Westerland','Die Ärzte',0,8,'westerland.mp3',NULL,'Das Ist Nicht Die Ganze Wahrheit...','das_ist_nicht_die_ganze_wahrheit.jpg',1988,'punk','die_ärzte.jpg'),(28,'Hymn','Barclay James Harvest',0,8,'hymn.mp3',NULL,'Gone To Earth','gone_to_earth.jpg',1977,'alternative','barclay_james_harvest.jpeg'),(29,'If You Don\'t Know Me by Now','Simply Red',0,8,'if_you_dont_know_me_by_now.mp3','if_you_dont_know_me_by_now.mp4','A New Flame','a_new_flame.jpg',1989,'r&b','simply_red.png'),(30,'It\'s Raining Men','The Weather Girls',0,9,'its_raining_men.mp3','its_raining_men.mp4','Success','success.jpg',1982,'disco','weather_girls.jpg'),(31,'Skandal im Sperrbezirk','Spider Murphy Gang',0,9,'skandal_im_sperrbezirk.mp3',NULL,'Dolce Vita','dolce_vita.jpg',1981,'german rock','spider_murphy_gang.jpg'),(32,'Über sieben Brücken musst du gehn','Karat',0,9,'über_sieben_brücken_musst_du_gehn.mp3','über_sieben_brücken_musst_du_gehn.mp4',NULL,NULL,1979,'german rock','karat.jpg'),(33,'BIRDS OF A FEATHER','Billie Eilish',0,6,'birds_of_a_feather.mp3','birds_of_a_feather.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'bedroom pop','billie_eilish.jpeg'),(34,'Yeah!','USHER',0,6,'yeah.mp3','yeah.mp4','Confessions','confessions.png',2004,'r&b','usher.jpg'),(35,'Blinding Lights','The Weeknd',0,1,'blinding_lights.mp3','blinding_lights.mp4','After Hours','after_hours.png',2019,'synth-pop','the_weeknd.jpg'),(36,'Espresso','Sabrina Carpenter',0,NULL,'espresso.mp3','espresso.mp4','Short n\' Sweet','short_n_sweet.jpg',2024,'pop','sabrina_carpenter.webp'),(37,'Can\'t Catch Me Now','Olivia Rodrigo',0,1,'cant_catch_me_now.mp3','cant_catch_me_now.mp4','The Hunger Games: The Ballad of Songbirds & Snakes','the_hunger_games_ballad.jpeg',2023,'folk rock','olivia_rodrigo.jpg'),(38,'We Are The World','U.S.A. For Africa',0,10,'we_are_the_world.mp3','we_are_the_world.mp4',NULL,NULL,1985,'pop',NULL),(39,'Do They Know It\'s Christmas?','Band Aid',0,10,'do_they_know_its_christmas.mp3',NULL,NULL,NULL,1984,'seasonal',NULL),(40,'Buenos Dias Argentina','Udo Jürgens',0,10,'buenos_dias_argentina.mp3','buenos_dias_argentina.mp4','Buenos Dias Argentina','buenos_dias_argentina.jpg',1978,'schlager','udo_jürgens.jpeg'),(41,'Heal the World','Michael Jackson',0,NULL,'heal_the_world.mp3','heal_the_world.mp4','Dangerous','dangerous.jpg',1991,'pop','michael-jackson.jpeg'),(42,'Slipping Through My Fingers','ABBA',0,NULL,'slipping_through_my_fingers.mp3',NULL,'The Visitors','the_visitors.jpg',1981,'pop','abba.jpg'),(43,'Nothing Else Matters','Metallica',0,11,'nothing_else_matters.mp3','nothing_else_matters.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg'),(44,'Knockin\' On Heaven\'s Door','Guns N\' Roses',0,11,'knockin_on_heavens_door.mp3',NULL,'Use Your Illusion II','use_your_illusion_ll.jpg',1991,'hard rock','guns_n_roses.jpg'),(45,'Highway to Hell','AC/DC',0,11,'highway_to_hell.mp3','highway_to_hell.mp4','Highway to Hell','highway_to_hell.jpg',1979,'hard rock','acdc.jpg'),(46,'Das Model','Kraftwerk',0,NULL,'das_model.mp3',NULL,'Die Mensch-Maschine','die_mensch_maschine.jpg',1978,'german pop','kraftwerk.jpg'),(47,'Into the Groove','Madonna',0,NULL,'into_the_groove.mp3','into_the_groove.mp4','Like a Virgin','like_a_virgin.jpg',1984,'r&b','madonna.jpg'),(48,'Fast Car','Tracy Chapman',0,NULL,'fast_car.mp3','fast_car.mp4','Tracy Chapman','tracy_chapman.jpg',1988,'folk','tracy_chapman.webp'),(50,'Holiday','Madonna',0,12,'holiday.mp3',NULL,'Madonna','madonna.jpg',1983,'pop','madonna.jpg'),(51,'Glory Days','Bruce Springsteen',0,12,'glory_days.mp3','glory_days.mp4','Born In The U.S.A.','born_in_the_usa.jpg',1984,'rock','bruce_springsteen.webp'),(52,'True Colors','Cyndi Lauper',0,12,'true_colors.mp3','true_colors.mp4','True Colors','true_colors.jpg',1986,'electropop','cyndi_lauper.webp'),(53,'Last Train to London','Electric Light Orchestra',0,13,'last_train_to_london.mp3','last_train_to_london.mp4','Discovery','discovery.jpg',1979,'disco','elo.jpg'),(54,'Ich bin Klempner von Beruf','Reinhard Mey',0,13,'ich_bin_klempner_von_beruf.mp3',NULL,'Wie vor Jahr und Tag','wie_vor_jahr_und_tag.jpg',1974,'schlager','reinhard_mey.jpg'),(55,'Griechischer Wein','Udo Jürgens',0,13,'griechischer_wein.mp3',NULL,'Meine Lieder','meine_lieder.jpg',1974,'german pop','udo_jürgens.jpeg'),(56,'Here Comes The Sun','The Beatles',0,NULL,'here_comes_the_sun.mp3',NULL,'Abbey Road','abbey_road.jpg',1969,'folk','beatles.jpg'),(57,'Hall of Fame','The Script',0,14,'hall_of_fame.mp3','hall_of_fame.mp4','#3','hashtag3.jpg',2012,'pop rock','the_script.jpg'),(58,'rockstar','Post Malone',0,14,'rockstar.mp3',NULL,'beerbongs & bentleys','beerbongs_and_bentleys.jpg',2018,'trap','post_malone.jpg'),(59,'Papercut','Linkin Park',0,14,'papercut.mp3','papercut.mp4','Hybrid Theory','hybrid_theory.jpg',2000,'nu metal','linkin_park.jpg'),(60,'Dancing in the Moonlight','Toploader',0,NULL,'dancing_in_the_moonlight.mp3',NULL,'Onka\'s Big Moka','onkas_big_moka.jpg',2000,'pop','toploader.jpg'),(61,'Wouldn\'t It Be Nice','The Beach Boys',0,NULL,'wouldnt_it_be_nice.mp3','wouldnt_it_be_nice.mp4','Pet Sounds','pet_sounds.jpg',1966,'alternative','beach_boys.webp'),(62,'Rock Me Amadeus','Falco',0,NULL,'rock_me_amadeus.mp3','rock_me_amadeus.mp4','Falco 3','falco3.jpg',1985,'german pop','falco.jpg'),(63,'Major Tom (...völlig losgelöst)','Peter Schilling',0,NULL,'major_tom.mp3','major_tom.mp4','Fehler Im System','fehler_im_system.jpg',1982,'schlager','peter_schilling.jpg'),(64,'Moskau','Dschinghis Khan',0,NULL,'moskau.mp3','moskau.mp4','Dschinghis Khan','dschinghis_khan.jpg',1979,'schlager','dschinghis_khan.webp');
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
) ENGINE=InnoDB AUTO_INCREMENT=14237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_hint`
--

LOCK TABLES `song_hint` WRITE;
/*!40000 ALTER TABLE `song_hint` DISABLE KEYS */;
INSERT INTO `song_hint` VALUES (13957,1,8,1,NULL),(13958,1,10,2,NULL),(13959,1,6,3,NULL),(13960,1,1,4,NULL),(13961,1,4,5,NULL),(13962,2,10,1,NULL),(13963,2,9,2,NULL),(13964,2,12,3,NULL),(13965,2,6,4,NULL),(13966,2,4,5,NULL),(13967,9,1,1,NULL),(13968,9,11,2,NULL),(13969,9,9,3,NULL),(13970,9,10,4,NULL),(13971,9,4,5,NULL),(13972,10,11,1,NULL),(13973,10,8,2,NULL),(13974,10,1,3,NULL),(13975,10,7,4,NULL),(13976,10,4,5,NULL),(13977,11,9,1,NULL),(13978,11,10,2,NULL),(13979,11,2,3,NULL),(13980,11,7,4,NULL),(13981,11,4,5,NULL),(13982,12,7,1,NULL),(13983,12,12,2,NULL),(13984,12,11,3,NULL),(13985,12,8,4,NULL),(13986,12,4,5,NULL),(13987,13,10,1,NULL),(13988,13,9,2,NULL),(13989,13,7,3,NULL),(13990,13,1,4,NULL),(13991,13,4,5,NULL),(13992,14,8,1,NULL),(13993,14,6,2,NULL),(13994,14,7,3,NULL),(13995,14,11,4,NULL),(13996,14,4,5,NULL),(13997,16,1,1,NULL),(13998,16,12,2,NULL),(13999,16,10,3,NULL),(14000,16,2,4,NULL),(14001,16,4,5,NULL),(14002,17,10,1,NULL),(14003,17,7,2,NULL),(14004,17,8,3,NULL),(14005,17,6,4,NULL),(14006,17,4,5,NULL),(14007,18,10,1,NULL),(14008,18,1,2,NULL),(14009,18,9,3,NULL),(14010,18,11,4,NULL),(14011,18,4,5,NULL),(14012,19,2,1,NULL),(14013,19,8,2,NULL),(14014,19,1,3,NULL),(14015,19,9,4,NULL),(14016,19,4,5,NULL),(14017,20,6,1,NULL),(14018,20,8,2,NULL),(14019,20,2,3,NULL),(14020,20,1,4,NULL),(14021,20,4,5,NULL),(14022,21,12,1,NULL),(14023,21,1,2,NULL),(14024,21,9,3,NULL),(14025,21,8,4,NULL),(14026,21,4,5,NULL),(14027,22,9,1,NULL),(14028,22,6,2,NULL),(14029,22,11,3,NULL),(14030,22,8,4,NULL),(14031,22,4,5,NULL),(14032,23,8,1,NULL),(14033,23,10,2,NULL),(14034,23,11,3,NULL),(14035,23,12,4,NULL),(14036,23,4,5,NULL),(14037,24,12,1,NULL),(14038,24,11,2,NULL),(14039,24,9,3,NULL),(14040,24,8,4,NULL),(14041,24,4,5,NULL),(14042,25,1,1,NULL),(14043,25,7,2,NULL),(14044,25,8,3,NULL),(14045,25,2,4,NULL),(14046,25,4,5,NULL),(14047,26,7,1,NULL),(14048,26,1,2,NULL),(14049,26,9,3,NULL),(14050,26,10,4,NULL),(14051,26,4,5,NULL),(14052,27,12,1,NULL),(14053,27,8,2,NULL),(14054,27,1,3,NULL),(14055,27,7,4,NULL),(14056,27,4,5,NULL),(14057,28,8,1,NULL),(14058,28,11,2,NULL),(14059,28,1,3,NULL),(14060,28,2,4,NULL),(14061,28,4,5,NULL),(14062,29,6,1,NULL),(14063,29,9,2,NULL),(14064,29,10,3,NULL),(14065,29,8,4,NULL),(14066,29,4,5,NULL),(14067,30,6,1,NULL),(14068,30,10,2,NULL),(14069,30,12,3,NULL),(14070,30,9,4,NULL),(14071,30,4,5,NULL),(14072,31,12,1,NULL),(14073,31,8,2,NULL),(14074,31,11,3,NULL),(14075,31,1,4,NULL),(14076,31,4,5,NULL),(14077,32,11,1,NULL),(14078,32,2,2,NULL),(14079,32,10,3,NULL),(14080,32,12,4,NULL),(14081,32,4,5,NULL),(14082,33,11,1,NULL),(14083,33,2,2,NULL),(14084,33,9,3,NULL),(14085,33,8,4,NULL),(14086,33,4,5,NULL),(14087,34,2,1,NULL),(14088,34,11,2,NULL),(14089,34,8,3,NULL),(14090,34,1,4,NULL),(14091,34,4,5,NULL),(14092,35,1,1,NULL),(14093,35,12,2,NULL),(14094,35,10,3,NULL),(14095,35,9,4,NULL),(14096,35,4,5,NULL),(14097,36,6,1,NULL),(14098,36,8,2,NULL),(14099,36,9,3,NULL),(14100,36,11,4,NULL),(14101,36,4,5,NULL),(14102,37,9,1,NULL),(14103,37,6,2,NULL),(14104,37,7,3,NULL),(14105,37,8,4,NULL),(14106,37,4,5,NULL),(14107,38,12,1,NULL),(14108,38,2,2,NULL),(14109,38,6,3,NULL),(14110,38,9,4,NULL),(14111,38,4,5,NULL),(14112,39,2,1,NULL),(14113,39,9,2,NULL),(14114,39,7,3,NULL),(14115,39,10,4,NULL),(14116,39,4,5,NULL),(14117,40,2,1,NULL),(14118,40,8,2,NULL),(14119,40,10,3,NULL),(14120,40,12,4,NULL),(14121,40,4,5,NULL),(14122,41,8,1,NULL),(14123,41,6,2,NULL),(14124,41,9,3,NULL),(14125,41,11,4,NULL),(14126,41,4,5,NULL),(14127,42,1,1,NULL),(14128,42,7,2,NULL),(14129,42,11,3,NULL),(14130,42,8,4,NULL),(14131,42,4,5,NULL),(14132,43,1,1,NULL),(14133,43,6,2,NULL),(14134,43,12,3,NULL),(14135,43,2,4,NULL),(14136,43,4,5,NULL),(14137,44,10,1,NULL),(14138,44,11,2,NULL),(14139,44,8,3,NULL),(14140,44,9,4,NULL),(14141,44,4,5,NULL),(14142,45,7,1,NULL),(14143,45,11,2,NULL),(14144,45,2,3,NULL),(14145,45,1,4,NULL),(14146,45,4,5,NULL),(14147,46,1,1,NULL),(14148,46,8,2,NULL),(14149,46,11,3,NULL),(14150,46,10,4,NULL),(14151,46,4,5,NULL),(14152,47,9,1,NULL),(14153,47,11,2,NULL),(14154,47,10,3,NULL),(14155,47,6,4,NULL),(14156,47,4,5,NULL),(14157,48,10,1,NULL),(14158,48,11,2,NULL),(14159,48,8,3,NULL),(14160,48,7,4,NULL),(14161,48,4,5,NULL),(14162,50,7,1,NULL),(14163,50,12,2,NULL),(14164,50,8,3,NULL),(14165,50,11,4,NULL),(14166,50,4,5,NULL),(14167,51,1,1,NULL),(14168,51,6,2,NULL),(14169,51,12,3,NULL),(14170,51,2,4,NULL),(14171,51,4,5,NULL),(14172,52,6,1,NULL),(14173,52,12,2,NULL),(14174,52,10,3,NULL),(14175,52,11,4,NULL),(14176,52,4,5,NULL),(14177,53,9,1,NULL),(14178,53,7,2,NULL),(14179,53,2,3,NULL),(14180,53,8,4,NULL),(14181,53,4,5,NULL),(14182,54,9,1,NULL),(14183,54,8,2,NULL),(14184,54,12,3,NULL),(14185,54,1,4,NULL),(14186,54,4,5,NULL),(14187,55,7,1,NULL),(14188,55,2,2,NULL),(14189,55,11,3,NULL),(14190,55,1,4,NULL),(14191,55,4,5,NULL),(14192,56,8,1,NULL),(14193,56,2,2,NULL),(14194,56,1,3,NULL),(14195,56,11,4,NULL),(14196,56,4,5,NULL),(14197,57,8,1,NULL),(14198,57,11,2,NULL),(14199,57,12,3,NULL),(14200,57,1,4,NULL),(14201,57,4,5,NULL),(14202,58,10,1,NULL),(14203,58,12,2,NULL),(14204,58,11,3,NULL),(14205,58,7,4,NULL),(14206,58,4,5,NULL),(14207,59,12,1,NULL),(14208,59,9,2,NULL),(14209,59,1,3,NULL),(14210,59,6,4,NULL),(14211,59,4,5,NULL),(14212,60,7,1,NULL),(14213,60,10,2,NULL),(14214,60,1,3,NULL),(14215,60,9,4,NULL),(14216,60,4,5,NULL),(14217,61,1,1,NULL),(14218,61,8,2,NULL),(14219,61,10,3,NULL),(14220,61,2,4,NULL),(14221,61,4,5,NULL),(14222,62,12,1,NULL),(14223,62,1,2,NULL),(14224,62,10,3,NULL),(14225,62,7,4,NULL),(14226,62,4,5,NULL),(14227,63,2,1,NULL),(14228,63,6,2,NULL),(14229,63,8,3,NULL),(14230,63,12,4,NULL),(14231,63,4,5,NULL),(14232,64,1,1,NULL),(14233,64,11,2,NULL),(14234,64,6,3,NULL),(14235,64,12,4,NULL),(14236,64,4,5,NULL);
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

-- Dump completed on 2025-10-25 21:31:17
