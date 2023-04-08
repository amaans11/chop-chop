
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
DROP TABLE IF EXISTS `action_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_id` bigint unsigned NOT NULL,
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `exception` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` mediumtext COLLATE utf8mb4_unicode_ci,
  `changes` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `action_events_actionable_type_actionable_id_index` (`actionable_type`,`actionable_id`),
  KEY `action_events_batch_id_model_type_model_id_index` (`batch_id`,`model_type`,`model_id`),
  KEY `action_events_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `action_events` WRITE;
/*!40000 ALTER TABLE `action_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_events` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Popular','Hundreds of main dish recipes. Choose from top-rated comfort food','2021-11-10 14:27:45','2021-11-10 14:27:45','popular'),(2,'Meal time','Choose based on different meal times!','2021-11-10 14:27:48','2021-11-10 14:27:48','meal-time'),(3,'Cuisines','Choose from a wide range of cuisines.We offer classes for for varius cuisines','2021-11-10 14:27:49','2021-11-10 14:27:49','cuisines'),(4,'Diet Goal','Select based on various diet goals','2021-11-10 14:27:50','2021-11-10 14:27:50','diet-goal');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `class_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_subcategory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subcategory_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_subcategory_subcategory_id_foreign` (`subcategory_id`),
  KEY `class_subcategory_class_id_foreign` (`class_id`),
  CONSTRAINT `class_subcategory_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_subcategory_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `class_subcategory` WRITE;
/*!40000 ALTER TABLE `class_subcategory` DISABLE KEYS */;
INSERT INTO `class_subcategory` VALUES (1,21,1,'2021-11-10 14:28:47','2021-11-10 14:28:47'),(2,2,2,'2021-11-10 14:28:50','2021-11-10 14:28:50'),(3,10,3,'2021-11-10 14:28:53','2021-11-10 14:28:53'),(4,8,4,'2021-11-10 14:28:54','2021-11-10 14:28:54'),(5,4,5,'2021-11-10 14:28:56','2021-11-10 14:28:56');
/*!40000 ALTER TABLE `class_subcategory` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` text COLLATE utf8mb4_unicode_ci,
  `steps` text COLLATE utf8mb4_unicode_ci,
  `utensils` text COLLATE utf8mb4_unicode_ci,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Beginner',
  `duration` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,1,'Jumbo Prawns Manchurian','Plum sauce is a fruit condiment that is prepared by cooking plums, garlic, vinegar, ginger, and sugar together. It\'s a semi-solid, semi-liquid sweet and sour sauce which is used alongside many Chinese dishes. Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure. Plum Sauce has a little spiciness due to the addition of red chili powder. If you don\'t like spicy food then you can adjust the quantity as per your taste. Overall, this sauce is really flavorful, you should give it a try.','2021-11-10 14:28:45','2021-11-10 14:28:45','Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure.','<ul><li>500 gm washed &amp; dried,peeled,chopped,de seeded plums</li><li>1 teaspoon red chilli powder</li><li>2 tablespoon vinegar</li><li>1/2 cup brown sugar</li><li>1 tablespoon minced garlic</li><li>1 tablespoon grated ginger</li><li>1 tablespoon light soya sauce</li></ul><div><br></div>','<div>&nbsp; &nbsp; <strong>Step 1 Prepare the sauce<br></strong><br></div><ul><li>To begin with this easy recipe, wash the plums and cut them. In a saucepan, add garlic, ginger, vinegar, sugar, chili powder, and plums. Stir to mix everything well.<br><br><strong>Step 2 Cook the sauce</strong><br><br></li><li>Cook the sauce on medium flame and let it come to a boil. Now, reduce the flame and simmer until the mixture becomes thick. Stir occasionally. Check if the plums have turned soft.<br><br></li></ul><div>&nbsp; &nbsp; &nbsp;<strong>Step 3 Add soya sauce</strong><br><br></div><ul><li>Switch off the gas flame and then add soya sauce. Stir to combine everything well.<br><br><strong>Step 4 Your Plum Sauce is ready</strong><br><br></li><li>Your Plum Sauce is ready. Let it cool at room temperature and store it an airtight container.</li></ul><div><br></div>','Grater','Intermediate',25,20.00,'jumbo-prawns-manchurian'),(2,2,'King Oyster Mushrooms from Scratch','Fond of stir-fries and mushrooms? Then combine the two together to make this super easy yet delish recipe. Made by stir-frying King Oyster Mushrooms in soya sauce, orange juice and a melange of spices, this tempting dish is indeed worth trying.Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack. You can serve it at parties or family dinners and people of all ages will love it. So, put on your chef\'s hat and try out this delicious recipe at home.','2021-11-10 14:28:47','2021-11-10 14:28:47','Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack.','<ul><li>1/4 cup extra virgin olive oil</li><li>1 teaspoon black pepper</li><li>3 cloves minced garlic</li><li>salt as required</li><li>chopped basil as required</li><li>4 tablespoon grated parmesan cheese</li><li>1 baguette</li><li>3 large diced tomato</li></ul><div><br></div>','<div>&nbsp; &nbsp; &nbsp;<strong>Step 1 Combine the spices in a bowl<br></strong><br></div><ul><li>In a bowl, add garlic, basil, salt, olive oil, and pepper. Mix them well.</li></ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; <strong>Step 2 Toss in tomatoes to the spice mixture<br></strong><br></div><ul><li>Toss in tomatoes and then sprinkle cheese on it. Mix well and freeze it for at least 45 mins.</li></ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; &nbsp;<strong>Step 3 Toast the bread slices<br></strong><br></div><ul><li>Bring the tomato mixture to room temperature. Cut the baguette loaf into slices and toast them until they turn light brown in color.</li></ul><div><br>&nbsp; &nbsp;<strong>Step 4 Top the bread slices with the mixture<br></strong><br></div><ul><li>Now, top the bread slices with the tomato mixture. Your Garlic Tomato Bruschetta is ready to serve. Enjoy.</li></ul><div><br></div><div><br></div>','Grater','Beginner',30,25.00,'king-oyster-mushrooms-from-scratch'),(3,3,'Indian Street Food','Turon is a popular snack made with bananas that belong to the Philippines. Originally, Turons are made by wrapping banana pieces in a spring roll wrapper and deep-fried to make them crispy. It is either dusted with sugar or coated in a caramel glaze prepared with sugar. Apart from banana, jackfruit, sweet potato, mango, cheddar cheese and coconut fillings are also stuffed in Turons. With its lip-smacking flavours, Turon is a popular street food amongst Filipinos.','2021-11-10 14:28:50','2021-11-10 14:28:50','These Turons are shallow-fried, which makes them healthy as well. Do try this recipe, rate it and let us know how it turned out to be.','<ul><li>1 1/2 kilograms mustard leaves</li><li>250 gm bathua saag</li><li>4 green chilli</li><li>3 large onion</li><li>1 teaspoon turmeric</li><li>4 tablespoon ghee</li><li>250 gm spinach</li><li>50 gm corn flour</li><li>20 cloves garlic</li><li>2 inches ginger</li><li>1 cup water</li></ul><div><br></div>','<ul><li><strong>Step 1 Clean all the leafy vegetables in running water<br></strong><br></li><li>Sarson da saag Is an authentic Punjabi delicacy, which can be prepared at home easily without putting in many efforts. Here’s how you can prepare this dish by following some simple steps given below. To begin with washing and cleaning the mustard leaves, spinach and bathua saag. To make it adulterant-free, soak the greens in lukewarm water and add a pinch of salt.</li></ul><div><br><br></div><ul><li><strong>Step 2 Pressure cook the leafy greens for half an hour<br></strong><br></li><li>After washing the leafy veggies properly, drain the excess water. Cut and peel the stems of mustard leaves before chopping, then finely chop all the leaves. Take a pressure cooker and cook all the leaves for half an hour approximately. Put in ginger and 10 garlic cloves along with the leaves. Let it cool for sometime.</li></ul><div><br></div><ul><li><strong>Step 3 Blend the cooked saag for 30 seconds and then prepare the tempering<br></strong><br></li><li>Take out the mixture and put it in a blender with 50 grams of cornflour and churn for 30 seconds. Mixture should remain a little lumpy. Heat 2 tablespoon ghee in a deep-frying vessel, when it has melted put in 10 cloves of finely chopped garlic. When the garlic has turned brown, add finely chopped onions and green chillies in a vessel.</li></ul><div><br></div>','Grater','Intermediate',45,20.00,'indian-street-food'),(4,4,'Smoked Salmon with Scrambled Eggs from Scratch','Bored of eating those regular scrambled eggs for breakfast? Don\'t worry, we have got your back. This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique. Not only it gives you loads of protein but fulfills your craving with its extra creamy flavor. Ditch your regular breakfast and try making this recipe. It would taste perfect with a toast or garlc bread.','2021-11-10 14:28:53','2021-11-10 14:28:53','This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique.','<ul><li>2 cup yoghurt (curd)</li><li>4 tablespoon honey</li><li>1/4 cup pomegranate seeds</li><li>1 Pinch powdered cinnamon</li><li>1 cup breadcrumbs</li><li>1/4 cup strawberry</li><li>1/4 cup blueberry</li><li>1 tablespoon chia seeds</li></ul><div><br></div>','<div><strong>&nbsp; &nbsp;Step 1 MIx the ingredients<br></strong><br></div><ul><li>In a bowl add yoghurt and honey. Mix them well. Now add chia seeds, a pinch of cinnamon powder, chopped strawberries, blueberries and pomegranate. Save some of the fruit for garnish. Mix everything well.</li></ul><div>&nbsp; &nbsp; <br><strong>&nbsp; Step 2 Layering<br></strong><br></div><ul><li>Now take a dessert bowl or glass and add a layer of breadcrumbs at the bottom and press it down properly with a spoon. Add a scoop of the yoghurt mixture and level it. Now add another layer of breadcrumbs and flatten it out. Again add a layer of fruit yoghurt. Repeat these steps to fill the bowl/glass till the top.</li></ul><div><br><strong>&nbsp; &nbsp; Step 3 Garnish and serve<br></strong><br></div><ul><li>Garnish with leftover fruits and serve. Enjoy the yummy and healthy pudding.</li></ul><div><br></div><div><br></div>','Grater','beginner',20,25.00,'smoked-salmon-with-scrambled-egg-from-scratch'),(5,5,'Baked Avocado Coats','Baked Avocado Boats as the name suggests are avocados filled with eggs. There\'s no doubt that the taste is as lavish as its name. The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it. A super nutritious recipe that will keep you fuller for a longer time. Let\'s know if you loved eating Baked Avocado Boats.','2021-11-10 14:28:54','2021-11-10 14:28:54','The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it.','<ul><li>kosher salt as required</li><li>4 egg</li><li>chopped chives as required</li><li>powdered black pepper as required</li><li>2 halved pitted avocados</li></ul><div><br></div>','<div>&nbsp; &nbsp; <strong>Step 1 Scoop the avocados out</strong><br><br></div><ul><li>Preheat the oven to 180C. Then, scoop out about 1tbsp avocado from the cavity so that you can crack open the egg. Repeat this process for the rest 3 halves.</li></ul><div>&nbsp;<br>&nbsp; &nbsp;<strong>Step 2 Season the avocados</strong><br><br></div><ul><li>Now, season the avocados By sprinkling some salt and pepper on the top of egg whites. Now bake the avocados for about 20-25 mins. You can cover the avocados with a foil to avoid browning.</li></ul><div><br>&nbsp; &nbsp; <strong>Step 3 Your Baked Avocado Boats are ready to serve<br></strong><br></div><ul><li>Once baked, take the avocados out and garnish them with chopped chives, chili flakes and oregano. Your Avocado Baked Boats are ready to serve hot. Enjoy.</li></ul><div><br></div>','Grater','Beginner',20,25.00,'smoked-salmon-with-scrambled-eggs-from-scratch');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'App\\Models\\User',1,'1f5e27fd-853a-417f-8ba6-04b7b9647072','users','1200x800','1200x800.jpeg','image/jpeg','public','public',276025,'[]','[]','[]','[]',1,'2021-11-10 14:27:27','2021-11-10 14:27:27'),(2,'App\\Models\\User',2,'fedbca8c-873b-465d-a038-edb7d25d045a','users','1200x800','1200x800.jpeg','image/jpeg','public','public',29150,'[]','[]','[]','[]',2,'2021-11-10 14:27:30','2021-11-10 14:27:30'),(3,'App\\Models\\User',3,'bcc7d764-1139-40a3-beb5-a06e93f66599','users','1200x800','1200x800.jpeg','image/jpeg','public','public',21655,'[]','[]','[]','[]',3,'2021-11-10 14:27:32','2021-11-10 14:27:32'),(4,'App\\Models\\User',4,'27dc492e-6c80-4baa-af8a-a149e602e2e5','users','1200x800','1200x800.jpeg','image/jpeg','public','public',166747,'[]','[]','[]','[]',4,'2021-11-10 14:27:33','2021-11-10 14:27:33'),(5,'App\\Models\\User',5,'2b37c80b-f137-4db6-aad2-33cf1a029f8f','users','1200x800','1200x800.jpeg','image/jpeg','public','public',202645,'[]','[]','[]','[]',5,'2021-11-10 14:27:35','2021-11-10 14:27:35'),(6,'App\\Models\\User',6,'26345e15-f22b-487f-bfea-9060ffcafa71','users','1200x800','1200x800.jpeg','image/jpeg','public','public',121404,'[]','[]','[]','[]',6,'2021-11-10 14:27:36','2021-11-10 14:27:36'),(7,'App\\Models\\User',7,'27c07569-16e5-49e4-9995-ad964bcad165','users','1200x800','1200x800.jpeg','image/jpeg','public','public',154146,'[]','[]','[]','[]',7,'2021-11-10 14:27:39','2021-11-10 14:27:39'),(8,'App\\Models\\User',8,'552e967b-3fa7-4b71-93bd-06ef73182ec6','users','1200x800','1200x800.jpeg','image/jpeg','public','public',78694,'[]','[]','[]','[]',8,'2021-11-10 14:27:42','2021-11-10 14:27:42'),(9,'App\\Models\\User',9,'1d010375-bcf9-40c5-9d92-97f3f9752941','users','1200x800','1200x800.jpeg','image/jpeg','public','public',288945,'[]','[]','[]','[]',9,'2021-11-10 14:27:43','2021-11-10 14:27:43'),(10,'App\\Models\\User',10,'56b35ca6-2a9b-4ac2-af3d-b09eafbcc1d6','users','1200x800','1200x800.jpeg','image/jpeg','public','public',162834,'[]','[]','[]','[]',10,'2021-11-10 14:27:45','2021-11-10 14:27:45'),(11,'App\\Models\\Category',1,'b28e53ab-abba-4fa5-80cf-6004c96595c1','categories','1200x800','1200x800.jpeg','image/jpeg','public','public',227092,'[]','[]','{\"thumb\": true}','[]',11,'2021-11-10 14:27:47','2021-11-10 14:27:48'),(12,'App\\Models\\Category',2,'ea38cffc-6d0a-4703-b661-e8f9967bbd30','categories','1200x800','1200x800.jpeg','image/jpeg','public','public',160281,'[]','[]','{\"thumb\": true}','[]',12,'2021-11-10 14:27:49','2021-11-10 14:27:49'),(13,'App\\Models\\Category',3,'bb13e680-baca-423e-af44-b52d5cb886f4','categories','1200x800','1200x800.jpeg','image/jpeg','public','public',99169,'[]','[]','{\"thumb\": true}','[]',13,'2021-11-10 14:27:50','2021-11-10 14:27:50'),(14,'App\\Models\\Category',4,'4bf7bea1-d3b1-4a69-ba61-19d36ce925ba','categories','1200x800','1200x800.jpeg','image/jpeg','public','public',192906,'[]','[]','{\"thumb\": true}','[]',14,'2021-11-10 14:27:53','2021-11-10 14:27:53'),(15,'App\\Models\\Subcategory',1,'591a4c0d-b79c-4afe-ad85-7f4aa0bd7644','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',120009,'[]','[]','[]','[]',15,'2021-11-10 14:27:55','2021-11-10 14:27:55'),(16,'App\\Models\\Subcategory',2,'8819896a-5cce-4ed8-81a6-7b74528339e4','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',45430,'[]','[]','[]','[]',16,'2021-11-10 14:27:57','2021-11-10 14:27:57'),(17,'App\\Models\\Subcategory',3,'232d7775-f9a2-4856-9fb9-63ce56274a07','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',227164,'[]','[]','[]','[]',17,'2021-11-10 14:28:00','2021-11-10 14:28:00'),(18,'App\\Models\\Subcategory',4,'c6307dad-7475-41d4-89a7-a9e2603b2f57','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',113240,'[]','[]','[]','[]',18,'2021-11-10 14:28:02','2021-11-10 14:28:02'),(19,'App\\Models\\Subcategory',5,'3544849d-8772-4c2d-9be4-acf6fef6fb69','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',249386,'[]','[]','[]','[]',19,'2021-11-10 14:28:05','2021-11-10 14:28:05'),(20,'App\\Models\\Subcategory',6,'9de96b10-e9dd-4b09-9a94-ef186963a057','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',260116,'[]','[]','[]','[]',20,'2021-11-10 14:28:08','2021-11-10 14:28:08'),(21,'App\\Models\\Subcategory',7,'33b21e2a-928a-4628-91a5-a64001b4ae4f','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',172870,'[]','[]','[]','[]',21,'2021-11-10 14:28:12','2021-11-10 14:28:12'),(22,'App\\Models\\Subcategory',8,'dc607894-f5b3-4577-8688-abd9a8775f28','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',69552,'[]','[]','[]','[]',22,'2021-11-10 14:28:14','2021-11-10 14:28:14'),(23,'App\\Models\\Subcategory',9,'3451ad16-bbb2-4370-b16d-e2224ebb6afd','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',231955,'[]','[]','[]','[]',23,'2021-11-10 14:28:16','2021-11-10 14:28:16'),(24,'App\\Models\\Subcategory',10,'23bfba1d-76f8-45ba-8a2a-94b8d89c6716','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',173404,'[]','[]','[]','[]',24,'2021-11-10 14:28:17','2021-11-10 14:28:17'),(25,'App\\Models\\Subcategory',11,'24994005-2c68-4cd3-98be-9d2470730829','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',81380,'[]','[]','[]','[]',25,'2021-11-10 14:28:19','2021-11-10 14:28:19'),(26,'App\\Models\\Subcategory',12,'249610a3-10fe-4123-9c42-7ce61c826429','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',158822,'[]','[]','[]','[]',26,'2021-11-10 14:28:22','2021-11-10 14:28:22'),(27,'App\\Models\\Subcategory',13,'090f8549-9d7e-4db8-9c8b-0112c56f5451','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',264088,'[]','[]','[]','[]',27,'2021-11-10 14:28:24','2021-11-10 14:28:24'),(28,'App\\Models\\Subcategory',14,'95b9b2f4-69fd-484f-9dc7-2ee73f6f0c27','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',31404,'[]','[]','[]','[]',28,'2021-11-10 14:28:25','2021-11-10 14:28:25'),(29,'App\\Models\\Subcategory',15,'a84a3c6f-1984-46e5-8871-e5140e389361','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',122736,'[]','[]','[]','[]',29,'2021-11-10 14:28:26','2021-11-10 14:28:26'),(30,'App\\Models\\Subcategory',16,'4c7c2345-a8d9-49e1-a4c8-bb3507a68ee4','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',284925,'[]','[]','[]','[]',30,'2021-11-10 14:28:28','2021-11-10 14:28:28'),(31,'App\\Models\\Subcategory',17,'03c47e69-b773-4a33-8051-0b0b4a90aeeb','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',63579,'[]','[]','[]','[]',31,'2021-11-10 14:28:29','2021-11-10 14:28:29'),(32,'App\\Models\\Subcategory',18,'bf36aae2-f0ac-4826-94a0-e9eafe4ffb06','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',195885,'[]','[]','[]','[]',32,'2021-11-10 14:28:31','2021-11-10 14:28:31'),(33,'App\\Models\\Subcategory',19,'1e9d6524-63a5-47de-aaa4-e149450d3f34','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',165508,'[]','[]','[]','[]',33,'2021-11-10 14:28:33','2021-11-10 14:28:33'),(34,'App\\Models\\Subcategory',20,'de37cfa3-8eca-475c-a5ed-93cfc3462d53','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',63444,'[]','[]','[]','[]',34,'2021-11-10 14:28:34','2021-11-10 14:28:34'),(35,'App\\Models\\Subcategory',21,'35f39785-ec06-40ce-ac2e-29db5348b2fc','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',434650,'[]','[]','[]','[]',35,'2021-11-10 14:28:36','2021-11-10 14:28:36'),(36,'App\\Models\\Subcategory',22,'43015c90-8f5b-4aae-8cd7-573ae7650e26','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',96433,'[]','[]','[]','[]',36,'2021-11-10 14:28:37','2021-11-10 14:28:37'),(37,'App\\Models\\Subcategory',23,'6137bff1-1dba-4351-ad1b-327df86c0192','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',101910,'[]','[]','[]','[]',37,'2021-11-10 14:28:38','2021-11-10 14:28:38'),(38,'App\\Models\\Subcategory',24,'fed309c3-e679-41b2-9e3e-be1385c58cf9','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',257363,'[]','[]','[]','[]',38,'2021-11-10 14:28:39','2021-11-10 14:28:39'),(39,'App\\Models\\Subcategory',25,'1e7a5b9c-1fca-4803-8af2-dcb6796502e9','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',59087,'[]','[]','[]','[]',39,'2021-11-10 14:28:41','2021-11-10 14:28:41'),(40,'App\\Models\\Subcategory',26,'7429b3f4-fd6e-4cfc-9d9c-9b82b92d0748','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',146109,'[]','[]','[]','[]',40,'2021-11-10 14:28:42','2021-11-10 14:28:42'),(41,'App\\Models\\Subcategory',27,'e2e47e1f-4cbe-4e89-bffb-66fa6eb552f5','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',126828,'[]','[]','[]','[]',41,'2021-11-10 14:28:43','2021-11-10 14:28:43'),(42,'App\\Models\\Subcategory',28,'2100155b-fd18-407e-8041-87007d2719ad','subcategories','1200x800','1200x800.jpeg','image/jpeg','public','public',151013,'[]','[]','[]','[]',42,'2021-11-10 14:28:45','2021-11-10 14:28:45'),(43,'App\\Models\\Classes',1,'eea9357d-f652-4587-854f-a3864b19d2d5','classes_hero_image','1200x800','1200x800.jpeg','image/jpeg','public','public',180409,'[]','[]','{\"thumb\": true}','[]',43,'2021-11-10 14:28:47','2021-11-10 14:28:47'),(44,'App\\Models\\Classes',2,'96d9203f-4745-40ca-bdaa-4845753df5fc','classes_hero_image','1200x800','1200x800.jpeg','image/jpeg','public','public',65671,'[]','[]','{\"thumb\": true}','[]',44,'2021-11-10 14:28:50','2021-11-10 14:28:50'),(45,'App\\Models\\Classes',3,'82953745-cdf2-4ddb-84e7-e2f4146d40f5','classes_hero_image','1200x800','1200x800.jpeg','image/jpeg','public','public',184961,'[]','[]','{\"thumb\": true}','[]',45,'2021-11-10 14:28:53','2021-11-10 14:28:53'),(46,'App\\Models\\Classes',4,'0e038e13-3a10-47a5-bf64-b08d7e23981d','classes_hero_image','1200x800','1200x800.jpeg','image/jpeg','public','public',317105,'[]','[]','{\"thumb\": true}','[]',46,'2021-11-10 14:28:54','2021-11-10 14:28:54'),(47,'App\\Models\\Classes',5,'401458c7-ac5c-40cf-87a2-7f983162345b','classes_hero_image','1200x800','1200x800.jpeg','image/jpeg','public','public',155755,'[]','[]','{\"thumb\": true}','[]',47,'2021-11-10 14:28:56','2021-11-10 14:28:56');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoom_link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_recording_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,1,'test meeting 1','2021-11-10 19:57:45','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(2,2,'test meeting 2','2021-11-10 19:57:45','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(3,2,'test meeting 3','2021-11-10 19:57:45','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(4,3,'test meeting 4','2021-11-10 19:57:45','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(5,3,'test meeting 5','2021-11-10 19:57:45','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2018_01_01_000000_create_action_events_table',1),(5,'2019_05_10_000000_add_fields_to_action_events_table',1),(6,'2019_08_19_000000_create_failed_jobs_table',1),(7,'2019_12_14_000001_create_personal_access_tokens_table',1),(8,'2020_05_21_100000_create_teams_table',1),(9,'2020_05_21_200000_create_team_user_table',1),(10,'2020_05_21_300000_create_team_invitations_table',1),(11,'2021_08_08_221335_create_sessions_table',1),(12,'2021_08_09_083910_add_facebook_id_column_in_users_table',1),(13,'2021_08_16_063434_add_data_field',1),(14,'2021_08_16_085126_make_data_field_nullable',1),(15,'2021_08_19_071850_create_media_table',1),(16,'2021_10_28_133819_create_classes_table',1),(17,'2021_10_28_135635_create_meetings_table',1),(18,'2021_10_29_051328_create_user_meetings_table',1),(19,'2021_11_09_081137_update_classes_table',1),(20,'2021_11_09_084407_create_user_reviews_table',1),(21,'2021_11_09_084709_create_categories_table',1),(22,'2021_11_09_084731_create_subcategories_table',1),(23,'2021_11_09_085338_create_class_subcategory_table',1),(24,'2021_11_09_195516_create_tag_tables',1),(25,'2021_11_10_081713_add_slug_column_to_tables',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('o9VKJeU1fDMiEIPJ3dlvLNrWowcoxkuVEQVsxGJq',10,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOTdxTlhhbDJJNmtTV3pLbnJmSVJPRHUweDNjcGRUUVNFWFdCN1BwWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU1OiJodHRwczovL2Nob3BjaG9wLWFwcC50ZXN0L25vdmEvcmVzb3VyY2VzL3N1Yi1jYXRlZ29yaWVzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTA7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ0cnUucVFPQ29tRDlrNkJiYnpsZnllWC4zS2g4T1J0Z1ZOQXJWeVlGSTRTNzZUdkJQWXJyMiI7fQ==',1636574342);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategories_category_id_foreign` (`category_id`),
  CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,1,'15 Min Breakfast','','2021-11-10 14:27:53','2021-11-10 14:27:53','15-min-breakfast',NULL),(2,1,'15 Min Dinner','','2021-11-10 14:27:55','2021-11-10 14:27:55','15-min-dinner',NULL),(3,1,'Brunch','','2021-11-10 14:27:57','2021-11-10 14:27:57','brunch',NULL),(4,1,'Longer Cook','','2021-11-10 14:28:00','2021-11-10 14:28:00','longer-cook',NULL),(5,1,'Thanks Giving','','2021-11-10 14:28:02','2021-11-10 14:28:02','thanks-giving',NULL),(6,1,'Weekly Meal Prep','','2021-11-10 14:28:05','2021-11-10 14:28:05','weekly-meal-prep',NULL),(7,1,'Date Night','','2021-11-10 14:28:08','2021-11-10 14:28:08','date-night',NULL),(8,1,'30 min Lunch','','2021-11-10 14:28:12','2021-11-10 14:28:12','30-min-lunch',NULL),(9,1,'20 min Dinner','','2021-11-10 14:28:14','2021-11-10 14:28:14','20-min-dinner',NULL),(10,2,'Breakfast','','2021-11-10 14:28:16','2021-11-10 14:28:16','breakfast',NULL),(11,2,'Brunch','','2021-11-10 14:28:17','2021-11-10 14:28:17','brunch',NULL),(12,2,'Lunch','','2021-11-10 14:28:19','2021-11-10 14:28:19','lunch',NULL),(13,2,'Dinner','','2021-11-10 14:28:22','2021-11-10 14:28:22','dinner',NULL),(14,3,'Chinese','','2021-11-10 14:28:24','2021-11-10 14:28:24','chinese',NULL),(15,3,'American','','2021-11-10 14:28:25','2021-11-10 14:28:25','american',NULL),(16,3,'Indian','','2021-11-10 14:28:26','2021-11-10 14:28:26','indian',NULL),(17,3,'Thai','','2021-11-10 14:28:28','2021-11-10 14:28:28','thai',NULL),(18,3,'Italian','','2021-11-10 14:28:29','2021-11-10 14:28:29','italian',NULL),(19,3,'Asian','','2021-11-10 14:28:31','2021-11-10 14:28:31','asian',NULL),(20,3,'Fusion','','2021-11-10 14:28:33','2021-11-10 14:28:33','fusion',NULL),(21,3,'Continental','','2021-11-10 14:28:34','2021-11-10 14:28:34','continental',NULL),(22,3,'Mediterranean','','2021-11-10 14:28:36','2021-11-10 14:28:36','mediterranean',NULL),(23,4,'Gain Weight','','2021-11-10 14:28:37','2021-11-10 14:28:37','gain-weight',NULL),(24,4,'Lose Weight','','2021-11-10 14:28:38','2021-11-10 14:28:38','lose-weight',NULL),(25,4,'Cook more diverse recipes','','2021-11-10 14:28:39','2021-11-10 14:28:39','cook-more-diverse-recipes',NULL),(26,4,'Cook tastier tried and trues','','2021-11-10 14:28:41','2021-11-10 14:28:41','cook-tastier-tried-and-trues',NULL),(27,4,'Try something exotic','','2021-11-10 14:28:42','2021-11-10 14:28:42','try-something-exotic',NULL),(28,4,'Family friendly meals','','2021-11-10 14:28:43','2021-11-10 14:28:43','family-friendly-meals',NULL);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggables` (
  `tag_id` bigint unsigned NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint unsigned NOT NULL,
  UNIQUE KEY `taggables_tag_id_taggable_id_taggable_type_unique` (`tag_id`,`taggable_id`,`taggable_type`),
  KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `taggables` WRITE;
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `slug` json NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_column` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `team_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_invitations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `team_invitations` WRITE;
/*!40000 ALTER TABLE `team_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_invitations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `meetings_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meetings_user_id_foreign` (`user_id`),
  KEY `user_meetings_meetings_id_foreign` (`meetings_id`),
  CONSTRAINT `user_meetings_meetings_id_foreign` FOREIGN KEY (`meetings_id`) REFERENCES `meetings` (`id`),
  CONSTRAINT `user_meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_meetings` WRITE;
/*!40000 ALTER TABLE `user_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meetings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` smallint NOT NULL DEFAULT '5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_reviews_user_id_foreign` (`user_id`),
  KEY `user_reviews_class_id_foreign` (`class_id`),
  CONSTRAINT `user_reviews_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
INSERT INTO `user_reviews` VALUES (1,9,3,'I can\'t see you?\' She was a sound of many footsteps, and Alice thought to herself. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, timidly; \'some of the miserable.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(2,6,1,'I think I can go back by railway,\' she said to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have dropped them, I.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(3,7,1,'Beautiful, beautiful Soup! Soup of the house, and the second thing is to find my way into a small passage, not much surprised at her as she could remember about ravens and writing-desks, which.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(4,3,3,'Cat, as soon as it was certainly too much of a bottle. They all returned from him to you, Though they were IN the well,\' Alice said very politely, feeling quite pleased to find her in an undertone.',2,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(5,6,4,'Alice, \'as all the jurymen are back in a hoarse, feeble voice: \'I heard the Rabbit came up to the Mock Turtle, and said to herself. (Alice had been looking over their heads. She felt very lonely and.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(6,3,1,'Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Hatter. \'You might just as if she had found her head down to look over their.',2,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(7,7,5,'WOULD not remember ever having heard of one,\' said Alice, surprised at her for a moment to think about it, and talking over its head. \'Very uncomfortable for the hedgehogs; and in his throat,\' said.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(8,2,5,'Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have none, Why, I do it again and again.\' \'You are old,\' said the Dormouse. \'Don\'t.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(9,8,1,'I\'ve got to go nearer till she got used to do:-- \'How doth the little creature down, and felt quite unhappy at the cook till his eyes were nearly out of the busy farm-yard--while the lowing of the.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(10,8,1,'Dormouse\'s place, and Alice thought to herself. Imagine her surprise, when the Rabbit began. Alice gave a little house in it about four feet high. \'I wish I hadn\'t gone down that rabbit-hole--and.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(11,5,5,'Alice. \'Stand up and walking off to other parts of the bread-and-butter. Just at this moment the King, and he went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, \'Really, my dear, I.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(12,3,1,'I to get through the little door, so she helped herself to about two feet high: even then she walked sadly down the hall. After a minute or two. \'They couldn\'t have done that, you know,\' the Mock.',2,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(13,3,3,'Duchess. \'Everything\'s got a moral, if only you can have no sort of life! I do wonder what they\'ll do next! If they had been would have this cat removed!\' The Queen had never had fits, my dear, YOU.',2,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(14,9,3,'I suppose.\' So she went on, turning to the baby, and not to be seen--everything seemed to be talking in his sleep, \'that \"I like what I used to it in less than no time she\'d have everybody executed.',3,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(15,9,5,'At last the Caterpillar angrily, rearing itself upright as it spoke. \'As wet as ever,\' said Alice indignantly, and she said to herself; \'I should like to drop the jar for fear of killing somebody.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(16,4,5,'I must be removed,\' said the Caterpillar. \'Well, I shan\'t go, at any rate,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Cat, and vanished. Alice was a large fan in the same tone.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(17,7,5,'I had it written down: but I hadn\'t begun my tea--not above a week or so--and what with the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting in the grass, merely.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(18,2,1,'It was so much about a whiting before.\' \'I can tell you my history, and you\'ll understand why it is to give the hedgehog a blow with its arms folded, frowning like a writing-desk?\' \'Come, we shall.',2,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(19,6,3,'CURTSEYING as you\'re falling through the neighbouring pool--she could hear the rattle of the right-hand bit to try the effect: the next verse,\' the Gryphon answered, very nearly getting up and ran.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(20,2,2,'YOU like cats if you want to go and get in at the Duchess began in a moment. \'Let\'s go on till you come to the Dormouse, without considering at all for any lesson-books!\' And so she felt that it.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(21,7,1,'You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great curiosity. \'It\'s a mineral, I THINK,\' said Alice. \'I\'ve tried every way, and the words.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(22,9,4,'Dinah, if I can say.\' This was not otherwise than what you like,\' said the Queen, \'and take this young lady to see if she did not like to go through next walking about at the Duchess was VERY ugly.',2,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(23,6,1,'I don\'t know,\' he went on muttering over the edge with each hand. \'And now which is which?\' she said to herself that perhaps it was growing, and growing, and she could see this, as she listened, or.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(24,7,5,'Five, \'and I\'ll tell you how it was talking in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into her eyes--and still as she could not make out what it was a.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(25,1,4,'As soon as look at them--\'I wish they\'d get the trial done,\' she thought, and it set to work, and very soon finished off the subjects on his spectacles and looked into its eyes again, to see the.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(26,6,1,'Hatter replied. \'Of course twinkling begins with an M--\' \'Why with an M--\' \'Why with an important air, \'are you all ready? This is the same as they came nearer, Alice could only hear whispers now.',4,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(27,8,5,'Bill\'s place for a few minutes, and began to feel which way you can;--but I must sugar my hair.\" As a duck with its arms and frowning at the stick, running a very decided tone: \'tell her something.',3,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(28,6,5,'I can guess that,\' she added in a whisper.) \'That would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the thing at all. \'But perhaps it was certainly too.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(29,5,5,'Who in the pool rippling to the door, and the beak-- Pray how did you ever eat a little sharp bark just over her head on her lap as if a fish came to ME, and told me you had been to the baby, it was.',1,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL),(30,1,1,'WILL be a grin, and she felt sure she would keep, through all her knowledge of history, Alice had not gone (We know it was all very well to introduce some other subject of conversation. \'Are.',5,'2021-11-10 14:28:56','2021-11-10 14:28:56',NULL);
/*!40000 ALTER TABLE `user_reviews` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `is_creator` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test1','test1@example.com','user',0,NULL,'$2y$10$RZafnvC7QwuAce5xGELqS.ZSiMrvh.7eLB9JG3reMhYh6Fmk0c.XW',NULL,NULL,NULL,NULL,'2021-11-10 14:27:24','2021-11-10 14:27:24',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(2,'test2','test2@example.com','user',0,NULL,'$2y$10$Wl6GMTaKWaKCaRfwUNOlluKiRQrPqpAV1ONnqnAVo3blKPptyQUAy',NULL,NULL,NULL,NULL,'2021-11-10 14:27:27','2021-11-10 14:27:27',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(3,'test3','test3@example.com','user',0,NULL,'$2y$10$xPHaRO.S0NcQht2JMhtSbONITc6n/W1K/jPlwCkSkKPCqq28KQbda',NULL,NULL,NULL,NULL,'2021-11-10 14:27:30','2021-11-10 14:27:30',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(4,'test4','test4@example.com','user',0,NULL,'$2y$10$4GXiq91GiZE0fquuA/kgg.6iNen3z.2ofhHntWsx63SEvGq.wThwa',NULL,NULL,NULL,NULL,'2021-11-10 14:27:32','2021-11-10 14:27:32',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(5,'test5','test5@example.com','user',0,NULL,'$2y$10$kSXnul9L68xcPl/u6U5k7.CiPYR8sfVzd64OTJw4vPnnCNVKepvVa',NULL,NULL,NULL,NULL,'2021-11-10 14:27:34','2021-11-10 14:27:34',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(6,'test6','test6@example.com','user',0,NULL,'$2y$10$0TYKVJcQLajwvaytScfFn./PAxTOVnnmtIRkX5aAeIABv7GuoHBBy',NULL,NULL,NULL,NULL,'2021-11-10 14:27:35','2021-11-10 14:27:35',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(7,'test7','test7@example.com','user',0,NULL,'$2y$10$OIdDw/BE5ckmKSGhZCQfLucv03JwVabAECrp1r867GWLTaLibJfa2',NULL,NULL,NULL,NULL,'2021-11-10 14:27:36','2021-11-10 14:27:36',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(8,'test8','test8@example.com','user',0,NULL,'$2y$10$1ZcOPom5929Dx1el1FPvEu51k179KuQXw1eIaHYKW7jKhfa/.WzRu',NULL,NULL,NULL,NULL,'2021-11-10 14:27:39','2021-11-10 14:27:39',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(9,'test9','test9@example.com','user',0,NULL,'$2y$10$1DT7mwjxn22WBiLNcKxbiOi7tUcU38C2rW29DTn/CGbi.1xZVxwPG',NULL,NULL,NULL,NULL,'2021-11-10 14:27:42','2021-11-10 14:27:42',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(10,'admin','admin@example.com','admin',0,NULL,'$2y$10$4ru.qQOComD9k6BbbzlfyeX.3Kh8ORtgVNArVyYFI4S76TvBPYrr2',NULL,NULL,NULL,NULL,'2021-11-10 14:27:43','2021-11-10 14:27:43',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}');
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

