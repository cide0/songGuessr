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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picker`
--

LOCK TABLES `picker` WRITE;
/*!40000 ALTER TABLE `picker` DISABLE KEYS */;
INSERT INTO `picker` VALUES (1,'Elias','Böhm'),(6,'Martina','Böhm'),(7,'Ruth','Hörlin'),(8,'Doris','Hörlin'),(9,'Gerhard','Hörlin'),(10,'Katja','Mark'),(11,'Holger','Mark'),(12,'Tanja','Götz'),(13,'Rolf','Schwoche'),(14,'Leonhard','Böhm'),(15,'Marie','Hörlin'),(16,'Natia','Weinmann'),(17,'Ines','Hörlin'),(18,'Anna-Lena','xyz'),(19,'Simon','Hörlin');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Beat it','Michael Jackson',0,NULL,'beat_it.mp3','beat_it.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(2,'Pink + White','Frank Ocean',0,1,'pink_white.mp3','pink_white.mp4','Blonde','blonde.jpg',2016,'r&b','frank-ocean.webp'),(9,'Thriller','Michael Jackson',0,NULL,'thriller.mp3','thriller.mp4','Thriller','thriller.png',1982,'pop','michael-jackson.jpeg'),(10,'Hymn for the Weekend','Coldplay',0,6,'hymn_for_the_weekend.mp3','hymn_for_the_weekend.mp4','A Head Full of Dreams','a_head_full_of_dreams.jpg',2015,'alternative','coldplay.jpeg'),(11,'Mockingbird','Eminem',0,NULL,'mockingbird.mp3','mockingbird.mp4','Encore','encore.jpg',2004,'rap','eminem.jpg'),(12,'Gimme! Gimme! Gimme! (A Man After Midnight)','ABBA',0,NULL,'gimme_gimme_gimme.mp3','gimme_gimme_gimme.mp4','Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(13,'Sweet Caroline','Neil Diamond',0,7,'sweet_caroline.mp3',NULL,'Sweet Caroline','sweet_caroline.jpg',1969,'soft rock','neil_diamond.webp'),(14,'99 Luftballons','Nena',0,7,'99_luftballons.mp3','99_luftballons.mp4','Nena','nena.jpg',1983,'german pop','nena.jpg'),(16,'Ich war noch niemals in New York','Udo Jürgens',0,7,'ich_war_noch_niemals_in_new_york.mp3',NULL,'Silberstreifen','silberstreifen.jpg',1982,'german pop','udo_jürgens.jpeg'),(17,'I Will Always Love You','Whitney Houston',0,NULL,'i_will_always_love_you.mp3','i_will_always_love_you.mp4','The Bodyguard - Original Soundtrack Album','the_bodyguard.jpg',1992,'ballade','whitney_houston.jpg'),(18,'Ein Stern (der deinen Namen trägt)','DJ Ötzi',0,NULL,'ein_stern_der_deinen_namen_trägt.mp3','ein_stern_der_deinen_namen_trägt.mp4','Sternstunden','sternstunden.jpg',2007,'german pop','dj_ötzi.jpg'),(19,'Hab\' mich wieder mal an dir betrunken','Pur',0,NULL,'hab_mich_wieder_mal_an_dir_betrunken.mp3',NULL,'Pur','pur.jpg',1987,'schlager','pur.jpg'),(20,'Waterloo','ABBA',0,NULL,'waterloo.mp3','waterloo.mp4','Waterloo','waterloo.jpg',1974,'pop','abba.jpg'),(21,'I Have A Dream','ABBA',0,NULL,'i_have_a_dream.mp3',NULL,'Voulez-Vous','voulez-vous.jpg',1979,'pop','abba.jpg'),(22,'Mamma Mia','ABBA',0,NULL,'mamma_mia.mp3','mamma_mia.mp4','Abba','abba.jpg',1975,'pop','abba.jpg'),(23,'Super Trouper','ABBA',0,NULL,'super_trouper.mp3','super_trouper.mp4','Super Trouper','super_trouper.jpg',1980,'pop','abba.jpg'),(24,'Lost on You','LP',0,NULL,'lost_on_you.mp3','lost_on_you.mp4','Lost On You','lost_on_you.jpg',2016,'alternative','lp.webp'),(25,'Stern des Südens','Bayern-Fans United',0,NULL,'stern_des_südens.mp3','stern_des_südens.mp4','Heimspiel','heimspiel.jpg',1999,'anthem',NULL),(26,'It\'s My Life','Bon Jovi',0,NULL,'its_my_life.mp3','its_my_life.mp4','Crush','crush.jpg',2000,'pop rock','bon_jovi.webp'),(27,'Westerland','Die Ärzte',0,8,'westerland.mp3',NULL,'Das Ist Nicht Die Ganze Wahrheit...','das_ist_nicht_die_ganze_wahrheit.jpg',1988,'punk','die_ärzte.jpg'),(28,'Hymn','Barclay James Harvest',0,8,'hymn.mp3',NULL,'Gone To Earth','gone_to_earth.jpg',1977,'alternative','barclay_james_harvest.jpeg'),(29,'If You Don\'t Know Me by Now','Simply Red',0,8,'if_you_dont_know_me_by_now.mp3','if_you_dont_know_me_by_now.mp4','A New Flame','a_new_flame.jpg',1989,'r&b','simply_red.png'),(30,'It\'s Raining Men','The Weather Girls',0,9,'its_raining_men.mp3','its_raining_men.mp4','Success','success.jpg',1982,'disco','weather_girls.jpg'),(31,'Skandal im Sperrbezirk','Spider Murphy Gang',0,9,'skandal_im_sperrbezirk.mp3',NULL,'Dolce Vita','dolce_vita.jpg',1981,'german rock','spider_murphy_gang.jpg'),(32,'Über sieben Brücken musst du gehn','Karat',0,9,'über_sieben_brücken_musst_du_gehn.mp3','über_sieben_brücken_musst_du_gehn.mp4',NULL,NULL,1979,'german rock','karat.jpg'),(33,'BIRDS OF A FEATHER','Billie Eilish',0,19,'birds_of_a_feather.mp3','birds_of_a_feather.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'bedroom pop','billie_eilish.jpeg'),(34,'Yeah!','USHER',0,6,'yeah.mp3','yeah.mp4','Confessions','confessions.png',2004,'r&b','usher.jpg'),(35,'Blinding Lights','The Weeknd',0,1,'blinding_lights.mp3','blinding_lights.mp4','After Hours','after_hours.png',2019,'synth-pop','the_weeknd.jpg'),(36,'Espresso','Sabrina Carpenter',0,NULL,'espresso.mp3','espresso.mp4','Short n\' Sweet','short_n_sweet.jpg',2024,'pop','sabrina_carpenter.webp'),(37,'Can\'t Catch Me Now','Olivia Rodrigo',0,1,'cant_catch_me_now.mp3','cant_catch_me_now.mp4','The Hunger Games: The Ballad of Songbirds & Snakes','the_hunger_games_ballad.jpeg',2023,'folk rock','olivia_rodrigo.jpg'),(38,'We Are The World','U.S.A. For Africa',0,10,'we_are_the_world.mp3','we_are_the_world.mp4',NULL,NULL,1985,'pop',NULL),(39,'Do They Know It\'s Christmas?','Band Aid',0,10,'do_they_know_its_christmas.mp3',NULL,NULL,NULL,1984,'seasonal',NULL),(40,'Buenos Dias Argentina','Udo Jürgens',0,10,'buenos_dias_argentina.mp3','buenos_dias_argentina.mp4','Buenos Dias Argentina','buenos_dias_argentina.jpg',1978,'schlager','udo_jürgens.jpeg'),(41,'Heal the World','Michael Jackson',0,NULL,'heal_the_world.mp3','heal_the_world.mp4','Dangerous','dangerous.jpg',1991,'pop','michael-jackson.jpeg'),(42,'Slipping Through My Fingers','ABBA',0,NULL,'slipping_through_my_fingers.mp3',NULL,'The Visitors','the_visitors.jpg',1981,'pop','abba.jpg'),(43,'Nothing Else Matters','Metallica',0,11,'nothing_else_matters.mp3','nothing_else_matters.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg'),(44,'Knockin\' On Heaven\'s Door','Guns N\' Roses',0,11,'knockin_on_heavens_door.mp3',NULL,'Use Your Illusion II','use_your_illusion_ll.jpg',1991,'hard rock','guns_n_roses.jpg'),(45,'Highway to Hell','AC/DC',0,11,'highway_to_hell.mp3','highway_to_hell.mp4','Highway to Hell','highway_to_hell.jpg',1979,'hard rock','acdc.jpg'),(46,'Das Model','Kraftwerk',0,NULL,'das_model.mp3',NULL,'Die Mensch-Maschine','die_mensch_maschine.jpg',1978,'german pop','kraftwerk.jpg'),(47,'Into the Groove','Madonna',0,NULL,'into_the_groove.mp3','into_the_groove.mp4','Like a Virgin','like_a_virgin.jpg',1984,'r&b','madonna.jpg'),(48,'Fast Car','Tracy Chapman',0,NULL,'fast_car.mp3','fast_car.mp4','Tracy Chapman','tracy_chapman.jpg',1988,'folk','tracy_chapman.webp'),(50,'Holiday','Madonna',0,12,'holiday.mp3',NULL,'Madonna','madonna.jpg',1983,'pop','madonna.jpg'),(51,'Glory Days','Bruce Springsteen',0,12,'glory_days.mp3','glory_days.mp4','Born In The U.S.A.','born_in_the_usa.jpg',1984,'rock','bruce_springsteen.webp'),(52,'True Colors','Cyndi Lauper',0,12,'true_colors.mp3','true_colors.mp4','True Colors','true_colors.jpg',1986,'electropop','cyndi_lauper.webp'),(53,'Last Train to London','Electric Light Orchestra',0,13,'last_train_to_london.mp3','last_train_to_london.mp4','Discovery','discovery.jpg',1979,'disco','elo.jpg'),(54,'Ich bin Klempner von Beruf','Reinhard Mey',0,13,'ich_bin_klempner_von_beruf.mp3',NULL,'Wie vor Jahr und Tag','wie_vor_jahr_und_tag.jpg',1974,'schlager','reinhard_mey.jpg'),(55,'Griechischer Wein','Udo Jürgens',0,13,'griechischer_wein.mp3',NULL,'Meine Lieder','meine_lieder.jpg',1974,'german pop','udo_jürgens.jpeg'),(56,'Here Comes The Sun','The Beatles',0,NULL,'here_comes_the_sun.mp3',NULL,'Abbey Road','abbey_road.jpg',1969,'folk','beatles.jpg'),(57,'Hall of Fame','The Script',0,14,'hall_of_fame.mp3','hall_of_fame.mp4','#3','hashtag3.jpg',2012,'pop rock','the_script.jpg'),(58,'rockstar','Post Malone',0,14,'rockstar.mp3',NULL,'beerbongs & bentleys','beerbongs_and_bentleys.jpg',2018,'trap','post_malone.jpg'),(59,'Papercut','Linkin Park',0,14,'papercut.mp3','papercut.mp4','Hybrid Theory','hybrid_theory.jpg',2000,'nu metal','linkin_park.jpg'),(60,'Dancing in the Moonlight','Toploader',0,NULL,'dancing_in_the_moonlight.mp3',NULL,'Onka\'s Big Moka','onkas_big_moka.jpg',2000,'pop','toploader.jpg'),(61,'Wouldn\'t It Be Nice','The Beach Boys',0,NULL,'wouldnt_it_be_nice.mp3','wouldnt_it_be_nice.mp4','Pet Sounds','pet_sounds.jpg',1966,'alternative','beach_boys.webp'),(62,'Rock Me Amadeus','Falco',0,NULL,'rock_me_amadeus.mp3','rock_me_amadeus.mp4','Falco 3','falco3.jpg',1985,'german pop','falco.jpg'),(63,'Major Tom (...völlig losgelöst)','Peter Schilling',0,NULL,'major_tom.mp3','major_tom.mp4','Fehler Im System','fehler_im_system.jpg',1982,'schlager','peter_schilling.jpg'),(64,'Moskau','Dschinghis Khan',0,NULL,'moskau.mp3','moskau.mp4','Dschinghis Khan','dschinghis_khan.jpg',1979,'schlager','dschinghis_khan.webp'),(65,'Auf uns','Andreas Bourani',0,15,'auf_uns.mp3','auf_uns.mp4','Hey','hey.jpg',2014,'german pop','andreas_bourani.jpeg'),(66,'Dark Horse','Katy Perry',0,15,'dark_horse.mp3','dark_horse.mp4','PRISM','prism.jpeg',2013,'pop','katy_perry.webp'),(68,'Wish I Could Fly','Roxette',0,16,'wish_i_could_fly.mp3','wish_i_could_fly.mp4','Have A Nice day','have_a_nice_day.jpg',1999,'alternative','roxette.jpg'),(69,'These Days','Rudimental',0,17,'these_days.mp3','these_days.mp4','Toast to Our Differences','toast_to_our_differences.jpg',2018,'electronic','rudimental.webp'),(70,'Forget Tomorrow','Mighty Oaks',0,17,'forget_tomorrow.mp3',NULL,'All Things Go','all_things_go.jpg',2020,'alternative','mighty_oaks.jpg'),(71,'wunderschön','Zartmann',0,18,'wunderschön.mp3','wunderschön.mp4','schönhauser EP','schönhauser_ep.jpeg',2025,'german pop','zartmann.jpg'),(72,'Home','Dotan',0,18,'home.mp3','home.mp4','7 Layers','7_layers.jpeg',2014,'alternative','dotan.jpg'),(73,'Mercy','Shawn Mendes',0,18,'mercy.mp3','mercy.mp4','Illuminate','illuminate.jpg',2016,'r&b','shawn_mendes.webp'),(74,'Circles','Post Malone',0,19,'circles.mp3','circles.mp4','Hollywood\'s Bleeding','hollywoods_bleeding.jpg',2019,'soft rock','post_malone.jpg'),(75,'LUNCH','Billie Eilish',0,6,'lunch.mp3','lunch.mp4','HIT ME HARD AND SOFT','hit_me_hard_and_soft.jpg',2024,'synth-pop','billie_eilish.jpeg'),(76,'Enter Sandman','Metallica',0,19,'enter_sandman.mp3','enter_sandman.mp4','Metallica','metallica.jpg',1991,'metal','metallica.jpeg');
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
) ENGINE=InnoDB AUTO_INCREMENT=25047 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_hint`
--

