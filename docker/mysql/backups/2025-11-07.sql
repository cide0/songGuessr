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
INSERT INTO `game_status` VALUES (1,34,'2025-11-07 11:47:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picker`
--

LOCK TABLES `picker` WRITE;
/*!40000 ALTER TABLE `picker` DISABLE KEYS */;
INSERT INTO `picker` VALUES (1,'Elias','Böhm'),(6,'Martina','Böhm'),(7,'Ruth','Hörlin'),(8,'Doris','Hörlin'),(9,'Gerhard','Hörlin'),(10,'Katja','Mark'),(11,'Holger','Mark'),(12,'Tanja','Götz'),(13,'Rolf','Schwoche'),(14,'Leonhard','Böhm'),(15,'Marie','Hörlin'),(16,'Natia','Weinmann'),(17,'Ines','Hörlin'),(18,'Anna-Lena','xyz'),(19,'Simon','Hörlin'),(20,'Anne','Böhm');
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Beat it','Michael Jackson',0,NULL,'beat_it.mp3','beat_it.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(2,'Pink + White','Frank Ocean',0,1,'pink_white.mp3','pink_white.mp4','Blonde','blonde.jpg',2016,'r&b','frank-ocean.webp'),(9,'Thriller','Michael Jackson',0,NULL,'thriller.mp3','thriller.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(10,'Hymn for the Weekend','Coldplay',0,6,'hymn_for_the_weekend.mp3','hymn_for_the_weekend.mp4','A Head Full of Dreams','a_head_full_of_dreams.jpg',2015,'alternative','coldplay.jpeg'),(11,'Mockingbird','Eminem',0,NULL,'mockingbird.mp3','mockingbird.mp4','Encore','encore.jpg',2004,'rap','eminem.jpg'),(12,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA',0,NULL,'gimme_gimme_gimme.mp3','gimme_gimme_gimme.mp4','Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(13,'Sweet Caroline','Neil Diamond',0,7,'sweet_caroline.mp3',NULL,'Sweet Caroline','sweet_caroline.jpg',1969,'soft rock','neil_diamond.webp'),(14,'99 Luftballons','Nena',0,7,'99_luftballons.mp3','99_luftballons.mp4','Nena','nena.jpg',1983,'german pop','nena.jpg'),(16,'Ich war noch niemals in New York','Udo Jürgens',0,7,'ich_war_noch_niemals_in_new_york.mp3',NULL,'Silberstreifen','silberstreifen.jpg',1982,'german pop','udo_jürgens.jpeg'),(17,'I Will Always Love You','Whitney Houston',1,NULL,'i_will_always_love_you.mp3','i_will_always_love_you.mp4','The Bodyguard - Original Soundtrack Album','the_bodyguard.jpg',1992,'ballade','whitney_houston.jpg'),(18,'Ein Stern (der deinen Namen trägt)','DJ Ötzi',0,NULL,'ein_stern_der_deinen_namen_trägt.mp3','ein_stern_der_deinen_namen_trägt.mp4','Sternstunden','sternstunden.jpg',2007,'german pop','dj_ötzi.jpg'),(19,'Hab\' mich wieder mal an dir betrunken','Pur',0,NULL,'hab_mich_wieder_mal_an_dir_betrunken.mp3',NULL,'Pur','pur.jpg',1987,'schlager','pur.jpg'),(20,'Waterloo','ABBA',0,NULL,'waterloo.mp3','waterloo.mp4','Waterloo','waterloo.jpg',1974,'pop','abba.jpg'),(21,'I Have A Dream','ABBA',0,NULL,'i_have_a_dream.mp3',NULL,'Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(22,'Mamma Mia','ABBA',0,NULL,'mamma_mia.mp3','mamma_mia.mp4','Abba','abba.jpg',1975,'pop','abba.jpg'),(23,'Super Trouper','ABBA',0,NULL,'super_trouper.mp3','super_trouper.mp4','Super Trouper','super_trouper.jpg',1980,'pop','abba.jpg'),(24,'Lost on You','LP',0,NULL,'lost_on_you.mp3','lost_on_you.mp4','Lost On You','lost_on_you.jpg',2016,'alternative','lp.webp'),(25,'Stern des Südens','Bayern-Fans United',0,NULL,'stern_des_südens.mp3','stern_des_südens.mp4','Heimspiel','heimspiel.jpg',1999,'anthem',NULL),(26,'It\'s My Life','Bon Jovi',0,NULL,'its_my_life.mp3','its_my_life.mp4','Crush','crush.jpg',2000,'pop rock','bon_jovi.webp'),(27,'Westerland','Die Ärzte',0,8,'westerland.mp3',NULL,'Das Ist Nicht Die Ganze Wahrheit...','das_ist_nicht_die_ganze_wahrheit.jpg',1988,'punk','die_ärzte.jpg'),(28,'Hymn','Barclay James Harvest',0,8,'hymn.mp3',NULL,'Gone To Earth','gone_to_earth.jpg',1977,'alternative','barclay_james_harvest.jpeg'),(29,'If You Don\'t Know Me by Now','Simply Red',0,8,'if_you_dont_know_me_by_now.mp3','if_you_dont_know_me_by_now.mp4','A New Flame','a_new_flame.jpg',1989,'r&b','simply_red.png'),(30,'It\'s Raining Men','The Weather Girls',0,9,'its_raining_men.mp3','its_raining_men.mp4','Success','success.jpg',1982,'disco','weather_girls.jpg'),(31,'Skandal im Sperrbezirk','Spider Murphy Gang',1,9,'skandal_im_sperrbezirk.mp3',NULL,'Dolce Vita','dolce_vita.jpg',1981,'german rock','spider_murphy_gang.jpg'),(32,'Über sieben Brücken musst du gehn','Karat',0,9,'über_sieben_brücken_musst_du_gehn.mp3','über_sieben_brücken_musst_du_gehn.mp4',NULL,NULL,1979,'german rock','karat.jpg'),(33,'BIRDS OF A FEATHER','Billie Eilish',0,19,'birds_of_a_feather.mp3','birds_of_a_feather.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'bedroom pop','billie_eilish.jpeg'),(34,'Yeah!','USHER',0,6,'yeah.mp3','yeah.mp4','Confessions','confessions.png',2004,'r&b','usher.jpg'),(35,'Blinding Lights','The Weeknd',0,1,'blinding_lights.mp3','blinding_lights.mp4','After Hours','after_hours.png',2019,'synth-pop','the_weeknd.jpg'),(36,'Espresso','Sabrina Carpenter',0,NULL,'espresso.mp3','espresso.mp4','Short n\' Sweet','short_n_sweet.jpg',2024,'pop','sabrina_carpenter.webp'),(37,'Can\'t Catch Me Now','Olivia Rodrigo',0,1,'cant_catch_me_now.mp3','cant_catch_me_now.mp4','The Hunger Games: The Ballad of Songbirds & Snakes','the_hunger_games_ballad.jpeg',2023,'folk rock','olivia_rodrigo.jpg'),(38,'We Are The World','U.S.A. For Africa',1,10,'we_are_the_world.mp3','we_are_the_world.mp4',NULL,NULL,1985,'pop',NULL),(39,'Do They Know It\'s Christmas?','Band Aid',0,10,'do_they_know_its_christmas.mp3',NULL,NULL,NULL,1984,'seasonal',NULL),(40,'Buenos Dias Argentina','Udo Jürgens',0,10,'buenos_dias_argentina.mp3','buenos_dias_argentina.mp4','Buenos Dias Argentina','buenos_dias_argentina.jpg',1978,'schlager','udo_jürgens.jpeg'),(41,'Heal the World','Michael Jackson',0,NULL,'heal_the_world.mp3','heal_the_world.mp4','Dangerous','dangerous.jpg',1991,'pop','michael-jackson.jpeg'),(42,'Slipping Through My Fingers','ABBA',0,NULL,'slipping_through_my_fingers.mp3',NULL,'The Visitors','the_visitors.jpg',1981,'pop','abba.jpg'),(43,'Nothing Else Matters','Metallica',0,11,'nothing_else_matters.mp3','nothing_else_matters.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg'),(44,'Knockin\' On Heaven\'s Door','Guns N\' Roses',0,11,'knockin_on_heavens_door.mp3',NULL,'Use Your Illusion II','use_your_illusion_ll.jpg',1991,'hard rock','guns_n_roses.jpg'),(45,'Highway to Hell','AC/DC',0,11,'highway_to_hell.mp3','highway_to_hell.mp4','Highway to Hell','highway_to_hell.jpg',1979,'hard rock','acdc.jpg'),(46,'Das Model','Kraftwerk',0,NULL,'das_model.mp3',NULL,'Die Mensch-Maschine','die_mensch_maschine.jpg',1978,'german pop','kraftwerk.jpg'),(47,'Into the Groove','Madonna',0,NULL,'into_the_groove.mp3','into_the_groove.mp4','Like a Virgin','like_a_virgin.jpg',1984,'r&b','madonna.jpg'),(48,'Fast Car','Tracy Chapman',0,NULL,'fast_car.mp3','fast_car.mp4','Tracy Chapman','tracy_chapman.jpg',1988,'folk','tracy_chapman.webp'),(50,'Holiday','Madonna',0,12,'holiday.mp3',NULL,'Madonna','madonna.jpg',1983,'pop','madonna.jpg'),(51,'Glory Days','Bruce Springsteen',0,12,'glory_days.mp3','glory_days.mp4','Born In The U.S.A.','born_in_the_usa.jpg',1984,'rock','bruce_springsteen.webp'),(52,'True Colors','Cyndi Lauper',0,12,'true_colors.mp3','true_colors.mp4','True Colors','true_colors.jpg',1986,'electropop','cyndi_lauper.webp'),(53,'Last Train to London','Electric Light Orchestra',0,13,'last_train_to_london.mp3','last_train_to_london.mp4','Discovery','discovery.jpg',1979,'disco','elo.jpg'),(54,'Ich bin Klempner von Beruf','Reinhard Mey',0,13,'ich_bin_klempner_von_beruf.mp3',NULL,'Wie vor Jahr und Tag','wie_vor_jahr_und_tag.jpg',1974,'schlager','reinhard_mey.jpg'),(55,'Griechischer Wein','Udo Jürgens',0,13,'griechischer_wein.mp3',NULL,'Meine Lieder','meine_lieder.jpg',1974,'german pop','udo_jürgens.jpeg'),(56,'Here Comes The Sun','The Beatles',0,NULL,'here_comes_the_sun.mp3',NULL,'Abbey Road','abbey_road.jpg',1969,'folk','beatles.jpg'),(57,'Hall of Fame','The Script',1,14,'hall_of_fame.mp3','hall_of_fame.mp4','#3','hashtag3.jpg',2012,'pop rock','the_script.jpg'),(58,'rockstar','Post Malone',0,14,'rockstar.mp3',NULL,'beerbongs & bentleys','beerbongs_and_bentleys.jpg',2018,'trap','post_malone.jpg'),(59,'Papercut','Linkin Park',0,14,'papercut.mp3','papercut.mp4','Hybrid Theory','hybrid_theory.jpg',2000,'nu metal','linkin_park.jpg'),(60,'Dancing in the Moonlight','Toploader',0,NULL,'dancing_in_the_moonlight.mp3',NULL,'Onka\'s Big Moka','onkas_big_moka.jpg',2000,'pop','toploader.jpg'),(61,'Wouldn\'t It Be Nice','The Beach Boys',0,NULL,'wouldnt_it_be_nice.mp3','wouldnt_it_be_nice.mp4','Pet Sounds','pet_sounds.jpg',1966,'alternative','beach_boys.webp'),(62,'Rock Me Amadeus','Falco',0,NULL,'rock_me_amadeus.mp3','rock_me_amadeus.mp4','Falco 3','falco3.jpg',1985,'german pop','falco.jpg'),(63,'Major Tom (...völlig losgelöst)','Peter Schilling',0,NULL,'major_tom.mp3','major_tom.mp4','Fehler Im System','fehler_im_system.jpg',1982,'schlager','peter_schilling.jpg'),(64,'Moskau','Dschinghis Khan',0,NULL,'moskau.mp3','moskau.mp4','Dschinghis Khan','dschinghis_khan.jpg',1979,'schlager','dschinghis_khan.webp'),(65,'Auf uns','Andreas Bourani',0,15,'auf_uns.mp3','auf_uns.mp4','Hey','hey.jpg',2014,'german pop','andreas_bourani.jpeg'),(66,'Dark Horse','Katy Perry',0,15,'dark_horse.mp3','dark_horse.mp4','PRISM','prism.jpeg',2013,'pop','katy_perry.webp'),(68,'Wish I Could Fly','Roxette',0,16,'wish_i_could_fly.mp3','wish_i_could_fly.mp4','Have A Nice day','have_a_nice_day.jpg',1999,'alternative','roxette.jpg'),(69,'These Days','Rudimental',0,17,'these_days.mp3','these_days.mp4','Toast to Our Differences','toast_to_our_differences.jpg',2018,'electronic','rudimental.webp'),(70,'Forget Tomorrow','Mighty Oaks',0,17,'forget_tomorrow.mp3',NULL,'All Things Go','all_things_go.jpg',2020,'alternative','mighty_oaks.jpg'),(71,'wunderschön','Zartmann',0,18,'wunderschön.mp3','wunderschön.mp4','schönhauser EP','schönhauser_ep.jpeg',2025,'german pop','zartmann.jpg'),(72,'Home','Dotan',0,18,'home.mp3','home.mp4','7 Layers','7_layers.jpeg',2014,'alternative','dotan.jpg'),(73,'Mercy','Shawn Mendes',0,18,'mercy.mp3','mercy.mp4','Illuminate','illuminate.jpg',2016,'r&b','shawn_mendes.webp'),(74,'Circles','Post Malone',0,19,'circles.mp3','circles.mp4','Hollywood\'s Bleeding','hollywoods_bleeding.jpg',2019,'soft rock','post_malone.jpg'),(75,'LUNCH','Billie Eilish',0,6,'lunch.mp3','lunch.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'synth-pop','billie_eilish.jpeg'),(76,'Enter Sandman','Metallica',0,19,'enter_sandman.mp3','enter_sandman.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg'),(77,'Viva La Vida','Coldplay',0,20,'viva_la_vida.mp3','viva_la_vida.mp4','Viva La Vida or Death and All His Friends','viva_la_vida.jpg',2008,'alternative','coldplay.jpeg'),(78,'A Sky Full of Stars','Coldplay',0,20,'a_sky_full_of_stars.mp3','a_sky_full_of_stars.mp4','Ghost Stories','ghost_stories.jpg',2014,'alternative','coldplay.jpeg'),(79,'Paradise','Coldplay',1,20,'paradise.mp3','paradise.mp4','Mylo Xyloto','mylo_xyloto.jpg',2011,'r&b','coldplay.jpeg');
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
) ENGINE=InnoDB AUTO_INCREMENT=26082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_hint`
--

LOCK TABLES `song_hint` WRITE;
/*!40000 ALTER TABLE `song_hint` DISABLE KEYS */;
INSERT INTO `song_hint` VALUES (25732,1,9,1,NULL),(25733,1,2,2,NULL),(25734,1,7,3,NULL),(25735,1,12,4,NULL),(25736,1,4,5,NULL),(25737,2,11,1,NULL),(25738,2,1,2,NULL),(25739,2,12,3,NULL),(25740,2,10,4,NULL),(25741,2,4,5,NULL),(25742,9,8,1,NULL),(25743,9,6,2,NULL),(25744,9,2,3,NULL),(25745,9,12,4,NULL),(25746,9,4,5,NULL),(25747,10,6,1,NULL),(25748,10,11,2,NULL),(25749,10,12,3,NULL),(25750,10,8,4,NULL),(25751,10,4,5,NULL),(25752,11,11,1,NULL),(25753,11,8,2,NULL),(25754,11,7,3,NULL),(25755,11,6,4,NULL),(25756,11,4,5,NULL),(25757,12,11,1,NULL),(25758,12,2,2,NULL),(25759,12,6,3,NULL),(25760,12,1,4,NULL),(25761,12,4,5,NULL),(25762,13,12,1,NULL),(25763,13,2,2,NULL),(25764,13,9,3,NULL),(25765,13,10,4,NULL),(25766,13,4,5,NULL),(25767,14,12,1,NULL),(25768,14,2,2,NULL),(25769,14,1,3,NULL),(25770,14,6,4,NULL),(25771,14,4,5,NULL),(25772,16,8,1,NULL),(25773,16,12,2,NULL),(25774,16,1,3,NULL),(25775,16,2,4,NULL),(25776,16,4,5,NULL),(25777,17,12,1,NULL),(25778,17,11,2,NULL),(25779,17,8,3,NULL),(25780,17,6,4,NULL),(25781,17,4,5,NULL),(25782,18,2,1,NULL),(25783,18,1,2,NULL),(25784,18,9,3,NULL),(25785,18,7,4,NULL),(25786,18,4,5,NULL),(25787,19,1,1,NULL),(25788,19,8,2,NULL),(25789,19,12,3,NULL),(25790,19,11,4,NULL),(25791,19,4,5,NULL),(25792,20,1,1,NULL),(25793,20,9,2,NULL),(25794,20,7,3,NULL),(25795,20,11,4,NULL),(25796,20,4,5,NULL),(25797,21,1,1,NULL),(25798,21,9,2,NULL),(25799,21,2,3,NULL),(25800,21,12,4,NULL),(25801,21,4,5,NULL),(25802,22,9,1,NULL),(25803,22,2,2,NULL),(25804,22,7,3,NULL),(25805,22,12,4,NULL),(25806,22,4,5,NULL),(25807,23,1,1,NULL),(25808,23,2,2,NULL),(25809,23,12,3,NULL),(25810,23,9,4,NULL),(25811,23,4,5,NULL),(25812,24,12,1,NULL),(25813,24,1,2,NULL),(25814,24,2,3,NULL),(25815,24,6,4,NULL),(25816,24,4,5,NULL),(25817,25,8,1,NULL),(25818,25,7,2,NULL),(25819,25,6,3,NULL),(25820,25,2,4,NULL),(25821,25,4,5,NULL),(25822,26,10,1,NULL),(25823,26,11,2,NULL),(25824,26,2,3,NULL),(25825,26,9,4,NULL),(25826,26,4,5,NULL),(25827,27,8,1,NULL),(25828,27,9,2,NULL),(25829,27,7,3,NULL),(25830,27,11,4,NULL),(25831,27,4,5,NULL),(25832,28,1,1,NULL),(25833,28,10,2,NULL),(25834,28,8,3,NULL),(25835,28,11,4,NULL),(25836,28,4,5,NULL),(25837,29,6,1,NULL),(25838,29,10,2,NULL),(25839,29,9,3,NULL),(25840,29,11,4,NULL),(25841,29,4,5,NULL),(25842,30,9,1,NULL),(25843,30,2,2,NULL),(25844,30,1,3,NULL),(25845,30,12,4,NULL),(25846,30,4,5,NULL),(25847,31,8,1,NULL),(25848,31,9,2,NULL),(25849,31,12,3,NULL),(25850,31,2,4,NULL),(25851,31,4,5,NULL),(25852,32,10,1,NULL),(25853,32,6,2,NULL),(25854,32,12,3,NULL),(25855,32,2,4,NULL),(25856,32,4,5,NULL),(25857,33,8,1,NULL),(25858,33,6,2,NULL),(25859,33,12,3,NULL),(25860,33,2,4,NULL),(25861,33,4,5,NULL),(25862,34,10,1,NULL),(25863,34,8,2,NULL),(25864,34,12,3,NULL),(25865,34,1,4,NULL),(25866,34,4,5,NULL),(25867,35,9,1,NULL),(25868,35,11,2,NULL),(25869,35,12,3,NULL),(25870,35,6,4,NULL),(25871,35,4,5,NULL),(25872,36,6,1,NULL),(25873,36,10,2,NULL),(25874,36,1,3,NULL),(25875,36,12,4,NULL),(25876,36,4,5,NULL),(25877,37,1,1,NULL),(25878,37,9,2,NULL),(25879,37,10,3,NULL),(25880,37,11,4,NULL),(25881,37,4,5,NULL),(25882,38,12,1,NULL),(25883,38,6,2,NULL),(25884,38,2,3,NULL),(25885,38,9,4,NULL),(25886,38,4,5,NULL),(25887,39,10,1,NULL),(25888,39,9,2,NULL),(25889,39,12,3,NULL),(25890,39,2,4,NULL),(25891,39,4,5,NULL),(25892,40,11,1,NULL),(25893,40,8,2,NULL),(25894,40,7,3,NULL),(25895,40,2,4,NULL),(25896,40,4,5,NULL),(25897,41,12,1,NULL),(25898,41,10,2,NULL),(25899,41,9,3,NULL),(25900,41,8,4,NULL),(25901,41,4,5,NULL),(25902,42,1,1,NULL),(25903,42,7,2,NULL),(25904,42,11,3,NULL),(25905,42,12,4,NULL),(25906,42,4,5,NULL),(25907,43,6,1,NULL),(25908,43,1,2,NULL),(25909,43,8,3,NULL),(25910,43,2,4,NULL),(25911,43,4,5,NULL),(25912,44,9,1,NULL),(25913,44,8,2,NULL),(25914,44,1,3,NULL),(25915,44,10,4,NULL),(25916,44,4,5,NULL),(25917,45,9,1,NULL),(25918,45,8,2,NULL),(25919,45,1,3,NULL),(25920,45,6,4,NULL),(25921,45,4,5,NULL),(25922,46,2,1,NULL),(25923,46,1,2,NULL),(25924,46,8,3,NULL),(25925,46,7,4,NULL),(25926,46,4,5,NULL),(25927,47,7,1,NULL),(25928,47,11,2,NULL),(25929,47,8,3,NULL),(25930,47,12,4,NULL),(25931,47,4,5,NULL),(25932,48,1,1,NULL),(25933,48,9,2,NULL),(25934,48,11,3,NULL),(25935,48,12,4,NULL),(25936,48,4,5,NULL),(25937,50,11,1,NULL),(25938,50,8,2,NULL),(25939,50,1,3,NULL),(25940,50,9,4,NULL),(25941,50,4,5,NULL),(25942,51,8,1,NULL),(25943,51,6,2,NULL),(25944,51,1,3,NULL),(25945,51,12,4,NULL),(25946,51,4,5,NULL),(25947,52,11,1,NULL),(25948,52,9,2,NULL),(25949,52,7,3,NULL),(25950,52,2,4,NULL),(25951,52,4,5,NULL),(25952,53,10,1,NULL),(25953,53,11,2,NULL),(25954,53,9,3,NULL),(25955,53,6,4,NULL),(25956,53,4,5,NULL),(25957,54,9,1,NULL),(25958,54,12,2,NULL),(25959,54,8,3,NULL),(25960,54,11,4,NULL),(25961,54,4,5,NULL),(25962,55,1,1,NULL),(25963,55,8,2,NULL),(25964,55,7,3,NULL),(25965,55,2,4,NULL),(25966,55,4,5,NULL),(25967,56,11,1,NULL),(25968,56,8,2,NULL),(25969,56,12,3,NULL),(25970,56,9,4,NULL),(25971,56,4,5,NULL),(25972,57,2,1,NULL),(25973,57,10,2,NULL),(25974,57,11,3,NULL),(25975,57,6,4,NULL),(25976,57,4,5,NULL),(25977,58,12,1,NULL),(25978,58,1,2,NULL),(25979,58,11,3,NULL),(25980,58,10,4,NULL),(25981,58,4,5,NULL),(25982,59,6,1,NULL),(25983,59,1,2,NULL),(25984,59,9,3,NULL),(25985,59,12,4,NULL),(25986,59,4,5,NULL),(25987,60,8,1,NULL),(25988,60,10,2,NULL),(25989,60,1,3,NULL),(25990,60,9,4,NULL),(25991,60,4,5,NULL),(25992,61,1,1,NULL),(25993,61,6,2,NULL),(25994,61,7,3,NULL),(25995,61,2,4,NULL),(25996,61,4,5,NULL),(25997,62,9,1,NULL),(25998,62,6,2,NULL),(25999,62,12,3,NULL),(26000,62,11,4,NULL),(26001,62,4,5,NULL),(26002,63,8,1,NULL),(26003,63,11,2,NULL),(26004,63,2,3,NULL),(26005,63,7,4,NULL),(26006,63,4,5,NULL),(26007,64,12,1,NULL),(26008,64,9,2,NULL),(26009,64,1,3,NULL),(26010,64,10,4,NULL),(26011,64,4,5,NULL),(26012,65,9,1,NULL),(26013,65,8,2,NULL),(26014,65,11,3,NULL),(26015,65,1,4,NULL),(26016,65,4,5,NULL),(26017,66,12,1,NULL),(26018,66,2,2,NULL),(26019,66,10,3,NULL),(26020,66,8,4,NULL),(26021,66,4,5,NULL),(26022,68,10,1,NULL),(26023,68,8,2,NULL),(26024,68,1,3,NULL),(26025,68,11,4,NULL),(26026,68,4,5,NULL),(26027,69,9,1,NULL),(26028,69,12,2,NULL),(26029,69,10,3,NULL),(26030,69,8,4,NULL),(26031,69,4,5,NULL),(26032,70,1,1,NULL),(26033,70,11,2,NULL),(26034,70,12,3,NULL),(26035,70,8,4,NULL),(26036,70,4,5,NULL),(26037,71,7,1,NULL),(26038,71,8,2,NULL),(26039,71,11,3,NULL),(26040,71,9,4,NULL),(26041,71,4,5,NULL),(26042,72,2,1,NULL),(26043,72,10,2,NULL),(26044,72,1,3,NULL),(26045,72,11,4,NULL),(26046,72,4,5,NULL),(26047,73,2,1,NULL),(26048,73,8,2,NULL),(26049,73,7,3,NULL),(26050,73,12,4,NULL),(26051,73,4,5,NULL),(26052,74,9,1,NULL),(26053,74,1,2,NULL),(26054,74,8,3,NULL),(26055,74,6,4,NULL),(26056,74,4,5,NULL),(26057,75,11,1,NULL),(26058,75,12,2,NULL),(26059,75,1,3,NULL),(26060,75,8,4,NULL),(26061,75,4,5,NULL),(26062,76,8,1,NULL),(26063,76,1,2,NULL),(26064,76,7,3,NULL),(26065,76,9,4,NULL),(26066,76,4,5,NULL),(26067,77,9,1,NULL),(26068,77,8,2,NULL),(26069,77,7,3,NULL),(26070,77,2,4,NULL),(26071,77,4,5,NULL),(26072,78,2,1,NULL),(26073,78,12,2,NULL),(26074,78,1,3,NULL),(26075,78,9,4,NULL),(26076,78,4,5,NULL),(26077,79,6,1,NULL),(26078,79,1,2,NULL),(26079,79,11,3,NULL),(26080,79,9,4,NULL),(26081,79,4,5,NULL);
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

-- Dump completed on 2025-11-07 11:53:06
