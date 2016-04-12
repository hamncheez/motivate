-- MySQL dump 10.16  Distrib 10.1.10-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: motivate
-- ------------------------------------------------------
-- Server version	10.1.10-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (7,'car repair',23,'2016-04-08 10:49:51','2016-04-08 10:49:51'),(8,'plants',26,'2016-04-08 10:49:51','2016-04-08 10:49:51'),(9,'bikes',24,'2016-04-08 10:49:51','2016-04-08 10:49:51');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_post`
--

DROP TABLE IF EXISTS `category_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `category_post_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `category_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_post`
--

LOCK TABLES `category_post` WRITE;
/*!40000 ALTER TABLE `category_post` DISABLE KEYS */;
INSERT INTO `category_post` VALUES (3,7,8,NULL,NULL),(4,8,7,NULL,NULL),(5,7,9,NULL,NULL);
/*!40000 ALTER TABLE `category_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `upvotes` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_03_22_234059_create_posts_table',1),('2016_03_24_133505_create_comments_table',1),('2016_03_25_035238_category_post_table',1),('2016_03_25_035704_categories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_user`
--

DROP TABLE IF EXISTS `post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_user_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_user`
--

LOCK TABLES `post_user` WRITE;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `pubstatus` int(11) NOT NULL,
  `favoritescount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (7,'I fixed my headlight','Bacon ipsum dolor amet brisket fatback filet mignon, beef ribs rump sint shoulder andouille enim voluptate cupidatat capicola t-bone. Est capicola qui pork chop t-bone, quis irure. Tongue beef sint fatback, commodo landjaeger ex pork belly. Sunt excepteur pork tempor reprehenderit.\r\n\r\nUt ham hock prosciutto consequat, aliqua quis tempor kevin sed voluptate ut. Ribeye brisket leberkas, fugiat nisi hamburger magna anim swine qui jowl pancetta t-bone quis. Veniam cow tenderloin eu tongue occaecat meatball eiusmod t-bone tri-tip reprehenderit tempor ut. Salami corned beef ut nisi jerky non. Pork loin lorem picanha ut.',23,1,0,'2016-04-08 10:49:51','2016-04-08 10:49:51','2016-04-08 06:00:00'),(8,'Planted a plant','Tongue in kielbasa exercitation shoulder, tri-tip bresaola ut frankfurter mollit bacon non. Dolor frankfurter tempor landjaeger duis proident jowl, biltong et tail consectetur venison shankle. Sed velit biltong tail ad ea jerky sint kielbasa chicken ex pancetta. Reprehenderit swine pig bresaola nostrud minim cupidatat veniam fugiat mollit officia hamburger ground round eiusmod. Cupidatat fugiat occaecat hamburger pork chop aliquip capicola alcatra meatball consequat sed cow ground round.\r\n\r\nConsequat fugiat ut shoulder dolor doner ham aute aliquip esse aliqua labore in. Sirloin alcatra dolore, esse fatback capicola pork chop pork loin aliquip leberkas pork belly. Quis ribeye prosciutto do velit pork ut lorem duis. Aute pariatur cupim, ut rump flank venison. Pastrami duis cow cillum sausage esse pork chop ea capicola swine exercitation. Nostrud id beef, sirloin et fugiat veniam.',26,1,0,'2016-04-08 10:49:51','2016-04-08 10:49:51','2016-04-08 06:00:00'),(9,'how I found a good mechanic','Pancetta eu veniam est chuck. Eiusmod reprehenderit bacon porchetta do minim dolor alcatra chicken veniam beef shoulder pastrami boudin. Ullamco drumstick laborum duis porchetta velit tail short ribs salami elit. Elit exercitation excepteur id sint consectetur laborum pancetta quis.\r\n\r\nPorchetta occaecat flank, ut swine strip steak pork deserunt consequat. Proident ham duis pork flank dolore. Corned beef jowl pastrami dolore commodo ground round cupidatat brisket turducken bacon kielbasa pork chop. Qui meatball fugiat irure drumstick. Jowl occaecat filet mignon officia. Aute turkey bresaola, ribeye pork belly sirloin non esse meatloaf fatback short loin quis. Ham adipisicing elit officia porchetta.\r\n\r\nLorem biltong ex t-bone beef ribs, ribeye minim velit non. Nisi shankle sunt, pariatur aute andouille landjaeger excepteur minim. Pork officia prosciutto ball tip, consectetur irure consequat ad do meatball non cillum turducken adipisicing ham hock. Sausage et short loin, id esse consequat capicola excepteur kielbasa duis pork swine andouille.',23,1,0,'2016-04-08 10:49:51','2016-04-08 10:49:51','2016-04-08 06:00:00'),(12,'HOw i fixed the drain','Tootsie roll biscuit macaroon. Dessert macaroon muffin apple pie bonbon. Gummi bears lemon drops liquorice candy canes marzipan bonbon bear claw danish jelly beans. Sweet roll fruitcake donut jelly lemon drops. Pudding powder candy gummi bears soufflé dragée gummies. Icing toffee bear claw jujubes cotton candy. Icing pastry cake cake icing. Caramels sesame snaps tart toffee. Cheesecake sugar plum chocolate. Bonbon candy gummi bears cheesecake bonbon. Wafer pudding tiramisu halvah jelly beans dragée oat cake jelly beans topping.',25,0,0,'2016-04-10 02:36:54','2016-04-10 02:36:54','0000-00-00 00:00:00'),(13,'HOw i fixed the drain','Tootsie roll biscuit macaroon. Dessert macaroon muffin apple pie bonbon. Gummi bears lemon drops liquorice candy canes marzipan bonbon bear claw danish jelly beans. Sweet roll fruitcake donut jelly lemon drops. Pudding powder candy gummi bears soufflé dragée gummies. Icing toffee bear claw jujubes cotton candy. Icing pastry cake cake icing. Caramels sesame snaps tart toffee. Cheesecake sugar plum chocolate. Bonbon candy gummi bears cheesecake bonbon. Wafer pudding tiramisu halvah jelly beans dragée oat cake jelly beans topping.',25,0,0,'2016-04-10 02:37:25','2016-04-10 02:37:25','0000-00-00 00:00:00'),(14,'HOw i fixed the drain','Tootsie roll biscuit macaroon. Dessert macaroon muffin apple pie bonbon. Gummi bears lemon drops liquorice candy canes marzipan bonbon bear claw danish jelly beans. Sweet roll fruitcake donut jelly lemon drops. Pudding powder candy gummi bears soufflé dragée gummies. Icing toffee bear claw jujubes cotton candy. Icing pastry cake cake icing. Caramels sesame snaps tart toffee. Cheesecake sugar plum chocolate. Bonbon candy gummi bears cheesecake bonbon. Wafer pudding tiramisu halvah jelly beans dragée oat cake jelly beans topping.',25,0,0,'2016-04-10 02:38:25','2016-04-10 02:38:25','0000-00-00 00:00:00'),(15,'Truest post of all time','asdfasd fasl;kdjf sakl jd;flkas d;lfkja sd;lkfj a;slkdj n apple pie bonbon. Gummi bears lemon drops liquorice candy canes marzipan bonbon bear claw danish jelly beans. Sweet roll fruitcake donut jelly lemon drops. Pudding powder candy gummi bears soufflé dragée gummies. Icing toffee bear claw jujubes cotton candy. Icing pastry cake cake icing. Caramels sesame snaps tart toffee. Cheesecake sugar plum chocolate. Bonbon candy gummi bears cheesecake bonbon. Wafer pudding tiramisu halvah jelly beans dragée oat cake jelly beans topping.',23,0,0,'2016-04-10 03:17:44','2016-04-10 03:17:44','0000-00-00 00:00:00'),(16,'How To change a headlight Hyndai Elantra 2007','hupa chups muffin topping ice cream chocolate. Dessert pudding lollipop sweet roll tiramisu gingerbread jelly pudding sweet. Ice cream pudding lollipop. Ice cream macaroon sugar plum lollipop ice cream soufflé danish chocolate bar biscuit.',23,0,0,'2016-04-10 03:21:10','2016-04-10 03:21:10','0000-00-00 00:00:00'),(17,'How To change a headlight Hyndai Elantra 2007','hupa chups muffin topping ice cream chocolate. Dessert pudding lollipop sweet roll tiramisu gingerbread jelly pudding sweet. Ice cream pudding lollipop. Ice cream macaroon sugar plum lollipop ice cream soufflé danish chocolate bar biscuit.',23,0,0,'2016-04-10 03:21:23','2016-04-10 03:21:23','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'author');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gravatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tagline` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_gravatar_unique` (`gravatar`),
  KEY `users_id_index` (`id`),
  KEY `role` (`role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`),
  CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'Hoku','Ho','hoku.oh@gmail.com','$2y$10$QWFzNzTZ9ZtA2361RxczZeqrg5kLUiOmKYW0p1R3eGC8M/7BPlYHe',NULL,1,NULL,'2016-04-08 10:49:51','2016-04-08 10:49:51','I htink im cool, but I just pose'),(24,'Ivan','Ho','ivankealiiho@gmail.com','$2y$10$XYn.KtVS9oPJy8NnVYi6D.M91fjJqjezdkuoy2VscAE9GepAC/S2K',NULL,1,NULL,'2016-04-08 10:49:51','2016-04-08 10:49:51','I made everything'),(25,'Cami','Ho','cami@gmail.com','$2y$10$XYn.KtVS9oPJy8NnVYi6D.M91fjJqjezdkuoy2VscAE9GepAC/S2K',NULL,2,NULL,'2016-04-08 10:49:51','2016-04-08 10:49:51','I got a new job in Lehi'),(26,'whitney','Ho','britlitwhit17@aol.com','$2y$10$XYn.KtVS9oPJy8NnVYi6D.M91fjJqjezdkuoy2VscAE9GepAC/S2K',NULL,2,NULL,'2016-04-08 10:49:51','2016-04-08 10:49:51','I love animals. and Ivan.'),(33,'','','keola.oh@gmail.com','$2y$10$XYn.KtVS9oPJy8NnVYi6D.M91fjJqjezdkuoy2VscAE9GepAC/S2K',NULL,2,NULL,'2016-04-10 06:28:57','2016-04-10 06:28:57',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-12  7:46:51
