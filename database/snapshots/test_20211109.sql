
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `action_events` WRITE;
/*!40000 ALTER TABLE `action_events` DISABLE KEYS */;
INSERT INTO `action_events` VALUES (1,'94d64578-4dfb-4051-a988-a37984b8e81a',10,'Update','App\\Models\\Classes',5,'App\\Models\\Classes',5,'App\\Models\\Classes',5,'','finished','','2021-11-09 12:18:14','2021-11-09 12:18:14','{\"short_description\":\"The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it.\",\"ingredients\":null,\"steps\":null}','{\"short_description\":\"<div>The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it.<\\/div>\",\"ingredients\":\"<ul><li>kosher salt as required<\\/li><li>4 egg<\\/li><li>chopped chives as required<\\/li><li>powdered black pepper as required<\\/li><li>2 halved pitted avocados<\\/li><\\/ul><div><br><\\/div>\",\"steps\":\"<div>&nbsp; &nbsp; <strong>Step 1 Scoop the avocados out<\\/strong><br><br><\\/div><ul><li>Preheat the oven to 180C. Then, scoop out about 1tbsp avocado from the cavity so that you can crack open the egg. Repeat this process for the rest 3 halves.<\\/li><\\/ul><div>&nbsp;<br>&nbsp; &nbsp;<strong>Step 2 Season the avocados<\\/strong><br><br><\\/div><ul><li>Now, season the avocados By sprinkling some salt and pepper on the top of egg whites. Now bake the avocados for about 20-25 mins. You can cover the avocados with a foil to avoid browning.<\\/li><\\/ul><div><br>&nbsp; &nbsp; <strong>Step 3 Your Baked Avocado Boats are ready to serve<br><\\/strong><br><\\/div><ul><li>Once baked, take the avocados out and garnish them with chopped chives, chili flakes and oregano. Your Avocado Baked Boats are ready to serve hot. Enjoy.<\\/li><\\/ul><div><br><\\/div>\"}'),(2,'94d64659-06ec-4d8b-b908-1f5b8993803f',10,'Update','App\\Models\\Classes',4,'App\\Models\\Classes',4,'App\\Models\\Classes',4,'','finished','','2021-11-09 12:20:41','2021-11-09 12:20:41','{\"short_description\":\"This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique.\",\"ingredients\":null,\"steps\":null}','{\"short_description\":\"<div>This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique.<\\/div>\",\"ingredients\":\"<ul><li>2 cup yoghurt (curd)<\\/li><li>4 tablespoon honey<\\/li><li>1\\/4 cup pomegranate seeds<\\/li><li>1 Pinch powdered cinnamon<\\/li><li>1 cup breadcrumbs<\\/li><li>1\\/4 cup strawberry<\\/li><li>1\\/4 cup blueberry<\\/li><li>1 tablespoon chia seeds<\\/li><\\/ul><div><br><\\/div>\",\"steps\":\"<div><strong>&nbsp; &nbsp;Step 1 MIx the ingredients<br><\\/strong><br><\\/div><ul><li>In a bowl add yoghurt and honey. Mix them well. Now add chia seeds, a pinch of cinnamon powder, chopped strawberries, blueberries and pomegranate. Save some of the fruit for garnish. Mix everything well.<\\/li><\\/ul><div>&nbsp; &nbsp; <br><strong>&nbsp; Step 2 Layering<br><\\/strong><br><\\/div><ul><li>Now take a dessert bowl or glass and add a layer of breadcrumbs at the bottom and press it down properly with a spoon. Add a scoop of the yoghurt mixture and level it. Now add another layer of breadcrumbs and flatten it out. Again add a layer of fruit yoghurt. Repeat these steps to fill the bowl\\/glass till the top.<\\/li><\\/ul><div><br><strong>&nbsp; &nbsp; Step 3 Garnish and serve<br><\\/strong><br><\\/div><ul><li>Garnish with leftover fruits and serve. Enjoy the yummy and healthy pudding.<\\/li><\\/ul><div><br><\\/div><div><br><\\/div>\"}'),(3,'94d64709-7e0b-4ef5-a1f6-ec8a91b2f24e',10,'Update','App\\Models\\Classes',3,'App\\Models\\Classes',3,'App\\Models\\Classes',3,'','finished','','2021-11-09 12:22:37','2021-11-09 12:22:37','{\"short_description\":\"These Turons are shallow-fried, which makes them healthy as well. Do try this recipe, rate it and let us know how it turned out to be.\",\"ingredients\":null,\"steps\":null}','{\"short_description\":\"<div>These Turons are shallow-fried, which makes them healthy as well. Do try this recipe, rate it and let us know how it turned out to be.<\\/div>\",\"ingredients\":\"<ul><li>1 1\\/2 kilograms mustard leaves<\\/li><li>250 gm bathua saag<\\/li><li>4 green chilli<\\/li><li>3 large onion<\\/li><li>1 teaspoon turmeric<\\/li><li>4 tablespoon ghee<\\/li><li>250 gm spinach<\\/li><li>50 gm corn flour<\\/li><li>20 cloves garlic<\\/li><li>2 inches ginger<\\/li><li>1 cup water<\\/li><\\/ul><div><br><\\/div>\",\"steps\":\"<ul><li><strong>Step 1 Clean all the leafy vegetables in running water<br><\\/strong><br><\\/li><li>Sarson da saag Is an authentic Punjabi delicacy, which can be prepared at home easily without putting in many efforts. Here\\u2019s how you can prepare this dish by following some simple steps given below. To begin with washing and cleaning the mustard leaves, spinach and bathua saag. To make it adulterant-free, soak the greens in lukewarm water and add a pinch of salt.<\\/li><\\/ul><div><br><br><\\/div><ul><li><strong>Step 2 Pressure cook the leafy greens for half an hour<br><\\/strong><br><\\/li><li>After washing the leafy veggies properly, drain the excess water. Cut and peel the stems of mustard leaves before chopping, then finely chop all the leaves. Take a pressure cooker and cook all the leaves for half an hour approximately. Put in ginger and 10 garlic cloves along with the leaves. Let it cool for sometime.<\\/li><\\/ul><div><br><\\/div><ul><li><strong>Step 3 Blend the cooked saag for 30 seconds and then prepare the tempering<br><\\/strong><br><\\/li><li>Take out the mixture and put it in a blender with 50 grams of cornflour and churn for 30 seconds. Mixture should remain a little lumpy. Heat 2 tablespoon ghee in a deep-frying vessel, when it has melted put in 10 cloves of finely chopped garlic. When the garlic has turned brown, add finely chopped onions and green chillies in a vessel.<\\/li><\\/ul><div><br><\\/div>\"}'),(4,'94d647c5-82b2-413e-8c8d-dc5e3d4c55a4',10,'Update','App\\Models\\Classes',2,'App\\Models\\Classes',2,'App\\Models\\Classes',2,'','finished','','2021-11-09 12:24:40','2021-11-09 12:24:40','{\"short_description\":\"Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack.\",\"ingredients\":null,\"steps\":null}','{\"short_description\":\"<div>Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack.<\\/div>\",\"ingredients\":\"<ul><li>1\\/4 cup extra virgin olive oil<\\/li><li>1 teaspoon black pepper<\\/li><li>3 cloves minced garlic<\\/li><li>salt as required<\\/li><li>chopped basil as required<\\/li><li>4 tablespoon grated parmesan cheese<\\/li><li>1 baguette<\\/li><li>3 large diced tomato<\\/li><\\/ul><div><br><\\/div>\",\"steps\":\"<div>&nbsp; &nbsp; &nbsp;<strong>Step 1 Combine the spices in a bowl<br><\\/strong><br><\\/div><ul><li>In a bowl, add garlic, basil, salt, olive oil, and pepper. Mix them well.<\\/li><\\/ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; <strong>Step 2 Toss in tomatoes to the spice mixture<br><\\/strong><br><\\/div><ul><li>Toss in tomatoes and then sprinkle cheese on it. Mix well and freeze it for at least 45 mins.<\\/li><\\/ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; &nbsp;<strong>Step 3 Toast the bread slices<br><\\/strong><br><\\/div><ul><li>Bring the tomato mixture to room temperature. Cut the baguette loaf into slices and toast them until they turn light brown in color.<\\/li><\\/ul><div><br>&nbsp; &nbsp;<strong>Step 4 Top the bread slices with the mixture<br><\\/strong><br><\\/div><ul><li>Now, top the bread slices with the tomato mixture. Your Garlic Tomato Bruschetta is ready to serve. Enjoy.<\\/li><\\/ul><div><br><\\/div><div><br><\\/div>\"}'),(5,'94d648fa-faaa-44d0-a679-3abb2fa94a4a',10,'Update','App\\Models\\Classes',1,'App\\Models\\Classes',1,'App\\Models\\Classes',1,'','finished','','2021-11-09 12:28:03','2021-11-09 12:28:03','{\"title\":\"Plum Sauce\",\"short_description\":\"Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure.\",\"ingredients\":null,\"steps\":null}','{\"title\":\"Jumbo Prawns Manchurian\",\"short_description\":\"<div>Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure.<\\/div>\",\"ingredients\":\"<ul><li>500 gm washed &amp; dried,peeled,chopped,de seeded plums<\\/li><li>1 teaspoon red chilli powder<\\/li><li>2 tablespoon vinegar<\\/li><li>1\\/2 cup brown sugar<\\/li><li>1 tablespoon minced garlic<\\/li><li>1 tablespoon grated ginger<\\/li><li>1 tablespoon light soya sauce<\\/li><\\/ul><div><br><\\/div>\",\"steps\":\"<div>&nbsp; &nbsp; <strong>Step 1 Prepare the sauce<br><\\/strong><br><\\/div><ul><li>To begin with this easy recipe, wash the plums and cut them. In a saucepan, add garlic, ginger, vinegar, sugar, chili powder, and plums. Stir to mix everything well.<br><br><strong>Step 2 Cook the sauce<\\/strong><br><br><\\/li><li>Cook the sauce on medium flame and let it come to a boil. Now, reduce the flame and simmer until the mixture becomes thick. Stir occasionally. Check if the plums have turned soft.<br><br><\\/li><\\/ul><div>&nbsp; &nbsp; &nbsp;<strong>Step 3 Add soya sauce<\\/strong><br><br><\\/div><ul><li>Switch off the gas flame and then add soya sauce. Stir to combine everything well.<br><br><strong>Step 4 Your Plum Sauce is ready<\\/strong><br><br><\\/li><li>Your Plum Sauce is ready. Let it cool at room temperature and store it an airtight container.<\\/li><\\/ul><div><br><\\/div>\"}');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Popular','Hundreds of main dish recipes. Choose from top-rated comfort food, healthy, and vegetarian options. Find your dinner star now!',NULL,NULL),(2,'Meal time','Choose based on different meal times!',NULL,NULL),(3,'Cuisines','Choose from a wide range of cuisines.We offer classes for for varius cuisines',NULL,NULL),(4,'Diet Goal','Select based on various diet goals',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `class_subcategory` WRITE;
/*!40000 ALTER TABLE `class_subcategory` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,1,'Jumbo Prawns Manchurian','Plum sauce is a fruit condiment that is prepared by cooking plums, garlic, vinegar, ginger, and sugar together. It\'s a semi-solid, semi-liquid sweet and sour sauce which is used alongside many Chinese dishes. Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure. Plum Sauce has a little spiciness due to the addition of red chili powder. If you don\'t like spicy food then you can adjust the quantity as per your taste. Overall, this sauce is really flavorful, you should give it a try.','2021-11-09 10:55:23','2021-11-09 12:28:03','<div>Plum Sauce elevates the flavor of the dish by its impeccable taste. You can serve plum sauce with noodles, egg rolls, and spring rolls. The combination will become your favorite for sure.</div>','<ul><li>500 gm washed &amp; dried,peeled,chopped,de seeded plums</li><li>1 teaspoon red chilli powder</li><li>2 tablespoon vinegar</li><li>1/2 cup brown sugar</li><li>1 tablespoon minced garlic</li><li>1 tablespoon grated ginger</li><li>1 tablespoon light soya sauce</li></ul><div><br></div>','<div>&nbsp; &nbsp; <strong>Step 1 Prepare the sauce<br></strong><br></div><ul><li>To begin with this easy recipe, wash the plums and cut them. In a saucepan, add garlic, ginger, vinegar, sugar, chili powder, and plums. Stir to mix everything well.<br><br><strong>Step 2 Cook the sauce</strong><br><br></li><li>Cook the sauce on medium flame and let it come to a boil. Now, reduce the flame and simmer until the mixture becomes thick. Stir occasionally. Check if the plums have turned soft.<br><br></li></ul><div>&nbsp; &nbsp; &nbsp;<strong>Step 3 Add soya sauce</strong><br><br></div><ul><li>Switch off the gas flame and then add soya sauce. Stir to combine everything well.<br><br><strong>Step 4 Your Plum Sauce is ready</strong><br><br></li><li>Your Plum Sauce is ready. Let it cool at room temperature and store it an airtight container.</li></ul><div><br></div>','Grater','Intermediate',25,20.00),(2,2,'King Oyster Mushrooms from Scratch','Fond of stir-fries and mushrooms? Then combine the two together to make this super easy yet delish recipe. Made by stir-frying King Oyster Mushrooms in soya sauce, orange juice and a melange of spices, this tempting dish is indeed worth trying. Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack. You can serve it at parties or family dinners and people of all ages will love it. So, put on your chef\'s hat and try out this delicious recipe at home.','2021-11-09 10:55:23','2021-11-09 12:24:40','<div>Coming all the way to you from Chef Vicky Ratnani, this dish will be perfect for dinner or even as a standalone snack.</div>','<ul><li>1/4 cup extra virgin olive oil</li><li>1 teaspoon black pepper</li><li>3 cloves minced garlic</li><li>salt as required</li><li>chopped basil as required</li><li>4 tablespoon grated parmesan cheese</li><li>1 baguette</li><li>3 large diced tomato</li></ul><div><br></div>','<div>&nbsp; &nbsp; &nbsp;<strong>Step 1 Combine the spices in a bowl<br></strong><br></div><ul><li>In a bowl, add garlic, basil, salt, olive oil, and pepper. Mix them well.</li></ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; <strong>Step 2 Toss in tomatoes to the spice mixture<br></strong><br></div><ul><li>Toss in tomatoes and then sprinkle cheese on it. Mix well and freeze it for at least 45 mins.</li></ul><div>&nbsp; &nbsp; <br>&nbsp; &nbsp; &nbsp;<strong>Step 3 Toast the bread slices<br></strong><br></div><ul><li>Bring the tomato mixture to room temperature. Cut the baguette loaf into slices and toast them until they turn light brown in color.</li></ul><div><br>&nbsp; &nbsp;<strong>Step 4 Top the bread slices with the mixture<br></strong><br></div><ul><li>Now, top the bread slices with the tomato mixture. Your Garlic Tomato Bruschetta is ready to serve. Enjoy.</li></ul><div><br></div><div><br></div>','Grater','Beginner',30,25.00),(3,3,'Indian Street Food','Turon is a popular snack made with bananas that belong to the Philippines. Originally, Turons are made by wrapping banana pieces in a spring roll wrapper and deep-fried to make them crispy. It is either dusted with sugar or coated in a caramel glaze prepared with sugar. Apart from banana, jackfruit, sweet potato, mango, cheddar cheese and coconut fillings are also stuffed in Turons. With its lip-smacking flavours, Turon is a popular street food amongst Filipinos.','2021-11-09 10:55:23','2021-11-09 12:22:37','<div>These Turons are shallow-fried, which makes them healthy as well. Do try this recipe, rate it and let us know how it turned out to be.</div>','<ul><li>1 1/2 kilograms mustard leaves</li><li>250 gm bathua saag</li><li>4 green chilli</li><li>3 large onion</li><li>1 teaspoon turmeric</li><li>4 tablespoon ghee</li><li>250 gm spinach</li><li>50 gm corn flour</li><li>20 cloves garlic</li><li>2 inches ginger</li><li>1 cup water</li></ul><div><br></div>','<ul><li><strong>Step 1 Clean all the leafy vegetables in running water<br></strong><br></li><li>Sarson da saag Is an authentic Punjabi delicacy, which can be prepared at home easily without putting in many efforts. Here’s how you can prepare this dish by following some simple steps given below. To begin with washing and cleaning the mustard leaves, spinach and bathua saag. To make it adulterant-free, soak the greens in lukewarm water and add a pinch of salt.</li></ul><div><br><br></div><ul><li><strong>Step 2 Pressure cook the leafy greens for half an hour<br></strong><br></li><li>After washing the leafy veggies properly, drain the excess water. Cut and peel the stems of mustard leaves before chopping, then finely chop all the leaves. Take a pressure cooker and cook all the leaves for half an hour approximately. Put in ginger and 10 garlic cloves along with the leaves. Let it cool for sometime.</li></ul><div><br></div><ul><li><strong>Step 3 Blend the cooked saag for 30 seconds and then prepare the tempering<br></strong><br></li><li>Take out the mixture and put it in a blender with 50 grams of cornflour and churn for 30 seconds. Mixture should remain a little lumpy. Heat 2 tablespoon ghee in a deep-frying vessel, when it has melted put in 10 cloves of finely chopped garlic. When the garlic has turned brown, add finely chopped onions and green chillies in a vessel.</li></ul><div><br></div>','Grater','Intermediate',45,20.00),(4,4,'Smoked Salmon with Scrambled Eggs from Scratch','Bored of eating those regular scrambled eggs for breakfast? Don\'t worry, we have got your back. This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique. Not only it gives you loads of protein but fulfills your craving with its extra creamy flavor. Ditch your regular breakfast and try making this recipe. It would taste perfect with a toast or garlc bread.','2021-11-09 10:55:23','2021-11-09 12:20:41','<div>This scrambled eggs dish has a special flavour of smoked salmon and cream cheese. The three ingredients together make this recipe unique.</div>','<ul><li>2 cup yoghurt (curd)</li><li>4 tablespoon honey</li><li>1/4 cup pomegranate seeds</li><li>1 Pinch powdered cinnamon</li><li>1 cup breadcrumbs</li><li>1/4 cup strawberry</li><li>1/4 cup blueberry</li><li>1 tablespoon chia seeds</li></ul><div><br></div>','<div><strong>&nbsp; &nbsp;Step 1 MIx the ingredients<br></strong><br></div><ul><li>In a bowl add yoghurt and honey. Mix them well. Now add chia seeds, a pinch of cinnamon powder, chopped strawberries, blueberries and pomegranate. Save some of the fruit for garnish. Mix everything well.</li></ul><div>&nbsp; &nbsp; <br><strong>&nbsp; Step 2 Layering<br></strong><br></div><ul><li>Now take a dessert bowl or glass and add a layer of breadcrumbs at the bottom and press it down properly with a spoon. Add a scoop of the yoghurt mixture and level it. Now add another layer of breadcrumbs and flatten it out. Again add a layer of fruit yoghurt. Repeat these steps to fill the bowl/glass till the top.</li></ul><div><br><strong>&nbsp; &nbsp; Step 3 Garnish and serve<br></strong><br></div><ul><li>Garnish with leftover fruits and serve. Enjoy the yummy and healthy pudding.</li></ul><div><br></div><div><br></div>','Grater','beginner',20,25.00),(5,5,'Baked Avocado Coats','Baked Avocado Boats as the name suggests are avocados filled with eggs. There\'s no doubt that the taste is as lavish as its name. The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it. A super nutritious recipe that will keep you fuller for a longer time. Let\'s know if you loved eating Baked Avocado Boats.','2021-11-09 10:55:23','2021-11-09 12:18:14','<div>The avocados are filled with eggs and garnished with chives. A simple yet delightful recipe. If you\'re in a mood for an exotic breakfast, do try making this recipe. You surely won\'t regret it.</div>','<ul><li>kosher salt as required</li><li>4 egg</li><li>chopped chives as required</li><li>powdered black pepper as required</li><li>2 halved pitted avocados</li></ul><div><br></div>','<div>&nbsp; &nbsp; <strong>Step 1 Scoop the avocados out</strong><br><br></div><ul><li>Preheat the oven to 180C. Then, scoop out about 1tbsp avocado from the cavity so that you can crack open the egg. Repeat this process for the rest 3 halves.</li></ul><div>&nbsp;<br>&nbsp; &nbsp;<strong>Step 2 Season the avocados</strong><br><br></div><ul><li>Now, season the avocados By sprinkling some salt and pepper on the top of egg whites. Now bake the avocados for about 20-25 mins. You can cover the avocados with a foil to avoid browning.</li></ul><div><br>&nbsp; &nbsp; <strong>Step 3 Your Baked Avocado Boats are ready to serve<br></strong><br></div><ul><li>Once baked, take the avocados out and garnish them with chopped chives, chili flakes and oregano. Your Avocado Baked Boats are ready to serve hot. Enjoy.</li></ul><div><br></div>','Grater','Beginner',20,25.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'App\\Models\\Classes',5,'92560dc4-c4f1-4eda-a3fd-d933ef858318','classes_hero_image','im-1','im-1.jpeg','image/jpeg','public','public',10279,'[]','[]','{\"thumb\": true}','[]',1,'2021-11-09 12:18:14','2021-11-09 12:18:14'),(2,'App\\Models\\Classes',4,'f2fdbf47-1fbc-4801-80cf-0221e503aa1d','classes_hero_image','im-2','im-2.jpeg','image/jpeg','public','public',7370,'[]','[]','{\"thumb\": true}','[]',1,'2021-11-09 12:20:41','2021-11-09 12:20:41'),(3,'App\\Models\\Classes',3,'9dbadaad-8d52-467e-9c83-a66b6f3de8c0','classes_hero_image','im-3','im-3.jpeg','image/jpeg','public','public',12071,'[]','[]','{\"thumb\": true}','[]',1,'2021-11-09 12:22:37','2021-11-09 12:22:37'),(4,'App\\Models\\Classes',2,'0d50877e-37f5-41d4-9549-21d46514e346','classes_hero_image','m-5','m-5.jpeg','image/jpeg','public','public',10329,'[]','[]','{\"thumb\": true}','[]',1,'2021-11-09 12:24:40','2021-11-09 12:24:40'),(5,'App\\Models\\Classes',1,'a5ab78ac-6762-4fc9-a67b-de55080e8cda','classes_hero_image','m-12','m-12.jpeg','image/jpeg','public','public',273299,'[]','[]','{\"thumb\": true}','[]',1,'2021-11-09 12:28:03','2021-11-09 12:28:03');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,1,'test meeting 1','2021-11-09 16:25:23','upcoming','https://zoom-link.example','https://video.example',NULL,NULL),(2,2,'test meeting 2','2021-11-09 16:25:23','upcoming','https://zoom-link.example','https://video.example',NULL,NULL),(3,2,'test meeting 3','2021-11-09 16:25:23','upcoming','https://zoom-link.example','https://video.example',NULL,NULL),(4,3,'test meeting 4','2021-11-09 16:25:23','upcoming','https://zoom-link.example','https://video.example',NULL,NULL),(5,3,'test meeting 5','2021-11-09 16:25:23','upcoming','https://zoom-link.example','https://video.example',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2018_01_01_000000_create_action_events_table',1),(5,'2019_05_10_000000_add_fields_to_action_events_table',1),(6,'2019_08_19_000000_create_failed_jobs_table',1),(7,'2019_12_14_000001_create_personal_access_tokens_table',1),(8,'2020_05_21_100000_create_teams_table',1),(9,'2020_05_21_200000_create_team_user_table',1),(10,'2020_05_21_300000_create_team_invitations_table',1),(11,'2021_08_08_221335_create_sessions_table',1),(12,'2021_08_09_083910_add_facebook_id_column_in_users_table',1),(13,'2021_08_16_063434_add_data_field',1),(14,'2021_08_16_085126_make_data_field_nullable',1),(15,'2021_08_19_071850_create_media_table',1),(16,'2021_10_28_133819_create_classes_table',1),(17,'2021_10_28_135635_create_meetings_table',1),(18,'2021_10_29_051328_create_user_meetings_table',1),(19,'2021_11_09_081137_update_classes_table',1),(20,'2021_11_09_084407_create_user_reviews_table',1),(21,'2021_11_09_084709_create_categories_table',1),(22,'2021_11_09_084731_create_subcategories_table',1),(23,'2021_11_09_085338_create_class_subcategory_table',1);
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
INSERT INTO `sessions` VALUES ('6Y2H5ry7cN3H8etiNJCPcfwJjzm7OljALaD5YRTY',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDJOM1FkR1MyWFN0S2FZVE5SZFMxZUdreTJ2OEJLZ3dYRmp0R0R5SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vY2hvcGNob3AtYXBwLnRlc3QvbWFuaWZlc3QuanNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1636475138),('C63uCUOf3aHl5ENWgUSOFCJxC0NH1TCiSTZ8hhlt',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0lycHhuSFFDa0w3VGN6M1c2dVQzOUY5YmRXeDFQVnJOT0lxWTE2aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vY2hvcGNob3AtYXBwLnRlc3QvbWFuaWZlc3QuanNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1636475144),('Dnjiicie75sLkDfSXtK4bNZvDUAp1GzbG3Zh75vm',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidWdwTjk5QmJSSXFnSnp3SkNPbXVlcEM5TmpaTU9JOU93U2xYTzBpaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vY2hvcGNob3AtYXBwLnRlc3QvbWFuaWZlc3QuanNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1636475136),('fByRcE7rrakTWEEox9GKJ8tmHReL6HdcLgcrsyTU',10,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiR3dZc240RVl6bVRhT2V6N0hRbktYRmdkb0dqdzVOdTNTTG9vV0NHTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTAwOiJodHRwczovL2Nob3BjaG9wLWFwcC50ZXN0L25vdmEvcmVzb3VyY2VzL2NsYXNzZXMvMS9lZGl0P3ZpYVJlbGF0aW9uc2hpcD0mdmlhUmVzb3VyY2U9JnZpYVJlc291cmNlSWQ9Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkVGo3UWtsQnI5b1VTaUQxTm5zWDdhLlkwWXA0ODhjMEk4RkIuVmxQZUJDRGFxMDdRRzVBbDYiO30=',1636480687),('yubZRKL7O8niFWGOM0GaUclBlvWN9U5XDPhsNsq0',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3ZMb3Exam56OFlYdVgwZ3lKVXk1NWNOT1AwOUtzNGtXZ1JUV1ZpZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vY2hvcGNob3AtYXBwLnRlc3QvbWFuaWZlc3QuanNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1636475148);
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
  PRIMARY KEY (`id`),
  KEY `subcategories_category_id_foreign` (`category_id`),
  CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,1,'15 min breakfast ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(2,1,'15 min dinner ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(3,1,'Brunch ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(4,1,'Longer Cook ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(5,1,'Thanks Giving ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(6,1,'Weekly Meal Prep ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(7,1,'Date Night ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(8,1,'30 min Lunch ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(9,1,'20 min Dinner ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(10,2,'breakfast ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(11,2,'brunch ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(12,2,'lunch ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(13,2,'dinner ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(14,3,'Chinese ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(15,3,'American ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(16,3,'Indian ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(17,3,'Thai ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(18,3,'Italian ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(19,3,'Asian ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(20,3,'Fusion ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(21,3,'Continental ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(22,3,'Mediterranean ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(23,4,'Gain Weight ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(24,4,'Lose Weight ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(25,4,'Cook more diverse recipes ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(26,4,'Cook tastier tried and trues ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(27,4,'Try something exotic ','','2021-11-09 10:55:23','2021-11-09 10:55:23'),(28,4,'Family friendly meals','','2021-11-09 10:55:23','2021-11-09 10:55:23');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `user_reviews_user_id_foreign` (`user_id`),
  KEY `user_reviews_class_id_foreign` (`class_id`),
  CONSTRAINT `user_reviews_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
INSERT INTO `user_reviews` VALUES (1,2,3,'Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, she found she could see it quite plainly through the air! Do you think you could manage it?) \'And what an ignorant little girl she\'ll.',3,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(2,9,1,'I\'ll get into her face. \'Very,\' said Alice: \'allow me to introduce it.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\' said the Hatter. \'Does YOUR watch tell you how it was sneezing and.',3,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(3,9,4,'Duchess: \'flamingoes and mustard both bite. And the Gryphon remarked: \'because they lessen from day to day.\' This was quite surprised to find that she had someone to listen to her, so she began.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(4,8,3,'Cat. \'I don\'t know what \"it\" means well enough, when I sleep\" is the use of repeating all that green stuff be?\' said Alice. \'It goes on, you know,\' said Alice, swallowing down her flamingo, and.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(5,5,3,'MARMALADE\', but to get in?\' asked Alice again, for she was quite out of the busy farm-yard--while the lowing of the sea.\' \'I couldn\'t help it,\' said the Gryphon. \'They can\'t have anything to put.',2,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(6,3,3,'YOUR table,\' said Alice; \'that\'s not at all for any of them. \'I\'m sure I\'m not myself, you see.\' \'I don\'t know one,\' said Alice, who was trembling down to nine inches high. CHAPTER VI. Pig and.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(7,2,4,'Mock Turtle. \'No, no! The adventures first,\' said the Footman, and began staring at the door--I do wish I could not help thinking there MUST be more to be sure! However, everything is queer to-day.\'.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(8,5,1,'But, now that I\'m doubtful about the crumbs,\' said the Gryphon never learnt it.\' \'Hadn\'t time,\' said the King, going up to Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied eagerly, for.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(9,7,4,'Let this be a footman because he taught us,\' said the Hatter. \'You might just as I\'d taken the highest tree in the distance would take the roof was thatched with fur. It was so much about a thousand.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(10,7,4,'She gave me a good thing!\' she said to herself, and began talking to herself, \'after such a capital one for catching mice you can\'t swim, can you?\' he added, turning to the three gardeners instantly.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(11,8,5,'Duchess, \'and that\'s the jury, and the m--\' But here, to Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her hand, watching the setting sun, and thinking of little animals.',2,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(12,4,2,'Mock Turtle, suddenly dropping his voice; and the choking of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said the King. The next witness was the Rabbit noticed.',4,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(13,1,1,'The Knave of Hearts, carrying the King\'s crown on a summer day: The Knave of Hearts, and I never knew so much at this, but at last turned sulky, and would only say, \'I am older than I am now?.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(14,7,5,'I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(15,9,3,'Run home this moment, I tell you, you coward!\' and at last came a little wider. \'Come, it\'s pleased so far,\' thought Alice, \'or perhaps they won\'t walk the way of nursing it, (which was to find that.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(16,9,5,'CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice heard it muttering to himself in an undertone, \'important--unimportant--unimportant--important--\' as if she meant to take MORE than.',2,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(17,3,3,'Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not dare to disobey, though.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(18,10,1,'I beg your pardon!\' cried Alice (she was so much into the sea, some children digging in the last word with such a hurry to get out again. The rabbit-hole went straight on like a mouse, That he met.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(19,2,5,'CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice looked at her, and she grew no larger: still it was looking about for a minute or two, it was a body to cut it off from: that he had.',3,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(20,9,5,'I find a number of cucumber-frames there must be!\' thought Alice. The poor little thing howled so, that Alice quite hungry to look at it!\' This speech caused a remarkable sensation among the trees.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(21,9,1,'WOULD always get into her eyes; and once she remembered having seen in her hands, wondering if anything would EVER happen in a minute. Alice began to repeat it, but her head to keep herself from.',2,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(22,1,4,'Dormouse shall!\' they both bowed low, and their curls got entangled together. Alice was not much like keeping so close to her, one on each side, and opened their eyes and mouths so VERY nearly at.',4,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(23,2,3,'Alice angrily. \'It wasn\'t very civil of you to leave it behind?\' She said the Mock Turtle is.\' \'It\'s the oldest rule in the distance, and she felt sure she would have done that, you know,\' said.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(24,7,4,'Alice, \'shall I NEVER get any older than I am now? That\'ll be a footman in livery came running out of a feather flock together.\"\' \'Only mustard isn\'t a letter, after all: it\'s a very curious to see.',5,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(25,8,2,'Mock Turtle: \'why, if a fish came to the law, And argued each case with my wife; And the moral of that is--\"The more there is of finding morals in things!\' Alice thought to herself, \'I wish I hadn\'t.',4,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(26,6,2,'I\'ve offended it again!\' For the Mouse heard this, it turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was walking hand in hand with Dinah, and saying to her usual height. It.',2,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(27,7,5,'I\'ll go round and get in at once.\' However, she soon made out what it was: she was playing against herself, for this curious child was very glad that it was the King; and the arm that was sitting on.',3,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(28,1,3,'Alice had no pictures or conversations in it, and then they both bowed low, and their curls got entangled together. Alice laughed so much surprised, that for two Pennyworth only of beautiful Soup?.',2,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(29,8,4,'I to do this, so that altogether, for the garden!\' and she dropped it hastily, just in time to wash the things get used to it in a fight with another hedgehog, which seemed to be seen--everything.',1,'2021-11-09 10:55:23','2021-11-09 10:55:23'),(30,6,3,'MINE,\' said the Caterpillar. \'Well, perhaps not,\' said Alice angrily. \'It wasn\'t very civil of you to set about it; if I\'m Mabel, I\'ll stay down here with me! There are no mice in the world she was.',4,'2021-11-09 10:55:23','2021-11-09 10:55:23');
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
INSERT INTO `users` VALUES (1,'test1','test1@example.com','user',0,NULL,'$2y$10$wel4G6z3tIQuaHq7ZDMEzOkYCn2UiCpyPPKeoi9Ppqnp2uELb.79.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'test2','test2@example.com','user',0,NULL,'$2y$10$nHFzdf.9hk.R4tkJyRdBEeMFYK8eckTvpu7sozBhqUYZPw4mpx71m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'test3','test3@example.com','user',0,NULL,'$2y$10$nWq8bwwZ0.nzcONAj3pjD.5vC7neBy1GAqzvdQI2gtaikoclH0SwG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'test4','test4@example.com','user',0,NULL,'$2y$10$c4zbeJ.Q1D3pDrMz/g6Ba.L4byPjz27W4og8d3sLPgNDwvZqWotBW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'test5','test5@example.com','user',0,NULL,'$2y$10$d1bAHfkrloqqXM2AoQ9Jq.xL3OTXkP2V.3Kd1iRgbFyhN3Spe2J7i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'test6','test6@example.com','user',0,NULL,'$2y$10$kaIQjeCwxj.dHVWrBFego.l3rCqJUwh99anGW51vGfCFe3tadTpg6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'test7','test7@example.com','user',0,NULL,'$2y$10$V8wGbgPBuN2P9BL.Y3y8Q.SNJLR/wQ7nWav2ZNuSSZCvbeUZVuVcu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'test8','test8@example.com','user',0,NULL,'$2y$10$NxYA9LxhXAPB0iza27BLLOfBit147LRM69Bzz2vu1281y9m0phWSa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'test9','test9@example.com','user',0,NULL,'$2y$10$8VfXc4JZ2w5lTkDCANFz4uk./p5/x.L3DR0pmfvKpq1zwqhdoGKyi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'admin','admin@example.com','admin',0,NULL,'$2y$10$Tj7QklBr9oUSiD1NnsX7a.Y0Yp488c0I8FB.VlPeBCDaq07QG5Al6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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

