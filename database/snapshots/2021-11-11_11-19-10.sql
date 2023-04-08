
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
INSERT INTO `categories` VALUES (1,'Popular','Hundreds of main dish recipes. Choose from top-rated comfort food, healthy, and vegetarian options. Find your dinner star now!','2021-11-11 05:28:08','2021-11-11 05:28:08','popular'),(2,'Meal time','Choose based on different meal times!','2021-11-11 05:28:08','2021-11-11 05:28:08','meal-time'),(3,'Cuisines','Choose from a wide range of cuisines.We offer classes for for varius cuisines','2021-11-11 05:28:08','2021-11-11 05:28:08','cuisines'),(4,'Diet Goal','Select based on various diet goals','2021-11-11 05:28:08','2021-11-11 05:28:08','diet-goal');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `class_subcategory` WRITE;
/*!40000 ALTER TABLE `class_subcategory` DISABLE KEYS */;
INSERT INTO `class_subcategory` VALUES (3,20,8,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(4,3,8,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(5,2,9,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(6,12,9,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(7,22,9,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(8,9,10,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(9,15,10,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(10,7,11,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(11,11,11,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(12,13,11,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(13,3,12,'2021-11-11 05:34:27','2021-11-11 05:34:27'),(14,11,12,'2021-11-11 05:34:27','2021-11-11 05:34:27'),(15,7,12,'2021-11-11 05:34:27','2021-11-11 05:34:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (8,1,'Jumbo Prawns Manchurian','Plum sauce is a fruit condiment that is prepared by cooking plums, garlic, vinegar, ginger, and sugar together. It\'s a semi-solid, semi-liquid sweet and sour sauce which is used alongside many Chinese dishes. Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure. Plum Sauce has a little spiciness due to the addition of red chili powder. If you don\'t like spicy food then you can adjust the quantity as per your taste. Overall, this sauce is really flavorful, you should give it a try.','2021-11-11 05:34:26','2021-11-11 05:34:26','Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure.','<ul><li>500 gm washed &amp; dried,peeled,chopped,de seeded plums</li><li>1 teaspoon red chilli powder</li><li>2 tablespoon vinegar</li><li>1/2 cup brown sugar</li><li>1 tablespoon minced garlic</li><li>1 tablespoon grated ginger</li><li>1 tablespoon light soya sauce</li></ul><div><br></div>','<div>&nbsp; &nbsp; <strong>Step 1 Prepare the sauce<br></strong><br></div><ul><li>To begin with this easy recipe, wash the plums and cut them. In a saucepan, add garlic, ginger, vinegar, sugar, chili powder, and plums. Stir to mix everything well.<br><br><strong>Step 2 Cook the sauce</strong><br><br></li><li>Cook the sauce on medium flame and let it come to a boil. Now, reduce the flame and simmer until the mixture becomes thick. Stir occasionally. Check if the plums have turned soft.<br><br></li></ul><div>&nbsp; &nbsp; &nbsp;<strong>Step 3 Add soya sauce</strong><br><br></div><ul><li>Switch off the gas flame and then add soya sauce. Stir to combine everything well.<br><br><strong>Step 4 Your Plum Sauce is ready</strong><br><br></li><li>Your Plum Sauce is ready. Let it cool at room temperature and store it an airtight container.</li></ul><div><br></div>','Grater','Intermediate',25,20.00,'jumbo-prawns-manchurian'),(9,2,'King Oyster Mushrooms from Scratch','Fond of stir-fries and mushrooms? Then combine the two together to make this super easy yet delish recipe. Made by stir-frying King Oyster Mushrooms in soya sauce, orange juice and a melange of spices, this tempting dish is indeed worth trying.Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack. You can serve it at parties or family dinners and people of all ages will love it. So, put on your chef\'s hat and try out this delicious recipe at home.','2021-11-11 05:34:26','2021-11-11 05:34:26','Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack.','<ul><li>1/4 cup extra virgin olive oil</li><li>1 teaspoon black pepper</li><li>3 cloves minced garlic</li><li>salt as required</li><li>chopped basil as required</li><li>4 tablespoon grated parmesan cheese</li><li>1 baguette</li><li>3 large diced tomato</li></ul><div><br></div>','<div>&nbsp; &nbsp; &nbsp;<strong>Step 1 Combine the spices in a bowl<br></strong><br></div><ul><li>In a bowl, add garlic, basil, salt, olive oil, and pepper. Mix them well.</li></ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; <strong>Step 2 Toss in tomatoes to the spice mixture<br></strong><br></div><ul><li>Toss in tomatoes and then sprinkle cheese on it. Mix well and freeze it for at least 45 mins.</li></ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; &nbsp;<strong>Step 3 Toast the bread slices<br></strong><br></div><ul><li>Bring the tomato mixture to room temperature. Cut the baguette loaf into slices and toast them until they turn light brown in color.</li></ul><div><br>&nbsp; &nbsp;<strong>Step 4 Top the bread slices with the mixture<br></strong><br></div><ul><li>Now, top the bread slices with the tomato mixture. Your Garlic Tomato Bruschetta is ready to serve. Enjoy.</li></ul><div><br></div><div><br></div>','Grater','Beginner',30,25.00,'king-oyster-mushrooms-from-scratch'),(10,3,'Indian Street Food','Turon is a popular snack made with bananas that belong to the Philippines. Originally, Turons are made by wrapping banana pieces in a spring roll wrapper and deep-fried to make them crispy. It is either dusted with sugar or coated in a caramel glaze prepared with sugar. Apart from banana, jackfruit, sweet potato, mango, cheddar cheese and coconut fillings are also stuffed in Turons. With its lip-smacking flavours, Turon is a popular street food amongst Filipinos.','2021-11-11 05:34:26','2021-11-11 05:34:26','These Turons are shallow-fried, which makes them healthy as well. Do try this recipe, rate it and let us know how it turned out to be.','<ul><li>1 1/2 kilograms mustard leaves</li><li>250 gm bathua saag</li><li>4 green chilli</li><li>3 large onion</li><li>1 teaspoon turmeric</li><li>4 tablespoon ghee</li><li>250 gm spinach</li><li>50 gm corn flour</li><li>20 cloves garlic</li><li>2 inches ginger</li><li>1 cup water</li></ul><div><br></div>','<ul><li><strong>Step 1 Clean all the leafy vegetables in running water<br></strong><br></li><li>Sarson da saag Is an authentic Punjabi delicacy, which can be prepared at home easily without putting in many efforts. Here’s how you can prepare this dish by following some simple steps given below. To begin with washing and cleaning the mustard leaves, spinach and bathua saag. To make it adulterant-free, soak the greens in lukewarm water and add a pinch of salt.</li></ul><div><br><br></div><ul><li><strong>Step 2 Pressure cook the leafy greens for half an hour<br></strong><br></li><li>After washing the leafy veggies properly, drain the excess water. Cut and peel the stems of mustard leaves before chopping, then finely chop all the leaves. Take a pressure cooker and cook all the leaves for half an hour approximately. Put in ginger and 10 garlic cloves along with the leaves. Let it cool for sometime.</li></ul><div><br></div><ul><li><strong>Step 3 Blend the cooked saag for 30 seconds and then prepare the tempering<br></strong><br></li><li>Take out the mixture and put it in a blender with 50 grams of cornflour and churn for 30 seconds. Mixture should remain a little lumpy. Heat 2 tablespoon ghee in a deep-frying vessel, when it has melted put in 10 cloves of finely chopped garlic. When the garlic has turned brown, add finely chopped onions and green chillies in a vessel.</li></ul><div><br></div>','Grater','Intermediate',45,20.00,'indian-street-food'),(11,4,'Smoked Salmon with Scrambled Eggs from Scratch','Bored of eating those regular scrambled eggs for breakfast? Don\'t worry, we have got your back. This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique. Not only it gives you loads of protein but fulfills your craving with its extra creamy flavor. Ditch your regular breakfast and try making this recipe. It would taste perfect with a toast or garlc bread.','2021-11-11 05:34:26','2021-11-11 05:34:26','This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique.','<ul><li>2 cup yoghurt (curd)</li><li>4 tablespoon honey</li><li>1/4 cup pomegranate seeds</li><li>1 Pinch powdered cinnamon</li><li>1 cup breadcrumbs</li><li>1/4 cup strawberry</li><li>1/4 cup blueberry</li><li>1 tablespoon chia seeds</li></ul><div><br></div>','<div><strong>&nbsp; &nbsp;Step 1 MIx the ingredients<br></strong><br></div><ul><li>In a bowl add yoghurt and honey. Mix them well. Now add chia seeds, a pinch of cinnamon powder, chopped strawberries, blueberries and pomegranate. Save some of the fruit for garnish. Mix everything well.</li></ul><div>&nbsp; &nbsp; <br><strong>&nbsp; Step 2 Layering<br></strong><br></div><ul><li>Now take a dessert bowl or glass and add a layer of breadcrumbs at the bottom and press it down properly with a spoon. Add a scoop of the yoghurt mixture and level it. Now add another layer of breadcrumbs and flatten it out. Again add a layer of fruit yoghurt. Repeat these steps to fill the bowl/glass till the top.</li></ul><div><br><strong>&nbsp; &nbsp; Step 3 Garnish and serve<br></strong><br></div><ul><li>Garnish with leftover fruits and serve. Enjoy the yummy and healthy pudding.</li></ul><div><br></div><div><br></div>','Grater','beginner',20,25.00,'smoked-salmon-with-scrambled-egg-from-scratch'),(12,5,'Baked Avocado Coats','Baked Avocado Boats as the name suggests are avocados filled with eggs. There\'s no doubt that the taste is as lavish as its name. The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it. A super nutritious recipe that will keep you fuller for a longer time. Let\'s know if you loved eating Baked Avocado Boats.','2021-11-11 05:34:26','2021-11-11 05:34:26','The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it.','<ul><li>kosher salt as required</li><li>4 egg</li><li>chopped chives as required</li><li>powdered black pepper as required</li><li>2 halved pitted avocados</li></ul><div><br></div>','<div>&nbsp; &nbsp; <strong>Step 1 Scoop the avocados out</strong><br><br></div><ul><li>Preheat the oven to 180C. Then, scoop out about 1tbsp avocado from the cavity so that you can crack open the egg. Repeat this process for the rest 3 halves.</li></ul><div>&nbsp;<br>&nbsp; &nbsp;<strong>Step 2 Season the avocados</strong><br><br></div><ul><li>Now, season the avocados By sprinkling some salt and pepper on the top of egg whites. Now bake the avocados for about 20-25 mins. You can cover the avocados with a foil to avoid browning.</li></ul><div><br>&nbsp; &nbsp; <strong>Step 3 Your Baked Avocado Boats are ready to serve<br></strong><br></div><ul><li>Once baked, take the avocados out and garnish them with chopped chives, chili flakes and oregano. Your Avocado Baked Boats are ready to serve hot. Enjoy.</li></ul><div><br></div>','Grater','Beginner',20,25.00,'baked-avocado-coats');
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
INSERT INTO `media` VALUES (1,'App\\Models\\User',1,'a4d8720a-e1cb-46bc-a4ee-22911922556f','users','1200x800','1200x800.jpeg','image/jpeg','public','public',107465,'[]','[]','[]','[]',1,'2021-11-11 05:27:53','2021-11-11 05:27:53'),(2,'App\\Models\\User',2,'ba05a124-3831-4ace-9a95-9881d9c3e282','users','1200x800','1200x800.jpeg','image/jpeg','public','public',69374,'[]','[]','[]','[]',2,'2021-11-11 05:27:56','2021-11-11 05:27:56'),(3,'App\\Models\\User',3,'b85515dd-8c27-4520-aa98-4a1f27f0f02d','users','1200x800','1200x800.jpeg','image/jpeg','public','public',91083,'[]','[]','[]','[]',3,'2021-11-11 05:27:57','2021-11-11 05:27:57'),(4,'App\\Models\\User',4,'c45acf87-43a3-4fab-a9a7-69fd0a02b3e2','users','1200x800','1200x800.jpeg','image/jpeg','public','public',214114,'[]','[]','[]','[]',4,'2021-11-11 05:27:58','2021-11-11 05:27:58'),(5,'App\\Models\\User',5,'f7a9d6ee-1901-4189-b26a-cb0d107d1ba0','users','1200x800','1200x800.jpeg','image/jpeg','public','public',258663,'[]','[]','[]','[]',5,'2021-11-11 05:27:59','2021-11-11 05:27:59'),(6,'App\\Models\\User',6,'2614c669-be6b-4a59-88b7-8e2ecf9dc3ff','users','1200x800','1200x800.jpeg','image/jpeg','public','public',335148,'[]','[]','[]','[]',6,'2021-11-11 05:28:01','2021-11-11 05:28:01'),(7,'App\\Models\\User',7,'2934ed66-da31-4831-84fc-2d511f4b12d6','users','1200x800','1200x800.jpeg','image/jpeg','public','public',231369,'[]','[]','[]','[]',7,'2021-11-11 05:28:04','2021-11-11 05:28:04'),(8,'App\\Models\\User',8,'60b4a2f5-caed-4e06-8f8a-993eb81e2aee','users','1200x800','1200x800.jpeg','image/jpeg','public','public',93017,'[]','[]','[]','[]',8,'2021-11-11 05:28:05','2021-11-11 05:28:05'),(9,'App\\Models\\User',9,'91ccf395-f2d2-4025-ac8a-e19481b326d0','users','1200x800','1200x800.jpeg','image/jpeg','public','public',210186,'[]','[]','[]','[]',9,'2021-11-11 05:28:06','2021-11-11 05:28:06'),(10,'App\\Models\\User',10,'55530286-c77c-42de-90da-604c349c184a','users','1200x800','1200x800.jpeg','image/jpeg','public','public',197668,'[]','[]','[]','[]',10,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(11,'App\\Models\\Category',1,'1420ff29-8dbe-42d6-b23e-f79d4326cdfb','categories','popular','popular.jpeg','image/jpeg','public','public',12838,'[]','[]','{\"thumb\": true}','[]',11,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(12,'App\\Models\\Category',2,'73f7467b-20b6-4f34-ad12-877176b08934','categories','meal-time','meal-time.jpeg','image/jpeg','public','public',9340,'[]','[]','{\"thumb\": true}','[]',12,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(13,'App\\Models\\Category',3,'645407fd-66b2-4080-940f-f780987eacbf','categories','cuisines','cuisines.jpeg','image/jpeg','public','public',17133,'[]','[]','{\"thumb\": true}','[]',13,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(14,'App\\Models\\Category',4,'9a898857-2ec2-4066-a6bd-0c981967aadc','categories','diet-goal','diet-goal.jpeg','image/jpeg','public','public',10474,'[]','[]','{\"thumb\": true}','[]',14,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(15,'App\\Models\\Subcategory',1,'e7be1068-617c-4e5d-a88a-2213cda0100c','subcategories','15-min-breakfast','15-min-breakfast.jpeg','image/jpeg','public','public',15788,'[]','[]','[]','[]',15,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(16,'App\\Models\\Subcategory',2,'7710fd27-c63a-4df3-8eb1-16ed83a18e80','subcategories','15-min-dinner','15-min-dinner.jpeg','image/jpeg','public','public',13980,'[]','[]','[]','[]',16,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(17,'App\\Models\\Subcategory',3,'3e67e9f2-2f5d-47f7-9295-a481e21ddfdf','subcategories','longer-cook','longer-cook.jpeg','image/jpeg','public','public',7994,'[]','[]','[]','[]',17,'2021-11-11 05:28:08','2021-11-11 05:28:08'),(18,'App\\Models\\Subcategory',4,'b0588cd2-4160-4852-97f7-4e3b2a17bb33','subcategories','thanks-giving','thanks-giving.jpeg','image/jpeg','public','public',15639,'[]','[]','[]','[]',18,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(19,'App\\Models\\Subcategory',5,'fed7e66d-297f-42e1-9c57-8043499bacec','subcategories','weekly-meal-prep','weekly-meal-prep.jpeg','image/jpeg','public','public',11196,'[]','[]','[]','[]',19,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(20,'App\\Models\\Subcategory',6,'4b0bf958-974b-4c1b-94f7-eb33632b004c','subcategories','date-night','date-night.jpeg','image/jpeg','public','public',15516,'[]','[]','[]','[]',20,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(21,'App\\Models\\Subcategory',7,'7152dd10-8085-4603-b881-b6f3e03f58a5','subcategories','30-min-lunch','30-min-lunch.jpeg','image/jpeg','public','public',15598,'[]','[]','[]','[]',21,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(22,'App\\Models\\Subcategory',8,'7f38393e-6365-41dc-8c75-6383b42e0c81','subcategories','20-min-dinner','20-min-dinner.jpeg','image/jpeg','public','public',15574,'[]','[]','[]','[]',22,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(23,'App\\Models\\Subcategory',9,'e4599561-f39d-4b9f-8817-34ec06ab1297','subcategories','breakfast','breakfast.jpeg','image/jpeg','public','public',11155,'[]','[]','[]','[]',23,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(24,'App\\Models\\Subcategory',10,'80f7f6c5-f7b1-4f2a-8a46-3741d3ca596e','subcategories','brunch','brunch.jpeg','image/jpeg','public','public',15956,'[]','[]','[]','[]',24,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(25,'App\\Models\\Subcategory',11,'df077947-063c-449c-9441-99f88727e569','subcategories','lunch','lunch.jpeg','image/jpeg','public','public',14121,'[]','[]','[]','[]',25,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(26,'App\\Models\\Subcategory',12,'1840a447-1705-49a3-bece-3102fe1cb289','subcategories','dinner','dinner.jpeg','image/jpeg','public','public',15578,'[]','[]','[]','[]',26,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(27,'App\\Models\\Subcategory',13,'577804b1-1019-4459-a6f7-a436f18b50a9','subcategories','chinese','chinese.jpeg','image/jpeg','public','public',18395,'[]','[]','[]','[]',27,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(28,'App\\Models\\Subcategory',14,'6c983e2d-0a65-4298-bf26-443ed4cf464c','subcategories','american','american.jpeg','image/jpeg','public','public',11673,'[]','[]','[]','[]',28,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(29,'App\\Models\\Subcategory',15,'8fb0c863-c6ea-4304-b7e3-2b666fa6b838','subcategories','indian','indian.jpeg','image/jpeg','public','public',15346,'[]','[]','[]','[]',29,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(30,'App\\Models\\Subcategory',16,'9a0406ec-1054-478c-bd98-2eca39453839','subcategories','thai','thai.jpeg','image/jpeg','public','public',13519,'[]','[]','[]','[]',30,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(31,'App\\Models\\Subcategory',17,'f99af78b-b75a-44c3-8655-cef24032142d','subcategories','italian','italian.jpeg','image/jpeg','public','public',16632,'[]','[]','[]','[]',31,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(32,'App\\Models\\Subcategory',18,'4ba41963-dfab-4c3f-8115-0244db3b49fa','subcategories','asian','asian.jpeg','image/jpeg','public','public',16632,'[]','[]','[]','[]',32,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(33,'App\\Models\\Subcategory',19,'7b80185a-c035-4374-8e3b-502d4b44175a','subcategories','fusion','fusion.jpeg','image/jpeg','public','public',15784,'[]','[]','[]','[]',33,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(34,'App\\Models\\Subcategory',20,'b0d4312d-fc69-4429-a0c6-81a99983acd2','subcategories','continental','continental.jpeg','image/jpeg','public','public',17456,'[]','[]','[]','[]',34,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(35,'App\\Models\\Subcategory',21,'4f8388b5-2287-4d83-9deb-c3cf509b7dc5','subcategories','gain-weight','gain-weight.jpeg','image/jpeg','public','public',13741,'[]','[]','[]','[]',35,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(36,'App\\Models\\Subcategory',22,'cdb6d918-6459-407a-a4a9-9cd955fdb5fa','subcategories','lose-weight','lose-weight.jpeg','image/jpeg','public','public',12501,'[]','[]','[]','[]',36,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(37,'App\\Models\\Subcategory',23,'c789356f-8689-4058-9bb7-fd1400f76e47','subcategories','cook-more-diverse-recipes','cook-more-diverse-recipes.jpeg','image/jpeg','public','public',14829,'[]','[]','[]','[]',37,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(38,'App\\Models\\Subcategory',24,'70420eea-8ee8-4d3c-afd8-2618b7411761','subcategories','cook-tastier-tried-and-trues','cook-tastier-tried-and-trues.jpeg','image/jpeg','public','public',10647,'[]','[]','[]','[]',38,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(39,'App\\Models\\Subcategory',25,'2bff0294-bc89-4934-b6a7-53c7eb477527','subcategories','try-something-exotic','try-something-exotic.jpeg','image/jpeg','public','public',11055,'[]','[]','[]','[]',39,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(40,'App\\Models\\Subcategory',26,'9185d949-73eb-477e-8a28-c448171e0e59','subcategories','family-friendly-meals','family-friendly-meals.jpeg','image/jpeg','public','public',13592,'[]','[]','[]','[]',40,'2021-11-11 05:28:09','2021-11-11 05:28:09'),(41,'App\\Models\\Classes',2,'8ae1f392-bf01-4751-a86a-cd381816fa43','classes_hero_image','jumbo-prawns-manchurian','jumbo-prawns-manchurian.jpeg','image/jpeg','public','public',11635,'[]','[]','{\"thumb\": true}','[]',41,'2021-11-11 05:30:49','2021-11-11 05:30:49'),(42,'App\\Models\\Classes',6,'0ede6ddc-d1a0-4e31-b9c8-ce6d0f57627b','classes_hero_image','jumbo-prawns-manchurian','jumbo-prawns-manchurian.jpeg','image/jpeg','public','public',11635,'[]','[]','{\"thumb\": true}','[]',42,'2021-11-11 05:33:42','2021-11-11 05:33:42'),(43,'App\\Models\\Classes',8,'7fa0d284-a1a3-478a-b5f0-a783ef39587f','classes_hero_image','jumbo-prawns-manchurian','jumbo-prawns-manchurian.jpeg','image/jpeg','public','public',11635,'[]','[]','{\"thumb\": true}','[]',43,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(44,'App\\Models\\Classes',9,'48bfd014-e25f-4cec-bdda-28f0b868aa73','classes_hero_image','king-oyster-mushrooms','king-oyster-mushrooms.jpeg','image/jpeg','public','public',9302,'[]','[]','{\"thumb\": true}','[]',44,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(45,'App\\Models\\Classes',10,'176ea798-67a5-444d-b63f-962787ef3b01','classes_hero_image','indian-street-food','indian-street-food.jpeg','image/jpeg','public','public',17603,'[]','[]','{\"thumb\": true}','[]',45,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(46,'App\\Models\\Classes',11,'c852504c-01ce-4ed3-ba48-54cc6735503c','classes_hero_image','smoked-salmon-with-scrambled-egg','smoked-salmon-with-scrambled-egg.jpeg','image/jpeg','public','public',4998,'[]','[]','{\"thumb\": true}','[]',46,'2021-11-11 05:34:26','2021-11-11 05:34:26'),(47,'App\\Models\\Classes',12,'c90b8ffe-212e-4ddd-845c-eacbbd20c2e0','classes_hero_image','baked-avocado-coats','baked-avocado-coats.jpeg','image/jpeg','public','public',8099,'[]','[]','{\"thumb\": true}','[]',47,'2021-11-11 05:34:27','2021-11-11 05:34:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,1,'test meeting 1','2021-11-11 10:58:08','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(2,2,'test meeting 2','2021-11-11 10:58:08','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(3,2,'test meeting 3','2021-11-11 10:58:08','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(4,3,'test meeting 4','2021-11-11 10:58:08','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(5,3,'test meeting 5','2021-11-11 10:58:08','upcoming','https://zoom-link.example','https://video.example',NULL,NULL,NULL),(6,10,'test meeting 1','2021-11-11 11:12:12','upcoming','https://zoom-link.example','https://video.example','2021-11-11 05:48:46','2021-11-11 05:48:46',NULL),(7,11,'test meeting 2','2021-11-12 02:12:12','upcoming','https://zoom-link.example','https://video.example','2021-11-11 05:48:46','2021-11-11 05:48:46',NULL),(8,8,'test meeting 3','2021-11-14 01:12:12','upcoming','https://zoom-link.example','https://video.example','2021-11-11 05:48:46','2021-11-11 05:48:46',NULL),(9,10,'test meeting 4','2021-11-16 04:12:12','upcoming','https://zoom-link.example','https://video.example','2021-11-11 05:48:46','2021-11-11 05:48:46',NULL),(10,11,'test meeting 5','2021-11-17 11:12:12','upcoming','https://zoom-link.example','https://video.example','2021-11-11 05:48:46','2021-11-11 05:48:46',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,1,'15 Min Breakfast','','2021-11-11 05:28:08','2021-11-11 05:28:08','15-min-breakfast',NULL),(2,1,'15 Min Dinner','','2021-11-11 05:28:08','2021-11-11 05:28:08','15-min-dinner',NULL),(3,1,'Longer Cook','','2021-11-11 05:28:08','2021-11-11 05:28:08','longer-cook',NULL),(4,1,'Thanks Giving','','2021-11-11 05:28:08','2021-11-11 05:28:08','thanks-giving',NULL),(5,1,'Weekly Meal Prep','','2021-11-11 05:28:09','2021-11-11 05:28:09','weekly-meal-prep',NULL),(6,1,'Date Night','','2021-11-11 05:28:09','2021-11-11 05:28:09','date-night',NULL),(7,1,'30 min Lunch','','2021-11-11 05:28:09','2021-11-11 05:28:09','30-min-lunch',NULL),(8,1,'20 min Dinner','','2021-11-11 05:28:09','2021-11-11 05:28:09','20-min-dinner',NULL),(9,2,'Breakfast','','2021-11-11 05:28:09','2021-11-11 05:28:09','breakfast',NULL),(10,2,'Brunch','','2021-11-11 05:28:09','2021-11-11 05:28:09','brunch',NULL),(11,2,'Lunch','','2021-11-11 05:28:09','2021-11-11 05:28:09','lunch',NULL),(12,2,'Dinner','','2021-11-11 05:28:09','2021-11-11 05:28:09','dinner',NULL),(13,3,'Chinese','','2021-11-11 05:28:09','2021-11-11 05:28:09','chinese',NULL),(14,3,'American','','2021-11-11 05:28:09','2021-11-11 05:28:09','american',NULL),(15,3,'Indian','','2021-11-11 05:28:09','2021-11-11 05:28:09','indian',NULL),(16,3,'Thai','','2021-11-11 05:28:09','2021-11-11 05:28:09','thai',NULL),(17,3,'Italian','','2021-11-11 05:28:09','2021-11-11 05:28:09','italian',NULL),(18,3,'Asian','','2021-11-11 05:28:09','2021-11-11 05:28:09','asian',NULL),(19,3,'Fusion','','2021-11-11 05:28:09','2021-11-11 05:28:09','fusion',NULL),(20,3,'Continental','','2021-11-11 05:28:09','2021-11-11 05:28:09','continental',NULL),(21,4,'Gain Weight','','2021-11-11 05:28:09','2021-11-11 05:28:09','gain-weight',NULL),(22,4,'Lose Weight','','2021-11-11 05:28:09','2021-11-11 05:28:09','lose-weight',NULL),(23,4,'Cook more diverse recipes','','2021-11-11 05:28:09','2021-11-11 05:28:09','cook-more-diverse-recipes',NULL),(24,4,'Cook tastier tried and trues','','2021-11-11 05:28:09','2021-11-11 05:28:09','cook-tastier-tried-and-trues',NULL),(25,4,'Try something exotic','','2021-11-11 05:28:09','2021-11-11 05:28:09','try-something-exotic',NULL),(26,4,'Family friendly meals','','2021-11-11 05:28:09','2021-11-11 05:28:09','family-friendly-meals',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
INSERT INTO `user_reviews` VALUES (6,1,11,'Everyone LOVED this!',5,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(7,2,8,'I am trying to find the original recipe . No cool whip or anything else Just the basics.',3,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(8,2,10,'I am trying to find the original recipe . No cool whip or anything else Just the basics.',3,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(9,3,8,'To lighten the recipe up I used sugar free Jell-O and Cool Whip Free. I also used 2 oz shot glasses as my serving glasses. Not only was this a very tasty and eye-appealing dessert but also fit right into my diet.Thanks.',5,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(10,3,10,'To lighten the recipe up I used sugar free Jell-O and Cool Whip Free. I also used 2 oz shot glasses as my serving glasses. Not only was this a very tasty and eye-appealing dessert but also fit right into my diet.Thanks.',5,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(11,4,8,'Great recipe! It brought back old memories when I made this for my children in the early seventies using Dream Whip.',4,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(12,4,11,'Great recipe! It brought back old memories when I made this for my children in the early seventies using Dream Whip.',4,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(13,5,9,'Easy to make. Very smooth tasting. Loved by kids and adults. In fact my husband wants me to make it for Easter.',5,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL),(14,5,10,'Easy to make. Very smooth tasting. Loved by kids and adults. In fact my husband wants me to make it for Easter.',5,'2021-11-11 05:42:12','2021-11-11 05:42:12',NULL);
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
INSERT INTO `users` VALUES (1,'test1','test1@example.com','user',0,NULL,'$2y$10$M009uBuMf7SGy5tlhuzp1.Gh/yNv2gB8z8xuuY.BtYXn3dRtXjdwe',NULL,NULL,NULL,NULL,'2021-11-11 05:27:51','2021-11-11 05:27:51',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(2,'test2','test2@example.com','user',0,NULL,'$2y$10$0r58ICoAzIr2MVaWACoumeKHXu.ASOvR6vl.Gzzs24STf0r2jIWC6',NULL,NULL,NULL,NULL,'2021-11-11 05:27:53','2021-11-11 05:27:53',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(3,'test3','test3@example.com','user',0,NULL,'$2y$10$M7MDCWwv/ZSo3AAR4X0aEuvesUc5oZgPfz4M3NfgY5UROi7c8YbbC',NULL,NULL,NULL,NULL,'2021-11-11 05:27:56','2021-11-11 05:27:56',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(4,'test4','test4@example.com','user',0,NULL,'$2y$10$xGC0L/tYcmB9gW7bPJ8xKeppFKkMrehE4mkUqAM1WUGv8khgWmCGa',NULL,NULL,NULL,NULL,'2021-11-11 05:27:57','2021-11-11 05:27:57',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(5,'test5','test5@example.com','user',0,NULL,'$2y$10$7QHfsX6REOK/2vOaiDLgDOnkItza16VsrSXio22KN82WPOy2J3KgW',NULL,NULL,NULL,NULL,'2021-11-11 05:27:58','2021-11-11 05:27:58',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(6,'test6','test6@example.com','user',0,NULL,'$2y$10$8RUIdRowyPySp3VDgAXWA.XIoa0/5RVPgDSXst7gcHuwm1htSDXXy',NULL,NULL,NULL,NULL,'2021-11-11 05:27:59','2021-11-11 05:27:59',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(7,'test7','test7@example.com','user',0,NULL,'$2y$10$EvLBJ.3jnzzRvgy5n/dlTu5MlTL3taAAnC4oAZjViAZBOQdgEOnEq',NULL,NULL,NULL,NULL,'2021-11-11 05:28:01','2021-11-11 05:28:01',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(8,'test8','test8@example.com','user',0,NULL,'$2y$10$x26lIUMsSLqDql3UYP6CWubL9OfrDEAW86/cGxwehhUilLIApSx6y',NULL,NULL,NULL,NULL,'2021-11-11 05:28:04','2021-11-11 05:28:04',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(9,'test9','test9@example.com','user',0,NULL,'$2y$10$do0CG1G2vZnhgyvHFBgrCOu315ZUdj9/hkByyX5/7vS2TdeT8SUSS',NULL,NULL,NULL,NULL,'2021-11-11 05:28:05','2021-11-11 05:28:05',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}'),(10,'admin','admin@example.com','admin',0,NULL,'$2y$10$VNlJhAQDbcmPpLbxC/qPFuG0oIKVELNcGkrgUUUKE4UEBIeKrACNS',NULL,NULL,NULL,NULL,'2021-11-11 05:28:07','2021-11-11 05:28:07',NULL,'{\"source_id\": \"test-project\", \"hurdle_process\": \"started\"}');
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