LOCK TABLES `song_hint` WRITE;
/*!40000 ALTER TABLE `song_hint` DISABLE KEYS */;
INSERT INTO `song_hint` VALUES (24712,1,12,1,NULL),(24713,1,6,2,NULL),(24714,1,2,3,NULL),(24715,1,8,4,NULL),(24716,1,4,5,NULL),(24717,2,2,1,NULL),(24718,2,1,2,NULL),(24719,2,11,3,NULL),(24720,2,12,4,NULL),(24721,2,4,5,NULL),(24722,9,2,1,NULL),(24723,9,10,2,NULL),(24724,9,6,3,NULL),(24725,9,11,4,NULL),(24726,9,4,5,NULL),(24727,10,10,1,NULL),(24728,10,9,2,NULL),(24729,10,2,3,NULL),(24730,10,12,4,NULL),(24731,10,4,5,NULL),(24732,11,8,1,NULL),(24733,11,6,2,NULL),(24734,11,12,3,NULL),(24735,11,7,4,NULL),(24736,11,4,5,NULL),(24737,12,9,1,NULL),(24738,12,6,2,NULL),(24739,12,1,3,NULL),(24740,12,10,4,NULL),(24741,12,4,5,NULL),(24742,13,8,1,NULL),(24743,13,11,2,NULL),(24744,13,2,3,NULL),(24745,13,10,4,NULL),(24746,13,4,5,NULL),(24747,14,9,1,NULL),(24748,14,8,2,NULL),(24749,14,11,3,NULL),(24750,14,2,4,NULL),(24751,14,4,5,NULL),(24752,16,7,1,NULL),(24753,16,9,2,NULL),(24754,16,11,3,NULL),(24755,16,12,4,NULL),(24756,16,4,5,NULL),(24757,17,11,1,NULL),(24758,17,10,2,NULL),(24759,17,12,3,NULL),(24760,17,8,4,NULL),(24761,17,4,5,NULL),(24762,18,8,1,NULL),(24763,18,6,2,NULL),(24764,18,1,3,NULL),(24765,18,11,4,NULL),(24766,18,4,5,NULL),(24767,19,12,1,NULL),(24768,19,2,2,NULL),(24769,19,1,3,NULL),(24770,19,9,4,NULL),(24771,19,4,5,NULL),(24772,20,12,1,NULL),(24773,20,6,2,NULL),(24774,20,2,3,NULL),(24775,20,11,4,NULL),(24776,20,4,5,NULL),(24777,21,1,1,NULL),(24778,21,9,2,NULL),(24779,21,8,3,NULL),(24780,21,12,4,NULL),(24781,21,4,5,NULL),(24782,22,10,1,NULL),(24783,22,9,2,NULL),(24784,22,6,3,NULL),(24785,22,1,4,NULL),(24786,22,4,5,NULL),(24787,23,10,1,NULL),(24788,23,2,2,NULL),(24789,23,9,3,NULL),(24790,23,12,4,NULL),(24791,23,4,5,NULL),(24792,24,7,1,NULL),(24793,24,2,2,NULL),(24794,24,6,3,NULL),(24795,24,8,4,NULL),(24796,24,4,5,NULL),(24797,25,1,1,NULL),(24798,25,6,2,NULL),(24799,25,2,3,NULL),(24800,25,7,4,NULL),(24801,25,4,5,NULL),(24802,26,2,1,NULL),(24803,26,9,2,NULL),(24804,26,1,3,NULL),(24805,26,8,4,NULL),(24806,26,4,5,NULL),(24807,27,2,1,NULL),(24808,27,9,2,NULL),(24809,27,1,3,NULL),(24810,27,11,4,NULL),(24811,27,4,5,NULL),(24812,28,12,1,NULL),(24813,28,11,2,NULL),(24814,28,10,3,NULL),(24815,28,1,4,NULL),(24816,28,4,5,NULL),(24817,29,2,1,NULL),(24818,29,11,2,NULL),(24819,29,7,3,NULL),(24820,29,6,4,NULL),(24821,29,4,5,NULL),(24822,30,6,1,NULL),(24823,30,9,2,NULL),(24824,30,1,3,NULL),(24825,30,11,4,NULL),(24826,30,4,5,NULL),(24827,31,7,1,NULL),(24828,31,2,2,NULL),(24829,31,1,3,NULL),(24830,31,9,4,NULL),(24831,31,4,5,NULL),(24832,32,6,1,NULL),(24833,32,9,2,NULL),(24834,32,2,3,NULL),(24835,32,12,4,NULL),(24836,32,4,5,NULL),(24837,33,12,1,NULL),(24838,33,9,2,NULL),(24839,33,7,3,NULL),(24840,33,11,4,NULL),(24841,33,4,5,NULL),(24842,34,8,1,NULL),(24843,34,2,2,NULL),(24844,34,1,3,NULL),(24845,34,11,4,NULL),(24846,34,4,5,NULL),(24847,35,6,1,NULL),(24848,35,9,2,NULL),(24849,35,10,3,NULL),(24850,35,8,4,NULL),(24851,35,4,5,NULL),(24852,36,2,1,NULL),(24853,36,9,2,NULL),(24854,36,1,3,NULL),(24855,36,8,4,NULL),(24856,36,4,5,NULL),(24857,37,12,1,NULL),(24858,37,11,2,NULL),(24859,37,2,3,NULL),(24860,37,10,4,NULL),(24861,37,4,5,NULL),(24862,38,10,1,NULL),(24863,38,2,2,NULL),(24864,38,12,3,NULL),(24865,38,9,4,NULL),(24866,38,4,5,NULL),(24867,39,2,1,NULL),(24868,39,9,2,NULL),(24869,39,12,3,NULL),(24870,39,7,4,NULL),(24871,39,4,5,NULL),(24872,40,11,1,NULL),(24873,40,2,2,NULL),(24874,40,9,3,NULL),(24875,40,8,4,NULL),(24876,40,4,5,NULL),(24877,41,6,1,NULL),(24878,41,12,2,NULL),(24879,41,9,3,NULL),(24880,41,8,4,NULL),(24881,41,4,5,NULL),(24882,42,12,1,NULL),(24883,42,1,2,NULL),(24884,42,9,3,NULL),(24885,42,11,4,NULL),(24886,42,4,5,NULL),(24887,43,2,1,NULL),(24888,43,12,2,NULL),(24889,43,9,3,NULL),(24890,43,6,4,NULL),(24891,43,4,5,NULL),(24892,44,9,1,NULL),(24893,44,2,2,NULL),(24894,44,8,3,NULL),(24895,44,1,4,NULL),(24896,44,4,5,NULL),(24897,45,2,1,NULL),(24898,45,8,2,NULL),(24899,45,11,3,NULL),(24900,45,1,4,NULL),(24901,45,4,5,NULL),(24902,46,1,1,NULL),(24903,46,11,2,NULL),(24904,46,8,3,NULL),(24905,46,2,4,NULL),(24906,46,4,5,NULL),(24907,47,11,1,NULL),(24908,47,9,2,NULL),(24909,47,6,3,NULL),(24910,47,8,4,NULL),(24911,47,4,5,NULL),(24912,48,2,1,NULL),(24913,48,7,2,NULL),(24914,48,11,3,NULL),(24915,48,6,4,NULL),(24916,48,4,5,NULL),(24917,50,8,1,NULL),(24918,50,10,2,NULL),(24919,50,1,3,NULL),(24920,50,12,4,NULL),(24921,50,4,5,NULL),(24922,51,8,1,NULL),(24923,51,2,2,NULL),(24924,51,9,3,NULL),(24925,51,6,4,NULL),(24926,51,4,5,NULL),(24927,52,11,1,NULL),(24928,52,8,2,NULL),(24929,52,1,3,NULL),(24930,52,9,4,NULL),(24931,52,4,5,NULL),(24932,53,11,1,NULL),(24933,53,6,2,NULL),(24934,53,10,3,NULL),(24935,53,8,4,NULL),(24936,53,4,5,NULL),(24937,54,8,1,NULL),(24938,54,9,2,NULL),(24939,54,7,3,NULL),(24940,54,2,4,NULL),(24941,54,4,5,NULL),(24942,55,1,1,NULL),(24943,55,11,2,NULL),(24944,55,12,3,NULL),(24945,55,2,4,NULL),(24946,55,4,5,NULL),(24947,56,1,1,NULL),(24948,56,2,2,NULL),(24949,56,10,3,NULL),(24950,56,11,4,NULL),(24951,56,4,5,NULL),(24952,57,8,1,NULL),(24953,57,11,2,NULL),(24954,57,12,3,NULL),(24955,57,1,4,NULL),(24956,57,4,5,NULL),(24957,58,9,1,NULL),(24958,58,1,2,NULL),(24959,58,2,3,NULL),(24960,58,12,4,NULL),(24961,58,4,5,NULL),(24962,59,2,1,NULL),(24963,59,11,2,NULL),(24964,59,9,3,NULL),(24965,59,12,4,NULL),(24966,59,4,5,NULL),(24967,60,11,1,NULL),(24968,60,2,2,NULL),(24969,60,1,3,NULL),(24970,60,8,4,NULL),(24971,60,4,5,NULL),(24972,61,6,1,NULL),(24973,61,8,2,NULL),(24974,61,9,3,NULL),(24975,61,7,4,NULL),(24976,61,4,5,NULL),(24977,62,1,1,NULL),(24978,62,10,2,NULL),(24979,62,8,3,NULL),(24980,62,2,4,NULL),(24981,62,4,5,NULL),(24982,63,12,1,NULL),(24983,63,9,2,NULL),(24984,63,7,3,NULL),(24985,63,11,4,NULL),(24986,63,4,5,NULL),(24987,64,12,1,NULL),(24988,64,9,2,NULL),(24989,64,1,3,NULL),(24990,64,7,4,NULL),(24991,64,4,5,NULL),(24992,65,9,1,NULL),(24993,65,2,2,NULL),(24994,65,8,3,NULL),(24995,65,12,4,NULL),(24996,65,4,5,NULL),(24997,66,6,1,NULL),(24998,66,2,2,NULL),(24999,66,7,3,NULL),(25000,66,12,4,NULL),(25001,66,4,5,NULL),(25002,68,11,1,NULL),(25003,68,1,2,NULL),(25004,68,8,3,NULL),(25005,68,2,4,NULL),(25006,68,4,5,NULL),(25007,69,8,1,NULL),(25008,69,11,2,NULL),(25009,69,1,3,NULL),(25010,69,9,4,NULL),(25011,69,4,5,NULL),(25012,70,7,1,NULL),(25013,70,11,2,NULL),(25014,70,8,3,NULL),(25015,70,9,4,NULL),(25016,70,4,5,NULL),(25017,71,8,1,NULL),(25018,71,1,2,NULL),(25019,71,9,3,NULL),(25020,71,11,4,NULL),(25021,71,4,5,NULL),(25022,72,1,1,NULL),(25023,72,6,2,NULL),(25024,72,8,3,NULL),(25025,72,12,4,NULL),(25026,72,4,5,NULL),(25027,73,8,1,NULL),(25028,73,12,2,NULL),(25029,73,1,3,NULL),(25030,73,9,4,NULL),(25031,73,4,5,NULL),(25032,74,9,1,NULL),(25033,74,12,2,NULL),(25034,74,11,3,NULL),(25035,74,8,4,NULL),(25036,74,4,5,NULL),(25037,75,7,1,NULL),(25038,75,11,2,NULL),(25039,75,1,3,NULL),(25040,75,8,4,NULL),(25041,75,4,5,NULL),(25042,76,8,1,NULL),(25043,76,11,2,NULL),(25044,76,2,3,NULL),(25045,76,6,4,NULL),(25046,76,4,5,NULL);
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

-- Dump completed on 2025-11-02 18:53:16
