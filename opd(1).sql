-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 10:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(23, 'SOUP', 'Soup is a primarily liquid food, generally served warm or hot that is made by combining ingredients of vegetables with stock, milk, or water.', '2023-05-14 17:22:43'),
(24, 'SALAD', 'A salad is a dish consisting of mixed, mostly natural ingredients. They are typically served chilled or at room temperature, though some can be served warm.', '2023-05-14 17:27:57'),
(25, 'INDIAN', 'Staple foods of Indian cuisine include pearl millet (bājra), rice, whole-wheat flour (aṭṭa), and a variety of lentils, such as masoor (most often red lentils), tuer (pigeon peas), urad (black gram), and moong (mung beans). Lentils may be used whole, dehusked—for example, dhuli moong or dhuli urad—or split.', '2023-05-14 17:31:46'),
(26, 'CHINESE', 'Chinese food staples such as rice, soy sauce, noodles, tea, chili oil, and tofu, and utensils such as chopsticks and the wok, can now be found worldwide.', '2023-05-14 17:39:44'),
(27, 'MEXICAN', 'This includes street foods, such as tacos, tortas, soup, sopes, tlacoyos, tlayudas, gorditas and sincronizadas. For most dishes, it is the type of chile used that gives it its main flavor. Chipotle, smoked-dried jalapeño pepper, is very common in Mexican cuisine.', '2023-05-14 17:42:07'),
(28, 'ITALIAN', 'The Mediterranean diet forms the basis of Italian cuisine, rich in pasta, fish, fruits and vegetables. Cheese, cold cuts and wine are central to Italian cuisine, and along with pizza and coffee (especially espresso) form part of Italian gastronomic culture.', '2023-05-14 17:45:00'),
(29, 'BEVERAGES', 'Beverages not only provide essential hydration but can also be a source of other nutrients. As well as energy some beverages can be a source of vitamins and minerals, protein, fats and other carbohydrates.', '2023-05-14 17:48:35'),
(30, 'DESSERT', 'Dessert, the last course of a meal. In the United States dessert is likely to consist of pastry, cake, ice cream, pudding, or fresh or cooked fruit.', '2023-05-14 17:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 1, 1),
(2, 2, 22, 1),
(3, 3, 1, 3),
(4, 4, 2, 5),
(5, 5, 48, 3),
(6, 6, 1, 1),
(7, 7, 1, 2),
(8, 8, 87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 2, 'asd11, qswq', 121212, 1234567890, 99, '0', '0', '2023-05-07 19:28:51'),
(2, 2, 'asd11, qswq', 121212, 1234567890, 149, '0', '0', '2023-05-07 19:29:31'),
(3, 2, 'asd11, qswq', 121212, 1234567890, 297, '0', '0', '2023-05-07 19:31:56'),
(4, 2, 'asd11, qswq', 121212, 1234567890, 995, '0', '0', '2023-05-07 19:36:43'),
(5, 2, 'asd11, qswq', 121212, 1234567890, 417, '0', '0', '2023-05-07 19:40:36'),
(6, 3, 'jdjd111, qswq', 121212, 9574065362, 99, '0', '0', '2023-05-12 10:53:49'),
(7, 3, 'asd11, qswq', 121212, 1234567890, 198, '0', '0', '2023-05-14 16:54:04'),
(8, 3, 'jdjd111, qswq', 121212, 1234567890, 140, '0', '0', '2023-05-14 21:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(73, 'Lemon Coriander Soup', 230, 'A tangy clear soup of vegetables with coriander taking the centrestage (not available in jain).', 23, '2023-05-14 18:03:14'),
(74, 'Eight Treasure Soup', 220, 'Chopped carrots, beans, mushrooms, and other seasonal vegetable in a creamy comfort soup sprinkled with almond slivers.', 23, '2023-05-14 18:06:59'),
(75, 'Hot And Sour Soup', 220, 'Hot and homely soup livened with soy and crushed white peppercorns.', 23, '2023-05-14 18:10:14'),
(76, 'Sweet Corn Soup', 265, 'A thick soup made from cream of corn & served with finely chopped vegetables.', 23, '2023-05-14 18:11:49'),
(77, 'Mix vegetable Soup', 176, 'Mix vegetable soup is a healthy, delicious & easy to make soup.', 23, '2023-05-14 18:15:51'),
(78, 'Tomato Soup', 120, 'Classic Tomato soup with basil served with bread crumbs (not available in jain)', 23, '2023-05-14 18:18:47'),
(79, 'Manchow Soup', 158, 'A Thick Soup Made From Finely Cut Vegetables, Ginger & Garlic With A Touch Of Soya. (Medium Spicy).', 23, '2023-05-14 18:21:03'),
(80, 'Corn Salad', 169, 'Sweet corn mixed with crunchy jalapenos, bell peppers, and coriander, with a zesty lemon pepper dressing.', 24, '2023-05-14 18:25:54'),
(81, 'Cucumber Vinegar Salad', 150, 'This cucumber vinegar salad has the perfect balance between sweet and sour flavors, plus a hint of fresh dill. The red onion adds nice crunch.', 24, '2023-05-14 18:28:40'),
(82, 'Mix vegetable salad', 190, 'Using potatoes and green beans gives this gorgeous and healthy vegetable salad a niçoise salad feel, but you can use whatever suits your fancy.', 24, '2023-05-14 18:30:47'),
(83, 'Green Salad', 180, 'A simple, vibrant, crunchy green salad with easy vinaigrette dressing.', 24, '2023-05-14 18:32:38'),
(84, 'Mango salad', 230, 'Fresh mango and refreshing cucumber combine forces with a spicy-sweet and tangy dressing.', 24, '2023-05-14 18:35:06'),
(85, 'Fruit salad', 280, 'Whatever fruit is in season and a delicious dressing! ', 24, '2023-05-14 18:37:49'),
(86, 'The garden salad', 280, 'Fresh, chopped lettuce and veggies tossed together into a gorgeous, healthy salad. ', 24, '2023-05-14 18:40:04'),
(87, 'Bhaji pav', 140, 'Medium Spicy | Gravy | 2 pieces | Iconic dish of mumbai, spicy mix of mashed potatoes and veggies prepared with loads of butter on tawa.', 25, '2023-05-14 18:41:48'),
(88, 'Masala Dosa', 145, 'Crispy and delicious dosa, folded in with masala and coated with fresh butter', 25, '2023-05-14 18:43:35'),
(89, 'Paneer butter masala', 180, 'Chunks of cottage cheese cooked in dense butter rich gravy of onion, tomatoes and spices.| Served Semi-Gravy| Roti', 25, '2023-05-14 18:45:49'),
(90, 'Veg burger', 80, 'A crispy vegetable patty with assorted veggies, lettuce and delectable sauces stuffed between lightly toasted buns.', 25, '2023-05-14 18:47:30'),
(91, 'Chole bhature', 190, 'Chole bhature is one of the most loved Indian Meals.Serve channa batura hot with pickled onions.', 25, '2023-05-14 18:52:23'),
(92, 'Bhel puri', 170, 'Bhel Poori is a sweet, tangy and spicy Indian street food prepared with puffed rice, crispy papdis, sev, some veggies and chutneys.', 25, '2023-05-14 18:55:11'),
(93, 'Sandwich', 180, 'A three layered sandwich loaded with cheese and veggies , served with chutneys!', 25, '2023-05-14 18:57:58'),
(94, 'Aloo da paratha', 200, 'Our all Parathas are made with pure wheat flour Served with Curd & Butter & Pickle ', 25, '2023-05-14 19:00:12'),
(96, 'Manchurian Dry', 145, 'Fried vegetable dumplings with chopped onion, garlic and brown sauce.', 26, '2023-05-14 19:04:20'),
(97, 'Hakka Noodles', 140, 'Stir fried veggies combined with boiled noodles for a flavoursome treat to your taste buds.', 26, '2023-05-14 19:05:47'),
(98, 'Paneer Chilly Dry', 210, 'Paneer is cooked with soy sauce, green chilli sauce, to give it a spicy and tangy taste.', 26, '2023-05-14 19:07:23'),
(99, 'Manchurian Fried Rice', 150, 'Schezwan fried rice is a zesty vegetarian and stir-fried rice variant that features a bold and spicy homemade schezwan sauce.', 26, '2023-05-14 19:10:12'),
(100, 'Chinese Bhel', 150, 'Our Chinese bhel is sweet, tangy with a spicy touch.', 26, '2023-05-14 19:12:18'),
(101, 'Crispy Veg', 154, 'Dry | Crispy veggies tossed with our secret sauce.', 26, '2023-05-14 19:14:35'),
(102, 'Baby Corn Chilli', 225, 'Dry | Sauted babycorns wok tossed in chilli chinese style!', 26, '2023-05-14 19:16:07'),
(103, 'Cheese Pizza', 259, 'Description: A delicious pizza loaded with full of Mozzrella Cheese + White Cheese + Orange Cheddar Cheese + Monterey Jack + Cheese Jalapeno + Colby Cheese.', 28, '2023-05-14 20:20:45'),
(104, 'Double Delight Mixture Pizza', 279, 'A special variety of pizza. combination of two different pizza in one pizza.', 28, '2023-05-14 20:21:56'),
(105, 'Pasta Arrabiata', 380, 'Penne pasta, cooked in a spicy red sauce of tomatoes, garlic, onions & red chilli peppers, along with basil & Olives . Served with two garlic breads', 28, '2023-05-14 20:23:56'),
(106, 'Aglio Olio Pasta Veg', 349, 'Choice of pasta tossed in crushed garlic, Italian herbs, chili flakes, olive oil and parmesan', 28, '2023-05-14 20:24:57'),
(107, 'Ravioli In Pesto Sacue', 430, 'Raviali are type of dumpling composed of a filling sealed between two layers of thin pasta dough.it includes traditional italian fillings ricotta mixed with grated cheese and vegetables such as spinach. It is best tasted with pesto sauce which completes the smooth texture.', 28, '2023-05-14 20:26:24'),
(108, 'Cheesy Garlic Bread', 179, 'Cheese, Garlic & Herb', 28, '2023-05-14 20:27:13'),
(109, 'Stuffed Garlic Bread', 155, 'Jalapeno, Golden Corn & Cheese', 28, '2023-05-14 20:28:11'),
(110, 'Cherry Tomato Bruschetta', 295, 'House made Sourdough bread, cherry tomatoes, Basil, confit garlic spread, Olive Oil, Balsamico, ricotta cheese (2 pieces, cold serving)', 28, '2023-05-14 20:29:58'),
(111, 'Fresh Salsa', 390, 'Our corn tortilla chips fried fresh daily, accompanied with fresh salsa. 538 kcal.', 27, '2023-05-14 20:31:23'),
(112, 'Cheesy Seasoned Nachos', 129, 'Super crispy nachos topped with Mexican seasoning, nacho cheese sauce with diced tomatoes & onions.', 27, '2023-05-14 20:32:27'),
(113, 'Corn Cheese Quesadilla', 345, '(Tortilla filled with Sweet Corn, Onions, Cheese & Served with Salsa)', 27, '2023-05-14 20:33:26'),
(114, 'Burnt Corn & Beans Taco', 375, 'House Made Crisp Tortillas With Creole Spiced Creamy Mexican Beans, Burnt Corn Cheese & Sour Cream. Available In Jain Option', 27, '2023-05-14 20:34:15'),
(115, 'Choco Chips Thickshake', 147, 'Dark chocolate paste blended in creamy and rich milk and topping of choco chips?. Yummm tempting!', 29, '2023-05-14 20:35:19'),
(117, 'Java Chip Frappuccino', 340, 'We blend mocha sauce and Frappuccino chips with Frappuccino roast coffee and milk and ice, then top with whipped cream and mocha drizzle to bring you endless java joy. Energy - Tall (354ml) - 391.7 kcal / Grande (473ml) - 536.19 kcal / Venti (591ml) 667.4 kcal. Allergen - Contains Wheat, Milk, Soy. An average active adult requires 2000 kcal energy per day, however, calorie needs may vary.', 29, '2023-05-14 20:36:52'),
(118, 'Caramel Frappuccino', 340, 'A blend of coffee, sweet caramel syrup, milk and ice topped with whipped cream and a swirl of caramel drizzle. Energy - Tall (354ml) - 364.5 kcal / Grande (473ml) - 485.42 kcal / Venti (591ml) 601.65 kcal. Allergen - Contains Milk. An average active adult requires 2000 kcal energy per day, however, calorie needs may vary.', 29, '2023-05-14 20:37:32'),
(119, 'Green Tea Cream Frappuccino', 375, 'We blend sweetened premium matcha green tea, milk and ice and top it with sweetened whipped cream to give you a delicious boost of energy. Energy - Tall (354ml) - 412.4 kcal / Grande (473ml) - 575.94 kcal / Venti (591ml) 726.64 kcal. Allergen - Contains Milk. An average active adult requires 2000 kcal energy per day, however, calorie needs may vary.', 29, '2023-05-14 20:38:26'),
(120, 'Mango On The Beach Frappuccino', 460, 'Alphonso mango flavoured cream blended with mango jelly. The beverage is topped with sandy textured graham crumbs. Serving size (ml)/Calories (kcal) - Tall: 354 ML, 484 kcal, Grande: 473 ML, 623 kcal, Venti: 591 ML, 780 kcal Allergen - Contains Wheat, Oats, Milk An average active adult requires 2000 kcal energy per day, however, calorie needs may vary.', 29, '2023-05-14 20:39:32'),
(121, 'Iced Cold brew with Ginger Ale', 425, 'A delicious double layered cold brew beverage with ginger ale. A pure delight for a warm sunny day. Serving size (ml)/Calories (kcal) - Tall: 354 ML, 98 kcal, Grande: 473 ML, 137 kcal, Venti: 591 ML, 159 kcal Allergen - NA An average active adult requires 2000 kcal energy per day, however, calorie needs may vary.', 29, '2023-05-14 20:40:22'),
(122, 'Salted Dark Caramel Latte', 395, 'A delicious mix of our bold espresso shot, perfectly steamed milk and dark caramel sauce topped with crunchy salty crumbs. A perfect caramel delight. Serving size (ml)/Calories (kcal) - Short: 237 ML, 338 kcal, Tall: 354 ML, 510 kcal, Grande: 473 ML, 649 kcal, Venti: 591 ML, 816 kcal Allergen - Contains Wheat, Soy, Milk An average active adult requires 2000 kcal energy per day, however, calorie needs may vary.', 29, '2023-05-14 20:41:19'),
(123, 'Chocolate Thickshake', 138, 'Serves 1 | A rich and creamy milkshake made with chocolate - a perfect chocolate indulgence.', 29, '2023-05-14 20:43:08'),
(127, 'No Bake Oreo Truffles', 200, 'These easy no-bake oreo truffles are a great dessert to make as a gift to friends and family.', 30, '2023-05-14 20:48:17'),
(128, 'Vegan Chocolate Lava Cakes', 299, 'From molten-in-the-middle chocolate lava cakes and an easy tiramisu trifle, to chocolate mousse and a creamy vegan pavlova, this is the ultimate guide to the best vegan Christmas desserts to serve up this festive season.', 30, '2023-05-14 20:50:22'),
(129, 'Triple Chocolate Mousse Cake', 280, 'This triple chocolate mousse cake is rich, smooth, creamy and full of flavor. It features layer of chocolate souffle cake, rich chocolate mousse and white chocolate mousse on top.', 30, '2023-05-14 20:53:32'),
(130, 'Strawberry Cheesecake', 189, 'Delectable cheesecake made with fresh strawberries and rich cream cheese is sure to make you fall in love berry much. Try now!', 30, '2023-05-14 20:54:56'),
(131, 'Raspberry-Filled Chocolate Mousse Cake', 199, 'You are here: Home / Recipes / Raspberry Chocolate Mousse Cake\r\nDECEMBER 21, 2018\r\n\r\nRASPBERRY CHOCOLATE MOUSSE CAKE\r\nSharing is caring!\r\n JUMP TO RECIPE\r\nSweet fresh raspberry filling between layers of moist chocolate cake, covered in rich chocolate mousse, and topped with silky chocolate ganache. This Raspberry Chocolate Mousse Cake is perfect for any occasion.\r\n\r\nRaspberry Filled Chocolate Mousse Cake | KitchenCents.com\r\nThis Raspberry Filled Chocolate Mousse Cake with chocolate ganache is a perfectly decadent ending to any Valentine’s Day or special occasion.', 30, '2023-05-14 20:56:31'),
(132, 'Blueberry Muffin', 99, 'Our delicious muffins made with fresh blueberries are an absolute delight in every bite. Must try!', 30, '2023-05-14 20:57:13'),
(133, 'Vanilla Pudding Ice Cream', 130, 'vanilla pudding ice cream is the perfect for summer.', 30, '2023-05-14 21:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Food Zone', 'darshanparmar263@gmail.com', 2515469442, 6304468851, '601 Sherwood Ave.<br> San Bernandino', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(3, 'pooja', 'pooja', 'gajjar', 'pdgajjar32@gmail.com', 9574065362, '0', '$2y$10$k9jr9MCFQShJJawlBG7jB.SejN7YjkcTxgrxYuP7GSPZhftarWjeK', '2023-05-12 10:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(9, 112, 1, 3, '2023-05-14 21:54:04'),
(10, 128, 1, 3, '2023-05-14 21:54:10'),
(11, 104, 1, 3, '2023-05-14 21:54:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
