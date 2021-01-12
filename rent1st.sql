-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2021 at 06:28 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent1st`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_code_large` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_code_medium` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_code_small` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `slug`, `provider_name`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'top', 'Advert Code', '', '', '', 0),
(2, 'bottom', 'Advert Code', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT 0,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `translation_lang`, `translation_of`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `active`) VALUES
(1, 'en', 1, 0, 'Automobiles', 'automobiles', NULL, 'app/categories/skin-default/fa-car.png', 'fa fa-car', 26, 41, 1, 'classified', 1),
(2, 'en', 2, 1, 'Auto Parts, Accessories', 'auto-parts-accessories', NULL, NULL, NULL, 29, 30, 2, NULL, 1),
(3, 'en', 3, 1, 'Car, Motorcycle Rental', 'car-motorcycle-rental', NULL, NULL, NULL, 27, 28, 2, NULL, 1),
(4, 'en', 4, 1, 'Caravan and Boating', 'caravan-and-boating', NULL, NULL, NULL, 31, 32, 2, NULL, 1),
(5, 'en', 5, 1, 'Motorcycle parts, Accessories', 'motorcycle-parts-accessories', NULL, NULL, NULL, 33, 34, 2, NULL, 1),
(6, 'en', 6, 1, 'Motorcycles, Scooters, Quads', 'motorcycles-scooters-quads', NULL, NULL, NULL, 35, 36, 2, NULL, 1),
(7, 'en', 7, 1, 'Used Cars - New Cars', 'used-cars-new-cars', NULL, NULL, NULL, 37, 38, 2, NULL, 1),
(8, 'en', 8, 1, 'Utility Vehicles, Machinery', 'utility-vehicles-machinery', NULL, NULL, NULL, 39, 40, 2, NULL, 1),
(9, 'en', 9, 0, 'Real estate', 'real-estate', NULL, 'app/categories/skin-default/fa-home.png', 'icon-home', 42, 65, 1, 'classified', 1),
(10, 'en', 10, 9, 'Commercial Property - Offices - Premises', 'commercial-property-offices-premises', NULL, NULL, NULL, 47, 48, 2, NULL, 1),
(11, 'en', 11, 9, 'I\'m looking for', 'im-looking-for', NULL, NULL, NULL, 51, 52, 2, NULL, 1),
(12, 'en', 12, 9, 'Roomates', 'roomates', NULL, NULL, NULL, 53, 54, 2, NULL, 1),
(13, 'en', 13, 9, 'Accommodation and Hotels', 'accommodation-and-hotels', NULL, NULL, NULL, 55, 56, 2, NULL, 1),
(14, 'en', 14, 9, 'Vacation Rental', 'vacation-rental', NULL, NULL, NULL, 57, 58, 2, NULL, 1),
(15, 'en', 15, 9, 'Garage, Parking, Farms', 'garage-parking-farms', NULL, NULL, NULL, 59, 60, 2, NULL, 1),
(16, 'en', 16, 9, 'Real Estate Services', 'real-estate-services', NULL, NULL, NULL, 61, 62, 2, NULL, 1),
(17, 'en', 17, 9, 'Rooms - Studio for Rent', 'rooms-studio-for-rent', NULL, NULL, NULL, 63, 64, 2, NULL, 1),
(18, 'en', 18, 9, 'Land for Sale, Rent', 'land-for-sale-rent', NULL, NULL, NULL, 49, 50, 2, NULL, 1),
(19, 'en', 19, 9, 'Property for sale', 'property-for-sale', NULL, NULL, NULL, 45, 46, 2, NULL, 1),
(20, 'en', 20, 9, 'Rentals', 'rentals', NULL, NULL, NULL, 43, 44, 2, NULL, 1),
(21, 'en', 21, 0, 'Services', 'services', NULL, 'app/categories/skin-default/ion-clipboard.png', 'fa fa-briefcase', 92, 127, 1, '', 1),
(22, 'en', 22, 21, 'Other services', 'other-services', NULL, NULL, NULL, 111, 112, 2, NULL, 1),
(23, 'en', 23, 21, 'Casting, Model, Photographer', 'casting-model-photographer', NULL, NULL, NULL, 123, 124, 2, NULL, 1),
(24, 'en', 24, 21, 'Carpooling', 'carpooling', NULL, NULL, NULL, 121, 122, 2, NULL, 1),
(25, 'en', 25, 21, 'Moving, Furniture Guard', 'moving-furniture-guard', NULL, NULL, NULL, 119, 120, 2, NULL, 1),
(26, 'en', 26, 21, 'Destocking - Commercial', 'destocking-commercial', NULL, NULL, NULL, 117, 118, 2, NULL, 1),
(27, 'en', 27, 21, 'Industrial Equipment', 'industrial-equipment', NULL, NULL, NULL, 115, 116, 2, NULL, 1),
(28, 'en', 28, 21, 'Aesthetics, Hairstyling', 'aesthetics-hairstyling', NULL, NULL, NULL, 93, 94, 2, NULL, 1),
(29, 'en', 29, 21, 'Horoscope - Tarot - Healers - Spell', 'horoscope-tarot-healers-spell', NULL, NULL, NULL, 113, 114, 2, NULL, 1),
(30, 'en', 30, 21, 'Materials and Equipment Pro', 'materials-and-equipment-pro', NULL, NULL, NULL, 109, 110, 2, NULL, 1),
(31, 'en', 31, 21, 'Event Organization Services', 'event-organization-services', NULL, NULL, NULL, 95, 96, 2, NULL, 1),
(32, 'en', 32, 21, 'Service Provision', 'service-provision', NULL, NULL, NULL, 107, 108, 2, NULL, 1),
(33, 'en', 33, 21, 'Health, Beauty', 'health-beauty', NULL, NULL, NULL, 105, 106, 2, NULL, 1),
(34, 'en', 34, 21, 'Artisan, Troubleshooting, Handyman', 'artisan-troubleshooting-handyman', NULL, NULL, NULL, 103, 104, 2, NULL, 1),
(35, 'en', 35, 21, 'Computing Services', 'computing-services', NULL, NULL, NULL, 101, 102, 2, NULL, 1),
(36, 'en', 36, 21, 'Tourism and Travel Services', 'tourism-and-travel-services', NULL, NULL, NULL, 99, 100, 2, NULL, 1),
(37, 'en', 37, 21, 'Translation, Writing', 'translation-writing', NULL, NULL, NULL, 125, 126, 2, NULL, 1),
(38, 'en', 38, 21, 'Construction - Renovation - Carpentry', 'construction-renovation-carpentry', NULL, NULL, NULL, 97, 98, 2, NULL, 1),
(39, 'en', 39, 0, 'Community', 'community', NULL, 'app/categories/skin-default/fa-users.png', 'icon-theatre', 266, 281, 1, 'classified', 1),
(40, 'en', 40, 39, 'Sporting goods, Exercise', 'sporting-goods-exercise', NULL, NULL, NULL, 267, 268, 2, NULL, 1),
(41, 'en', 41, 39, 'Artists, Musicians', 'artists-musicians', NULL, NULL, NULL, 269, 270, 2, NULL, 1),
(42, 'en', 42, 39, 'Associations, Voluntary', 'associations-voluntary', NULL, NULL, NULL, 271, 272, 2, NULL, 1),
(43, 'en', 43, 39, 'Friendships for Events', 'friendships-for-events', NULL, NULL, NULL, 273, 274, 2, NULL, 1),
(44, 'en', 44, 39, 'My neighborhood', 'my-neighborhood', NULL, NULL, NULL, 275, 276, 2, NULL, 1),
(45, 'en', 45, 39, 'Nightlife, Restaurant & Bar', 'nightlife-restaurant-bar', NULL, NULL, NULL, 277, 278, 2, NULL, 1),
(46, 'en', 46, 39, 'Outings, Entertainment', 'outings-entertainment', NULL, NULL, NULL, 279, 280, 2, NULL, 1),
(47, 'en', 47, 0, 'Multimedia', 'multimedia', NULL, 'app/categories/skin-default/fa-laptop.png', 'icon-laptop', 2, 25, 1, 'classified', 1),
(48, 'en', 48, 47, 'Multimedia & Phones Accessories', 'multimedia-phones-accessories', NULL, NULL, NULL, 5, 6, 2, NULL, 1),
(49, 'en', 49, 47, 'CD/DVD - Books - Movies', 'cddvd-books-movies', NULL, NULL, NULL, 7, 8, 2, NULL, 1),
(50, 'en', 50, 47, 'Consoles - Video Games', 'consoles-video-games', NULL, NULL, NULL, 11, 12, 2, NULL, 1),
(51, 'en', 51, 47, 'Computers - PC - Office Supplies', 'computers-pc-office-supplies', NULL, NULL, NULL, 13, 14, 2, NULL, 1),
(52, 'en', 52, 47, 'Wanted', 'wanted', NULL, NULL, NULL, 15, 16, 2, NULL, 1),
(53, 'en', 53, 47, 'Tablets - Touchscreens', 'tablets-touchscreens', NULL, NULL, NULL, 17, 18, 2, NULL, 1),
(54, 'en', 54, 47, 'Mobiles phones - Smartphones', 'mobiles-phones-smartphones', NULL, NULL, NULL, 19, 20, 2, NULL, 1),
(55, 'en', 55, 47, 'TV - Images - Sound', 'tv-images-sound', NULL, NULL, NULL, 21, 22, 2, NULL, 1),
(56, 'en', 56, 47, 'Clearance - Commercial', 'clearance-commercial', NULL, NULL, NULL, 23, 24, 2, NULL, 1),
(57, 'en', 57, 47, 'Industrial Equipment', 'industrial-equipment', NULL, NULL, NULL, 9, 10, 2, NULL, 1),
(58, 'en', 58, 47, 'Materials & Professional equipment', 'materials-professional-equipment', NULL, NULL, NULL, 3, 4, 2, NULL, 1),
(59, 'en', 59, 0, 'Fashion, Home & Garden', 'fashion-home-garden', NULL, 'app/categories/skin-default/fa-home.png', 'icon-basket-1', 66, 91, 1, 'classified', 1),
(60, 'en', 60, 59, 'Furniture - Tableware', 'furniture-tableware', NULL, NULL, NULL, 89, 90, 2, NULL, 1),
(61, 'en', 61, 59, 'Antiques - Art - Decoration', 'antiques-art-decoration', NULL, NULL, NULL, 69, 70, 2, NULL, 1),
(62, 'en', 62, 59, 'Appliances', 'appliances', NULL, NULL, NULL, 71, 72, 2, NULL, 1),
(63, 'en', 63, 59, 'Jewelry - Watches - Luggage', 'jewelry-watches-luggage', NULL, NULL, NULL, 73, 74, 2, NULL, 1),
(64, 'en', 64, 59, 'DIY - Gardening', 'diy-gardening', NULL, NULL, NULL, 75, 76, 2, NULL, 1),
(65, 'en', 65, 59, 'Various flea markets', 'various-flea-markets', NULL, NULL, NULL, 77, 78, 2, NULL, 1),
(66, 'en', 66, 59, 'Shoes', 'shoes', NULL, NULL, NULL, 79, 80, 2, NULL, 1),
(67, 'en', 67, 59, 'Toys - Games - Figurines', 'toys-games-figurines', NULL, NULL, NULL, 67, 68, 2, NULL, 1),
(68, 'en', 68, 59, 'Clothing, Fashion & Accessories', 'clothing-fashion-accessories', NULL, NULL, NULL, 81, 82, 2, NULL, 1),
(69, 'en', 69, 59, 'Stuffs for Baby and Child', 'stuffs-for-baby-and-child', NULL, NULL, NULL, 83, 84, 2, NULL, 1),
(70, 'en', 70, 59, 'Stuffs for Beauty and Health', 'stuffs-for-beauty-and-health', NULL, NULL, NULL, 85, 86, 2, NULL, 1),
(71, 'en', 71, 59, 'Wine & Gourmet - Recipes', 'wine-gourmet-recipes', NULL, NULL, NULL, 87, 88, 2, NULL, 1),
(72, 'en', 72, 0, 'Pets & Mascots', 'pets-mascots', NULL, 'app/categories/skin-default/map-icon-pet-store.png', 'icon-guidedog', 282, 287, 1, '', 1),
(73, 'en', 73, 72, 'Accessories - Other Pets services', 'accessories-other-pets-services', NULL, NULL, NULL, 283, 284, 2, NULL, 1),
(74, 'en', 74, 72, 'Sales, Adoptions, Lost', 'sales-adoptions-lost', NULL, NULL, NULL, 285, 286, 2, NULL, 1),
(75, 'en', 75, 0, 'Free Dating', 'free-dating', NULL, 'app/categories/skin-default/ion-ios-heart.png', 'icon-heart', 288, 307, 1, 'not-salable', 1),
(76, 'en', 76, 75, 'Friendship - Friends', 'friendship-friends', NULL, NULL, NULL, 305, 306, 2, NULL, 1),
(77, 'en', 77, 75, 'Escorts - Adult Services', 'escorts-adult-services', NULL, NULL, NULL, 303, 304, 2, NULL, 1),
(78, 'en', 78, 75, 'Women Seeking Women', 'women-seeking-women', NULL, NULL, NULL, 299, 300, 2, NULL, 1),
(79, 'en', 79, 75, 'Women Seeking Men', 'women-seeking-men', NULL, NULL, NULL, 301, 302, 2, NULL, 1),
(80, 'en', 80, 75, 'Men Seeking Women', 'men-seeking-women', NULL, NULL, NULL, 289, 290, 2, NULL, 1),
(81, 'en', 81, 75, 'Men Seeking Men', 'men-seeking-men', NULL, NULL, NULL, 291, 292, 2, NULL, 1),
(82, 'en', 82, 75, 'Massage Services - Relaxation', 'massage-services-relaxation', NULL, NULL, NULL, 293, 294, 2, NULL, 1),
(83, 'en', 83, 75, 'Adults Products - Articles', 'adults-products-articles', NULL, NULL, NULL, 295, 296, 2, NULL, 1),
(84, 'en', 84, 75, 'Casual Encounter', 'casual-encounter', NULL, NULL, NULL, 297, 298, 2, NULL, 1),
(85, 'en', 85, 0, 'Jobs Offers', 'jobs-offers', NULL, 'app/categories/skin-default/mfglabs-users.png', 'icon-megaphone-1', 176, 223, 1, 'job-offer', 1),
(86, 'en', 86, 85, 'Agriculture - Environment', 'agriculture-environment', NULL, NULL, NULL, 197, 198, 2, NULL, 1),
(87, 'en', 87, 85, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, NULL, NULL, 195, 196, 2, NULL, 1),
(88, 'en', 88, 85, 'Automotive - Mechanic', 'automotive-mechanic', NULL, NULL, NULL, 191, 192, 2, NULL, 1),
(89, 'en', 89, 85, 'Others Jobs Offer', 'others-jobs-offer', NULL, NULL, NULL, 189, 190, 2, NULL, 1),
(90, 'en', 90, 85, 'BTP - Construction - Building', 'btp-construction-building', NULL, NULL, NULL, 187, 188, 2, NULL, 1),
(91, 'en', 91, 85, 'Trade - Business Services', 'trade-business-services', NULL, NULL, NULL, 185, 186, 2, NULL, 1),
(92, 'en', 92, 85, 'Commercial - Sale Jobs Offer', 'commercial-sale-jobs-offer', NULL, NULL, NULL, 183, 184, 2, NULL, 1),
(93, 'en', 93, 85, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, NULL, NULL, 181, 182, 2, NULL, 1),
(94, 'en', 94, 85, 'Steering - Manager', 'steering-manager', NULL, NULL, NULL, 221, 222, 2, NULL, 1),
(95, 'en', 95, 85, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, NULL, NULL, 193, 194, 2, NULL, 1),
(96, 'en', 96, 85, 'Public Service Jobs Offer', 'public-service-jobs-offer', NULL, NULL, NULL, 179, 180, 2, NULL, 1),
(97, 'en', 97, 85, 'Real Estate Jobs Offer', 'real-estate-jobs-offer', NULL, NULL, NULL, 207, 208, 2, NULL, 1),
(98, 'en', 98, 85, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, NULL, NULL, 199, 200, 2, NULL, 1),
(99, 'en', 99, 85, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, NULL, NULL, 201, 202, 2, NULL, 1),
(100, 'en', 100, 85, 'Industry, Production & engineering', 'industry-production-engineering', NULL, NULL, NULL, 219, 220, 2, NULL, 1),
(101, 'en', 101, 85, 'Marketing - Communication', 'marketing-communication', NULL, NULL, NULL, 217, 218, 2, NULL, 1),
(102, 'en', 102, 85, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, NULL, NULL, 215, 216, 2, NULL, 1),
(103, 'en', 103, 85, 'HR - Training - Education', 'hr-training-education', NULL, NULL, NULL, 213, 214, 2, NULL, 1),
(104, 'en', 104, 85, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, NULL, NULL, 211, 212, 2, NULL, 1),
(105, 'en', 105, 85, 'Security - Guarding', 'security-guarding', NULL, NULL, NULL, 177, 178, 2, NULL, 1),
(106, 'en', 106, 85, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, NULL, NULL, 209, 210, 2, NULL, 1),
(107, 'en', 107, 85, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, NULL, NULL, 205, 206, 2, NULL, 1),
(108, 'en', 108, 85, 'Transportation - Logistics', 'transportation-logistics', NULL, NULL, NULL, 203, 204, 2, NULL, 1),
(109, 'en', 109, 0, 'Job Search', 'job-search', NULL, 'app/categories/skin-default/fa-search.png', 'icon-search', 128, 175, 1, 'job-search', 1),
(110, 'en', 110, 109, 'Agriculture - Environment', 'agriculture-environment', NULL, NULL, NULL, 129, 130, 2, NULL, 1),
(111, 'en', 111, 109, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, NULL, NULL, 153, 154, 2, NULL, 1),
(112, 'en', 112, 109, 'Automotive - Mechanic', 'automotive-mechanic', NULL, NULL, NULL, 171, 172, 2, NULL, 1),
(113, 'en', 113, 109, 'Others Jobs Search', 'others-jobs-search', NULL, NULL, NULL, 169, 170, 2, NULL, 1),
(114, 'en', 114, 109, 'BTP - Construction - Building', 'btp-construction-building', NULL, NULL, NULL, 165, 166, 2, NULL, 1),
(115, 'en', 115, 109, 'Trade - Business Services', 'trade-business-services', NULL, NULL, NULL, 167, 168, 2, NULL, 1),
(116, 'en', 116, 109, 'Commercial - Sale Jobs Search', 'commercial-sale-jobs-search', NULL, NULL, NULL, 163, 164, 2, NULL, 1),
(117, 'en', 117, 109, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, NULL, NULL, 161, 162, 2, NULL, 1),
(118, 'en', 118, 109, 'Steering - Manager', 'steering-manager', NULL, NULL, NULL, 157, 158, 2, NULL, 1),
(119, 'en', 119, 109, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, NULL, NULL, 155, 156, 2, NULL, 1),
(120, 'en', 120, 109, 'Public Service Jobs Search', 'public-service-jobs-search', NULL, NULL, NULL, 151, 152, 2, NULL, 1),
(121, 'en', 121, 109, 'Real Estate Jobs Search', 'real-estate-jobs-search', NULL, NULL, NULL, 131, 132, 2, NULL, 1),
(122, 'en', 122, 109, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, NULL, NULL, 149, 150, 2, NULL, 1),
(123, 'en', 123, 109, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, NULL, NULL, 147, 148, 2, NULL, 1),
(124, 'en', 124, 109, 'Industry, Production & engineering', 'industry-production-engineering', NULL, NULL, NULL, 145, 146, 2, NULL, 1),
(125, 'en', 125, 109, 'Marketing - Communication', 'marketing-communication', NULL, NULL, NULL, 159, 160, 2, NULL, 1),
(126, 'en', 126, 109, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, NULL, NULL, 143, 144, 2, NULL, 1),
(127, 'en', 127, 109, 'HR - Training - Education', 'hr-training-education', NULL, NULL, NULL, 141, 142, 2, NULL, 1),
(128, 'en', 128, 109, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, NULL, NULL, 139, 140, 2, NULL, 1),
(129, 'en', 129, 109, 'Security - Guarding', 'security-guarding', NULL, NULL, NULL, 137, 138, 2, NULL, 1),
(130, 'en', 130, 109, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, NULL, NULL, 135, 136, 2, NULL, 1),
(131, 'en', 131, 109, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, NULL, NULL, 133, 134, 2, NULL, 1),
(132, 'en', 132, 109, 'Transportation - Logistics', 'transportation-logistics', NULL, NULL, NULL, 173, 174, 2, NULL, 1),
(133, 'en', 133, 0, 'Learning', 'learning', NULL, 'app/categories/skin-default/fa-graduation-cap.png', 'icon-book-open', 250, 265, 1, '', 1),
(134, 'en', 134, 133, 'Language Classes', 'language-classes', NULL, NULL, NULL, 263, 264, 2, NULL, 1),
(135, 'en', 135, 133, 'Computer Courses', 'computer-courses', NULL, NULL, NULL, 261, 262, 2, NULL, 1),
(136, 'en', 136, 133, 'Tutoring, Private Lessons', 'tutoring-private-lessons', NULL, NULL, NULL, 257, 258, 2, NULL, 1),
(137, 'en', 137, 133, 'Vocational Training', 'vocational-training', NULL, NULL, NULL, 259, 260, 2, NULL, 1),
(138, 'en', 138, 133, 'Maths, Physics, Chemistry', 'maths-physics-chemistry', NULL, NULL, NULL, 251, 252, 2, NULL, 1),
(139, 'en', 139, 133, 'Music, Theatre, Dance', 'music-theatre-dance', NULL, NULL, NULL, 253, 254, 2, NULL, 1),
(140, 'en', 140, 133, 'School support', 'school-support', NULL, NULL, NULL, 255, 256, 2, NULL, 1),
(141, 'en', 141, 0, 'Local Events', 'local-events', NULL, 'app/categories/skin-default/fa-calendar.png', 'icon-megaphone-1', 224, 249, 1, 'classified', 1),
(142, 'en', 142, 141, 'Concerts & Festivals', 'concerts-festivals', NULL, NULL, NULL, 227, 228, 2, NULL, 1),
(143, 'en', 143, 141, 'Networking & Meetups', 'networking-meetups', NULL, NULL, NULL, 229, 230, 2, NULL, 1),
(144, 'en', 144, 141, 'Sports & Outdoors', 'sports-outdoors', NULL, NULL, NULL, 225, 226, 2, NULL, 1),
(145, 'en', 145, 141, 'Trade Shows & Conventions', 'trade-shows-conventions', NULL, NULL, NULL, 231, 232, 2, NULL, 1),
(146, 'en', 146, 141, 'Training & Seminars', 'training-seminars', NULL, NULL, NULL, 233, 234, 2, NULL, 1),
(147, 'en', 147, 141, 'Ceremonies', 'ceremonies', NULL, NULL, NULL, 235, 236, 2, NULL, 1),
(148, 'en', 148, 141, 'Conferences', 'conferences', NULL, NULL, NULL, 237, 238, 2, NULL, 1),
(149, 'en', 149, 141, 'Weddings', 'weddings', NULL, NULL, NULL, 239, 240, 2, NULL, 1),
(150, 'en', 150, 141, 'Birthdays', 'birthdays', NULL, NULL, NULL, 241, 242, 2, NULL, 1),
(151, 'en', 151, 141, 'Family Events', 'family-events', NULL, NULL, NULL, 243, 244, 2, NULL, 1),
(152, 'en', 152, 141, 'Nightlife', 'nightlife', NULL, NULL, NULL, 245, 246, 2, NULL, 1),
(153, 'en', 153, 141, 'All others events', 'all-others-events', NULL, NULL, NULL, 247, 248, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_field`
--

CREATE TABLE `category_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint(1) UNSIGNED DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 1, 0, 0, 2, 3, 1),
(2, 1, 6, 0, 0, 16, 17, 1),
(3, 109, 7, 0, NULL, NULL, NULL, NULL),
(4, 1, 5, 0, 0, 8, 9, 1),
(5, 1, 4, 0, 0, 14, 15, 1),
(6, 1, 2, 0, 0, 4, 5, 1),
(7, 1, 3, 0, 0, 6, 7, 1),
(8, 1, 8, 0, 0, 12, 13, 1),
(9, 47, 8, 0, 0, 4, 5, 1),
(10, 59, 8, 0, NULL, NULL, NULL, NULL),
(11, 1, 9, 0, 0, 10, 11, 1),
(12, 85, 10, 0, NULL, NULL, NULL, NULL),
(13, 85, 11, 0, NULL, NULL, NULL, NULL),
(14, 85, 12, 0, NULL, NULL, NULL, NULL),
(15, 109, 12, 0, NULL, NULL, NULL, NULL),
(16, 9, 13, 0, 0, 2, 3, 1),
(17, 9, 14, 0, 0, 4, 5, 1),
(18, 9, 15, 0, 0, 8, 9, 1),
(19, 9, 16, 0, 0, 10, 11, 1),
(20, 9, 17, 0, 0, 6, 7, 1),
(21, 47, 18, 0, 0, 2, 3, 1),
(22, 75, 19, 0, NULL, NULL, NULL, NULL),
(23, 75, 20, 0, NULL, NULL, NULL, NULL),
(24, 75, 21, 0, NULL, NULL, NULL, NULL),
(25, 141, 22, 0, NULL, NULL, NULL, NULL),
(26, 141, 23, 0, NULL, NULL, NULL, NULL),
(27, 141, 24, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'ISO-3166 2-letter country code, 2 characters',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'name of geographical point (utf8) varchar(200)',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name of geographical point in plain ascii characters, varchar(200)',
  `latitude` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `longitude` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, char(1)',
  `feature_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see http://www.geonames.org/export/codes.html, varchar(10)',
  `subadmin1_code` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)',
  `subadmin2_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)',
  `population` bigint(20) DEFAULT NULL COMMENT 'bigint (4 byte int)',
  `time_zone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the timezone id (see file timeZone.txt)',
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1108161, 'PK', 'Chuhar Jamali', 'Chuhar Jamali', 24.3944, 67.993, 'P', 'PPL', 'PK.05', NULL, 15781, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1161983, 'PK', 'Rawala Kot', 'Rawala Kot', 33.8578, 73.7604, 'P', 'PPLA2', 'PK.06', NULL, 50000, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1161991, 'PK', 'Pir Jo Goth', 'Pir Jo Goth', 27.5918, 68.6185, 'P', 'PPL', 'PK.05', NULL, 35537, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1162004, 'PK', 'Khairpur Mir’s', 'Khairpur Mir\'s', 27.5295, 68.7591, 'P', 'PPLA2', 'PK.05', NULL, 124602, 'Asia/Karachi', 1, '2018-01-30 23:00:00', '2018-01-30 23:00:00'),
(1162035, 'PK', 'Adilpur', 'Adilpur', 27.9368, 69.3194, 'P', 'PPL', 'PK.05', NULL, 8247, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1162105, 'PK', 'Zhob', 'Zhob', 31.3408, 69.4493, 'P', 'PPLA2', 'PK.02', NULL, 50537, 'Asia/Karachi', 1, '2016-10-06 23:00:00', '2016-10-06 23:00:00'),
(1162261, 'PK', 'Zaida', 'Zaida', 34.0595, 72.4669, 'P', 'PPL', 'PK.03', NULL, 26787, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1162275, 'PK', 'Zahir Pir', 'Zahir Pir', 28.8128, 70.5234, 'P', 'PPL', 'PK.04', NULL, 34121, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1162285, 'PK', 'Zafarwal', 'Zafarwal', 32.3446, 74.8999, 'P', 'PPL', 'PK.04', NULL, 23078, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1162316, 'PK', 'Yazman', 'Yazman', 29.1212, 71.7446, 'P', 'PPL', 'PK.04', NULL, 24580, 'Asia/Karachi', 1, '2014-03-22 23:00:00', '2014-03-22 23:00:00'),
(1162456, 'PK', 'Wazirabad', 'Wazirabad', 32.4432, 74.12, 'P', 'PPL', 'PK.04', NULL, 102444, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1162572, 'PK', 'Chak Five Hundred Seventy-five', 'Chak Five Hundred Seventy-five', 31.5451, 73.8289, 'P', 'PPL', 'PK.04', NULL, 24295, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1162589, 'PK', 'Warah', 'Warah', 27.448, 67.7965, 'P', 'PPL', 'PK.05', NULL, 18724, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1162813, 'PK', 'Vihari', 'Vihari', 30.0445, 72.3556, 'P', 'PPLA2', 'PK.04', NULL, 112840, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1162855, 'PK', 'Utmanzai', 'Utmanzai', 34.1878, 71.7627, 'P', 'PPL', 'PK.03', NULL, 29423, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1162862, 'PK', 'Uthal', 'Uthal', 25.8072, 66.6219, 'P', 'PPLA2', 'PK.02', NULL, 16483, 'Asia/Karachi', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1162868, 'PK', 'Usta Muhammad', 'Usta Muhammad', 28.1772, 68.0437, 'P', 'PPL', 'PK.02', NULL, 43983, 'Asia/Karachi', 1, '2016-09-07 23:00:00', '2016-09-07 23:00:00'),
(1162959, 'PK', 'Umarkot', 'Umarkot', 25.3633, 69.7418, 'P', 'PPLA2', 'PK.05', NULL, 42074, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1163021, 'PK', 'Ubauro', 'Ubauro', 28.1643, 69.7311, 'P', 'PPL', 'PK.05', NULL, 23462, 'Asia/Karachi', 1, '2016-06-03 23:00:00', '2016-06-03 23:00:00'),
(1163054, 'PK', 'Turbat', 'Turbat', 26.0012, 63.0485, 'P', 'PPLA2', 'PK.02', NULL, 75694, 'Asia/Karachi', 1, '2016-02-05 23:00:00', '2016-02-05 23:00:00'),
(1163224, 'PK', 'Topi', 'Topi', 34.0703, 72.6215, 'P', 'PPL', 'PK.03', NULL, 36340, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1163272, 'PK', 'Toba Tek Singh', 'Toba Tek Singh', 30.9713, 72.4827, 'P', 'PPLA2', 'PK.04', NULL, 69064, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1163414, 'PK', 'Thul', 'Thul', 28.2403, 68.7755, 'P', 'PPL', 'PK.05', NULL, 34472, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1163582, 'PK', 'Thatta', 'Thatta', 24.7474, 67.9235, 'P', 'PPLA2', 'PK.05', NULL, 44302, 'Asia/Karachi', 1, '2012-01-16 23:00:00', '2012-01-16 23:00:00'),
(1163595, 'PK', 'Tharu Shah', 'Tharu Shah', 26.9423, 68.1176, 'P', 'PPL', 'PK.05', NULL, 17698, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1163724, 'PK', 'Taunsa', 'Taunsa', 30.7036, 70.6505, 'P', 'PPL', 'PK.04', NULL, 44869, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1163905, 'PK', 'Tank', 'Tank', 32.2171, 70.3831, 'P', 'PPLA2', 'PK.03', NULL, 38488, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1163912, 'PK', 'Tangwani', 'Tangwani', 28.2789, 68.9976, 'P', 'PPL', 'PK.05', NULL, 9255, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1163927, 'PK', 'Tangi', 'Tangi', 34.3009, 71.6524, 'P', 'PPL', 'PK.03', NULL, 29444, 'Asia/Karachi', 1, '2015-07-02 23:00:00', '2015-07-02 23:00:00'),
(1163952, 'PK', 'Tando Muhammad Khan', 'Tando Muhammad Khan', 25.1238, 68.5368, 'P', 'PPLA2', 'PK.05', NULL, 72659, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1163958, 'PK', 'Tando Jam', 'Tando Jam', 25.4281, 68.5292, 'P', 'PPL', 'PK.05', NULL, 31612, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1163964, 'PK', 'Tando Bago', 'Tando Bago', 24.7891, 68.9653, 'P', 'PPL', 'PK.05', NULL, 14095, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1163965, 'PK', 'Tando Allahyar', 'Tando Allahyar', 25.4605, 68.7175, 'P', 'PPLA2', 'PK.05', NULL, 127202, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1163967, 'PK', 'Tando Adam', 'Tando Adam', 25.7682, 68.662, 'P', 'PPL', 'PK.05', NULL, 125598, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1163968, 'PK', 'Tandlianwala', 'Tandlianwala', 31.0336, 73.1327, 'P', 'PPL', 'PK.04', NULL, 38285, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1164045, 'PK', 'Talhar', 'Talhar', 24.8845, 68.8144, 'P', 'PPL', 'PK.05', NULL, 21154, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1164064, 'PK', 'Talamba', 'Talamba', 30.5269, 72.2408, 'P', 'PPL', 'PK.04', NULL, 28151, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1164069, 'PK', 'Talagang', 'Talagang', 32.9277, 72.4159, 'P', 'PPL', 'PK.04', NULL, 44960, 'Asia/Karachi', 1, '2018-08-06 23:00:00', '2018-08-06 23:00:00'),
(1164076, 'PK', 'Thal', 'Thal', 35.4784, 72.2438, 'P', 'PPL', 'PK.03', NULL, 29331, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1164216, 'PK', 'Swabi', 'Swabi', 34.1202, 72.4698, 'P', 'PPLA2', 'PK.03', NULL, 97363, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1164245, 'PK', 'Surkhpur', 'Surkhpur', 32.7182, 74.4477, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 20000, 'Asia/Karachi', 1, '2018-09-03 23:00:00', '2018-09-03 23:00:00'),
(1164306, 'PK', 'Surab', 'Surab', 28.4928, 66.26, 'P', 'PPL', 'PK.02', NULL, 13104, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1164408, 'PK', 'Sukkur', 'Sukkur', 27.7032, 68.8589, 'P', 'PPLA2', 'PK.05', NULL, 417767, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1164419, 'PK', 'Sukheke Mandi', 'Sukheke Mandi', 31.8654, 73.5088, 'P', 'PPL', 'PK.04', NULL, 32836, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1164660, 'PK', 'Sohbatpur', 'Sohbatpur', 28.5204, 68.543, 'P', 'PPL', 'PK.02', NULL, 8940, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1164679, 'PK', 'Sodhri', 'Sodhri', 32.4621, 74.1821, 'P', 'PPL', 'PK.04', NULL, 15977, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1164698, 'PK', 'Sobhodero', 'Sobhodero', 27.3048, 68.3971, 'P', 'PPL', 'PK.05', NULL, 14623, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1164716, 'PK', 'Sīta Road', 'Sita Road', 27.0333, 67.85, 'P', 'PPL', 'PK.05', NULL, 27587, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1164776, 'PK', 'Sinjhoro', 'Sinjhoro', 26.0301, 68.8087, 'P', 'PPL', 'PK.05', NULL, 15970, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1164825, 'PK', 'Sillanwali', 'Sillanwali', 31.8254, 72.5406, 'P', 'PPL', 'PK.04', NULL, 27023, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1164896, 'PK', 'Sibi', 'Sibi', 29.543, 67.8773, 'P', 'PPLA2', 'PK.02', NULL, 64069, 'Asia/Karachi', 1, '2016-10-06 23:00:00', '2016-10-06 23:00:00'),
(1164909, 'PK', 'Sialkot', 'Sialkot', 32.4927, 74.5313, 'P', 'PPLA2', 'PK.04', NULL, 477396, 'Asia/Karachi', 1, '2014-08-18 23:00:00', '2014-08-18 23:00:00'),
(1164970, 'PK', 'Shujaabad', 'Shujaabad', 29.8809, 71.2934, 'P', 'PPL', 'PK.04', NULL, 65952, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1164987, 'PK', 'Shorkot', 'Shorkot', 31.9102, 70.8776, 'P', 'PPL', 'PK.03', NULL, 67439, 'Asia/Karachi', 1, '2017-05-06 23:00:00', '2017-05-06 23:00:00'),
(1165108, 'PK', 'Shikarpur', 'Shikarpur', 27.9556, 68.6382, 'P', 'PPLA2', 'PK.05', NULL, 156901, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1165221, 'PK', 'Shekhupura', 'Shekhupura', 31.7129, 73.9856, 'P', 'PPLA2', 'PK.04', NULL, 361303, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1165260, 'PK', 'Sharqpur Sharif', 'Sharqpur Sharif', 31.4612, 74.1009, 'P', 'PPL', 'PK.04', NULL, 31855, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1165388, 'PK', 'Shakargarh', 'Shakargarh', 32.2636, 75.1601, 'P', 'PPL', 'PK.04', NULL, 64304, 'Asia/Karachi', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(1165486, 'PK', 'Shahr Sultan', 'Shahr Sultan', 29.5752, 71.0221, 'P', 'PPL', 'PK.04', NULL, 16166, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1165507, 'PK', 'Shahpur Chakar', 'Shahpur Chakar', 26.1541, 68.6501, 'P', 'PPL', 'PK.05', NULL, 21446, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1165518, 'PK', 'Shahpur', 'Shahpur', 32.2682, 72.4688, 'P', 'PPL', 'PK.04', NULL, 14153, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1165569, 'PK', 'Shahkot', 'Shahkot', 31.5709, 73.4853, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 200000, 'Asia/Karachi', 1, '2012-07-30 23:00:00', '2012-07-30 23:00:00'),
(1165635, 'PK', 'Shahdadpur', 'Shahdadpur', 25.9254, 68.6228, 'P', 'PPL', 'PK.05', NULL, 67249, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1165638, 'PK', 'Shahdad Kot', 'Shahdad Kot', 27.8473, 67.9068, 'P', 'PPLA2', 'PK.05', NULL, 75411, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1165744, 'PK', 'Shabqadar', 'Shabqadar', 34.216, 71.5548, 'P', 'PPL', 'PK.03', NULL, 66541, 'Asia/Karachi', 1, '2015-07-02 23:00:00', '2015-07-02 23:00:00'),
(1165789, 'PK', 'Sehwan', 'Sehwan', 26.4249, 67.8613, 'P', 'PPL', 'PK.05', NULL, 41150, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1166000, 'PK', 'Sargodha', 'Sargodha', 32.0859, 72.6742, 'P', 'PPLA2', 'PK.04', NULL, 542603, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1166062, 'PK', 'Sarai Sidhu', 'Sarai Sidhu', 30.5948, 71.9699, 'P', 'PPL', 'PK.04', NULL, 15632, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166066, 'PK', 'Sarai Naurang', 'Sarai Naurang', 32.8258, 70.7811, 'P', 'PPL', 'PK.03', NULL, 19694, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1166073, 'PK', 'Sarai Alamgir', 'Sarai Alamgir', 32.9049, 73.7552, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 44120, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166115, 'PK', 'Sann', 'Sann', 26.0403, 68.1376, 'P', 'PPL', 'PK.05', NULL, 8834, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1166118, 'PK', 'Sanjwal', 'Sanjwal', 33.7611, 72.4332, 'P', 'PPL', 'PK.04', NULL, 10657, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166146, 'PK', 'Sangla Hill', 'Sangla Hill', 31.7167, 73.3833, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 57002, 'Asia/Karachi', 1, '2014-10-07 23:00:00', '2014-10-07 23:00:00'),
(1166164, 'PK', 'Sanghar', 'Sanghar', 26.0469, 68.9492, 'P', 'PPLA2', 'PK.05', NULL, 62033, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1166265, 'PK', 'Sambrial', 'Sambrial', 32.4784, 74.3534, 'P', 'PPL', 'PK.04', NULL, 62874, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166275, 'PK', 'Samaro', 'Samaro', 25.2814, 69.3962, 'P', 'PPL', 'PK.05', NULL, 8784, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1166381, 'PK', 'Sakrand', 'Sakrand', 26.1385, 68.2744, 'P', 'PPL', 'PK.05', NULL, 31630, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1166547, 'PK', 'Sahiwal', 'Sahiwal', 31.9739, 72.3311, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 37186, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166548, 'PK', 'Sahiwal', 'Sahiwal', 30.666, 73.1019, 'P', 'PPLA2', 'PK.04', 'PK.04.1166545', 235695, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166652, 'PK', 'Saddiqabad', 'Saddiqabad', 28.3091, 70.1265, 'P', 'PPL', 'PK.04', NULL, 189876, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1166720, 'PK', 'Rustam', 'Rustam', 27.9671, 68.8039, 'P', 'PPL', 'PK.05', NULL, 9048, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1166819, 'PK', 'Rojhan', 'Rojhan', 28.6873, 69.9535, 'P', 'PPL', 'PK.04', NULL, 13031, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1166827, 'PK', 'Rohri', 'Rohri', 27.692, 68.895, 'P', 'PPL', 'PK.05', NULL, 50649, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1166933, 'PK', 'Renala Khurd', 'Renala Khurd', 30.8788, 73.5986, 'P', 'PPL', 'PK.04', NULL, 37111, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1166993, 'PK', 'Rawalpindi', 'Rawalpindi', 33.5973, 73.0479, 'P', 'PPLA2', 'PK.04', 'PK.04.1166991', 1743101, 'Asia/Karachi', 1, '2018-08-18 23:00:00', '2018-08-18 23:00:00'),
(1167031, 'PK', 'Ratodero', 'Ratodero', 27.8023, 68.289, 'P', 'PPL', 'PK.05', NULL, 47819, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1167064, 'PK', 'Rasulnagar', 'Rasulnagar', 32.3279, 73.7804, 'P', 'PPL', 'PK.04', NULL, 14392, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1167142, 'PK', 'Ranipur', 'Ranipur', 27.2872, 68.5062, 'P', 'PPL', 'PK.05', NULL, 22495, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1167342, 'PK', 'Rajo Khanani', 'Rajo Khanani', 24.9839, 68.8537, 'P', 'PPL', 'PK.05', NULL, 7683, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1167380, 'PK', 'Rajanpur', 'Rajanpur', 29.1041, 70.3297, 'P', 'PPLA2', 'PK.04', NULL, 50682, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1167386, 'PK', 'Raja Jang', 'Raja Jang', 31.2208, 74.2548, 'P', 'PPL', 'PK.04', NULL, 24407, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1167398, 'PK', 'Raiwind', 'Raiwind', 31.2489, 74.2153, 'P', 'PPL', 'PK.04', NULL, 31592, 'Asia/Karachi', 1, '2017-04-05 23:00:00', '2017-04-05 23:00:00'),
(1167460, 'PK', 'Rahim Yar Khan', 'Rahim Yar Khan', 28.4199, 70.3035, 'P', 'PPLA2', 'PK.04', 'PK.04.1167458', 788915, 'Asia/Karachi', 1, '2017-09-25 23:00:00', '2017-09-25 23:00:00'),
(1167501, 'PK', 'Goth Radhan', 'Goth Radhan', 27.1985, 67.9535, 'P', 'PPL', 'PK.05', NULL, 16786, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1167507, 'PK', 'Chenab Nagar', 'Chenab Nagar', 31.7551, 72.914, 'P', 'PPL', 'PK.04', NULL, 70000, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1167528, 'PK', 'Quetta', 'Quetta', 30.1841, 67.0014, 'P', 'PPLA', 'PK.02', NULL, 733675, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1167622, 'PK', 'Kambar', 'Kambar', 27.5875, 68.0007, 'P', 'PPL', 'PK.05', NULL, 77481, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1167648, 'PK', 'Qadirpur Ran', 'Qadirpur Ran', 30.2918, 71.6716, 'P', 'PPL', 'PK.04', NULL, 20407, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1167798, 'PK', 'Pithoro', 'Pithoro', 25.5112, 69.378, 'P', 'PPL', 'PK.05', NULL, 6440, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1167821, 'PK', 'Pishin', 'Pishin', 30.5818, 66.9941, 'P', 'PPLA2', 'PK.02', NULL, 24239, 'Asia/Karachi', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(1167873, 'PK', 'Pir Mahal', 'Pir Mahal', 30.7666, 72.4345, 'P', 'PPL', 'PK.04', NULL, 35343, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1168015, 'PK', 'Pindi Gheb', 'Pindi Gheb', 33.241, 72.2648, 'P', 'PPL', 'PK.04', NULL, 34301, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1168021, 'PK', 'Pindi Bhattian', 'Pindi Bhattian', 31.8984, 73.2734, 'P', 'PPL', 'PK.04', NULL, 35088, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1168036, 'PK', 'Pind Dadan Khan', 'Pind Dadan Khan', 32.5866, 73.0446, 'P', 'PPL', 'PK.04', NULL, 22001, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1168101, 'PK', 'Goth Phulji', 'Goth Phulji', 26.881, 67.6824, 'P', 'PPL', 'PK.05', NULL, 7877, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1168166, 'PK', 'Phalia', 'Phalia', 32.431, 73.579, 'P', 'PPL', 'PK.04', NULL, 24789, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1168197, 'PK', 'Peshawar', 'Peshawar', 34.008, 71.5785, 'P', 'PPLA', 'PK.03', NULL, 1218773, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1168226, 'PK', 'Pattoki', 'Pattoki', 31.0202, 73.8533, 'P', 'PPL', 'PK.04', NULL, 70436, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1168307, 'PK', 'Pasrur', 'Pasrur', 32.2629, 74.6633, 'P', 'PPL', 'PK.04', NULL, 53364, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1168312, 'PK', 'Pasni', 'Pasni', 25.263, 63.4692, 'P', 'PPL', 'PK.02', NULL, 33110, 'Asia/Karachi', 1, '2017-08-22 23:00:00', '2017-08-22 23:00:00'),
(1168394, 'PK', 'Parachinar', 'Parachinar', 33.8997, 70.1001, 'P', 'PPLA', 'PK.01', NULL, 0, 'Asia/Karachi', 1, '2013-11-15 23:00:00', '2013-11-15 23:00:00'),
(1168412, 'PK', 'Pano Aqil', 'Pano Aqil', 27.8562, 69.1111, 'P', 'PPL', 'PK.05', NULL, 72881, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1168555, 'PK', 'Pakpattan', 'Pakpattan', 30.3431, 73.3894, 'P', 'PPLA2', 'PK.04', NULL, 126706, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1168633, 'PK', 'Paharpur', 'Paharpur', 32.105, 70.9706, 'P', 'PPL', 'PK.03', NULL, 17294, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1168652, 'PK', 'Pad Idan', 'Pad Idan', 26.7745, 68.3009, 'P', 'PPL', 'PK.05', NULL, 20919, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1168680, 'PK', 'Pabbi', 'Pabbi', 34.0097, 71.7944, 'P', 'PPL', 'PK.03', NULL, 37307, 'Asia/Karachi', 1, '2016-04-09 23:00:00', '2016-04-09 23:00:00'),
(1168700, 'PK', 'Ormara', 'Ormara', 25.2102, 64.6363, 'P', 'PPL', 'PK.02', NULL, 13026, 'Asia/Karachi', 1, '2018-11-05 23:00:00', '2018-11-05 23:00:00'),
(1168718, 'PK', 'Okara', 'Okara', 30.8103, 73.4516, 'P', 'PPLA2', 'PK.04', NULL, 223648, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1168749, 'PK', 'Nushki', 'Nushki', 29.5522, 66.0229, 'P', 'PPL', 'PK.02', NULL, 27680, 'Asia/Karachi', 1, '2015-12-04 23:00:00', '2015-12-04 23:00:00'),
(1169116, 'PK', 'Nawabshah', 'Nawabshah', 26.2394, 68.4037, 'P', 'PPLA2', 'PK.05', NULL, 229504, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1169143, 'PK', 'Naushahro Firoz', 'Naushahro Firoz', 26.8401, 68.1227, 'P', 'PPLA2', 'PK.05', NULL, 17631, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1169145, 'PK', 'Naushahra Virkan', 'Naushahra Virkan', 31.9626, 73.9712, 'P', 'PPL', 'PK.04', NULL, 40853, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1169187, 'PK', 'Naudero', 'Naudero', 27.6668, 68.3609, 'P', 'PPL', 'PK.05', NULL, 33455, 'Asia/Karachi', 1, '2016-12-02 23:00:00', '2016-12-02 23:00:00'),
(1169254, 'PK', 'Nasirabad', 'Nasirabad', 27.3814, 67.9164, 'P', 'PPL', 'PK.05', NULL, 27809, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1169278, 'PK', 'Narowal', 'Narowal', 32.102, 74.873, 'P', 'PPLA2', 'PK.04', NULL, 68291, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1169334, 'PK', 'Narang Mandi', 'Narang Mandi', 31.9038, 74.5159, 'P', 'PPL', 'PK.04', NULL, 34778, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1169367, 'PK', 'Naukot', 'Naukot', 24.8582, 69.4015, 'P', 'PPL', 'PK.05', NULL, 22081, 'Asia/Karachi', 1, '2017-07-03 23:00:00', '2017-07-03 23:00:00'),
(1169372, 'PK', 'Nankana Sahib', 'Nankana Sahib', 31.4501, 73.7065, 'P', 'PPL', 'PK.04', NULL, 56366, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1169580, 'PK', 'Nabisar', 'Nabisar', 25.0672, 69.6434, 'P', 'PPL', 'PK.05', NULL, 6256, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1169605, 'PK', 'Muzaffargarh', 'Muzaffargarh', 30.0726, 71.1938, 'P', 'PPLA2', 'PK.04', NULL, 165192, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00'),
(1169607, 'PK', 'Muzaffarābād', 'Muzaffarabad', 34.37, 73.4708, 'P', 'PPLA', 'PK.06', NULL, 725000, 'Asia/Karachi', 1, '2014-03-22 23:00:00', '2014-03-22 23:00:00'),
(1169620, 'PK', 'Mustafābād', 'Mustafabad', 30.8922, 73.4989, 'P', 'PPL', 'PK.04', NULL, 45795, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1169684, 'PK', 'Murree', 'Murree', 33.9084, 73.3903, 'P', 'PPL', 'PK.04', NULL, 25247, 'Asia/Karachi', 1, '2015-01-09 23:00:00', '2015-01-09 23:00:00'),
(1169692, 'PK', 'Muridke', 'Muridke', 31.8026, 74.2577, 'P', 'PPL', 'PK.04', NULL, 164246, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1169825, 'PK', 'Multan', 'Multan', 30.1968, 71.4782, 'P', 'PPLA2', 'PK.04', NULL, 1437230, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1170013, 'PK', 'Moro', 'Moro', 26.6632, 68.0002, 'P', 'PPL', 'PK.05', NULL, 76765, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1170219, 'PK', 'Mithi', 'Mithi', 24.737, 69.7971, 'P', 'PPL', 'PK.05', NULL, 23431, 'Asia/Karachi', 1, '2016-01-06 23:00:00', '2016-01-06 23:00:00'),
(1170222, 'PK', 'Mitha Tiwana', 'Mitha Tiwana', 32.2454, 72.1061, 'P', 'PPL', 'PK.04', NULL, 26390, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1170281, 'PK', 'Mirwah Gorchani', 'Mirwah Gorchani', 25.3098, 69.0502, 'P', 'PPL', 'PK.05', NULL, 12139, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1170290, 'PK', 'Mirpur Sakro', 'Mirpur Sakro', 24.5469, 67.628, 'P', 'PPL', 'PK.05', NULL, 8371, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1170294, 'PK', 'Mirpur Mathelo', 'Mirpur Mathelo', 28.0214, 69.5491, 'P', 'PPL', 'PK.05', NULL, 49311, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1170295, 'PK', 'Mirpur Khas', 'Mirpur Khas', 25.5276, 69.0126, 'P', 'PPLA2', 'PK.05', NULL, 215657, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1170299, 'PK', 'Mirpur Bhtoro', 'Mirpur Bhtoro', 24.7285, 68.2601, 'P', 'PPL', 'PK.05', NULL, 8866, 'Asia/Karachi', 1, '2017-07-03 23:00:00', '2017-07-03 23:00:00'),
(1170312, 'PK', 'Miro Khan', 'Miro Khan', 27.7598, 68.0919, 'P', 'PPL', 'PK.05', NULL, 10590, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1170395, 'PK', 'Mingora', 'Mingora', 34.7795, 72.3626, 'P', 'PPL', 'PK.03', NULL, 279914, 'Asia/Karachi', 1, '2013-11-24 23:00:00', '2013-11-24 23:00:00'),
(1170398, 'PK', 'Minchianabad', 'Minchianabad', 30.1636, 73.5686, 'P', 'PPL', 'PK.04', NULL, 29253, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1170425, 'PK', 'Mianwali', 'Mianwali', 32.5776, 71.5285, 'P', 'PPLA2', 'PK.04', NULL, 89570, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1170486, 'PK', 'Mian Channun', 'Mian Channun', 30.4407, 72.3568, 'P', 'PPL', 'PK.04', NULL, 76226, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1170564, 'PK', 'Mehrabpur', 'Mehrabpur', 28.1077, 68.0255, 'P', 'PPL', 'PK.02', NULL, 35263, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1170584, 'PK', 'Mehar', 'Mehar', 27.1803, 67.8205, 'P', 'PPL', 'PK.05', NULL, 30429, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1170667, 'PK', 'Matli', 'Matli', 25.0429, 68.6559, 'P', 'PPL', 'PK.05', NULL, 50398, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1170677, 'PK', 'Matiari', 'Matiari', 25.5971, 68.4467, 'P', 'PPLA2', 'PK.05', NULL, 18929, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1170706, 'PK', 'Mastung', 'Mastung', 29.7997, 66.8455, 'P', 'PPLA2', 'PK.02', NULL, 29082, 'Asia/Karachi', 1, '2016-10-06 23:00:00', '2016-10-06 23:00:00'),
(1170880, 'PK', 'Mardan', 'Mardan', 34.1979, 72.0497, 'P', 'PPLA2', 'PK.03', NULL, 300424, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1170951, 'PK', 'Mansehra', 'Mansehra', 34.3302, 73.1968, 'P', 'PPLA2', 'PK.03', NULL, 66486, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1170974, 'PK', 'Mankera', 'Mankera', 31.3877, 71.4405, 'P', 'PPL', 'PK.04', NULL, 10819, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1171050, 'PK', 'Mangla', 'Mangla', 31.8931, 72.3817, 'P', 'PPL', 'PK.04', NULL, 16264, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1171123, 'PK', 'Mandi Bahauddin', 'Mandi Bahauddin', 32.587, 73.4912, 'P', 'PPLA2', 'PK.04', NULL, 129733, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1171165, 'PK', 'Mananwala', 'Mananwala', 31.588, 73.6893, 'P', 'PPL', 'PK.04', NULL, 28432, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1171198, 'PK', 'Mamu Kanjan', 'Mamu Kanjan', 30.8304, 72.7994, 'P', 'PPL', 'PK.04', NULL, 31914, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1171305, 'PK', 'Malir Cantonment', 'Malir Cantonment', 24.9434, 67.2059, 'P', 'PPLX', 'PK.05', NULL, 300000, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1171376, 'PK', 'Malakwal', 'Malakwal', 32.5545, 73.2127, 'P', 'PPL', 'PK.04', NULL, 34589, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1171502, 'PK', 'Mailsi', 'Mailsi', 29.8012, 72.174, 'P', 'PPL', 'PK.04', NULL, 64545, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1171677, 'PK', 'Madeji', 'Madeji', 27.7531, 68.4517, 'P', 'PPL', 'PK.05', NULL, 14802, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1171757, 'PK', 'Mach', 'Mach', 29.8637, 67.3302, 'P', 'PPL', 'PK.02', NULL, 16930, 'Asia/Karachi', 1, '2018-06-07 23:00:00', '2018-06-07 23:00:00'),
(1171868, 'PK', 'Loralai', 'Loralai', 30.3705, 68.598, 'P', 'PPLA2', 'PK.02', NULL, 37787, 'Asia/Karachi', 1, '2017-03-31 23:00:00', '2017-03-31 23:00:00'),
(1171965, 'PK', 'Lodhran', 'Lodhran', 29.5339, 71.6324, 'P', 'PPLA2', 'PK.04', NULL, 97249, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1171991, 'PK', 'Liliani', 'Liliani', 32.2039, 72.9512, 'P', 'PPL', 'PK.04', NULL, 12211, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1172035, 'PK', 'Layyah', 'Layyah', 30.9613, 70.939, 'P', 'PPLA2', 'PK.04', 'PK.04.7418967', 78954, 'Asia/Karachi', 1, '2016-01-31 23:00:00', '2016-01-31 23:00:00'),
(1172128, 'PK', 'Larkana', 'Larkana', 27.559, 68.212, 'P', 'PPLA2', 'PK.05', NULL, 364033, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1172295, 'PK', 'Lalian', 'Lalian', 31.8246, 72.8012, 'P', 'PPL', 'PK.04', NULL, 31355, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1172318, 'PK', 'Lala Musa', 'Lala Musa', 32.7014, 73.9575, 'P', 'PPL', 'PK.04', NULL, 65197, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1172339, 'PK', 'Lakki', 'Lakki', 32.6072, 70.9123, 'P', 'PPLA2', 'PK.03', NULL, 36391, 'Asia/Karachi', 1, '2017-05-06 23:00:00', '2017-05-06 23:00:00'),
(1172389, 'PK', 'Lakhi', 'Lakhi', 27.8488, 68.6997, 'P', 'PPL', 'PK.05', NULL, 13600, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1172451, 'PK', 'Lahore', 'Lahore', 31.558, 74.3507, 'P', 'PPLA', 'PK.04', NULL, 6310888, 'Asia/Karachi', 1, '2017-04-05 23:00:00', '2017-04-05 23:00:00'),
(1172488, 'PK', 'Ladhewala Waraich', 'Ladhewala Waraich', 32.1569, 74.1156, 'P', 'PPLX', 'PK.04', NULL, 39757, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1172513, 'PK', 'Lachi', 'Lachi', 33.3829, 71.3373, 'P', 'PPL', 'PK.03', NULL, 18537, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1172657, 'PK', 'Kunri', 'Kunri', 25.1787, 69.5657, 'P', 'PPL', 'PK.05', NULL, 26773, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1172663, 'PK', 'Kunjah', 'Kunjah', 32.5298, 73.9749, 'P', 'PPL', 'PK.04', NULL, 28103, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1172682, 'PK', 'Kundian', 'Kundian', 32.4577, 71.4789, 'P', 'PPL', 'PK.04', NULL, 35406, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1172779, 'PK', 'Kulachi', 'Kulachi', 31.9306, 70.4596, 'P', 'PPL', 'PK.03', NULL, 22376, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1172866, 'PK', 'Kot Sultan', 'Kot Sultan', 30.7737, 70.9313, 'P', 'PPL', 'PK.04', 'PK.04.7418967', 10000, 'Asia/Karachi', 1, '2016-01-18 23:00:00', '2016-01-18 23:00:00'),
(1172888, 'PK', 'Kot Samaba', 'Kot Samaba', 28.5521, 70.4684, 'P', 'PPL', 'PK.04', NULL, 22953, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1172904, 'PK', 'Kotri', 'Kotri', 25.3657, 68.3083, 'P', 'PPL', 'PK.05', NULL, 72672, 'Asia/Karachi', 1, '2016-12-02 23:00:00', '2016-12-02 23:00:00'),
(1172915, 'PK', 'Kot Radha Kishan', 'Kot Radha Kishan', 31.1707, 74.1013, 'P', 'PPL', 'PK.04', NULL, 45938, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1172964, 'PK', 'Kot Mumin', 'Kot Mumin', 32.1884, 73.0299, 'P', 'PPL', 'PK.04', NULL, 38355, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1172993, 'PK', 'Kot Malik Barkhurdar', 'Kot Malik Barkhurdar', 30.2038, 66.9872, 'P', 'PPLX', 'PK.02', NULL, 69359, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1173025, 'PK', 'Kotli Loharan', 'Kotli Loharan', 32.5889, 74.4947, 'P', 'PPL', 'PK.04', NULL, 21463, 'Asia/Karachi', 1, '2018-09-03 23:00:00', '2018-09-03 23:00:00'),
(1173055, 'PK', 'Kotli', 'Kotli', 33.5184, 73.9022, 'P', 'PPLA2', 'PK.06', NULL, 640000, 'Asia/Karachi', 1, '2015-11-06 23:00:00', '2015-11-06 23:00:00'),
(1173272, 'PK', 'Kot Ghulam Muhammad', 'Kot Ghulam Muhammad', 32.3331, 74.5469, 'P', 'PPL', 'PK.04', NULL, 20897, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1173302, 'PK', 'Kot Diji', 'Kot Diji', 27.3416, 68.7082, 'P', 'PPL', 'PK.05', NULL, 25616, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1173378, 'PK', 'Kot Addu', 'Kot Addu', 30.4691, 70.967, 'P', 'PPL', 'PK.04', NULL, 104217, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1173464, 'PK', 'Kohlu', 'Kohlu', 29.8965, 69.2532, 'P', 'PPLA2', 'PK.02', NULL, 11089, 'Asia/Karachi', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(1173491, 'PK', 'Kohat', 'Kohat', 33.582, 71.4493, 'P', 'PPLA2', 'PK.03', NULL, 151427, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1173664, 'PK', 'Khuzdar', 'Khuzdar', 27.8119, 66.611, 'P', 'PPL', 'PK.02', NULL, 141227, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1173687, 'PK', 'Khushāb', 'Khushab', 32.2967, 72.3525, 'P', 'PPLA3', 'PK.04', NULL, 102793, 'Asia/Karachi', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1173692, 'PK', 'Khurrianwala', 'Khurrianwala', 31.4994, 73.2676, 'P', 'PPL', 'PK.04', NULL, 35292, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1173920, 'PK', 'Khewra', 'Khewra', 32.6491, 73.0106, 'P', 'PPL', 'PK.04', NULL, 32620, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1174042, 'PK', 'Kharian', 'Kharian', 32.8161, 73.887, 'P', 'PPL', 'PK.04', NULL, 81435, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1174062, 'PK', 'Kharan', 'Kharan', 28.5846, 65.415, 'P', 'PPLA2', 'PK.02', NULL, 30841, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1174074, 'PK', 'Karak', 'Karak', 33.1163, 71.0935, 'P', 'PPLA2', 'PK.03', NULL, 13679, 'Asia/Karachi', 1, '2016-04-09 23:00:00', '2016-04-09 23:00:00'),
(1174167, 'PK', 'Khanpur', 'Khanpur', 28.6474, 70.6569, 'P', 'PPL', 'PK.04', NULL, 142426, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1174171, 'PK', 'Khanpur Mahar', 'Khanpur Mahar', 27.8409, 69.413, 'P', 'PPL', 'PK.05', NULL, 22273, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1174211, 'PK', 'Khangarh', 'Khangarh', 29.9145, 71.1607, 'P', 'PPL', 'PK.04', NULL, 19698, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1174217, 'PK', 'Khangah Dogran', 'Khangah Dogran', 31.8329, 73.6221, 'P', 'PPL', 'PK.04', NULL, 30314, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1174301, 'PK', 'Khalabat', 'Khalabat', 34.06, 72.8896, 'P', 'PPLW', 'PK.03', NULL, 39148, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1174344, 'PK', 'Khairpur Nathan Shah', 'Khairpur Nathan Shah', 27.0906, 67.7349, 'P', 'PPL', 'PK.05', NULL, 30286, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1174355, 'PK', 'Khairpur Tamewah', 'Khairpur Tamewah', 29.5814, 72.238, 'P', 'PPL', 'PK.04', NULL, 30967, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1174357, 'PK', 'Khairpur', 'Khairpur', 28.0644, 69.7036, 'P', 'PPL', 'PK.05', NULL, 40083, 'Asia/Karachi', 1, '2016-06-03 23:00:00', '2016-06-03 23:00:00'),
(1174408, 'PK', 'Khadro', 'Khadro', 26.1471, 68.7178, 'P', 'PPL', 'PK.05', NULL, 9997, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1174625, 'PK', 'Kasur', 'Kasur', 31.1187, 74.4502, 'P', 'PPLA2', 'PK.04', NULL, 290643, 'Asia/Karachi', 1, '2017-04-05 23:00:00', '2017-04-05 23:00:00'),
(1174653, 'PK', 'Kashmor', 'Kashmor', 28.4326, 69.5836, 'P', 'PPL', 'PK.05', NULL, 33732, 'Asia/Karachi', 1, '2016-06-03 23:00:00', '2016-06-03 23:00:00'),
(1174720, 'PK', 'Karor', 'Karor', 31.2246, 70.9515, 'P', 'PPL', 'PK.04', NULL, 25634, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1174765, 'PK', 'Kario Ghanwar', 'Kario Ghanwar', 24.8082, 68.6048, 'P', 'PPL', 'PK.05', NULL, 5685, 'Asia/Karachi', 1, '2017-07-03 23:00:00', '2017-07-03 23:00:00'),
(1174815, 'PK', 'Karaundi', 'Karaundi', 26.8971, 68.4064, 'P', 'PPL', 'PK.05', NULL, 8604, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1174872, 'PK', 'Karachi', 'Karachi', 24.8608, 67.0104, 'P', 'PPLA', 'PK.05', 'PK.05.1174870', 11624219, 'Asia/Karachi', 1, '2017-05-22 23:00:00', '2017-05-22 23:00:00'),
(1174984, 'PK', 'Kanganpur', 'Kanganpur', 30.7647, 74.1229, 'P', 'PPL', 'PK.04', NULL, 21788, 'Asia/Karachi', 1, '2017-05-06 23:00:00', '2017-05-06 23:00:00'),
(1175010, 'PK', 'Kandiaro', 'Kandiaro', 27.0592, 68.2102, 'P', 'PPL', 'PK.05', NULL, 26807, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1175012, 'PK', 'Kandiari', 'Kandiari', 26.9155, 68.5219, 'P', 'PPL', 'PK.05', NULL, 6861, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1175021, 'PK', 'Kandhkot', 'Kandhkot', 28.2457, 69.1797, 'P', 'PPL', 'PK.05', NULL, 88468, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1175082, 'PK', 'Kamra', 'Kamra', 33.747, 73.5123, 'P', 'PPL', 'PK.04', NULL, 43779, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1175088, 'PK', 'Kamoke', 'Kamoke', 31.9753, 74.223, 'P', 'PPL', 'PK.04', NULL, 199531, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1175098, 'PK', 'Chak One Hundred Twenty Nine Left', 'Chak One Hundred Twenty Nine Left', 30.4292, 73.0452, 'P', 'PPL', 'PK.04', NULL, 24053, 'Asia/Karachi', 1, '2017-05-06 23:00:00', '2017-05-06 23:00:00'),
(1175125, 'PK', 'Kamar Mushani', 'Kamar Mushani', 32.8432, 71.3619, 'P', 'PPL', 'PK.04', NULL, 15867, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1175156, 'PK', 'Kamalia', 'Kamalia', 30.7271, 72.6461, 'P', 'PPL', 'PK.04', NULL, 112426, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1175180, 'PK', 'Kalur Kot', 'Kalur Kot', 32.1551, 71.2663, 'P', 'PPL', 'PK.04', NULL, 25574, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1175232, 'PK', 'Kallar Kahar', 'Kallar Kahar', 32.78, 72.6979, 'P', 'PPL', 'PK.04', NULL, 15800, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1175283, 'PK', 'Kaleke Mandi', 'Kaleke Mandi', 31.976, 73.6, 'P', 'PPL', 'PK.04', NULL, 16361, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1175296, 'PK', 'Kalat', 'Kalat', 29.0266, 66.5936, 'P', 'PPLA2', 'PK.02', NULL, 26701, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1175297, 'PK', 'Kalaswala', 'Kalaswala', 32.2008, 74.6486, 'P', 'PPL', 'PK.04', NULL, 12576, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1175365, 'PK', 'Kalabagh', 'Kalabagh', 32.9616, 71.5464, 'P', 'PPL', 'PK.04', NULL, 15976, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1175436, 'PK', 'Kahuta', 'Kahuta', 33.5918, 73.3874, 'P', 'PPL', 'PK.04', NULL, 22551, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1175446, 'PK', 'Kahror Pakka', 'Kahror Pakka', 29.6243, 71.9144, 'P', 'PPL', 'PK.04', NULL, 69743, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1175453, 'PK', 'Kahna Nau', 'Kahna Nau', 31.3671, 74.369, 'P', 'PPL', 'PK.04', NULL, 45888, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1175506, 'PK', 'Kadhan', 'Kadhan', 24.4804, 68.9855, 'P', 'PPL', 'PK.05', NULL, 6854, 'Asia/Karachi', 1, '2016-12-02 23:00:00', '2016-12-02 23:00:00'),
(1175560, 'PK', 'Kabirwala', 'Kabirwala', 30.4047, 71.8627, 'P', 'PPL', 'PK.04', NULL, 60782, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1175678, 'PK', 'Johi', 'Johi', 26.6922, 67.6143, 'P', 'PPL', 'PK.05', NULL, 16311, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1175712, 'PK', 'Jiwani', 'Jiwani', 25.0485, 61.7457, 'P', 'PPL', 'PK.02', NULL, 16322, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1175748, 'PK', 'Chak Jhumra', 'Chak Jhumra', 31.5681, 73.1832, 'P', 'PPL', 'PK.04', NULL, 37214, 'Asia/Karachi', 1, '2017-03-03 23:00:00', '2017-03-03 23:00:00'),
(1175762, 'PK', 'Jhol', 'Jhol', 25.9553, 68.8887, 'P', 'PPL', 'PK.05', NULL, 16067, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1175864, 'PK', 'Jhelum', 'Jhelum', 32.9345, 73.731, 'P', 'PPLA2', 'PK.04', NULL, 164080, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1175870, 'PK', 'Jhawarian', 'Jhawarian', 32.3619, 72.6227, 'P', 'PPL', 'PK.04', NULL, 27893, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1175892, 'PK', 'Jhang Sadr', 'Jhang Sadr', 31.2698, 72.3169, 'P', 'PPL', 'PK.04', NULL, 341210, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1176022, 'PK', 'Jauharabad', 'Jauharabad', 32.2902, 72.2818, 'P', 'PPL', 'PK.04', NULL, 46545, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1176035, 'PK', 'Jatoi Shimali', 'Jatoi Shimali', 29.5183, 70.8447, 'P', 'PPL', 'PK.04', NULL, 47144, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1176048, 'PK', 'Jati', 'Jati', 24.3549, 68.2673, 'P', 'PPL', 'PK.05', NULL, 9152, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1176106, 'PK', 'Jaranwala', 'Jaranwala', 31.3332, 73.4187, 'P', 'PPL', 'PK.04', NULL, 119785, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1176206, 'PK', 'Jandiala Sher Khan', 'Jandiala Sher Khan', 31.821, 73.9182, 'P', 'PPL', 'PK.04', NULL, 10985, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1176218, 'PK', 'Jand', 'Jand', 33.433, 72.0188, 'P', 'PPL', 'PK.04', NULL, 18170, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1176241, 'PK', 'Jampur', 'Jampur', 29.6423, 70.5952, 'P', 'PPL', 'PK.04', NULL, 63791, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1176358, 'PK', 'Jalalpur Pirwala', 'Jalalpur Pirwala', 29.5051, 71.222, 'P', 'PPL', 'PK.04', NULL, 37393, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1176368, 'PK', 'Jalalpur Jattan', 'Jalalpur Jattan', 32.6412, 74.2056, 'P', 'PPL', 'PK.04', NULL, 93883, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1176444, 'PK', 'Jahanian Shah', 'Jahanian Shah', 31.8054, 72.2774, 'P', 'PPL', 'PK.04', NULL, 29095, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1176515, 'PK', 'Jacobabad', 'Jacobabad', 28.2819, 68.4376, 'P', 'PPLA2', 'PK.05', 'PK.05.1176514', 170588, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1176608, 'PK', 'Islamkot', 'Islamkot', 24.699, 70.1798, 'P', 'PPL', 'PK.05', NULL, 12426, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1176615, 'PK', 'Islamabad', 'Islamabad', 33.7215, 73.0433, 'P', 'PPLC', 'PK.08', NULL, 601600, 'Asia/Karachi', 1, '2013-04-04 23:00:00', '2013-04-04 23:00:00'),
(1176734, 'PK', 'Hyderabad', 'Hyderabad', 25.3924, 68.3737, 'P', 'PPLA2', 'PK.05', NULL, 1386330, 'Asia/Karachi', 1, '2015-04-23 23:00:00', '2015-04-23 23:00:00'),
(1176800, 'PK', 'Hujra Shah Muqim', 'Hujra Shah Muqim', 30.7417, 73.8233, 'P', 'PPL', 'PK.04', NULL, 61546, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1176889, 'PK', 'Hingorja', 'Hingorja', 27.2109, 68.416, 'P', 'PPL', 'PK.05', NULL, 22263, 'Asia/Karachi', 1, '2011-05-06 23:00:00', '2011-05-06 23:00:00'),
(1176948, 'PK', 'Hazro City', 'Hazro City', 33.9099, 72.4918, 'P', 'PPL', 'PK.04', NULL, 26309, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1176995, 'PK', 'Havelian', 'Havelian', 34.0535, 73.1599, 'P', 'PPL', 'PK.03', NULL, 40481, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1176997, 'PK', 'Haveli Lakha', 'Haveli Lakha', 30.451, 73.6937, 'P', 'PPL', 'PK.04', NULL, 65289, 'Asia/Karachi', 1, '2017-05-06 23:00:00', '2017-05-06 23:00:00'),
(1177042, 'PK', 'Hasilpur', 'Hasilpur', 29.6922, 72.5457, 'P', 'PPL', 'PK.04', NULL, 88031, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1177064, 'PK', 'Chak Thirty-one -Eleven Left', 'Chak Thirty-one -Eleven Left', 30.4239, 72.6974, 'P', 'PPL', 'PK.04', NULL, 45665, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1177073, 'PK', 'Harunabad', 'Harunabad', 29.6121, 73.138, 'P', 'PPL', 'PK.04', NULL, 72432, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1177089, 'PK', 'Harnoli', 'Harnoli', 32.2787, 71.5543, 'P', 'PPL', 'PK.04', NULL, 15669, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1177098, 'PK', 'Harnai', 'Harnai', 30.1008, 67.9382, 'P', 'PPL', 'PK.02', NULL, 11066, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1177107, 'PK', 'Haripur', 'Haripur', 33.9978, 72.9349, 'P', 'PPLA2', 'PK.03', NULL, 56977, 'Asia/Karachi', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00'),
(1177203, 'PK', 'Hangu', 'Hangu', 33.532, 71.0595, 'P', 'PPLA2', 'PK.03', NULL, 36150, 'Asia/Karachi', 1, '2015-05-05 23:00:00', '2015-05-05 23:00:00'),
(1177278, 'PK', 'Hala', 'Hala', 25.8146, 68.422, 'P', 'PPL', 'PK.05', NULL, 47915, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1177384, 'PK', 'Hafizabad', 'Hafizabad', 32.0709, 73.688, 'P', 'PPLA2', 'PK.04', NULL, 153656, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1177397, 'PK', 'Hadali', 'Hadali', 32.6404, 74.569, 'P', 'PPL', 'PK.04', NULL, 49663, 'Asia/Karachi', 1, '2018-09-03 23:00:00', '2018-09-03 23:00:00'),
(1177446, 'PK', 'Gwadar', 'Gwadar', 25.1216, 62.3254, 'P', 'PPLA2', 'PK.02', NULL, 51901, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1177654, 'PK', 'Gujrat', 'Gujrat', 32.5742, 74.0754, 'P', 'PPLA2', 'PK.04', NULL, 301506, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1177662, 'PK', 'Gujranwala', 'Gujranwala', 32.1557, 74.187, 'P', 'PPLA2', 'PK.04', NULL, 1384471, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1177682, 'PK', 'Gujar Khan', 'Gujar Khan', 33.2541, 73.3043, 'P', 'PPL', 'PK.04', NULL, 69374, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1178231, 'PK', 'Gojra', 'Gojra', 31.1493, 72.6832, 'P', 'PPL', 'PK.04', NULL, 139726, 'Asia/Karachi', 1, '2017-03-03 23:00:00', '2017-03-03 23:00:00'),
(1178338, 'PK', 'Gilgit', 'Gilgit', 35.9187, 74.3124, 'P', 'PPLA', 'PK.07', NULL, 10414, 'Asia/Karachi', 1, '2013-11-11 23:00:00', '2013-11-11 23:00:00'),
(1178456, 'PK', 'Ghotki', 'Ghotki', 28.0044, 69.3157, 'P', 'PPLA2', 'PK.05', NULL, 64295, 'Asia/Karachi', 1, '2017-05-06 23:00:00', '2017-05-06 23:00:00'),
(1178560, 'PK', 'Ghauspur', 'Ghauspur', 28.1388, 69.0825, 'P', 'PPL', 'PK.05', NULL, 29767, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1178587, 'PK', 'Gharo', 'Gharo', 24.7418, 67.5853, 'P', 'PPL', 'PK.05', NULL, 19524, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1178841, 'PK', 'Garh Maharaja', 'Garh Maharaja', 30.8338, 71.9049, 'P', 'PPL', 'PK.04', NULL, 29153, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1178843, 'PK', 'Garhiyasin', 'Garhiyasin', 27.9063, 68.5121, 'P', 'PPL', 'PK.05', NULL, 14810, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1178858, 'PK', 'Garhi Khairo', 'Garhi Khairo', 28.0603, 67.9803, 'P', 'PPL', 'PK.02', NULL, 13666, 'Asia/Karachi', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(1178902, 'PK', 'Goth Garelo', 'Goth Garelo', 27.4352, 68.0757, 'P', 'PPL', 'PK.05', NULL, 6853, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1179061, 'PK', 'Gambat', 'Gambat', 27.3517, 68.5215, 'P', 'PPL', 'PK.05', NULL, 34005, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1179185, 'PK', 'Gadani', 'Gadani', 25.1188, 66.7322, 'P', 'PPL', 'PK.02', NULL, 13427, 'Asia/Karachi', 1, '2018-11-05 23:00:00', '2018-11-05 23:00:00'),
(1179223, 'PK', 'Fort Abbas', 'Fort Abbas', 29.1934, 72.8552, 'P', 'PPL', 'PK.04', NULL, 40626, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179255, 'PK', 'Fazilpur', 'Fazilpur', 32.1763, 75.0658, 'P', 'PPL', 'PK.04', NULL, 28213, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179305, 'PK', 'Chak Two Hundred Forty-nine Thal Development Authority', 'Chak Two Hundred Forty-nine Thal Development Authority', 31.1777, 71.2048, 'P', 'PPL', 'PK.04', NULL, 18126, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1179346, 'PK', 'Faruka', 'Faruka', 31.8864, 72.4136, 'P', 'PPL', 'PK.04', NULL, 21747, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179377, 'PK', 'Faqirwali', 'Faqirwali', 29.468, 73.0349, 'P', 'PPL', 'PK.04', NULL, 25186, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179400, 'PK', 'Faisalabad', 'Faisalabad', 31.4155, 73.0897, 'P', 'PPLA2', 'PK.04', NULL, 2506595, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179406, 'PK', 'Eminabad', 'Eminabad', 32.0424, 74.26, 'P', 'PPL', 'PK.04', NULL, 22679, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179450, 'PK', 'Dunyapur', 'Dunyapur', 29.8027, 71.7434, 'P', 'PPL', 'PK.04', NULL, 34044, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1179463, 'PK', 'Dunga Bunga', 'Dunga Bunga', 29.7498, 73.2429, 'P', 'PPL', 'PK.04', NULL, 25893, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179496, 'PK', 'Dullewala', 'Dullewala', 31.8344, 71.4364, 'P', 'PPL', 'PK.04', NULL, 48682, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179515, 'PK', 'Duki', 'Duki', 30.1531, 68.5732, 'P', 'PPL', 'PK.02', NULL, 6384, 'Asia/Karachi', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(1179660, 'PK', 'Dokri', 'Dokri', 27.3742, 68.0972, 'P', 'PPL', 'PK.05', NULL, 14800, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1179724, 'PK', 'Doaba', 'Doaba', 33.4245, 70.7368, 'P', 'PPL', 'PK.03', NULL, 8893, 'Asia/Karachi', 1, '2019-02-20 23:00:00', '2019-02-20 23:00:00'),
(1179757, 'PK', 'Upper Dir', 'Upper Dir', 35.2074, 71.8768, 'P', 'PPLA2', 'PK.03', NULL, 29869, 'Asia/Karachi', 1, '2016-05-06 23:00:00', '2016-05-06 23:00:00'),
(1179758, 'PK', 'Diplo', 'Diplo', 24.4669, 69.5811, 'P', 'PPL', 'PK.05', NULL, 11575, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1179760, 'PK', 'Dipalpur', 'Dipalpur', 30.6698, 73.6531, 'P', 'PPL', 'PK.04', NULL, 74640, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1179762, 'PK', 'Dinan Bashnoian Wala', 'Dinan Bashnoian Wala', 29.7658, 73.2656, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 7500, 'Asia/Karachi', 1, '2016-04-14 23:00:00', '2016-04-14 23:00:00'),
(1179790, 'PK', 'Dinga', 'Dinga', 32.641, 73.7204, 'P', 'PPL', 'PK.04', NULL, 39784, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1179834, 'PK', 'Dijkot', 'Dijkot', 31.2174, 72.9962, 'P', 'PPL', 'PK.04', NULL, 27469, 'Asia/Karachi', 1, '2017-03-03 23:00:00', '2017-03-03 23:00:00'),
(1179837, 'PK', 'Digri', 'Digri', 25.1566, 69.111, 'P', 'PPL', 'PK.05', NULL, 31842, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1179902, 'PK', 'Dhoro Naro', 'Dhoro Naro', 25.5048, 69.5709, 'P', 'PPL', 'PK.05', NULL, 19907, 'Asia/Karachi', 1, '2016-01-06 23:00:00', '2016-01-06 23:00:00'),
(1180071, 'PK', 'Dhaunkal', 'Dhaunkal', 32.4061, 74.1371, 'P', 'PPL', 'PK.04', NULL, 12117, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1180133, 'PK', 'Dhanot', 'Dhanot', 29.5799, 71.7521, 'P', 'PPL', 'PK.04', NULL, 18729, 'Asia/Karachi', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1180281, 'PK', 'Dera Ismail Khan', 'Dera Ismail Khan', 31.8313, 70.9017, 'P', 'PPLA2', 'PK.03', 'PK.03.1180282', 101616, 'Asia/Karachi', 1, '2019-07-10 23:00:00', '2019-07-10 23:00:00'),
(1180289, 'PK', 'Dera Ghazi Khan', 'Dera Ghazi Khan', 30.0459, 70.6403, 'P', 'PPLA2', 'PK.04', NULL, 236093, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1180295, 'PK', 'Dera Bugti', 'Dera Bugti', 29.0362, 69.1585, 'P', 'PPLA2', 'PK.02', NULL, 18120, 'Asia/Karachi', 1, '2016-11-20 23:00:00', '2016-11-20 23:00:00');
INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1180374, 'PK', 'Daur', 'Daur', 26.4553, 68.3184, 'P', 'PPL', 'PK.05', NULL, 17577, 'Asia/Karachi', 1, '2017-06-05 23:00:00', '2017-06-05 23:00:00'),
(1180379, 'PK', 'Daultala', 'Daultala', 33.1928, 73.141, 'P', 'PPL', 'PK.04', NULL, 11814, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1180397, 'PK', 'Daulatpur', 'Daulatpur', 26.5016, 67.9708, 'P', 'PPL', 'PK.05', NULL, 14574, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1180419, 'PK', 'Daud Khel', 'Daud Khel', 32.8753, 71.5712, 'P', 'PPL', 'PK.04', NULL, 26395, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1180436, 'PK', 'Daska Kalan', 'Daska Kalan', 32.3242, 74.3504, 'P', 'PPLX', 'PK.04', NULL, 126924, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1180453, 'PK', 'Darya Khan Marri', 'Darya Khan Marri', 26.6777, 68.2867, 'P', 'PPL', 'PK.05', NULL, 8973, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1180454, 'PK', 'Darya Khan', 'Darya Khan', 31.7845, 71.102, 'P', 'PPL', 'PK.04', NULL, 15048, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1180491, 'PK', 'Daromehar', 'Daromehar', 24.7938, 68.1798, 'P', 'PPL', 'PK.05', NULL, 10869, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1180729, 'PK', 'Dalbandin', 'Dalbandin', 28.8885, 64.4062, 'P', 'PPLA2', 'PK.02', NULL, 14621, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1180752, 'PK', 'Dajal', 'Dajal', 29.5577, 70.3761, 'P', 'PPL', 'PK.04', NULL, 17630, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1180757, 'PK', 'Daira Din Panah', 'Daira Din Panah', 30.5705, 70.9372, 'P', 'PPL', 'PK.04', NULL, 14878, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1180809, 'PK', 'Dadu', 'Dadu', 26.7303, 67.7769, 'P', 'PPLA2', 'PK.05', NULL, 139784, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1180825, 'PK', 'Dadhar', 'Dadhar', 29.4749, 67.6517, 'P', 'PPL', 'PK.02', NULL, 15090, 'Asia/Karachi', 1, '2018-01-08 23:00:00', '2018-01-08 23:00:00'),
(1180942, 'PK', 'Chunian', 'Chunian', 30.9662, 73.9791, 'P', 'PPL', 'PK.04', NULL, 57312, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1180983, 'PK', 'Chuchar-kana Mandi', 'Chuchar-kana Mandi', 31.75, 73.8, 'P', 'PPL', 'PK.04', NULL, 69321, 'Asia/Karachi', 1, '2017-09-03 23:00:00', '2017-09-03 23:00:00'),
(1181022, 'PK', 'Chhor', 'Chhor', 25.5126, 69.7844, 'P', 'PPL', 'PK.05', NULL, 16301, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1181053, 'PK', 'Choa Saidan Shah', 'Choa Saidan Shah', 32.7196, 72.9863, 'P', 'PPL', 'PK.04', NULL, 15344, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1181073, 'PK', 'Chishtian', 'Chishtian', 29.7971, 72.8577, 'P', 'PPL', 'PK.04', NULL, 122199, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1181096, 'PK', 'Chiniot', 'Chiniot', 31.7209, 72.9784, 'P', 'PPLA2', 'PK.04', NULL, 201781, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1181163, 'PK', 'Chichawatni', 'Chichawatni', 30.5301, 72.6916, 'P', 'PPL', 'PK.04', NULL, 82762, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1181352, 'PK', 'Chawinda', 'Chawinda', 32.3443, 74.7051, 'P', 'PPL', 'PK.04', NULL, 23599, 'Asia/Karachi', 1, '2017-02-02 23:00:00', '2017-02-02 23:00:00'),
(1181439, 'PK', 'Charsadda', 'Charsadda', 34.1482, 71.7406, 'P', 'PPLA2', 'PK.03', NULL, 95319, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1181600, 'PK', 'Chamber', 'Chamber', 25.2936, 68.8118, 'P', 'PPL', 'PK.05', NULL, 12746, 'Asia/Karachi', 1, '2017-07-03 23:00:00', '2017-07-03 23:00:00'),
(1181611, 'PK', 'Chaman', 'Chaman', 30.9177, 66.4526, 'P', 'PPL', 'PK.02', NULL, 88568, 'Asia/Karachi', 1, '2016-07-03 23:00:00', '2016-07-03 23:00:00'),
(1181636, 'PK', 'Chakwal', 'Chakwal', 32.9329, 72.8539, 'P', 'PPLA2', 'PK.04', NULL, 101200, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1181887, 'PK', 'Chak Azam Sahu', 'Chak Azam Sahu', 30.752, 73.0283, 'P', 'PPL', 'PK.04', NULL, 38216, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1181910, 'PK', 'Chak', 'Chak', 27.8584, 68.8338, 'P', 'PPL', 'PK.05', NULL, 14275, 'Asia/Karachi', 1, '2018-12-03 23:00:00', '2018-12-03 23:00:00'),
(1182092, 'PK', 'Būrewāla', 'Burewala', 30.1667, 72.65, 'P', 'PPL', 'PK.04', NULL, 183915, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1182295, 'PK', 'Bozdar Wada', 'Bozdar Wada', 27.183, 68.6358, 'P', 'PPL', 'PK.05', NULL, 9175, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1182577, 'PK', 'Bhopalwala', 'Bhopalwala', 32.4297, 74.3635, 'P', 'PPL', 'PK.04', NULL, 17341, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1182607, 'PK', 'Bhit Shah', 'Bhit Shah', 25.8057, 68.4914, 'P', 'PPL', 'PK.05', NULL, 19325, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1182622, 'PK', 'Bhiria', 'Bhiria', 26.9104, 68.1947, 'P', 'PPL', 'PK.05', NULL, 12186, 'Asia/Karachi', 1, '2016-12-02 23:00:00', '2016-12-02 23:00:00'),
(1182637, 'PK', 'Bhimbar', 'Bhimbar', 32.9747, 74.0785, 'P', 'PPL', 'PK.06', NULL, 342900, 'Asia/Karachi', 1, '2016-02-05 23:00:00', '2016-02-05 23:00:00'),
(1182665, 'PK', 'Bhera', 'Bhera', 32.4821, 72.9087, 'P', 'PPL', 'PK.04', NULL, 31781, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1182682, 'PK', 'Bhawana', 'Bhawana', 31.5688, 72.6492, 'P', 'PPL', 'PK.04', NULL, 16218, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1182775, 'PK', 'Bhan', 'Bhan', 26.5583, 67.7214, 'P', 'PPL', 'PK.05', NULL, 16961, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1182787, 'PK', 'Bhalwal', 'Bhalwal', 32.2658, 72.8981, 'P', 'PPL', 'PK.04', NULL, 74744, 'Asia/Karachi', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(1182815, 'PK', 'Bhakkar', 'Bhakkar', 31.6269, 71.0647, 'P', 'PPLA2', 'PK.04', NULL, 81950, 'Asia/Karachi', 1, '2017-10-02 23:00:00', '2017-10-02 23:00:00'),
(1182829, 'PK', 'Mianke Mor', 'Mianke Mor', 31.2024, 73.9486, 'P', 'PPL', 'PK.04', NULL, 86900, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1182872, 'PK', 'Bhag', 'Bhag', 29.0417, 67.8239, 'P', 'PPL', 'PK.02', NULL, 14555, 'Asia/Karachi', 1, '2018-06-07 23:00:00', '2018-06-07 23:00:00'),
(1182953, 'PK', 'Berani', 'Berani', 25.785, 68.8075, 'P', 'PPL', 'PK.05', NULL, 9975, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1182998, 'PK', 'Bela', 'Bela', 26.2272, 66.3118, 'P', 'PPL', 'PK.02', NULL, 20119, 'Asia/Karachi', 1, '2016-09-07 23:00:00', '2016-09-07 23:00:00'),
(1183018, 'PK', 'Begowala', 'Begowala', 32.4382, 74.2679, 'P', 'PPL', 'PK.04', NULL, 9259, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1183090, 'PK', 'Bat Khela', 'Bat Khela', 34.6178, 71.9725, 'P', 'PPL', 'PK.03', NULL, 46079, 'Asia/Karachi', 1, '2015-07-02 23:00:00', '2015-07-02 23:00:00'),
(1183105, 'PK', 'Battagram', 'Battagram', 34.6772, 73.0233, 'P', 'PPLA2', 'PK.03', 'PK.03.8224052', 700000, 'Asia/Karachi', 1, '2016-12-14 23:00:00', '2016-12-14 23:00:00'),
(1183224, 'PK', 'Basirpur', 'Basirpur', 30.5776, 73.8391, 'P', 'PPL', 'PK.04', NULL, 41617, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1183307, 'PK', 'Barkhan', 'Barkhan', 29.8977, 69.5256, 'P', 'PPLA2', 'PK.02', NULL, 8760, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1183460, 'PK', 'Bannu', 'Bannu', 32.9853, 70.604, 'P', 'PPLA2', 'PK.03', NULL, 49008, 'Asia/Karachi', 1, '2017-07-31 23:00:00', '2017-07-31 23:00:00'),
(1183511, 'PK', 'Bandhi', 'Bandhi', 26.5876, 68.3021, 'P', 'PPL', 'PK.05', NULL, 8608, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(1183880, 'PK', 'Bahawalpur', 'Bahawalpur', 29.3978, 71.6752, 'P', 'PPLA2', 'PK.04', NULL, 552607, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1183883, 'PK', 'Bahawalnagar', 'Bahawalnagar', 29.9984, 73.2527, 'P', 'PPLA2', 'PK.04', NULL, 126617, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1184008, 'PK', 'Bagarji', 'Bagarji', 27.7543, 68.7587, 'P', 'PPL', 'PK.05', NULL, 8005, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1184020, 'PK', 'Baffa', 'Baffa', 34.4377, 73.2237, 'P', 'PPL', 'PK.03', NULL, 14047, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1184055, 'PK', 'Badin', 'Badin', 24.656, 68.837, 'P', 'PPLA2', 'PK.05', NULL, 73569, 'Asia/Karachi', 1, '2017-02-03 23:00:00', '2017-02-03 23:00:00'),
(1184075, 'PK', 'Baddomalhi', 'Baddomalhi', 31.9904, 74.6641, 'P', 'PPL', 'PK.04', NULL, 18435, 'Asia/Karachi', 1, '2017-04-05 23:00:00', '2017-04-05 23:00:00'),
(1184249, 'PK', 'Attock City', 'Attock City', 33.7667, 72.3598, 'P', 'PPLA2', 'PK.04', NULL, 85479, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1184370, 'PK', 'Arifwala', 'Arifwala', 30.2906, 73.0657, 'P', 'PPL', 'PK.04', NULL, 87360, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(1184569, 'PK', 'Aman Garh', 'Aman Garh', 34.0058, 71.9297, 'P', 'PPL', 'PK.03', NULL, 25723, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(1184655, 'PK', 'Alipur', 'Alipur', 29.3824, 70.9111, 'P', 'PPL', 'PK.04', NULL, 33601, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1184752, 'PK', 'Akora', 'Akora', 34.0034, 72.1256, 'P', 'PPL', 'PK.03', NULL, 23288, 'Asia/Karachi', 1, '2017-01-03 23:00:00', '2017-01-03 23:00:00'),
(1184845, 'PK', 'Ahmadpur East', 'Ahmadpur East', 29.1427, 71.2577, 'P', 'PPL', 'PK.04', NULL, 116579, 'Asia/Karachi', 1, '2017-11-06 23:00:00', '2017-11-06 23:00:00'),
(1185056, 'PK', 'Abbottabad', 'Abbottabad', 34.1463, 73.2117, 'P', 'PPLA2', 'PK.03', NULL, 120000, 'Asia/Karachi', 1, '2018-10-14 23:00:00', '2018-10-14 23:00:00'),
(1332083, 'PK', 'Bahawalnagar', 'Bahawalnagar', 30.5508, 73.3908, 'P', 'PPL', 'PK.04', NULL, 126700, 'Asia/Karachi', 1, '2018-05-09 23:00:00', '2018-05-09 23:00:00'),
(1341204, 'PK', 'Nowshera Cantonment', 'Nowshera Cantonment', 33.9983, 71.9983, 'P', 'PPL', 'PK.03', NULL, 96766, 'Asia/Karachi', 1, '2018-07-03 23:00:00', '2018-07-03 23:00:00'),
(1347134, 'PK', 'Alik Ghund', 'Alik Ghund', 30.4898, 67.5218, 'P', 'PPL', 'PK.02', NULL, 7630, 'Asia/Karachi', 1, '2016-11-22 23:00:00', '2016-11-22 23:00:00'),
(1347927, 'PK', 'Khadan Khak', 'Khadan Khak', 30.7524, 67.7113, 'P', 'PPL', 'PK.02', NULL, 6622, 'Asia/Karachi', 1, '2018-01-10 23:00:00', '2018-01-10 23:00:00'),
(1356491, 'PK', 'Ahmadpur Sial', 'Ahmadpur Sial', 30.6779, 71.7434, 'P', 'PPL', 'PK.04', NULL, 24889, 'Asia/Karachi', 1, '2018-05-09 23:00:00', '2018-05-09 23:00:00'),
(1357699, 'PK', 'New Bādāh', 'New Badah', 27.3417, 68.0319, 'P', 'PPL', 'PK.05', NULL, 38855, 'Asia/Karachi', 1, '2018-12-05 23:00:00', '2018-12-05 23:00:00'),
(1403734, 'PK', 'Jām Sāhib', 'Jam Sahib', 26.2958, 68.6292, 'P', 'PPL', 'PK.05', NULL, 6869, 'Asia/Karachi', 1, '2006-01-16 23:00:00', '2006-01-16 23:00:00'),
(1412008, 'PK', 'Setharja Old', 'Setharja Old', 27.2127, 68.4688, 'P', 'PPL', 'PK.05', NULL, 32651, 'Asia/Karachi', 1, '2018-02-06 23:00:00', '2018-02-06 23:00:00'),
(1448637, 'PK', 'Risalpur Cantonment', 'Risalpur Cantonment', 34.0605, 71.9928, 'P', 'PPL', 'PK.03', NULL, 37084, 'Asia/Karachi', 1, '2016-04-10 23:00:00', '2016-04-10 23:00:00'),
(6457378, 'PK', 'Malakwal City', 'Malakwal City', 32.5549, 73.2122, 'P', 'PPL', 'PK.04', NULL, 35000, 'Asia/Karachi', 1, '2007-04-06 23:00:00', '2007-04-06 23:00:00'),
(7649128, 'PK', 'Nazir Town', 'Nazir Town', 33.3061, 73.4833, 'P', 'PPL', 'PK.04', 'PK.04.1180287', 6750, 'Asia/Karachi', 1, '2011-02-07 23:00:00', '2011-02-07 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', 'Andorra', 'Andorra', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, '0', 0, 0, NULL, NULL),
(2, 'AE', 'ARE', 784, 'AE', 'al-Imārāt', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(3, 'AF', 'AFG', 4, 'AF', 'Afġānistān', 'Afghanistan', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(4, 'AG', 'ATG', 28, 'AC', 'Antigua and Barbuda', 'Antigua and Barbuda', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, '0', 0, 0, NULL, NULL),
(5, 'AI', 'AIA', 660, 'AV', 'Anguilla', 'Anguilla', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, '0', 0, 0, NULL, NULL),
(6, 'AL', 'ALB', 8, 'AL', 'Shqipëria', 'Albania', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(7, 'AM', 'ARM', 51, 'AM', 'Hayastan', 'Armenia', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(8, 'AN', 'ANT', 530, 'NT', 'Netherlands Antilles', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, '0', 0, 0, NULL, NULL),
(9, 'AO', 'AGO', 24, 'AO', 'Angola', 'Angola', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(10, 'AQ', 'ATA', 10, 'AY', 'Antarctica', 'Antarctica', '', 14000000, 0, 'AN', '.aq', '', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(11, 'AR', 'ARG', 32, 'AR', 'Argentina', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, '0', 0, 0, NULL, NULL),
(12, 'AS', 'ASM', 16, 'AQ', 'American Samoa', 'American Samoa', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, '0', 0, 0, NULL, NULL),
(13, 'AT', 'AUT', 40, 'AU', 'Österreich', 'Austria', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, '0', 0, 0, NULL, NULL),
(14, 'AU', 'AUS', 36, 'AS', 'Australia', 'Australia', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, '0', 0, 0, NULL, NULL),
(15, 'AW', 'ABW', 533, 'AA', 'Aruba', 'Aruba', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(16, 'AX', 'ALA', 248, '', 'Aland Islands', 'Aland Islands', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, '0', 0, 0, NULL, NULL),
(17, 'AZ', 'AZE', 31, 'AJ', 'Azərbaycan', 'Azerbaijan', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(18, 'BA', 'BIH', 70, 'BK', 'Bosna i Hercegovina', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(19, 'BB', 'BRB', 52, 'BB', 'Barbados', 'Barbados', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, '0', 0, 0, NULL, NULL),
(20, 'BD', 'BGD', 50, 'BG', 'Bāṅlādēś', 'Bangladesh', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, '0', 0, 0, NULL, NULL),
(21, 'BE', 'BEL', 56, 'BE', 'Belgique', 'Belgium', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, '0', 0, 0, NULL, NULL),
(22, 'BF', 'BFA', 854, 'UV', 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(23, 'BG', 'BGR', 100, 'BU', 'Bŭlgarija', 'Bulgaria', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, '0', 0, 0, NULL, NULL),
(24, 'BH', 'BHR', 48, 'BA', 'al-Baḥrayn', 'Bahrain', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, '0', 0, 0, NULL, NULL),
(25, 'BI', 'BDI', 108, 'BY', 'Burundi', 'Burundi', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(26, 'BJ', 'BEN', 204, 'BN', 'Bénin', 'Benin', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, '0', 0, 0, NULL, '2016-05-09 20:55:29'),
(27, 'BL', 'BLM', 652, 'TB', 'Saint Barthelemy', 'Saint Barthelemy', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(28, 'BM', 'BMU', 60, 'BD', 'Bermuda', 'Bermuda', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(29, 'BN', 'BRN', 96, 'BX', 'Brunei Darussalam', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, '0', 0, 0, NULL, NULL),
(30, 'BO', 'BOL', 68, 'BL', 'Bolivia', 'Bolivia', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(31, 'BQ', 'BES', 535, '', 'Bonaire, Saint Eustatius and Saba ', 'Bonaire, Saint Eustatius and Saba ', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(32, 'BR', 'BRA', 76, 'BR', 'Brasil', 'Brazil', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(33, 'BS', 'BHS', 44, 'BF', 'Bahamas', 'Bahamas', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, '0', 0, 0, NULL, NULL),
(34, 'BT', 'BTN', 64, 'BT', 'Druk-yul', 'Bhutan', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(35, 'BV', 'BVT', 74, 'BV', 'Bouvet Island', 'Bouvet Island', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(36, 'BW', 'BWA', 72, 'BC', 'Botswana', 'Botswana', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, '0', 0, 0, NULL, NULL),
(37, 'BY', 'BLR', 112, 'BO', 'Biełaruś', 'Belarus', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(38, 'BZ', 'BLZ', 84, 'BH', 'Belize', 'Belize', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, '0', 0, 0, NULL, NULL),
(39, 'CA', 'CAN', 124, 'CA', 'Canada', 'Canada', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(40, 'CC', 'CCK', 166, 'CK', 'Cocos Islands', 'Cocos Islands', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(41, 'CD', 'COD', 180, 'CG', 'RDC', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, '0', 0, 0, NULL, NULL),
(42, 'CF', 'CAF', 140, 'CT', 'Centrafrique', 'Central African Republic', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, '0', 0, 0, NULL, NULL),
(43, 'CG', 'COG', 178, 'CF', 'Congo', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(44, 'CH', 'CHE', 756, 'SZ', 'Switzerland', 'Switzerland', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(45, 'CI', 'CIV', 384, 'IV', 'Côte d\'Ivoire', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, '0', 0, 0, NULL, NULL),
(46, 'CK', 'COK', 184, 'CW', 'Cook Islands', 'Cook Islands', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(47, 'CL', 'CHL', 152, 'CI', 'Chile', 'Chile', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, '0', 0, 0, NULL, NULL),
(48, 'CM', 'CMR', 120, 'CM', 'Cameroun', 'Cameroon', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, '0', 0, 0, NULL, NULL),
(49, 'CN', 'CHN', 156, 'CH', 'Zhōngguó', 'China', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(50, 'CO', 'COL', 170, 'CO', 'Colombia', 'Colombia', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(51, 'CR', 'CRI', 188, 'CS', 'Costa Rica', 'Costa Rica', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, '0', 0, 0, NULL, NULL),
(52, 'CS', 'SCG', 891, 'YI', 'Serbia and Montenegro', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, '0', 0, 0, NULL, NULL),
(53, 'CU', 'CUB', 192, 'CU', 'Cuba', 'Cuba', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, '0', 0, 0, NULL, NULL),
(54, 'CV', 'CPV', 132, 'CV', 'Cabo Verde', 'Cape Verde', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, '0', 0, 0, NULL, NULL),
(55, 'CW', 'CUW', 531, 'UC', 'Curacao', 'Curacao', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, '0', 0, 0, NULL, NULL),
(56, 'CX', 'CXR', 162, 'KT', 'Christmas Island', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, '0', 0, 0, NULL, NULL),
(57, 'CY', 'CYP', 196, 'CY', 'Kýpros (Kıbrıs)', 'Cyprus', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(58, 'CZ', 'CZE', 203, 'EZ', 'Česko', 'Czech Republic', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, '0', 0, 0, NULL, NULL),
(59, 'DE', 'DEU', 276, 'GM', 'Deutschland', 'Germany', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(60, 'DJ', 'DJI', 262, 'DJ', 'Djibouti', 'Djibouti', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, '0', 0, 0, NULL, NULL),
(61, 'DK', 'DNK', 208, 'DA', 'Danmark', 'Denmark', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, '0', 0, 0, NULL, NULL),
(62, 'DM', 'DMA', 212, 'DO', 'Dominica', 'Dominica', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, '0', 0, 0, NULL, NULL),
(63, 'DO', 'DOM', 214, 'DR', 'República Dominicana', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, '0', 0, 0, NULL, NULL),
(64, 'DZ', 'DZA', 12, 'AG', 'Algérie', 'Algeria', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, '0', 0, 0, NULL, NULL),
(65, 'EC', 'ECU', 218, 'EC', 'Ecuador', 'Ecuador', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, '0', 0, 0, NULL, NULL),
(66, 'EE', 'EST', 233, 'EN', 'Eesti', 'Estonia', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(67, 'EG', 'EGY', 818, 'EG', 'Egypt', 'Egypt', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(68, 'EH', 'ESH', 732, 'WI', 'aṣ-Ṣaḥrāwīyâ al-ʿArabīyâ', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(69, 'ER', 'ERI', 232, 'ER', 'Ertrā', 'Eritrea', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(70, 'ES', 'ESP', 724, 'SP', 'España', 'Spain', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, '0', 0, 0, NULL, NULL),
(71, 'ET', 'ETH', 231, 'ET', 'Ityoṗya', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(72, 'FI', 'FIN', 246, 'FI', 'Suomi (Finland)', 'Finland', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(73, 'FJ', 'FJI', 242, 'FJ', 'Viti', 'Fiji', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, '0', 0, 0, NULL, NULL),
(74, 'FK', 'FLK', 238, 'FK', 'Falkland Islands', 'Falkland Islands', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, '0', 0, 0, NULL, NULL),
(75, 'FM', 'FSM', 583, 'FM', 'Micronesia', 'Micronesia', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, '0', 0, 0, NULL, NULL),
(76, 'FO', 'FRO', 234, 'FO', 'Føroyar', 'Faroe Islands', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, '0', 0, 0, NULL, NULL),
(77, 'FR', 'FRA', 250, 'FR', 'France', 'France', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, '0', 0, 0, NULL, NULL),
(78, 'GA', 'GAB', 266, 'GB', 'Gabon', 'Gabon', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, '0', 0, 0, NULL, NULL),
(79, 'GD', 'GRD', 308, 'GJ', 'Grenada', 'Grenada', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, '0', 0, 0, NULL, NULL),
(80, 'GE', 'GEO', 268, 'GG', 'Sak\'art\'velo', 'Georgia', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(81, 'GF', 'GUF', 254, 'FG', 'Guyane', 'French Guiana', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, '0', 0, 0, NULL, NULL),
(82, 'GG', 'GGY', 831, 'GK', 'Guernsey', 'Guernsey', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(83, 'GH', 'GHA', 288, 'GH', 'Ghana', 'Ghana', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, '0', 0, 0, NULL, NULL),
(84, 'GI', 'GIB', 292, 'GI', 'Gibraltar', 'Gibraltar', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(85, 'GL', 'GRL', 304, 'GL', 'Grønland', 'Greenland', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(86, 'GM', 'GMB', 270, 'GA', 'Gambia', 'Gambia', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, '0', 0, 0, NULL, NULL),
(87, 'GN', 'GIN', 324, 'GV', 'Guinée', 'Guinea', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, '0', 0, 0, NULL, NULL),
(88, 'GP', 'GLP', 312, 'GP', 'Guadeloupe', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, '0', 0, 0, NULL, NULL),
(89, 'GQ', 'GNQ', 226, 'EK', 'Guinée Equatoriale', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, '0', 0, 0, NULL, NULL),
(90, 'GR', 'GRC', 300, 'GR', 'Elláda', 'Greece', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, '0', 0, 0, NULL, NULL),
(91, 'GS', 'SGS', 239, 'SX', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, '0', 0, 0, NULL, NULL),
(92, 'GT', 'GTM', 320, 'GT', 'Guatemala', 'Guatemala', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, '0', 0, 0, NULL, NULL),
(93, 'GU', 'GUM', 316, 'GQ', 'Guam', 'Guam', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, '0', 0, 0, NULL, NULL),
(94, 'GW', 'GNB', 624, 'PU', 'Guiné-Bissau', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, '0', 0, 0, NULL, NULL),
(95, 'GY', 'GUY', 328, 'GY', 'Guyana', 'Guyana', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, '0', 0, 0, NULL, NULL),
(96, 'HK', 'HKG', 344, 'HK', 'Hèunggóng', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(97, 'HM', 'HMD', 334, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, '0', 0, 0, NULL, NULL),
(98, 'HN', 'HND', 340, 'HO', 'Honduras', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, '0', 0, 0, NULL, NULL),
(99, 'HR', 'HRV', 191, 'HR', 'Hrvatska', 'Croatia', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, '0', 0, 0, NULL, NULL),
(100, 'HT', 'HTI', 332, 'HA', 'Haïti', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, '0', 0, 0, NULL, NULL),
(101, 'HU', 'HUN', 348, 'HU', 'Magyarország', 'Hungary', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, '0', 0, 0, NULL, NULL),
(102, 'ID', 'IDN', 360, 'ID', 'Indonesia', 'Indonesia', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, '0', 0, 0, NULL, NULL),
(103, 'IE', 'IRL', 372, 'EI', 'Ireland', 'Ireland', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, '0', 0, 0, NULL, NULL),
(104, 'IL', 'ISR', 376, 'IS', 'Yiśrā\'ēl', 'Israel', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, '0', 0, 0, NULL, NULL),
(105, 'IM', 'IMN', 833, 'IM', 'Isle of Man', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, '0', 0, 0, NULL, NULL),
(106, 'IN', 'IND', 356, 'IN', 'Bhārat', 'India', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, '0', 0, 0, NULL, NULL),
(107, 'IO', 'IOT', 86, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, '0', 0, 0, NULL, NULL),
(108, 'IQ', 'IRQ', 368, 'IZ', 'al-ʿIrāq', 'Iraq', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, '0', 0, 0, NULL, NULL),
(109, 'IR', 'IRN', 364, 'IR', 'Īrān', 'Iran', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, '0', 0, 0, NULL, NULL),
(110, 'IS', 'ISL', 352, 'IC', 'Ísland', 'Iceland', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, '0', 0, 0, NULL, NULL),
(111, 'IT', 'ITA', 380, 'IT', 'Italia', 'Italy', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(112, 'JE', 'JEY', 832, 'JE', 'Jersey', 'Jersey', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(113, 'JM', 'JAM', 388, 'JM', 'Jamaica', 'Jamaica', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, '0', 0, 0, NULL, NULL),
(114, 'JO', 'JOR', 400, 'JO', 'al-Urdun', 'Jordan', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, '0', 0, 0, NULL, NULL),
(115, 'JP', 'JPN', 392, 'JA', 'Nihon', 'Japan', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, '0', 0, 0, NULL, NULL),
(116, 'KE', 'KEN', 404, 'KE', 'Kenya', 'Kenya', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, '0', 0, 0, NULL, NULL),
(117, 'KG', 'KGZ', 417, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(118, 'KH', 'KHM', 116, 'CB', 'Kambucā', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(119, 'KI', 'KIR', 296, 'KR', 'Kiribati', 'Kiribati', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(120, 'KM', 'COM', 174, 'CN', 'Comores', 'Comoros', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, '0', 0, 0, NULL, NULL),
(121, 'KN', 'KNA', 659, 'SC', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, '0', 0, 0, NULL, NULL),
(122, 'KP', 'PRK', 408, 'KN', 'Joseon', 'North Korea', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, '0', 0, 0, NULL, NULL),
(123, 'KR', 'KOR', 410, 'KS', 'Hanguk', 'South Korea', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, '0', 0, 0, NULL, NULL),
(124, 'KW', 'KWT', 414, 'KU', 'al-Kuwayt', 'Kuwait', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, '0', 0, 0, NULL, NULL),
(125, 'KY', 'CYM', 136, 'CJ', 'Cayman Islands', 'Cayman Islands', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, '0', 0, 0, NULL, NULL),
(126, 'KZ', 'KAZ', 398, 'KZ', 'Ķazaķstan', 'Kazakhstan', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, '0', 0, 0, NULL, NULL),
(127, 'LA', 'LAO', 418, 'LA', 'Lāw', 'Laos', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, '0', 0, 0, NULL, NULL),
(128, 'LB', 'LBN', 422, 'LE', 'Lubnān', 'Lebanon', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, '0', 0, 0, NULL, NULL),
(129, 'LC', 'LCA', 662, 'ST', 'Saint Lucia', 'Saint Lucia', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, '0', 0, 0, NULL, NULL),
(130, 'LI', 'LIE', 438, 'LS', 'Liechtenstein', 'Liechtenstein', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, '0', 0, 0, NULL, NULL),
(131, 'LK', 'LKA', 144, 'CE', 'Šrī Laṁkā', 'Sri Lanka', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(132, 'LR', 'LBR', 430, 'LI', 'Liberia', 'Liberia', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, '0', 0, 0, NULL, NULL),
(133, 'LS', 'LSO', 426, 'LT', 'Lesotho', 'Lesotho', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, '0', 0, 0, NULL, NULL),
(134, 'LT', 'LTU', 440, 'LH', 'Lietuva', 'Lithuania', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, '0', 0, 0, NULL, NULL),
(135, 'LU', 'LUX', 442, 'LU', 'Lëtzebuerg', 'Luxembourg', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, '0', 0, 0, NULL, NULL),
(136, 'LV', 'LVA', 428, 'LG', 'Latvija', 'Latvia', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, '0', 0, 0, NULL, NULL),
(137, 'LY', 'LBY', 434, 'LY', 'Lībiyā', 'Libya', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, '0', 0, 0, NULL, NULL),
(138, 'MA', 'MAR', 504, 'MO', 'Maroc', 'Morocco', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, '0', 0, 0, NULL, NULL),
(139, 'MC', 'MCO', 492, 'MN', 'Monaco', 'Monaco', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, '0', 0, 0, NULL, NULL),
(140, 'MD', 'MDA', 498, 'MD', 'Moldova', 'Moldova', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, '0', 0, 0, NULL, NULL),
(141, 'ME', 'MNE', 499, 'MJ', 'Crna Gora', 'Montenegro', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(142, 'MF', 'MAF', 663, 'RN', 'Saint Martin', 'Saint Martin', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, '0', 0, 0, NULL, NULL),
(143, 'MG', 'MDG', 450, 'MA', 'Madagascar', 'Madagascar', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, '0', 0, 0, NULL, NULL),
(144, 'MH', 'MHL', 584, 'RM', 'Marshall Islands', 'Marshall Islands', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, '0', 0, 0, NULL, NULL),
(145, 'MK', 'MKD', 807, 'MK', 'Makedonija', 'Macedonia', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, '0', 0, 0, NULL, NULL),
(146, 'ML', 'MLI', 466, 'ML', 'Mali', 'Mali', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, '0', 0, 0, NULL, NULL),
(147, 'MM', 'MMR', 104, 'BM', 'Mẏanmā', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, '0', 0, 0, NULL, NULL),
(148, 'MN', 'MNG', 496, 'MG', 'Mongol Uls', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, '0', 0, 0, NULL, NULL),
(149, 'MO', 'MAC', 446, 'MC', 'Ngoumún', 'Macao', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, '0', 0, 0, NULL, NULL),
(150, 'MP', 'MNP', 580, 'CQ', 'Northern Mariana Islands', 'Northern Mariana Islands', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, '0', 0, 0, NULL, NULL),
(151, 'MQ', 'MTQ', 474, 'MB', 'Martinique', 'Martinique', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, '0', 0, 0, NULL, NULL),
(152, 'MR', 'MRT', 478, 'MR', 'Mauritanie', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, '0', 0, 0, NULL, NULL),
(153, 'MS', 'MSR', 500, 'MH', 'Montserrat', 'Montserrat', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, '0', 0, 0, NULL, NULL),
(154, 'MT', 'MLT', 470, 'MT', 'Malta', 'Malta', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, '0', 0, 0, NULL, NULL),
(155, 'MU', 'MUS', 480, 'MP', 'Mauritius', 'Mauritius', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(156, 'MV', 'MDV', 462, 'MV', 'Dhivehi', 'Maldives', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, '0', 0, 0, NULL, NULL),
(157, 'MW', 'MWI', 454, 'MI', 'Malawi', 'Malawi', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, '0', 0, 0, NULL, NULL),
(158, 'MX', 'MEX', 484, 'MX', 'México', 'Mexico', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, '0', 0, 0, NULL, NULL),
(159, 'MY', 'MYS', 458, 'MY', 'Malaysia', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, '0', 0, 0, NULL, NULL),
(160, 'MZ', 'MOZ', 508, 'MZ', 'Moçambique', 'Mozambique', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, '0', 0, 0, NULL, NULL),
(161, 'NA', 'NAM', 516, 'WA', 'Namibia', 'Namibia', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, '0', 0, 0, NULL, NULL),
(162, 'NC', 'NCL', 540, 'NC', 'Nouvelle Calédonie', 'New Caledonia', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, '0', 0, 0, NULL, NULL),
(163, 'NE', 'NER', 562, 'NG', 'Niger', 'Niger', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, '0', 0, 0, NULL, NULL),
(164, 'NF', 'NFK', 574, 'NF', 'Norfolk Island', 'Norfolk Island', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, '0', 0, 0, NULL, NULL),
(165, 'NG', 'NGA', 566, 'NI', 'Nigeria', 'Nigeria', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, '0', 0, 0, NULL, NULL),
(166, 'NI', 'NIC', 558, 'NU', 'Nicaragua', 'Nicaragua', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, '0', 0, 0, NULL, NULL),
(167, 'NL', 'NLD', 528, 'NL', 'Nederland', 'Netherlands', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, '0', 0, 0, NULL, NULL),
(168, 'NO', 'NOR', 578, 'NO', 'Norge (Noreg)', 'Norway', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, '0', 0, 0, NULL, NULL),
(169, 'NP', 'NPL', 524, 'NP', 'Nēpāl', 'Nepal', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, '0', 0, 0, NULL, NULL),
(170, 'NR', 'NRU', 520, 'NR', 'Naoero', 'Nauru', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, '0', 0, 0, NULL, NULL),
(171, 'NU', 'NIU', 570, 'NE', 'Niue', 'Niue', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, '0', 0, 0, NULL, NULL),
(172, 'NZ', 'NZL', 554, 'NZ', 'New Zealand', 'New Zealand', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, '0', 0, 0, NULL, NULL),
(173, 'OM', 'OMN', 512, 'MU', 'ʿUmān', 'Oman', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, '0', 0, 0, NULL, NULL),
(174, 'PA', 'PAN', 591, 'PM', 'Panamá', 'Panama', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(175, 'PE', 'PER', 604, 'PE', 'Perú', 'Peru', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(176, 'PF', 'PYF', 258, 'FP', 'Polinésie Française', 'French Polynesia', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, '0', 0, 0, NULL, NULL),
(177, 'PG', 'PNG', 598, 'PP', 'Papua New Guinea', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(178, 'PH', 'PHL', 608, 'RP', 'Pilipinas', 'Philippines', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, '0', 0, 0, NULL, NULL),
(179, 'PK', 'PAK', 586, 'PK', 'Pākistān', 'Pakistan', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', NULL, '0', 0, 1, NULL, NULL),
(180, 'PL', 'POL', 616, 'PL', 'Polska', 'Poland', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, '0', 0, 0, NULL, NULL),
(181, 'PM', 'SPM', 666, 'SB', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, '0', 0, 0, NULL, NULL),
(182, 'PN', 'PCN', 612, 'PC', 'Pitcairn', 'Pitcairn', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, '0', 0, 0, NULL, NULL),
(183, 'PR', 'PRI', 630, 'RQ', 'Puerto Rico', 'Puerto Rico', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, '0', 0, 0, NULL, NULL),
(184, 'PS', 'PSE', 275, 'WE', 'Filasṭīn', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, '0', 0, 0, NULL, NULL),
(185, 'PT', 'PRT', 620, 'PO', 'Portugal', 'Portugal', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, '0', 0, 0, NULL, NULL),
(186, 'PW', 'PLW', 585, 'PS', 'Palau', 'Palau', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(187, 'PY', 'PRY', 600, 'PA', 'Paraguay', 'Paraguay', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(188, 'QA', 'QAT', 634, 'QA', 'Qaṭar', 'Qatar', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, '0', 0, 0, NULL, NULL),
(189, 'RE', 'REU', 638, 'RE', 'Réunion', 'Reunion', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, '0', 0, 0, NULL, NULL),
(190, 'RO', 'ROU', 642, 'RO', 'România', 'Romania', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, '0', 0, 0, NULL, NULL),
(191, 'RS', 'SRB', 688, 'RI', 'Srbija', 'Serbia', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, '0', 0, 0, NULL, NULL),
(192, 'RU', 'RUS', 643, 'RS', 'Rossija', 'Russia', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, '0', 0, 0, NULL, NULL),
(193, 'RW', 'RWA', 646, 'RW', 'Rwanda', 'Rwanda', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, '0', 0, 0, NULL, NULL),
(194, 'SA', 'SAU', 682, 'SA', 'as-Saʿūdīyâ', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, '0', 0, 0, NULL, NULL),
(195, 'SB', 'SLB', 90, 'BP', 'Solomon Islands', 'Solomon Islands', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, '0', 0, 0, NULL, NULL),
(196, 'SC', 'SYC', 690, 'SE', 'Seychelles', 'Seychelles', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, '0', 0, 0, NULL, NULL),
(197, 'SD', 'SDN', 729, 'SU', 'Sudan', 'Sudan', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, '0', 0, 0, NULL, NULL),
(198, 'SE', 'SWE', 752, 'SW', 'Sverige', 'Sweden', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, '0', 0, 0, NULL, NULL),
(199, 'SG', 'SGP', 702, 'SN', 'xīnjiāpō', 'Singapore', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, '0', 0, 0, NULL, NULL),
(200, 'SH', 'SHN', 654, 'SH', 'Saint Helena', 'Saint Helena', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, '0', 0, 0, NULL, NULL),
(201, 'SI', 'SVN', 705, 'SI', 'Slovenija', 'Slovenia', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, '0', 0, 0, NULL, NULL),
(202, 'SJ', 'SJM', 744, 'SV', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, '0', 0, 0, NULL, NULL),
(203, 'SK', 'SVK', 703, 'LO', 'Slovensko', 'Slovakia', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, '0', 0, 0, NULL, NULL),
(204, 'SL', 'SLE', 694, 'SL', 'Sierra Leone', 'Sierra Leone', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, '0', 0, 0, NULL, NULL),
(205, 'SM', 'SMR', 674, 'SM', 'San Marino', 'San Marino', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(206, 'SN', 'SEN', 686, 'SG', 'Sénégal', 'Senegal', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, '0', 0, 0, NULL, NULL),
(207, 'SO', 'SOM', 706, 'SO', 'Soomaaliya', 'Somalia', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, '0', 0, 0, NULL, NULL),
(208, 'SR', 'SUR', 740, 'NS', 'Suriname', 'Suriname', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, '0', 0, 0, NULL, NULL),
(209, 'SS', 'SSD', 728, 'OD', 'South Sudan', 'South Sudan', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, '0', 0, 0, NULL, NULL),
(210, 'ST', 'STP', 678, 'TP', 'São Tomé e Príncipe', 'Sao Tome and Principe', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, '0', 0, 0, NULL, NULL),
(211, 'SV', 'SLV', 222, 'ES', 'El Salvador', 'El Salvador', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, '0', 0, 0, NULL, NULL),
(212, 'SX', 'SXM', 534, 'NN', 'Sint Maarten', 'Sint Maarten', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, '0', 0, 0, NULL, NULL),
(213, 'SY', 'SYR', 760, 'SY', 'Sūrīyâ', 'Syria', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, '0', 0, 0, NULL, NULL),
(214, 'SZ', 'SWZ', 748, 'WZ', 'Swaziland', 'Swaziland', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, '0', 0, 0, NULL, NULL),
(215, 'TC', 'TCA', 796, 'TK', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, '0', 0, 0, NULL, NULL),
(216, 'TD', 'TCD', 148, 'CD', 'Tchad', 'Chad', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, '0', 0, 0, NULL, NULL),
(217, 'TF', 'ATF', 260, 'FS', 'French Southern Territories', 'French Southern Territories', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(218, 'TG', 'TGO', 768, 'TO', 'Togo', 'Togo', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, '0', 0, 0, NULL, NULL),
(219, 'TH', 'THA', 764, 'TH', 'Prathēt tai', 'Thailand', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, '0', 0, 0, NULL, NULL),
(220, 'TJ', 'TJK', 762, 'TI', 'Tojikiston', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, '0', 0, 0, NULL, NULL),
(221, 'TK', 'TKL', 772, 'TL', 'Tokelau', 'Tokelau', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, '0', 0, 0, NULL, NULL),
(222, 'TL', 'TLS', 626, 'TT', 'Timór Lorosa\'e', 'East Timor', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, '0', 0, 0, NULL, NULL),
(223, 'TM', 'TKM', 795, 'TX', 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(224, 'TN', 'TUN', 788, 'TS', 'Tunisie', 'Tunisia', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, '0', 0, 0, NULL, NULL),
(225, 'TO', 'TON', 776, 'TN', 'Tonga', 'Tonga', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, '0', 0, 0, NULL, NULL),
(226, 'TR', 'TUR', 792, 'TU', 'Türkiye', 'Turkey', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, '0', 0, 0, NULL, NULL),
(227, 'TT', 'TTO', 780, 'TD', 'Trinidad and Tobago', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, '0', 0, 0, NULL, NULL),
(228, 'TV', 'TUV', 798, 'TV', 'Tuvalu', 'Tuvalu', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, '0', 0, 0, NULL, NULL),
(229, 'TW', 'TWN', 158, 'TW', 'T\'ai2-wan1', 'Taiwan', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, '0', 0, 0, NULL, NULL),
(230, 'TZ', 'TZA', 834, 'TZ', 'Tanzania', 'Tanzania', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, '0', 0, 0, NULL, NULL),
(231, 'UA', 'UKR', 804, 'UP', 'Ukrajina', 'Ukraine', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, '0', 0, 0, NULL, NULL),
(232, 'UG', 'UGA', 800, 'UG', 'Uganda', 'Uganda', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, '0', 0, 0, NULL, NULL),
(233, 'UK', 'GBR', 826, 'UK', 'United Kingdom', 'United Kingdom', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, '0', 0, 0, NULL, NULL),
(234, 'UM', 'UMI', 581, '', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, '0', 0, 0, NULL, NULL),
(235, 'US', 'USA', 840, 'US', 'USA', 'United States', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, '0', 0, 0, NULL, NULL),
(236, 'UY', 'URY', 858, 'UY', 'Uruguay', 'Uruguay', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, '0', 0, 0, NULL, NULL),
(237, 'UZ', 'UZB', 860, 'UZ', 'O\'zbekiston', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, '0', 0, 0, NULL, NULL),
(238, 'VA', 'VAT', 336, 'VT', 'Vaticanum', 'Vatican', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, '0', 0, 0, NULL, NULL),
(239, 'VC', 'VCT', 670, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, '0', 0, 0, NULL, NULL),
(240, 'VE', 'VEN', 862, 'VE', 'Venezuela', 'Venezuela', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, '0', 0, 0, NULL, NULL),
(241, 'VG', 'VGB', 92, 'VI', 'British Virgin Islands', 'British Virgin Islands', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, '0', 0, 0, NULL, NULL),
(242, 'VI', 'VIR', 850, 'VQ', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, '0', 0, 0, NULL, NULL),
(243, 'VN', 'VNM', 704, 'VM', 'Việt Nam', 'Vietnam', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, '0', 0, 0, NULL, NULL),
(244, 'VU', 'VUT', 548, 'NH', 'Vanuatu', 'Vanuatu', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, '0', 0, 0, NULL, NULL),
(245, 'WF', 'WLF', 876, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, '0', 0, 0, NULL, NULL),
(246, 'WS', 'WSM', 882, 'WS', 'Samoa', 'Samoa', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, '0', 0, 0, NULL, NULL),
(247, 'XK', 'XKX', 0, 'KV', 'Kosovo', 'Kosovo', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, '0', 0, 0, NULL, NULL),
(248, 'YE', 'YEM', 887, 'YM', 'al-Yaman', 'Yemen', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, '0', 0, 0, NULL, NULL),
(249, 'YT', 'MYT', 175, 'MF', 'Mayotte', 'Mayotte', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, '0', 0, 0, NULL, NULL),
(250, 'ZA', 'ZAF', 710, 'SF', 'South Africa', 'South Africa', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, '0', 0, 0, NULL, NULL),
(251, 'ZM', 'ZMB', 894, 'ZA', 'Zambia', 'Zambia', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, '0', 0, 0, NULL, NULL),
(252, 'ZW', 'ZWE', 716, 'ZI', 'Zimbabwe', 'Zimbabwe', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, '0', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_entity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'From Github : An array of currency symbols as HTML entities',
  `font_arial` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_code2000` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_decimal` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_hex` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_left` tinyint(1) UNSIGNED DEFAULT 0,
  `decimal_places` int(10) UNSIGNED DEFAULT 2 COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `html_entity`, `font_arial`, `font_code2000`, `unicode_decimal`, `unicode_hex`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', '&#1583;.&#1573;', 'د.إ', 'د.إ', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(2, 'AFN', 'Afghanistan Afghani', '&#65;&#102;', '؋', '؋', '1547', '60b', 0, 2, '.', ',', NULL, NULL),
(3, 'ALL', 'Albania Lek', '&#76;&#101;&#107;', 'Lek', 'Lek', '76, 1', '4c, 6', 0, 2, '.', ',', NULL, NULL),
(4, 'AMD', 'Armenia Dram', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(5, 'ANG', 'Netherlands Antilles Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', NULL, NULL),
(6, 'AOA', 'Angola Kwanza', '&#75;&#122;', 'Kz', 'Kz', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(7, 'ARS', 'Argentina Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(8, 'AUD', 'Australia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(9, 'AWG', 'Aruba Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', NULL, NULL),
(10, 'AZN', 'Azerbaijan New Manat', '&#1084;&#1072;&#1085;', 'ман', 'ман', '1084,', '43c, ', 0, 2, '.', ',', NULL, NULL),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', '&#75;&#77;', 'KM', 'KM', '75, 7', '4b, 4', 0, 2, '.', ',', NULL, NULL),
(12, 'BBD', 'Barbados Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(13, 'BDT', 'Bangladesh Taka', '&#2547;', '৳', '৳', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(14, 'BGN', 'Bulgaria Lev', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(15, 'BHD', 'Bahrain Dinar', '.&#1583;.&#1576;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', NULL, NULL),
(16, 'BIF', 'Burundi Franc', '&#70;&#66;&#117;', 'FBu', 'FBu', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(17, 'BMD', 'Bermuda Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(18, 'BND', 'Brunei Darussalam Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(19, 'BOB', 'Bolivia Boliviano', '&#36;&#98;', '$b', '$b', '36, 9', '24, 6', 0, 2, '.', ',', NULL, NULL),
(20, 'BRL', 'Brazil Real', '&#82;&#36;', 'R$', 'R$', '82, 3', '52, 2', 0, 2, '.', ',', NULL, NULL),
(21, 'BSD', 'Bahamas Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(22, 'BTN', 'Bhutan Ngultrum', '&#78;&#117;&#46;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(23, 'BWP', 'Botswana Pula', '&#80;', 'P', 'P', '80', '50', 1, 2, '.', ',', NULL, NULL),
(24, 'BYR', 'Belarus Ruble', '&#112;&#46;', 'p.', 'p.', '112, ', '70, 2', 0, 0, '.', ',', NULL, NULL),
(25, 'BZD', 'Belize Dollar', '&#66;&#90;&#36;', 'BZ$', 'BZ$', '66, 9', '42, 5', 1, 2, '.', ',', NULL, NULL),
(26, 'CAD', 'Canada Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(27, 'CDF', 'Congo/Kinshasa Franc', '&#70;&#67;', 'Fr', 'Fr', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(28, 'CHF', 'Switzerland Franc', '', 'Fr', 'Fr', '67, 7', '43, 4', 0, 2, '.', ',', NULL, NULL),
(29, 'CLP', 'Chile Peso', '&#36;', '$', '$', '36', '24', 0, 0, '.', ',', NULL, NULL),
(30, 'CNY', 'China Yuan Renminbi', '&#165;', '¥', '¥', '165', 'a5', 0, 2, '.', ',', NULL, NULL),
(31, 'COP', 'Colombia Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(32, 'CRC', 'Costa Rica Colon', '&#8353;', '₡', '₡', '8353', '20a1', 0, 2, '.', ',', NULL, NULL),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(34, 'CUP', 'Cuba Peso', '&#8396;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', NULL, NULL),
(35, 'CVE', 'Cape Verde Escudo', '&#x24;', '$', '$', NULL, NULL, 1, 0, '.', ',', NULL, NULL),
(36, 'CZK', 'Czech Republic Koruna', '&#75;&#269;', 'Kč', 'Kč', '75, 2', '4b, 1', 0, 2, '.', ',', NULL, NULL),
(37, 'DJF', 'Djibouti Franc', '&#70;&#100;&#106;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(38, 'DKK', 'Denmark Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(39, 'DOP', 'Dominican Republic Peso', '&#82;&#68;&#36;', 'RD$', 'RD$', '82, 6', '52, 4', 0, 2, '.', ',', NULL, NULL),
(40, 'DZD', 'Algeria Dinar', '&#1583;&#1580;', 'DA', 'DA', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(41, 'EEK', 'Estonia Kroon', NULL, 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(42, 'EGP', 'Egypt Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(43, 'ERN', 'Eritrea Nakfa', '&#x4E;&#x66;&#x6B;', 'Nfk', 'Nfk', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(44, 'ETB', 'Ethiopia Birr', '&#66;&#114;', 'Br', 'Br', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(45, 'EUR', 'Euro Member Countries', '€', '€', '€', '8364', '20ac', 0, 2, ',', ' ', NULL, NULL),
(46, 'FJD', 'Fiji Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(48, 'GBP', 'United Kingdom Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(49, 'GEL', 'Georgia Lari', '&#4314;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(50, 'GGP', 'Guernsey Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(51, 'GHC', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', '162', 'a2', 1, 2, '.', ',', NULL, NULL),
(52, 'GHS', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(53, 'GIP', 'Gibraltar Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(54, 'GMD', 'Gambia Dalasi', '&#68;', 'D', 'D', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(55, 'GNF', 'Guinea Franc', '&#70;&#71;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(56, 'GTQ', 'Guatemala Quetzal', '&#81;', 'Q', 'Q', '81', '51', 0, 2, '.', ',', NULL, NULL),
(57, 'GYD', 'Guyana Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(58, 'HKD', 'Hong Kong Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(59, 'HNL', 'Honduras Lempira', '&#76;', 'L', 'L', '76', '4c', 0, 2, '.', ',', NULL, NULL),
(60, 'HRK', 'Croatia Kuna', '&#107;&#110;', 'kn', 'kn', '107, ', '6b, 6', 0, 2, '.', ',', NULL, NULL),
(61, 'HTG', 'Haiti Gourde', '&#71;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(62, 'HUF', 'Hungary Forint', '&#70;&#116;', 'Ft', 'Ft', '70, 1', '46, 7', 0, 2, '.', ',', NULL, NULL),
(63, 'IDR', 'Indonesia Rupiah', '&#82;&#112;', 'Rp', 'Rp', '82, 1', '52, 7', 0, 0, '.', ',', NULL, NULL),
(64, 'ILS', 'Israel Shekel', '&#8362;', '₪', '₪', '8362', '20aa', 0, 2, '.', ',', NULL, NULL),
(65, 'IMP', 'Isle of Man Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(66, 'INR', 'India Rupee', '&#8377;', '₨', '₨', '', '', 0, 2, '.', ',', NULL, NULL),
(67, 'IQD', 'Iraq Dinar', '&#1593;.&#1583;', 'د.ع;', 'د.ع;', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(68, 'IRR', 'Iran Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 0, '.', ',', NULL, NULL),
(69, 'ISK', 'Iceland Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 0, '.', ',', NULL, NULL),
(70, 'JEP', 'Jersey Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(71, 'JMD', 'Jamaica Dollar', '&#74;&#36;', 'J$', 'J$', '74, 3', '4a, 2', 1, 2, '.', ',', NULL, NULL),
(72, 'JOD', 'Jordan Dinar', '&#74;&#68;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', NULL, NULL),
(73, 'JPY', 'Japan Yen', '&#165;', '¥', '¥', '165', 'a5', 0, 0, '.', ',', NULL, NULL),
(74, 'KES', 'Kenya Shilling', '&#x4B;&#x53;&#x68;', 'KSh', 'KSh', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(75, 'KGS', 'Kyrgyzstan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(76, 'KHR', 'Cambodia Riel', '&#6107;', '៛', '៛', '6107', '17db', 0, 2, '.', ',', NULL, NULL),
(77, 'KMF', 'Comoros Franc', '&#67;&#70;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(78, 'KPW', 'Korea (North) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', NULL, NULL),
(79, 'KRW', 'Korea (South) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', NULL, NULL),
(80, 'KWD', 'Kuwait Dinar', '&#1583;.&#1603;', 'د.ك', 'د.ك', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(81, 'KYD', 'Cayman Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(82, 'KZT', 'Kazakhstan Tenge', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(83, 'LAK', 'Laos Kip', '&#8365;', '₭', '₭', '8365', '20ad', 0, 0, '.', ',', NULL, NULL),
(84, 'LBP', 'Lebanon Pound', '&#163;', '£', '£', '163', 'a3', 0, 0, '.', ',', NULL, NULL),
(85, 'LKR', 'Sri Lanka Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(86, 'LRD', 'Liberia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(87, 'LSL', 'Lesotho Loti', '&#76;', 'M', 'M', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(88, 'LTL', 'Lithuania Litas', '&#76;&#116;', 'Lt', 'Lt', '76, 1', '4c, 7', 0, 2, '.', ',', NULL, NULL),
(89, 'LVL', 'Latvia Lat', '&#76;&#115;', 'Ls', 'Ls', '76, 1', '4c, 7', 0, 2, '.', ',', NULL, NULL),
(90, 'LYD', 'Libya Dinar', '&#1604;.&#1583;', 'DL', 'DL', NULL, NULL, 0, 3, '.', ',', NULL, NULL),
(91, 'MAD', 'Morocco Dirham', '&#1583;.&#1605;.', 'Dhs', 'Dhs', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(92, 'MDL', 'Moldova Leu', '&#76;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(93, 'MGA', 'Madagascar Ariary', '&#65;&#114;', 'Ar', 'Ar', NULL, NULL, 0, 5, '.', ',', NULL, NULL),
(94, 'MKD', 'Macedonia Denar', '&#1076;&#1077;&#1085;', 'ден', 'ден', '1076,', '434, ', 0, 2, '.', ',', NULL, NULL),
(95, 'MMK', 'Myanmar (Burma) Kyat', '&#75;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(96, 'MNT', 'Mongolia Tughrik', '&#8366;', '₮', '₮', '8366', '20ae', 0, 2, '.', ',', NULL, NULL),
(97, 'MOP', 'Macau Pataca', '&#77;&#79;&#80;&#36;', NULL, NULL, NULL, NULL, 0, 1, '.', ',', NULL, NULL),
(98, 'MRO', 'Mauritania Ouguiya', '&#85;&#77;', 'UM', 'UM', NULL, NULL, 0, 5, '.', ',', NULL, NULL),
(99, 'MUR', 'Mauritius Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', '.&#1923;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(101, 'MWK', 'Malawi Kwacha', '&#77;&#75;', 'MK', 'MK', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(102, 'MXN', 'Mexico Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(103, 'MYR', 'Malaysia Ringgit', '&#82;&#77;', 'RM', 'RM', '82, 7', '52, 4', 0, 2, '.', ',', NULL, NULL),
(104, 'MZN', 'Mozambique Metical', '&#77;&#84;', 'MT', 'MT', '77, 8', '4d, 5', 0, 2, '.', ',', NULL, NULL),
(105, 'NAD', 'Namibia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(106, 'NGN', 'Nigeria Naira', '&#8358;', '₦', '₦', '8358', '20a6', 1, 2, '.', ',', NULL, NULL),
(107, 'NIO', 'Nicaragua Cordoba', '&#67;&#36;', 'C$', 'C$', '67, 3', '43, 2', 0, 2, '.', ',', NULL, NULL),
(108, 'NOK', 'Norway Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(109, 'NPR', 'Nepal Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(110, 'NZD', 'New Zealand Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(111, 'OMR', 'Oman Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 3, '.', ',', NULL, NULL),
(112, 'PAB', 'Panama Balboa', '&#66;&#47;&#46;', 'B/.', 'B/.', '66, 4', '42, 2', 0, 2, '.', ',', NULL, NULL),
(113, 'PEN', 'Peru Nuevo Sol', '&#83;&#47;&#46;', 'S/.', 'S/.', '83, 4', '53, 2', 0, 2, '.', ',', NULL, NULL),
(114, 'PGK', 'Papua New Guinea Kina', '&#75;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(115, 'PHP', 'Philippines Peso', '&#8369;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', NULL, NULL),
(116, 'PKR', 'Pakistan Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(117, 'PLN', 'Poland Zloty', '&#122;&#322;', 'zł', 'zł', '122, ', '7a, 1', 0, 2, '.', ',', NULL, NULL),
(118, 'PYG', 'Paraguay Guarani', '&#71;&#115;', 'Gs', 'Gs', '71, 1', '47, 7', 0, 0, '.', ',', NULL, NULL),
(119, 'QAR', 'Qatar Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL),
(120, 'RON', 'Romania New Leu', '&#108;&#101;&#105;', 'lei', 'lei', '108, ', '6c, 6', 0, 2, '.', ',', NULL, NULL),
(121, 'RSD', 'Serbia Dinar', '&#1044;&#1080;&#1085;&#46;', 'Дин.', 'Дин.', '1044,', '414, ', 0, 2, '.', ',', NULL, NULL),
(122, 'RUB', 'Russia Ruble', '&#8381;', '₽', '₽', '8381,', '20BD', 0, 2, '.', ',', NULL, NULL),
(123, 'RWF', 'Rwanda Franc', '&#1585;.&#1587;', 'FRw', 'FRw', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(124, 'SAR', 'Saudi Arabia Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL),
(125, 'SBD', 'Solomon Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(126, 'SCR', 'Seychelles Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', NULL, NULL),
(127, 'SDG', 'Sudan Pound', '&#163;', 'DS', 'DS', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(128, 'SEK', 'Sweden Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', NULL, NULL),
(129, 'SGD', 'Singapore Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(130, 'SHP', 'Saint Helena Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(131, 'SLL', 'Sierra Leone Leone', '&#76;&#101;', 'Le', 'Le', NULL, NULL, 1, 0, '.', ',', NULL, NULL),
(132, 'SOS', 'Somalia Shilling', '&#83;', 'S', 'S', '83', '53', 0, 2, '.', ',', NULL, NULL),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(134, 'SRD', 'Suriname Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(135, 'SSP', 'South Sudanese Pound', '&#xA3;', '£', '£', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(136, 'STD', 'São Tomé and Príncipe Dobra', '&#68;&#98;', 'Db', 'Db', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(137, 'SVC', 'El Salvador Colon', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', NULL, NULL),
(138, 'SYP', 'Syria Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', NULL, NULL),
(139, 'SZL', 'Swaziland Lilangeni', '&#76;', 'E', 'E', NULL, NULL, 1, 2, '.', ',', NULL, NULL),
(140, 'THB', 'Thailand Baht', '&#3647;', '฿', '฿', '3647', 'e3f', 0, 2, '.', ',', NULL, NULL),
(141, 'TJS', 'Tajikistan Somoni', '&#84;&#74;&#83;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(142, 'TMT', 'Turkmenistan Manat', '&#109;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(143, 'TND', 'Tunisia Dinar', '&#1583;.&#1578;', 'DT', 'DT', NULL, NULL, 1, 3, '.', ',', NULL, NULL),
(144, 'TOP', 'Tonga Pa\'anga', '&#84;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(145, 'TRL', 'Turkey Lira', NULL, '₤', '₤', '8356', '20a4', 1, 2, '.', ',', NULL, NULL),
(146, 'TRY', 'Turkey Lira', '&#x20BA;', '₺', '₺', '', '', 1, 2, '.', ',', NULL, NULL),
(147, 'TTD', 'Trinidad and Tobago Dollar', '&#36;', 'TT$', 'TT$', '84, 8', '54, 5', 1, 2, '.', ',', NULL, NULL),
(148, 'TVD', 'Tuvalu Dollar', NULL, '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(149, 'TWD', 'Taiwan New Dollar', '&#78;&#84;&#36;', 'NT$', 'NT$', '78, 8', '4e, 5', 1, 2, '.', ',', NULL, NULL),
(150, 'TZS', 'Tanzania Shilling', '&#x54;&#x53;&#x68;', 'TSh', 'TSh', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(151, 'UAH', 'Ukraine Hryvnia', '&#8372;', '₴', '₴', '8372', '20b4', 0, 2, '.', ',', NULL, NULL),
(152, 'UGX', 'Uganda Shilling', '&#85;&#83;&#104;', 'USh', 'USh', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(153, 'USD', 'United States Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(154, 'UYU', 'Uruguay Peso', '&#36;&#85;', '$U', '$U', '36, 8', '24, 5', 0, 2, '.', ',', NULL, NULL),
(155, 'UZS', 'Uzbekistan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', NULL, NULL),
(156, 'VEF', 'Venezuela Bolivar', '&#66;&#115;', 'Bs', 'Bs', '66, 1', '42, 7', 0, 2, '.', ',', NULL, NULL),
(157, 'VND', 'Viet Nam Dong', '&#8363;', '₫', '₫', '8363', '20ab', 1, 0, '.', ',', NULL, NULL),
(158, 'VUV', 'Vanuatu Vatu', '&#86;&#84;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(159, 'WST', 'Samoa Tala', '&#87;&#83;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(161, 'XCD', 'East Caribbean Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', NULL, NULL),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', '&#70;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', NULL, NULL),
(165, 'YER', 'Yemen Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', NULL, NULL),
(166, 'ZAR', 'South Africa Rand', '&#82;', 'R', 'R', '82', '52', 1, 2, '.', ',', NULL, NULL),
(167, 'ZMW', 'Zambia Kwacha', NULL, 'ZK', 'ZK', NULL, NULL, 0, 2, '.', ',', NULL, NULL),
(168, 'ZWD', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', NULL, NULL),
(169, 'ZWL', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', NULL, NULL),
(170, 'XBT', 'Bitcoin', '฿', '฿', '฿', NULL, NULL, 1, 2, '.', ',', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8_unicode_ci NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('text','textarea','checkbox','checkbox_multiple','select','radio','file') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `max` int(10) UNSIGNED DEFAULT 255,
  `default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) UNSIGNED DEFAULT NULL,
  `help` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `translation_lang`, `translation_of`, `name`, `type`, `max`, `default`, `required`, `help`, `active`) VALUES
(1, 'posts', 'en', 1, 'Car Brand', 'select', NULL, NULL, 1, NULL, 1),
(2, 'posts', 'en', 2, 'Model', 'text', NULL, NULL, 0, NULL, 1),
(3, 'posts', 'en', 3, 'Year of registration', 'text', NULL, NULL, 0, NULL, 1),
(4, 'posts', 'en', 4, 'Mileage', 'text', NULL, NULL, 0, NULL, 1),
(5, 'posts', 'en', 5, 'Fuel Type', 'select', NULL, NULL, 0, NULL, 1),
(6, 'posts', 'en', 6, 'Features', 'checkbox_multiple', NULL, NULL, 0, NULL, 1),
(7, 'posts', 'en', 7, 'Resume', 'file', NULL, NULL, 1, NULL, 1),
(8, 'posts', 'en', 8, 'Condition', 'select', NULL, NULL, 0, NULL, 1),
(9, 'posts', 'en', 9, 'Transmission', 'radio', NULL, NULL, 0, NULL, 1),
(10, 'posts', 'en', 10, 'Start Date', 'text', 50, NULL, 0, NULL, 1),
(11, 'posts', 'en', 11, 'Company', 'text', 100, NULL, 1, NULL, 1),
(12, 'posts', 'en', 12, 'Work Type', 'select', NULL, NULL, 1, NULL, 1),
(13, 'posts', 'en', 13, 'Size', 'text', 50, NULL, 1, NULL, 1),
(14, 'posts', 'en', 14, 'Rooms', 'select', NULL, NULL, 1, NULL, 1),
(15, 'posts', 'en', 15, 'Building Type', 'select', NULL, NULL, 0, NULL, 1),
(16, 'posts', 'en', 16, 'Parking', 'checkbox', NULL, NULL, 0, NULL, 1),
(17, 'posts', 'en', 17, 'Furnished', 'radio', NULL, NULL, 0, NULL, 1),
(18, 'posts', 'en', 18, 'Electronic Brand', 'select', NULL, NULL, 0, NULL, 1),
(19, 'posts', 'en', 19, 'Sex', 'radio', NULL, NULL, 1, NULL, 1),
(20, 'posts', 'en', 20, 'Looking for', 'checkbox_multiple', NULL, NULL, 0, NULL, 1),
(21, 'posts', 'en', 21, 'Age', 'select', NULL, NULL, 1, NULL, 1),
(22, 'posts', 'en', 22, 'Start date', 'text', 50, NULL, 1, NULL, 1),
(23, 'posts', 'en', 23, 'End date', 'text', 50, NULL, 1, NULL, 1),
(24, 'posts', 'en', 24, 'Event Address', 'text', 200, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields_options`
--

CREATE TABLE `fields_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` bigint(20) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `translation_lang`, `translation_of`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 'en', 1, 'BMW', NULL, NULL, NULL, NULL),
(2, 1, 'en', 2, 'Mercedes', NULL, NULL, NULL, NULL),
(3, 1, 'en', 3, 'Renault', NULL, NULL, NULL, NULL),
(4, 6, 'en', 4, 'Air conditionar', NULL, NULL, NULL, NULL),
(5, 6, 'en', 5, 'GPS', NULL, NULL, NULL, NULL),
(6, 6, 'en', 6, 'Security System', NULL, NULL, NULL, NULL),
(7, 6, 'en', 7, 'Stepney', NULL, NULL, NULL, NULL),
(8, 5, 'en', 8, 'Essence', NULL, NULL, NULL, NULL),
(9, 5, 'en', 9, 'Diesel', NULL, NULL, NULL, NULL),
(10, 1, 'en', 10, 'Toyota', NULL, NULL, NULL, NULL),
(11, 8, 'en', 11, 'New', NULL, NULL, NULL, NULL),
(12, 8, 'en', 12, 'Used', NULL, NULL, NULL, NULL),
(13, 9, 'en', 13, 'Automatic', NULL, NULL, NULL, NULL),
(14, 9, 'en', 14, 'Manual', NULL, NULL, NULL, NULL),
(15, 12, 'en', 15, 'Full-time', NULL, NULL, NULL, NULL),
(16, 12, 'en', 16, 'Part-time', NULL, NULL, NULL, NULL),
(17, 12, 'en', 17, 'Temporary', NULL, NULL, NULL, NULL),
(18, 12, 'en', 18, 'Internship', NULL, NULL, NULL, NULL),
(19, 12, 'en', 19, 'Permanent', NULL, NULL, NULL, NULL),
(20, 14, 'en', 20, '1', 0, 4, 5, 1),
(21, 14, 'en', 21, '2', 0, 6, 7, 1),
(22, 14, 'en', 22, '3', 0, 8, 9, 1),
(23, 14, 'en', 23, '4', 0, 10, 11, 1),
(24, 14, 'en', 24, '5', 0, 12, 13, 1),
(25, 14, 'en', 25, '6', 0, 14, 15, 1),
(26, 14, 'en', 26, '7', 0, 16, 17, 1),
(27, 14, 'en', 27, '8', 0, 18, 19, 1),
(28, 14, 'en', 28, '9', 0, 20, 21, 1),
(29, 14, 'en', 29, '10', 0, 22, 23, 1),
(30, 14, 'en', 30, '> 10', 0, 24, 25, 1),
(31, 15, 'en', 31, 'Apartment', NULL, NULL, NULL, NULL),
(32, 15, 'en', 32, 'House', NULL, NULL, NULL, NULL),
(33, 17, 'en', 33, 'Yes', NULL, NULL, NULL, NULL),
(34, 17, 'en', 34, 'No', NULL, NULL, NULL, NULL),
(35, 15, 'en', 35, 'Office', NULL, NULL, NULL, NULL),
(36, 15, 'en', 36, 'Store', NULL, NULL, NULL, NULL),
(37, 15, 'en', 37, 'Plot of land', NULL, NULL, NULL, NULL),
(38, 14, 'en', 38, '0', 0, 2, 3, 1),
(39, 1, 'en', 39, 'Chevrolet', NULL, NULL, NULL, NULL),
(40, 1, 'en', 40, 'Cadillac', NULL, NULL, NULL, NULL),
(41, 1, 'en', 41, 'Buick', NULL, NULL, NULL, NULL),
(42, 1, 'en', 42, 'GMC', NULL, NULL, NULL, NULL),
(43, 1, 'en', 43, 'Ford', NULL, NULL, NULL, NULL),
(44, 1, 'en', 44, 'Chrysler', NULL, NULL, NULL, NULL),
(45, 1, 'en', 45, 'Dodge', NULL, NULL, NULL, NULL),
(46, 1, 'en', 46, 'Jeep', NULL, NULL, NULL, NULL),
(47, 1, 'en', 47, 'Tesla', NULL, NULL, NULL, NULL),
(48, 1, 'en', 48, 'Lexus', NULL, NULL, NULL, NULL),
(49, 1, 'en', 49, 'Suzuki', NULL, NULL, NULL, NULL),
(50, 1, 'en', 50, 'Mazda', NULL, NULL, NULL, NULL),
(51, 1, 'en', 51, 'Honda', NULL, NULL, NULL, NULL),
(52, 1, 'en', 52, 'Acura', NULL, NULL, NULL, NULL),
(53, 1, 'en', 53, 'Mitsubishi', NULL, NULL, NULL, NULL),
(54, 1, 'en', 54, 'Nissan', NULL, NULL, NULL, NULL),
(55, 1, 'en', 55, 'Infiniti', NULL, NULL, NULL, NULL),
(56, 1, 'en', 56, 'Audi', NULL, NULL, NULL, NULL),
(57, 1, 'en', 57, 'Volkswagen', NULL, NULL, NULL, NULL),
(58, 1, 'en', 58, 'Porsche', NULL, NULL, NULL, NULL),
(59, 1, 'en', 59, 'Opel', NULL, NULL, NULL, NULL),
(60, 1, 'en', 60, 'Jaguar', NULL, NULL, NULL, NULL),
(61, 1, 'en', 61, 'Land Rover', NULL, NULL, NULL, NULL),
(62, 1, 'en', 62, 'Mini', NULL, NULL, NULL, NULL),
(63, 1, 'en', 63, 'Aston Martin', NULL, NULL, NULL, NULL),
(64, 1, 'en', 64, 'Bentley', NULL, NULL, NULL, NULL),
(65, 1, 'en', 65, 'Rolls Royce', NULL, NULL, NULL, NULL),
(66, 1, 'en', 66, 'McLaren', NULL, NULL, NULL, NULL),
(67, 1, 'en', 67, 'Fiat', NULL, NULL, NULL, NULL),
(68, 1, 'en', 68, 'Alfa Romeo', NULL, NULL, NULL, NULL),
(69, 1, 'en', 69, 'Maserati', NULL, NULL, NULL, NULL),
(70, 1, 'en', 70, 'Ferrari', NULL, NULL, NULL, NULL),
(71, 1, 'en', 71, 'Lamborghini', NULL, NULL, NULL, NULL),
(72, 1, 'en', 72, 'Pagani', NULL, NULL, NULL, NULL),
(73, 1, 'en', 73, 'Lancia', NULL, NULL, NULL, NULL),
(74, 1, 'en', 74, 'Peugeot', NULL, NULL, NULL, NULL),
(75, 1, 'en', 75, 'Citroen', NULL, NULL, NULL, NULL),
(76, 1, 'en', 76, 'Bugatti', NULL, NULL, NULL, NULL),
(77, 1, 'en', 77, 'Tata', NULL, NULL, NULL, NULL),
(78, 1, 'en', 78, 'Hyundai', NULL, NULL, NULL, NULL),
(79, 1, 'en', 79, 'Kia', NULL, NULL, NULL, NULL),
(80, 1, 'en', 80, 'Daewoo', NULL, NULL, NULL, NULL),
(81, 1, 'en', 81, 'Volvo', NULL, NULL, NULL, NULL),
(82, 1, 'en', 82, 'Saab', NULL, NULL, NULL, NULL),
(83, 1, 'en', 83, 'Lada', NULL, NULL, NULL, NULL),
(84, 1, 'en', 84, 'Volga', NULL, NULL, NULL, NULL),
(85, 1, 'en', 85, 'Zil', NULL, NULL, NULL, NULL),
(86, 1, 'en', 86, 'GAZ', NULL, NULL, NULL, NULL),
(87, 1, 'en', 87, 'Geely', NULL, NULL, NULL, NULL),
(88, 1, 'en', 88, 'Chery', NULL, NULL, NULL, NULL),
(89, 1, 'en', 89, 'Hongqi', NULL, NULL, NULL, NULL),
(90, 18, 'en', 90, 'Huawei', NULL, NULL, NULL, NULL),
(91, 18, 'en', 91, 'Lenovo', NULL, NULL, NULL, NULL),
(92, 18, 'en', 92, 'TP-Link', NULL, NULL, NULL, NULL),
(93, 18, 'en', 93, 'Xiaomi', NULL, NULL, NULL, NULL),
(94, 18, 'en', 94, 'Canon', NULL, NULL, NULL, NULL),
(95, 18, 'en', 95, 'Casio', NULL, NULL, NULL, NULL),
(96, 18, 'en', 96, 'Epson', NULL, NULL, NULL, NULL),
(97, 18, 'en', 97, 'Fuji', NULL, NULL, NULL, NULL),
(98, 18, 'en', 98, 'Funai', NULL, NULL, NULL, NULL),
(99, 18, 'en', 99, 'JVC', NULL, NULL, NULL, NULL),
(100, 18, 'en', 100, 'Nikon', NULL, NULL, NULL, NULL),
(101, 18, 'en', 101, 'Nintendo', NULL, NULL, NULL, NULL),
(102, 18, 'en', 102, 'Olympus', NULL, NULL, NULL, NULL),
(103, 18, 'en', 103, 'Panasonic', NULL, NULL, NULL, NULL),
(104, 18, 'en', 104, 'Pentax', NULL, NULL, NULL, NULL),
(105, 18, 'en', 105, 'Pioneer', NULL, NULL, NULL, NULL),
(106, 18, 'en', 106, 'Sega', NULL, NULL, NULL, NULL),
(107, 18, 'en', 107, 'Sharp', NULL, NULL, NULL, NULL),
(108, 18, 'en', 108, 'Sony', NULL, NULL, NULL, NULL),
(109, 18, 'en', 109, 'Toshiba', NULL, NULL, NULL, NULL),
(110, 18, 'en', 110, 'Daewoo', NULL, NULL, NULL, NULL),
(111, 18, 'en', 111, 'LG', NULL, NULL, NULL, NULL),
(112, 18, 'en', 112, 'Samsung', NULL, NULL, NULL, NULL),
(113, 18, 'en', 113, 'Hyundai', NULL, NULL, NULL, NULL),
(114, 18, 'en', 114, 'Kova', NULL, NULL, NULL, NULL),
(115, 18, 'en', 115, 'Acer', NULL, NULL, NULL, NULL),
(116, 18, 'en', 116, 'Asus', NULL, NULL, NULL, NULL),
(117, 18, 'en', 117, 'D-Link', NULL, NULL, NULL, NULL),
(118, 18, 'en', 118, 'Gigabyte', NULL, NULL, NULL, NULL),
(119, 18, 'en', 119, 'Beko', NULL, NULL, NULL, NULL),
(120, 18, 'en', 120, 'Nokia', NULL, NULL, NULL, NULL),
(121, 18, 'en', 121, 'Alcatel-Lucent', NULL, NULL, NULL, NULL),
(122, 18, 'en', 122, 'Bosch', NULL, NULL, NULL, NULL),
(123, 18, 'en', 123, 'Siemens', NULL, NULL, NULL, NULL),
(124, 18, 'en', 124, 'Sennheiser', NULL, NULL, NULL, NULL),
(125, 18, 'en', 125, 'Telefunken', NULL, NULL, NULL, NULL),
(126, 18, 'en', 126, 'Philips', NULL, NULL, NULL, NULL),
(127, 18, 'en', 127, 'Electrolux', NULL, NULL, NULL, NULL),
(128, 18, 'en', 128, 'Russell Hobbs', NULL, NULL, NULL, NULL),
(129, 18, 'en', 129, 'BlackBerry', NULL, NULL, NULL, NULL),
(130, 18, 'en', 130, 'Thomson', NULL, NULL, NULL, NULL),
(131, 18, 'en', 131, 'Amazon', NULL, NULL, NULL, NULL),
(132, 18, 'en', 132, 'Apple', NULL, NULL, NULL, NULL),
(133, 18, 'en', 133, 'Bose', NULL, NULL, NULL, NULL),
(134, 18, 'en', 134, 'Cisco Systems', NULL, NULL, NULL, NULL),
(135, 18, 'en', 135, 'Dell', NULL, NULL, NULL, NULL),
(136, 18, 'en', 136, 'Gateway', NULL, NULL, NULL, NULL),
(137, 18, 'en', 137, 'Google', NULL, NULL, NULL, NULL),
(138, 18, 'en', 138, 'Hewlett-Packard', NULL, NULL, NULL, NULL),
(139, 18, 'en', 139, 'IBM', NULL, NULL, NULL, NULL),
(140, 18, 'en', 140, 'Intel', NULL, NULL, NULL, NULL),
(141, 18, 'en', 141, 'Microsoft', NULL, NULL, NULL, NULL),
(142, 18, 'en', 142, 'Motorola', NULL, NULL, NULL, NULL),
(143, 18, 'en', 143, 'NVIDIA', NULL, NULL, NULL, NULL),
(144, 18, 'en', 144, 'Packard Bell', NULL, NULL, NULL, NULL),
(145, 18, 'en', 145, 'Qualcomm', NULL, NULL, NULL, NULL),
(146, 18, 'en', 146, 'Seagate', NULL, NULL, NULL, NULL),
(147, 18, 'en', 147, 'Sun Microsystems', NULL, NULL, NULL, NULL),
(148, 18, 'en', 148, 'Vizio', NULL, NULL, NULL, NULL),
(149, 18, 'en', 149, 'Western Digital', NULL, NULL, NULL, NULL),
(150, 18, 'en', 150, 'Xerox', NULL, NULL, NULL, NULL),
(151, 18, 'en', 151, 'Other', NULL, NULL, NULL, NULL),
(152, 1, 'en', 152, 'Other', NULL, NULL, NULL, NULL),
(153, 19, 'en', 153, 'man', NULL, NULL, NULL, NULL),
(154, 19, 'en', 154, 'woman', NULL, NULL, NULL, NULL),
(155, 20, 'en', 155, 'man', NULL, NULL, NULL, NULL),
(156, 20, 'en', 156, 'woman', NULL, NULL, NULL, NULL),
(157, 21, 'en', 157, '18 - 25', NULL, NULL, NULL, NULL),
(158, 21, 'en', 158, '26 - 30', NULL, NULL, NULL, NULL),
(159, 21, 'en', 159, '31 - 40', NULL, NULL, NULL, NULL),
(160, 21, 'en', 160, '41 - 50', NULL, NULL, NULL, NULL),
(161, 21, 'en', 161, '50 - 60', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Mr'),
(2, 'en', 2, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `field` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', '{\"enable_form_area_customization\":\"1\",\"background_color\":\"#585555\",\"background_image\":\"app\\/logo\\/header-5ff83fcd12195.png\",\"height\":null,\"parallax\":\"0\",\"hide_form\":\"0\",\"form_border_color\":null,\"form_border_width\":null,\"form_btn_background_color\":null,\"form_btn_text_color\":null,\"hide_titles\":\"0\",\"title_en\":\"RENT SELL AND BUYE NEAR YOU\",\"sub_title_en\":null,\"big_title_color\":\"#00f1f6\",\"sub_title_color\":\"#01a3a7\",\"active\":\"1\"}', 'home.inc.search', NULL, 0, 0, 1, 1, 1),
(2, 'getLocations', 'Locations & Country Map', NULL, 'home.inc.locations', NULL, 0, 2, 3, 1, 1),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, 0, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', NULL, 'home.inc.categories', NULL, 0, 6, 7, 1, 1),
(5, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, 0, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, 0, 10, 11, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', NULL, 'layouts.inc.advertising.top', NULL, 0, 12, 13, 1, 1),
(8, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, 0, 14, 15, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 1, 1, 0, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT 0,
  `from_user_id` bigint(20) UNSIGNED DEFAULT 0,
  `from_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_user_id` bigint(20) UNSIGNED DEFAULT 0,
  `to_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) UNSIGNED DEFAULT 0,
  `deleted_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `translation_of` int(10) UNSIGNED NOT NULL,
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `translation_lang`, `translation_of`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'en', 1, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(2, 'en', 2, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(3, 'en', 3, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(4, 'en', 4, 'create', 'Post Free Ads', 'Post Free Ads - {country}.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(5, 'en', 5, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(6, 'en', 6, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(7, 'en', 7, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(8, 'en', 8, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT 0,
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT 30 COMMENT 'In days',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `translation_lang`, `translation_of`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `duration`, `description`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Regular List', 'FREE', NULL, 0, '0.00', 'USD', 30, 'Regular List', 0, 2, 3, 1, 0),
(2, 'en', 2, 'Urgent Ad', 'Urgent', 'red', 0, '4.99', 'USD', 30, 'Urgent', 0, 4, 5, 1, 0),
(3, 'en', 3, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 30, 'Top Ads', 0, 6, 7, 1, 0),
(4, 'en', 4, 'Top page Ad + Urgent Ad', 'Premium+', 'green', 1, '9.00', 'USD', 30, 'Featured Ads', 0, 8, 9, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT 0,
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT 0,
  `active` tinyint(1) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `translation_lang`, `translation_of`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, 'en', 1, 0, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of Cotonou under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"http://www.bedigit.com\">http://www.bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:10:40', '2017-02-13 15:22:30'),
(2, 'en', 2, 0, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:28:37', '2017-02-12 20:24:52'),
(3, 'en', 3, 0, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:31:56', '2017-02-12 20:24:52'),
(4, 'en', 4, 0, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2017-02-10 11:34:56', '2017-02-14 05:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT 0,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT 0,
  `is_compatible_api` tinyint(1) DEFAULT 0,
  `countries` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT 0,
  `active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'Paypal', 'Payment with Paypal', 0, 0, NULL, 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'list-permission', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(2, 'create-permission', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(3, 'update-permission', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(4, 'delete-permission', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(5, 'list-role', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(6, 'create-role', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(7, 'update-role', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(8, 'delete-role', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13'),
(9, 'access-dashboard', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED DEFAULT 1 COMMENT 'Set at 0 on updating the ad',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `post_id`, `filename`, `position`, `active`, `created_at`, `updated_at`) VALUES
(6, 1, 'files/pk/1/4eda0c381c841bd2c5f322643a5c933c.png', 1, 1, '2021-01-08 06:59:15', '2021-01-08 06:59:15'),
(7, 1, 'files/pk/1/f71bf22d01f2607f8c0878d4f0377779.jpg', 2, 1, '2021-01-08 06:59:15', '2021-01-08 06:59:15'),
(8, 1, 'files/pk/1/fdd9bb71b30744657497a34947f7f6ae.jpg', 3, 1, '2021-01-08 06:59:15', '2021-01-08 06:59:15'),
(9, 1, 'files/pk/1/551d5e220168b0490c1c12fa8eae9edc.jpg', 4, 1, '2021-01-08 06:59:16', '2021-01-08 06:59:16'),
(10, 1, 'files/pk/1/760bf367165f6cc9380b4cb7d1d1a17d.jpg', 5, 1, '2021-01-08 06:59:16', '2021-01-08 06:59:16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(17,2) UNSIGNED DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT 0,
  `contact_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT 0,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lon` float DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` float DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT 0,
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) DEFAULT 0,
  `verified_phone` tinyint(1) UNSIGNED DEFAULT 1,
  `reviewed` tinyint(1) UNSIGNED DEFAULT 0,
  `featured` tinyint(1) UNSIGNED DEFAULT 0,
  `archived` tinyint(1) UNSIGNED DEFAULT 0,
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT 0,
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `country_code`, `user_id`, `category_id`, `post_type_id`, `title`, `description`, `tags`, `price`, `negotiable`, `contact_name`, `email`, `phone`, `phone_hidden`, `address`, `city_id`, `lon`, `lat`, `ip_addr`, `visits`, `email_token`, `phone_token`, `tmp_token`, `verified_email`, `verified_phone`, `reviewed`, `featured`, `archived`, `archived_at`, `archived_manually`, `deletion_mail_sent_at`, `fb_profile`, `partner`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PK', 1, 58, 2, 'This is test add', '<p>we have to check that\'s why we are posting the add</p>', 'test,new,multi', '1500.00', 1, 'Muhammad Ali', 'admin@gmail.com', '0123123123', 1, NULL, 1172451, 74.3507, 31.558, '127.0.0.1', 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, '2021-01-08 06:57:01', '2021-01-08 06:58:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Private', NULL, NULL, NULL, 1),
(2, 'en', 2, 'Professional', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_values`
--

CREATE TABLE `post_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_values`
--

INSERT INTO `post_values` (`id`, `post_id`, `field_id`, `option_id`, `value`) VALUES
(3, 1, 18, NULL, '137'),
(4, 1, 8, NULL, '11');

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Fraud'),
(2, 'en', 2, 'Duplicate'),
(3, 'en', 3, 'Spam'),
(4, 'en', 4, 'Wrong category'),
(5, 'en', 5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `updated_at`, `created_at`) VALUES
(1, 'super-admin', 'web', '2021-01-08 05:33:13', '2021-01-08 05:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payload` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_activity` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"nulled\",\"name\":\"Rentfirst\",\"slogan\":\"site Slogan\",\"email\":\"alimughal5566@gmail.com\"}', 'Application Setup', NULL, 0, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', NULL, 'Style Customization', NULL, 0, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', NULL, 'Listing & Search Options', NULL, 0, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads Single Page', NULL, 'Ads Single Page Options', NULL, 0, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"email_sender\":\"alimughal5566@gmail.com\",\"driver\":\"sendmail\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\"}', 'Mail Sending Configuration', NULL, 0, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', NULL, 'SMS Sending Configuration', NULL, 0, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', NULL, 'Upload Settings', NULL, 0, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"default_country_code\":\"PK\"}', 'Geo Location Configuration', NULL, 0, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', NULL, 'Security Options', NULL, 0, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', NULL, 'Social Network Login', NULL, 0, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, 0, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, 0, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', NULL, 'SEO Tools', NULL, 0, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', NULL, 'Other Options', NULL, 0, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', NULL, 'Cron Job', NULL, 0, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', NULL, 'Pages Footer', NULL, 0, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', NULL, 'Backup Configuration', NULL, 0, 34, 35, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `asciiname`, `active`) VALUES
(2607, 'PK.08', 'PK', 'Islamabad', 'Islamabad', 1),
(2608, 'PK.05', 'PK', 'Sindh', 'Sindh', 1),
(2609, 'PK.04', 'PK', 'Punjab', 'Punjab', 1),
(2610, 'PK.03', 'PK', 'Khyber Pakhtunkhwa', 'Khyber Pakhtunkhwa', 1),
(2611, 'PK.07', 'PK', 'Gilgit-Baltistan', 'Gilgit-Baltistan', 1),
(2612, 'PK.01', 'PK', 'FATA', 'FATA', 1),
(2613, 'PK.02', 'PK', 'Balochistan', 'Balochistan', 1),
(2614, 'PK.06', 'PK', 'Azad Kashmir', 'Azad Kashmir', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `asciiname`, `active`) VALUES
(28195, 'PK.02.1162104', 'PK', 'PK.02', 'Zhob District', 'Zhob District', 1),
(28196, 'PK.04.1162811', 'PK', 'PK.04', 'Vihāri District', 'Vihari District', 1),
(28197, 'PK.02.1163052', 'PK', 'PK.02', 'Kech District', 'Kech District', 1),
(28198, 'PK.05.1163570', 'PK', 'PK.05', 'Thatta District', 'Thatta District', 1),
(28199, 'PK.05.1163602', 'PK', 'PK.05', 'Thar Pārkar District', 'Thar Parkar District', 1),
(28200, 'PK.03.1164211', 'PK', 'PK.03', 'Swāt District', 'Swat District', 1),
(28201, 'PK.05.1164407', 'PK', 'PK.05', 'Sukkur District', 'Sukkur District', 1),
(28202, 'PK.01.1164536', 'PK', 'PK.01', 'South Wazīristān Agency', 'South Waziristan Agency', 1),
(28203, 'PK.02.1164895', 'PK', 'PK.02', 'Sibi District', 'Sibi District', 1),
(28204, 'PK.04.1164908', 'PK', 'PK.04', 'Siālkot District', 'Sialkot District', 1),
(28205, 'PK.05.1165106', 'PK', 'PK.05', 'Shikārpur District', 'Shikarpur District', 1),
(28206, 'PK.04.1165218', 'PK', 'PK.04', 'Shekhūpura District', 'Shekhupura District', 1),
(28207, 'PK.04.1165998', 'PK', 'PK.04', 'Sargodha Division', 'Sargodha Division', 1),
(28208, 'PK.04.1165999', 'PK', 'PK.04', 'Sargodha District', 'Sargodha District', 1),
(28209, 'PK.05.1166162', 'PK', 'PK.05', 'Sānghar District', 'Sanghar District', 1),
(28210, 'PK.04.1166545', 'PK', 'PK.04', 'Sāhīwāl District', 'Sahiwal District', 1),
(28211, 'PK.04.1166990', 'PK', 'PK.04', 'Rawalpindi Division', 'Rawalpindi Division', 1),
(28212, 'PK.04.1166991', 'PK', 'PK.04', 'Rawalpindi District', 'Rawalpindi District', 1),
(28213, 'PK.04.1167458', 'PK', 'PK.04', 'Rahīmyār Khān District', 'Rahimyar Khan District', 1),
(28214, 'PK.02.1167526', 'PK', 'PK.02', 'Quetta Division', 'Quetta Division', 1),
(28215, 'PK.02.1167527', 'PK', 'PK.02', 'Quetta District', 'Quetta District', 1),
(28216, 'PK.06.1167717', 'PK', 'PK.06', 'Poonch District', 'Poonch District', 1),
(28217, 'PK.02.1167820', 'PK', 'PK.02', 'Pishīn District', 'Pishin District', 1),
(28218, 'PK.03.1168194', 'PK', 'PK.03', 'Peshawar Division', 'Peshawar Division', 1),
(28219, 'PK.03.1168195', 'PK', 'PK.03', 'Peshāwar District', 'Peshawar District', 1),
(28220, 'PK.02.1168444', 'PK', 'PK.02', 'Panjgūr District', 'Panjgur District', 1),
(28221, 'PK.01.1168705', 'PK', 'PK.01', 'Orakzai Agency', 'Orakzai Agency', 1),
(28222, 'PK.01.1168875', 'PK', 'PK.01', 'North Wazīristān Agency', 'North Waziristan Agency', 1),
(28223, 'PK.05.1169115', 'PK', 'PK.05', 'Nawābshāh District', 'Nawabshah District', 1),
(28224, 'PK.02.1169249', 'PK', 'PK.02', 'Nasīrābād District', 'Nasirabad District', 1),
(28225, 'PK.04.1169603', 'PK', 'PK.04', 'Muzaffargarh District', 'Muzaffargarh District', 1),
(28226, 'PK.06.1169606', 'PK', 'PK.06', 'Muzaffarābād District', 'Muzaffarabad District', 1),
(28227, 'PK.04.1169820', 'PK', 'PK.04', 'Multan Division', 'Multan Division', 1),
(28228, 'PK.04.1169821', 'PK', 'PK.04', 'Multān District', 'Multan District', 1),
(28229, 'PK.01.1170122', 'PK', 'PK.01', 'Mohmand Agency', 'Mohmand Agency', 1),
(28230, 'PK.06.1170297', 'PK', 'PK.06', 'Mirpur District', 'Mirpur District', 1),
(28231, 'PK.04.1170424', 'PK', 'PK.04', 'Miānwāli District', 'Mianwali District', 1),
(28232, 'PK.03.1170875', 'PK', 'PK.03', 'Mardān District', 'Mardan District', 1),
(28233, 'PK.03.1170950', 'PK', 'PK.03', 'Mānsehra District', 'Mansehra District', 1),
(28234, 'PK.03.1171387', 'PK', 'PK.03', 'Malakand Division', 'Malakand Division', 1),
(28235, 'PK.03.1171388', 'PK', 'PK.03', 'Malakand Protected Area', 'Malakand Protected Area', 1),
(28236, 'PK.02.1171403', 'PK', 'PK.02', 'Mekran District', 'Mekran District', 1),
(28237, 'PK.02.1171867', 'PK', 'PK.02', 'Loralai District', 'Loralai District', 1),
(28238, 'PK.02.1172115', 'PK', 'PK.02', 'Lasbela District', 'Lasbela District', 1),
(28239, 'PK.05.1172127', 'PK', 'PK.05', 'Lārkāna District', 'Larkana District', 1),
(28240, 'PK.04.1172448', 'PK', 'PK.04', 'Lahore Division', 'Lahore Division', 1),
(28241, 'PK.04.1172449', 'PK', 'PK.04', 'Lahore District', 'Lahore District', 1),
(28242, 'PK.01.1172574', 'PK', 'PK.01', 'Kurram Agency', 'Kurram Agency', 1),
(28243, 'PK.06.1173037', 'PK', 'PK.06', 'Kotli District', 'Kotli District', 1),
(28244, 'PK.02.1173463', 'PK', 'PK.02', 'Kohlu District', 'Kohlu District', 1),
(28245, 'PK.03.1173473', 'PK', 'PK.03', 'Kohistān District', 'Kohistan District', 1),
(28246, 'PK.03.1173489', 'PK', 'PK.03', 'Kohāt District', 'Kohat District', 1),
(28247, 'PK.01.1173641', 'PK', 'PK.01', 'Khyber Agency', 'Khyber Agency', 1),
(28248, 'PK.02.1173663', 'PK', 'PK.02', 'Khuzdār District', 'Khuzdar District', 1),
(28249, 'PK.02.1174059', 'PK', 'PK.02', 'Khārān District', 'Kharan District', 1),
(28250, 'PK.05.1174348', 'PK', 'PK.05', 'Sukkur Division', 'Sukkur Division', 1),
(28251, 'PK.05.1174349', 'PK', 'PK.05', 'Khairpur District', 'Khairpur District', 1),
(28252, 'PK.04.1174623', 'PK', 'PK.04', 'Kasūr District', 'Kasur District', 1),
(28253, 'PK.05.1174870', 'PK', 'PK.05', 'Karāchi District', 'Karachi District', 1),
(28254, 'PK.02.1175292', 'PK', 'PK.02', 'Kalat Division', 'Kalat Division', 1),
(28255, 'PK.02.1175293', 'PK', 'PK.02', 'Kalāt District', 'Kalat District', 1),
(28256, 'PK.02.1175527', 'PK', 'PK.02', 'Kachhi District', 'Kachhi District', 1),
(28257, 'PK.04.1175862', 'PK', 'PK.04', 'Jhelum District', 'Jhelum District', 1),
(28258, 'PK.04.1175906', 'PK', 'PK.04', 'Jhang District', 'Jhang District', 1),
(28259, 'PK.05.1176514', 'PK', 'PK.05', 'Jacobabad District', 'Jacobabad District', 1),
(28260, 'PK.05.1176732', 'PK', 'PK.05', 'Hyderabad Division', 'Hyderabad Division', 1),
(28261, 'PK.05.1176733', 'PK', 'PK.05', 'Hyderābād District', 'Hyderabad District', 1),
(28262, 'PK.07.1176775', 'PK', 'PK.07', 'Hunza-Nagar District', 'Hunza-Nagar District', 1),
(28263, 'PK.03.1176967', 'PK', 'PK.03', 'Hazara Division', 'Hazara Division', 1),
(28264, 'PK.02.1177445', 'PK', 'PK.02', 'Gwādar District', 'Gwadar District', 1),
(28265, 'PK.04.1177651', 'PK', 'PK.04', 'Gujrāt District', 'Gujrat District', 1),
(28266, 'PK.04.1177657', 'PK', 'PK.04', 'Gujranwala Division', 'Gujranwala Division', 1),
(28267, 'PK.04.1177658', 'PK', 'PK.04', 'Gujrānwāla District', 'Gujranwala District', 1),
(28268, 'PK.04.1179398', 'PK', 'PK.04', 'Faisalābād Division', 'Faisalabad Division', 1),
(28269, 'PK.04.1179399', 'PK', 'PK.04', 'Faisalābād District', 'Faisalabad District', 1),
(28270, 'PK.03.1179754', 'PK', 'PK.03', 'Upper Dīr District', 'Upper Dir District', 1),
(28271, 'PK.01.1180280', 'PK', 'PK.01', 'Dera Ismāīl Khān Tribal Area', 'Dera Ismail Khan Tribal Area', 1),
(28272, 'PK.03.1180282', 'PK', 'PK.03', 'Dera Ismāīl Khān District', 'Dera Ismail Khan District', 1),
(28273, 'PK.04.1180287', 'PK', 'PK.04', 'Dera Ghāzi Khān District', 'Dera Ghazi Khan District', 1),
(28274, 'PK.05.1180802', 'PK', 'PK.05', 'Dādu District', 'Dadu District', 1),
(28275, 'PK.03.1181064', 'PK', 'PK.03', 'Chitrāl District', 'Chitral District', 1),
(28276, 'PK.02.1181950', 'PK', 'PK.02', 'Chāgai District', 'Chagai District', 1),
(28277, 'PK.03.1182146', 'PK', 'PK.03', 'Buner District', 'Buner District', 1),
(28278, 'PK.03.1183459', 'PK', 'PK.03', 'Bannu District', 'Bannu District', 1),
(28279, 'PK.07.1183615', 'PK', 'PK.07', 'Skārdu District', 'Skardu District', 1),
(28280, 'PK.01.1183781', 'PK', 'PK.01', 'Bājaur Agency', 'Bajaur Agency', 1),
(28281, 'PK.04.1183875', 'PK', 'PK.04', 'Bahawalpur Division', 'Bahawalpur Division', 1),
(28282, 'PK.04.1183876', 'PK', 'PK.04', 'Bahāwalpur District', 'Bahawalpur District', 1),
(28283, 'PK.04.1183882', 'PK', 'PK.04', 'Bahāwalnagar District', 'Bahawalnagar District', 1),
(28284, 'PK.05.1184051', 'PK', 'PK.05', 'Badīn District', 'Badin District', 1),
(28285, 'PK.04.1184248', 'PK', 'PK.04', 'Attock District', 'Attock District', 1),
(28286, 'PK.03.1185055', 'PK', 'PK.03', 'Abbottābād District', 'Abbottabad District', 1),
(28287, 'PK.05.1376894', 'PK', 'PK.05', 'Mirpur Khas District', 'Mirpur Khas District', 1),
(28288, 'PK.02.6641896', 'PK', 'PK.02', 'Awārān District', 'Awaran District', 1),
(28289, 'PK.02.6641912', 'PK', 'PK.02', 'Bārkhān District', 'Barkhan District', 1),
(28290, 'PK.02.6641919', 'PK', 'PK.02', 'Dera Bugti District', 'Dera Bugti District', 1),
(28291, 'PK.02.6641922', 'PK', 'PK.02', 'Jāfarābād District', 'Jafarabad District', 1),
(28292, 'PK.02.6641923', 'PK', 'PK.02', 'Jhal Magsi District', 'Jhal Magsi District', 1),
(28293, 'PK.02.6641952', 'PK', 'PK.02', 'Mastung District', 'Mastung District', 1),
(28294, 'PK.02.6641955', 'PK', 'PK.02', 'Mūsa Khel District', 'Musa Khel District', 1),
(28295, 'PK.02.6641960', 'PK', 'PK.02', 'Nushki District', 'Nushki District', 1),
(28296, 'PK.02.6641961', 'PK', 'PK.02', 'Qila Abdullāh District', 'Qila Abdullah District', 1),
(28297, 'PK.02.6641963', 'PK', 'PK.02', 'Qila Saifullāh District', 'Qila Saifullah District', 1),
(28298, 'PK.02.6641965', 'PK', 'PK.02', 'Wāshuk District', 'Washuk District', 1),
(28299, 'PK.02.6641972', 'PK', 'PK.02', 'Ziārat District', 'Ziarat District', 1),
(28300, 'PK.04.7331706', 'PK', 'PK.04', 'Toba Tek Singh District', 'Toba Tek Singh District', 1),
(28301, 'PK.05.7352189', 'PK', 'PK.05', 'Naushahro Fīroz District', 'Naushahro Firoz District', 1),
(28302, 'PK.05.7418822', 'PK', 'PK.05', 'Ghotki District', 'Ghotki District', 1),
(28303, 'PK.04.7418846', 'PK', 'PK.04', 'Lodhrān District', 'Lodhran District', 1),
(28304, 'PK.04.7418850', 'PK', 'PK.04', 'Pākpattan District', 'Pakpattan District', 1),
(28305, 'PK.04.7418888', 'PK', 'PK.04', 'Okāra District', 'Okara District', 1),
(28306, 'PK.04.7418890', 'PK', 'PK.04', 'Khānewāl District', 'Khanewal District', 1),
(28307, 'PK.04.7418962', 'PK', 'PK.04', 'Hāfizābād District', 'Hafizabad District', 1),
(28308, 'PK.04.7418963', 'PK', 'PK.04', 'Mandi Bahāuddīn District', 'Mandi Bahauddin District', 1),
(28309, 'PK.04.7418964', 'PK', 'PK.04', 'Chakwāl District', 'Chakwal District', 1),
(28310, 'PK.04.7418965', 'PK', 'PK.04', 'Khushāb District', 'Khushab District', 1),
(28311, 'PK.04.7418966', 'PK', 'PK.04', 'Bhakkar District', 'Bhakkar District', 1),
(28312, 'PK.04.7418967', 'PK', 'PK.04', 'Layyah District', 'Layyah District', 1),
(28313, 'PK.04.7418968', 'PK', 'PK.04', 'Nārowāl District', 'Narowal District', 1),
(28314, 'PK.03.7419039', 'PK', 'PK.03', 'Lakki Marwat District', 'Lakki Marwat District', 1),
(28315, 'PK.03.7419040', 'PK', 'PK.03', 'Tānk District', 'Tank District', 1),
(28316, 'PK.01.7419041', 'PK', 'PK.01', 'Tānk Tribal Area', 'Tank Tribal Area', 1),
(28317, 'PK.01.7419043', 'PK', 'PK.01', 'Bannu Tribal Area', 'Bannu Tribal Area', 1),
(28318, 'PK.01.7419044', 'PK', 'PK.01', 'Lakki Marwat Tribal Area', 'Lakki Marwat Tribal Area', 1),
(28319, 'PK.03.7419047', 'PK', 'PK.03', 'Karak District', 'Karak District', 1),
(28320, 'PK.03.7419048', 'PK', 'PK.03', 'Hangu District', 'Hangu District', 1),
(28321, 'PK.01.7419049', 'PK', 'PK.01', 'Peshāwar Tribal Area', 'Peshawar Tribal Area', 1),
(28322, 'PK.01.7419050', 'PK', 'PK.01', 'Kohāt Tribal Area', 'Kohat Tribal Area', 1),
(28323, 'PK.03.7419051', 'PK', 'PK.03', 'Chārsadda District', 'Charsadda District', 1),
(28324, 'PK.03.7419052', 'PK', 'PK.03', 'Nowshera District', 'Nowshera District', 1),
(28325, 'PK.03.7419053', 'PK', 'PK.03', 'Shāngla District', 'Shangla District', 1),
(28326, 'PK.03.7419054', 'PK', 'PK.03', 'Harīpur District', 'Haripur District', 1),
(28327, 'PK.03.7419055', 'PK', 'PK.03', 'Swābi District', 'Swabi District', 1),
(28328, 'PK.03.7419056', 'PK', 'PK.03', 'Lower Dīr District', 'Lower Dir District', 1),
(28329, 'PK.07.7419057', 'PK', 'PK.07', 'Ghizar District', 'Ghizar District', 1),
(28330, 'PK.07.7419077', 'PK', 'PK.07', 'Ghanche District', 'Ghanche District', 1),
(28331, 'PK.05.7419156', 'PK', 'PK.05', 'Jāmshoro District', 'Jamshoro District', 1),
(28332, 'PK.05.7419157', 'PK', 'PK.05', 'Matiāri District', 'Matiari District', 1),
(28333, 'PK.04.7419159', 'PK', 'PK.04', 'Nankāna Sāhib District', 'Nankana Sahib District', 1),
(28334, 'PK.06.7536187', 'PK', 'PK.06', 'Bhimbar District', 'Bhimbar District', 1),
(28335, 'PK.06.7536188', 'PK', 'PK.06', 'Bagh District', 'Bagh District', 1),
(28336, 'PK.04.7648373', 'PK', 'PK.04', 'Sudhnati District', 'Sudhnati District', 1),
(28337, 'PK.01.7732203', 'PK', 'PK.01', 'Chawkay', 'Chawkay', 1),
(28338, 'PK.03.8061265', 'PK', 'PK.03', 'Tor Ghar', 'Tor Ghar', 1),
(28339, 'PK.06.8199376', 'PK', 'PK.06', 'Neelum District', 'Neelum District', 1),
(28340, 'PK.03.8224052', 'PK', 'PK.03', 'Battagram District', 'Battagram District', 1),
(28341, 'PK.04.8309731', 'PK', 'PK.04', 'Rājanpur', 'Rajanpur', 1),
(28342, 'PK.07.8309748', 'PK', 'PK.07', 'Astor', 'Astor', 1),
(28343, 'PK.06.8309754', 'PK', 'PK.06', 'Haveli', 'Haveli', 1),
(28344, 'PK.06.8309755', 'PK', 'PK.06', 'Hatian', 'Hatian', 1),
(28345, 'PK.02.8309758', 'PK', 'PK.02', 'Harnai', 'Harnai', 1),
(28346, 'PK.02.8309759', 'PK', 'PK.02', 'Shirāni', 'Shirani', 1),
(28347, 'PK.07.8358419', 'PK', 'PK.07', 'Gilgit', 'Gilgit', 1),
(28348, 'PK.07.8358421', 'PK', 'PK.07', 'Diamīr', 'Diamir', 1),
(28349, 'PK.06.8986039', 'PK', 'PK.06', 'Sudhanoti District', 'Sudhanoti District', 1),
(28350, 'PK.05.9034783', 'PK', 'PK.05', 'Qamber Shahdadkot District', 'Qamber Shahdadkot District', 1),
(28351, 'PK.05.9035095', 'PK', 'PK.05', 'Kashmore District', 'Kashmore District', 1),
(28352, 'PK.05.9072726', 'PK', 'PK.05', 'Umerkot District', 'Umerkot District', 1),
(28353, 'PK.05.9625763', 'PK', 'PK.05', 'Tando Allahyar District', 'Tando Allahyar District', 1),
(28354, 'PK.05.9625902', 'PK', 'PK.05', 'Tando Mohammad Khan District', 'Tando Mohammad Khan District', 1),
(28355, 'PK.05.10300608', 'PK', 'PK.05', 'Sujawal District', 'Sujawal District', 1),
(28356, 'PK.04.10344547', 'PK', 'PK.04', 'Vehari District', 'Vehari District', 1),
(28357, 'PK.02.10983501', 'PK', 'PK.02', 'Dalbandin Nok Kundi', 'Dalbandin Nok Kundi', 1),
(28358, 'PK.07.11594770', 'PK', 'PK.07', 'Ghizer District', 'Ghizer District', 1),
(28359, 'PK.07.11744817', 'PK', 'PK.07', 'Astore Division', 'Astore Division', 1),
(28360, 'PK.04.11744818', 'PK', 'PK.04', 'Dera Ghazi Khan Dvision', 'Dera Ghazi Khan Dvision', 1),
(28361, 'PK.05.11744828', 'PK', 'PK.05', 'Mirpur Khas Division', 'Mirpur Khas Division', 1),
(28362, 'PK.06.11744829', 'PK', 'PK.06', 'Rawalakot Division', 'Rawalakot Division', 1),
(28363, 'PK.05.11744830', 'PK', 'PK.05', 'Shaheed Benazirabad Division', 'Shaheed Benazirabad Division', 1),
(28364, 'PK.02.11876517', 'PK', 'PK.02', 'Bolān', 'Bolan', 1),
(28365, 'PK.04.11886901', 'PK', 'PK.04', 'Chiniot', 'Chiniot', 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_zone_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `gmt` double DEFAULT NULL,
  `dst` double DEFAULT NULL,
  `raw` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `country_code`, `time_zone_id`, `gmt`, `dst`, `raw`) VALUES
(1, 'CI', 'Africa/Abidjan', 0, 0, 0),
(2, 'GH', 'Africa/Accra', 0, 0, 0),
(3, 'ET', 'Africa/Addis_Ababa', 3, 3, 3),
(4, 'DZ', 'Africa/Algiers', 1, 1, 1),
(5, 'ER', 'Africa/Asmara', 3, 3, 3),
(6, 'ML', 'Africa/Bamako', 0, 0, 0),
(7, 'CF', 'Africa/Bangui', 1, 1, 1),
(8, 'GM', 'Africa/Banjul', 0, 0, 0),
(9, 'GW', 'Africa/Bissau', 0, 0, 0),
(10, 'MW', 'Africa/Blantyre', 2, 2, 2),
(11, 'CG', 'Africa/Brazzaville', 1, 1, 1),
(12, 'BI', 'Africa/Bujumbura', 2, 2, 2),
(13, 'EG', 'Africa/Cairo', 2, 2, 2),
(14, 'MA', 'Africa/Casablanca', 0, 1, 0),
(15, 'ES', 'Africa/Ceuta', 1, 2, 1),
(16, 'GN', 'Africa/Conakry', 0, 0, 0),
(17, 'SN', 'Africa/Dakar', 0, 0, 0),
(18, 'TZ', 'Africa/Dar_es_Salaam', 3, 3, 3),
(19, 'DJ', 'Africa/Djibouti', 3, 3, 3),
(20, 'CM', 'Africa/Douala', 1, 1, 1),
(21, 'EH', 'Africa/El_Aaiun', 0, 1, 0),
(22, 'SL', 'Africa/Freetown', 0, 0, 0),
(23, 'BW', 'Africa/Gaborone', 2, 2, 2),
(24, 'ZW', 'Africa/Harare', 2, 2, 2),
(25, 'ZA', 'Africa/Johannesburg', 2, 2, 2),
(26, 'SS', 'Africa/Juba', 3, 3, 3),
(27, 'UG', 'Africa/Kampala', 3, 3, 3),
(28, 'SD', 'Africa/Khartoum', 3, 3, 3),
(29, 'RW', 'Africa/Kigali', 2, 2, 2),
(30, 'CD', 'Africa/Kinshasa', 1, 1, 1),
(31, 'NG', 'Africa/Lagos', 1, 1, 1),
(32, 'GA', 'Africa/Libreville', 1, 1, 1),
(33, 'TG', 'Africa/Lome', 0, 0, 0),
(34, 'AO', 'Africa/Luanda', 1, 1, 1),
(35, 'CD', 'Africa/Lubumbashi', 2, 2, 2),
(36, 'ZM', 'Africa/Lusaka', 2, 2, 2),
(37, 'GQ', 'Africa/Malabo', 1, 1, 1),
(38, 'MZ', 'Africa/Maputo', 2, 2, 2),
(39, 'LS', 'Africa/Maseru', 2, 2, 2),
(40, 'SZ', 'Africa/Mbabane', 2, 2, 2),
(41, 'SO', 'Africa/Mogadishu', 3, 3, 3),
(42, 'LR', 'Africa/Monrovia', 0, 0, 0),
(43, 'KE', 'Africa/Nairobi', 3, 3, 3),
(44, 'TD', 'Africa/Ndjamena', 1, 1, 1),
(45, 'NE', 'Africa/Niamey', 1, 1, 1),
(46, 'MR', 'Africa/Nouakchott', 0, 0, 0),
(47, 'BF', 'Africa/Ouagadougou', 0, 0, 0),
(48, 'BJ', 'Africa/Porto-Novo', 1, 1, 1),
(49, 'ST', 'Africa/Sao_Tome', 0, 0, 0),
(50, 'LY', 'Africa/Tripoli', 2, 2, 2),
(51, 'TN', 'Africa/Tunis', 1, 1, 1),
(52, 'NA', 'Africa/Windhoek', 2, 1, 1),
(53, 'US', 'America/Adak', -10, -9, -10),
(54, 'US', 'America/Anchorage', -9, -8, -9),
(55, 'AI', 'America/Anguilla', -4, -4, -4),
(56, 'AG', 'America/Antigua', -4, -4, -4),
(57, 'BR', 'America/Araguaina', -3, -3, -3),
(58, 'AR', 'America/Argentina/Buenos_Aires', -3, -3, -3),
(59, 'AR', 'America/Argentina/Catamarca', -3, -3, -3),
(60, 'AR', 'America/Argentina/Cordoba', -3, -3, -3),
(61, 'AR', 'America/Argentina/Jujuy', -3, -3, -3),
(62, 'AR', 'America/Argentina/La_Rioja', -3, -3, -3),
(63, 'AR', 'America/Argentina/Mendoza', -3, -3, -3),
(64, 'AR', 'America/Argentina/Rio_Gallegos', -3, -3, -3),
(65, 'AR', 'America/Argentina/Salta', -3, -3, -3),
(66, 'AR', 'America/Argentina/San_Juan', -3, -3, -3),
(67, 'AR', 'America/Argentina/San_Luis', -3, -3, -3),
(68, 'AR', 'America/Argentina/Tucuman', -3, -3, -3),
(69, 'AR', 'America/Argentina/Ushuaia', -3, -3, -3),
(70, 'AW', 'America/Aruba', -4, -4, -4),
(71, 'PY', 'America/Asuncion', -3, -4, -4),
(72, 'CA', 'America/Atikokan', -5, -5, -5),
(73, 'BR', 'America/Bahia', -3, -3, -3),
(74, 'MX', 'America/Bahia_Banderas', -6, -5, -6),
(75, 'BB', 'America/Barbados', -4, -4, -4),
(76, 'BR', 'America/Belem', -3, -3, -3),
(77, 'BZ', 'America/Belize', -6, -6, -6),
(78, 'CA', 'America/Blanc-Sablon', -4, -4, -4),
(79, 'BR', 'America/Boa_Vista', -4, -4, -4),
(80, 'CO', 'America/Bogota', -5, -5, -5),
(81, 'US', 'America/Boise', -7, -6, -7),
(82, 'CA', 'America/Cambridge_Bay', -7, -6, -7),
(83, 'BR', 'America/Campo_Grande', -3, -4, -4),
(84, 'MX', 'America/Cancun', -5, -5, -5),
(85, 'VE', 'America/Caracas', -4, -4, -4),
(86, 'GF', 'America/Cayenne', -3, -3, -3),
(87, 'KY', 'America/Cayman', -5, -5, -5),
(88, 'US', 'America/Chicago', -6, -5, -6),
(89, 'MX', 'America/Chihuahua', -7, -6, -7),
(90, 'CR', 'America/Costa_Rica', -6, -6, -6),
(91, 'CA', 'America/Creston', -7, -7, -7),
(92, 'BR', 'America/Cuiaba', -3, -4, -4),
(93, 'CW', 'America/Curacao', -4, -4, -4),
(94, 'GL', 'America/Danmarkshavn', 0, 0, 0),
(95, 'CA', 'America/Dawson', -8, -7, -8),
(96, 'CA', 'America/Dawson_Creek', -7, -7, -7),
(97, 'US', 'America/Denver', -7, -6, -7),
(98, 'US', 'America/Detroit', -5, -4, -5),
(99, 'DM', 'America/Dominica', -4, -4, -4),
(100, 'CA', 'America/Edmonton', -7, -6, -7),
(101, 'BR', 'America/Eirunepe', -5, -5, -5),
(102, 'SV', 'America/El_Salvador', -6, -6, -6),
(103, 'CA', 'America/Fort_Nelson', -7, -7, -7),
(104, 'BR', 'America/Fortaleza', -3, -3, -3),
(105, 'CA', 'America/Glace_Bay', -4, -3, -4),
(106, 'GL', 'America/Godthab', -3, -2, -3),
(107, 'CA', 'America/Goose_Bay', -4, -3, -4),
(108, 'TC', 'America/Grand_Turk', -4, -4, -4),
(109, 'GD', 'America/Grenada', -4, -4, -4),
(110, 'GP', 'America/Guadeloupe', -4, -4, -4),
(111, 'GT', 'America/Guatemala', -6, -6, -6),
(112, 'EC', 'America/Guayaquil', -5, -5, -5),
(113, 'GY', 'America/Guyana', -4, -4, -4),
(114, 'CA', 'America/Halifax', -4, -3, -4),
(115, 'CU', 'America/Havana', -5, -4, -5),
(116, 'MX', 'America/Hermosillo', -7, -7, -7),
(117, 'US', 'America/Indiana/Indianapolis', -5, -4, -5),
(118, 'US', 'America/Indiana/Knox', -6, -5, -6),
(119, 'US', 'America/Indiana/Marengo', -5, -4, -5),
(120, 'US', 'America/Indiana/Petersburg', -5, -4, -5),
(121, 'US', 'America/Indiana/Tell_City', -6, -5, -6),
(122, 'US', 'America/Indiana/Vevay', -5, -4, -5),
(123, 'US', 'America/Indiana/Vincennes', -5, -4, -5),
(124, 'US', 'America/Indiana/Winamac', -5, -4, -5),
(125, 'CA', 'America/Inuvik', -7, -6, -7),
(126, 'CA', 'America/Iqaluit', -5, -4, -5),
(127, 'JM', 'America/Jamaica', -5, -5, -5),
(128, 'US', 'America/Juneau', -9, -8, -9),
(129, 'US', 'America/Kentucky/Louisville', -5, -4, -5),
(130, 'US', 'America/Kentucky/Monticello', -5, -4, -5),
(131, 'BQ', 'America/Kralendijk', -4, -4, -4),
(132, 'BO', 'America/La_Paz', -4, -4, -4),
(133, 'PE', 'America/Lima', -5, -5, -5),
(134, 'US', 'America/Los_Angeles', -8, -7, -8),
(135, 'SX', 'America/Lower_Princes', -4, -4, -4),
(136, 'BR', 'America/Maceio', -3, -3, -3),
(137, 'NI', 'America/Managua', -6, -6, -6),
(138, 'BR', 'America/Manaus', -4, -4, -4),
(139, 'MF', 'America/Marigot', -4, -4, -4),
(140, 'MQ', 'America/Martinique', -4, -4, -4),
(141, 'MX', 'America/Matamoros', -6, -5, -6),
(142, 'MX', 'America/Mazatlan', -7, -6, -7),
(143, 'US', 'America/Menominee', -6, -5, -6),
(144, 'MX', 'America/Merida', -6, -5, -6),
(145, 'US', 'America/Metlakatla', -9, -8, -9),
(146, 'MX', 'America/Mexico_City', -6, -5, -6),
(147, 'PM', 'America/Miquelon', -3, -2, -3),
(148, 'CA', 'America/Moncton', -4, -3, -4),
(149, 'MX', 'America/Monterrey', -6, -5, -6),
(150, 'UY', 'America/Montevideo', -3, -3, -3),
(151, 'MS', 'America/Montserrat', -4, -4, -4),
(152, 'BS', 'America/Nassau', -5, -4, -5),
(153, 'US', 'America/New_York', -5, -4, -5),
(154, 'CA', 'America/Nipigon', -5, -4, -5),
(155, 'US', 'America/Nome', -9, -8, -9),
(156, 'BR', 'America/Noronha', -2, -2, -2),
(157, 'US', 'America/North_Dakota/Beulah', -6, -5, -6),
(158, 'US', 'America/North_Dakota/Center', -6, -5, -6),
(159, 'US', 'America/North_Dakota/New_Salem', -6, -5, -6),
(160, 'MX', 'America/Ojinaga', -7, -6, -7),
(161, 'PA', 'America/Panama', -5, -5, -5),
(162, 'CA', 'America/Pangnirtung', -5, -4, -5),
(163, 'SR', 'America/Paramaribo', -3, -3, -3),
(164, 'US', 'America/Phoenix', -7, -7, -7),
(165, 'HT', 'America/Port-au-Prince', -5, -4, -5),
(166, 'TT', 'America/Port_of_Spain', -4, -4, -4),
(167, 'BR', 'America/Porto_Velho', -4, -4, -4),
(168, 'PR', 'America/Puerto_Rico', -4, -4, -4),
(169, 'CL', 'America/Punta_Arenas', -3, -3, -3),
(170, 'CA', 'America/Rainy_River', -6, -5, -6),
(171, 'CA', 'America/Rankin_Inlet', -6, -5, -6),
(172, 'BR', 'America/Recife', -3, -3, -3),
(173, 'CA', 'America/Regina', -6, -6, -6),
(174, 'CA', 'America/Resolute', -6, -5, -6),
(175, 'BR', 'America/Rio_Branco', -5, -5, -5),
(176, 'BR', 'America/Santarem', -3, -3, -3),
(177, 'CL', 'America/Santiago', -3, -4, -4),
(178, 'DO', 'America/Santo_Domingo', -4, -4, -4),
(179, 'BR', 'America/Sao_Paulo', -2, -3, -3),
(180, 'GL', 'America/Scoresbysund', -1, 0, -1),
(181, 'US', 'America/Sitka', -9, -8, -9),
(182, 'BL', 'America/St_Barthelemy', -4, -4, -4),
(183, 'CA', 'America/St_Johns', -3.5, -2.5, -3.5),
(184, 'KN', 'America/St_Kitts', -4, -4, -4),
(185, 'LC', 'America/St_Lucia', -4, -4, -4),
(186, 'VI', 'America/St_Thomas', -4, -4, -4),
(187, 'VC', 'America/St_Vincent', -4, -4, -4),
(188, 'CA', 'America/Swift_Current', -6, -6, -6),
(189, 'HN', 'America/Tegucigalpa', -6, -6, -6),
(190, 'GL', 'America/Thule', -4, -3, -4),
(191, 'CA', 'America/Thunder_Bay', -5, -4, -5),
(192, 'MX', 'America/Tijuana', -8, -7, -8),
(193, 'CA', 'America/Toronto', -5, -4, -5),
(194, 'VG', 'America/Tortola', -4, -4, -4),
(195, 'CA', 'America/Vancouver', -8, -7, -8),
(196, 'CA', 'America/Whitehorse', -8, -7, -8),
(197, 'CA', 'America/Winnipeg', -6, -5, -6),
(198, 'US', 'America/Yakutat', -9, -8, -9),
(199, 'CA', 'America/Yellowknife', -7, -6, -7),
(200, 'AQ', 'Antarctica/Casey', 11, 11, 11),
(201, 'AQ', 'Antarctica/Davis', 7, 7, 7),
(202, 'AQ', 'Antarctica/DumontDUrville', 10, 10, 10),
(203, 'AU', 'Antarctica/Macquarie', 11, 11, 11),
(204, 'AQ', 'Antarctica/Mawson', 5, 5, 5),
(205, 'AQ', 'Antarctica/McMurdo', 13, 12, 12),
(206, 'AQ', 'Antarctica/Palmer', -3, -3, -3),
(207, 'AQ', 'Antarctica/Rothera', -3, -3, -3),
(208, 'AQ', 'Antarctica/Syowa', 3, 3, 3),
(209, 'AQ', 'Antarctica/Troll', 0, 2, 0),
(210, 'AQ', 'Antarctica/Vostok', 6, 6, 6),
(211, 'SJ', 'Arctic/Longyearbyen', 1, 2, 1),
(212, 'YE', 'Asia/Aden', 3, 3, 3),
(213, 'KZ', 'Asia/Almaty', 6, 6, 6),
(214, 'JO', 'Asia/Amman', 2, 3, 2),
(215, 'RU', 'Asia/Anadyr', 12, 12, 12),
(216, 'KZ', 'Asia/Aqtau', 5, 5, 5),
(217, 'KZ', 'Asia/Aqtobe', 5, 5, 5),
(218, 'TM', 'Asia/Ashgabat', 5, 5, 5),
(219, 'KZ', 'Asia/Atyrau', 5, 5, 5),
(220, 'IQ', 'Asia/Baghdad', 3, 3, 3),
(221, 'BH', 'Asia/Bahrain', 3, 3, 3),
(222, 'AZ', 'Asia/Baku', 4, 4, 4),
(223, 'TH', 'Asia/Bangkok', 7, 7, 7),
(224, 'RU', 'Asia/Barnaul', 7, 7, 7),
(225, 'LB', 'Asia/Beirut', 2, 3, 2),
(226, 'KG', 'Asia/Bishkek', 6, 6, 6),
(227, 'BN', 'Asia/Brunei', 8, 8, 8),
(228, 'RU', 'Asia/Chita', 9, 9, 9),
(229, 'MN', 'Asia/Choibalsan', 8, 8, 8),
(230, 'LK', 'Asia/Colombo', 5.5, 5.5, 5.5),
(231, 'SY', 'Asia/Damascus', 2, 3, 2),
(232, 'BD', 'Asia/Dhaka', 6, 6, 6),
(233, 'TL', 'Asia/Dili', 9, 9, 9),
(234, 'AE', 'Asia/Dubai', 4, 4, 4),
(235, 'TJ', 'Asia/Dushanbe', 5, 5, 5),
(236, 'CY', 'Asia/Famagusta', 3, 3, 3),
(237, 'PS', 'Asia/Gaza', 2, 3, 2),
(238, 'PS', 'Asia/Hebron', 2, 3, 2),
(239, 'VN', 'Asia/Ho_Chi_Minh', 7, 7, 7),
(240, 'HK', 'Asia/Hong_Kong', 8, 8, 8),
(241, 'MN', 'Asia/Hovd', 7, 7, 7),
(242, 'RU', 'Asia/Irkutsk', 8, 8, 8),
(243, 'ID', 'Asia/Jakarta', 7, 7, 7),
(244, 'ID', 'Asia/Jayapura', 9, 9, 9),
(245, 'IL', 'Asia/Jerusalem', 2, 3, 2),
(246, 'AF', 'Asia/Kabul', 4.5, 4.5, 4.5),
(247, 'RU', 'Asia/Kamchatka', 12, 12, 12),
(248, 'PK', 'Asia/Karachi', 5, 5, 5),
(249, 'NP', 'Asia/Kathmandu', 5.75, 5.75, 5.75),
(250, 'RU', 'Asia/Khandyga', 9, 9, 9),
(251, 'IN', 'Asia/Kolkata', 5.5, 5.5, 5.5),
(252, 'RU', 'Asia/Krasnoyarsk', 7, 7, 7),
(253, 'MY', 'Asia/Kuala_Lumpur', 8, 8, 8),
(254, 'MY', 'Asia/Kuching', 8, 8, 8),
(255, 'KW', 'Asia/Kuwait', 3, 3, 3),
(256, 'MO', 'Asia/Macau', 8, 8, 8),
(257, 'RU', 'Asia/Magadan', 11, 11, 11),
(258, 'ID', 'Asia/Makassar', 8, 8, 8),
(259, 'PH', 'Asia/Manila', 8, 8, 8),
(260, 'OM', 'Asia/Muscat', 4, 4, 4),
(261, 'CY', 'Asia/Nicosia', 2, 3, 2),
(262, 'RU', 'Asia/Novokuznetsk', 7, 7, 7),
(263, 'RU', 'Asia/Novosibirsk', 7, 7, 7),
(264, 'RU', 'Asia/Omsk', 6, 6, 6),
(265, 'KZ', 'Asia/Oral', 5, 5, 5),
(266, 'KH', 'Asia/Phnom_Penh', 7, 7, 7),
(267, 'ID', 'Asia/Pontianak', 7, 7, 7),
(268, 'KP', 'Asia/Pyongyang', 8.5, 8.5, 8.5),
(269, 'QA', 'Asia/Qatar', 3, 3, 3),
(270, 'KZ', 'Asia/Qyzylorda', 6, 6, 6),
(271, 'SA', 'Asia/Riyadh', 3, 3, 3),
(272, 'RU', 'Asia/Sakhalin', 11, 11, 11),
(273, 'UZ', 'Asia/Samarkand', 5, 5, 5),
(274, 'KR', 'Asia/Seoul', 9, 9, 9),
(275, 'CN', 'Asia/Shanghai', 8, 8, 8),
(276, 'SG', 'Asia/Singapore', 8, 8, 8),
(277, 'RU', 'Asia/Srednekolymsk', 11, 11, 11),
(278, 'TW', 'Asia/Taipei', 8, 8, 8),
(279, 'UZ', 'Asia/Tashkent', 5, 5, 5),
(280, 'GE', 'Asia/Tbilisi', 4, 4, 4),
(281, 'IR', 'Asia/Tehran', 3.5, 4.5, 3.5),
(282, 'BT', 'Asia/Thimphu', 6, 6, 6),
(283, 'JP', 'Asia/Tokyo', 9, 9, 9),
(284, 'RU', 'Asia/Tomsk', 7, 7, 7),
(285, 'MN', 'Asia/Ulaanbaatar', 8, 8, 8),
(286, 'CN', 'Asia/Urumqi', 6, 6, 6),
(287, 'RU', 'Asia/Ust-Nera', 10, 10, 10),
(288, 'LA', 'Asia/Vientiane', 7, 7, 7),
(289, 'RU', 'Asia/Vladivostok', 10, 10, 10),
(290, 'RU', 'Asia/Yakutsk', 9, 9, 9),
(291, 'MM', 'Asia/Yangon', 6.5, 6.5, 6.5),
(292, 'RU', 'Asia/Yekaterinburg', 5, 5, 5),
(293, 'AM', 'Asia/Yerevan', 4, 4, 4),
(294, 'PT', 'Atlantic/Azores', -1, 0, -1),
(295, 'BM', 'Atlantic/Bermuda', -4, -3, -4),
(296, 'ES', 'Atlantic/Canary', 0, 1, 0),
(297, 'CV', 'Atlantic/Cape_Verde', -1, -1, -1),
(298, 'FO', 'Atlantic/Faroe', 0, 1, 0),
(299, 'PT', 'Atlantic/Madeira', 0, 1, 0),
(300, 'IS', 'Atlantic/Reykjavik', 0, 0, 0),
(301, 'GS', 'Atlantic/South_Georgia', -2, -2, -2),
(302, 'SH', 'Atlantic/St_Helena', 0, 0, 0),
(303, 'FK', 'Atlantic/Stanley', -3, -3, -3),
(304, 'AU', 'Australia/Adelaide', 10.5, 9.5, 9.5),
(305, 'AU', 'Australia/Brisbane', 10, 10, 10),
(306, 'AU', 'Australia/Broken_Hill', 10.5, 9.5, 9.5),
(307, 'AU', 'Australia/Currie', 11, 10, 10),
(308, 'AU', 'Australia/Darwin', 9.5, 9.5, 9.5),
(309, 'AU', 'Australia/Eucla', 8.75, 8.75, 8.75),
(310, 'AU', 'Australia/Hobart', 11, 10, 10),
(311, 'AU', 'Australia/Lindeman', 10, 10, 10),
(312, 'AU', 'Australia/Lord_Howe', 11, 10.5, 10.5),
(313, 'AU', 'Australia/Melbourne', 11, 10, 10),
(314, 'AU', 'Australia/Perth', 8, 8, 8),
(315, 'AU', 'Australia/Sydney', 11, 10, 10),
(316, 'NL', 'Europe/Amsterdam', 1, 2, 1),
(317, 'AD', 'Europe/Andorra', 1, 2, 1),
(318, 'RU', 'Europe/Astrakhan', 4, 4, 4),
(319, 'GR', 'Europe/Athens', 2, 3, 2),
(320, 'RS', 'Europe/Belgrade', 1, 2, 1),
(321, 'DE', 'Europe/Berlin', 1, 2, 1),
(322, 'SK', 'Europe/Bratislava', 1, 2, 1),
(323, 'BE', 'Europe/Brussels', 1, 2, 1),
(324, 'RO', 'Europe/Bucharest', 2, 3, 2),
(325, 'HU', 'Europe/Budapest', 1, 2, 1),
(326, 'DE', 'Europe/Busingen', 1, 2, 1),
(327, 'MD', 'Europe/Chisinau', 2, 3, 2),
(328, 'DK', 'Europe/Copenhagen', 1, 2, 1),
(329, 'IE', 'Europe/Dublin', 0, 1, 0),
(330, 'GI', 'Europe/Gibraltar', 1, 2, 1),
(331, 'GG', 'Europe/Guernsey', 0, 1, 0),
(332, 'FI', 'Europe/Helsinki', 2, 3, 2),
(333, 'IM', 'Europe/Isle_of_Man', 0, 1, 0),
(334, 'TR', 'Europe/Istanbul', 3, 3, 3),
(335, 'JE', 'Europe/Jersey', 0, 1, 0),
(336, 'RU', 'Europe/Kaliningrad', 2, 2, 2),
(337, 'UA', 'Europe/Kiev', 2, 3, 2),
(338, 'RU', 'Europe/Kirov', 3, 3, 3),
(339, 'PT', 'Europe/Lisbon', 0, 1, 0),
(340, 'SI', 'Europe/Ljubljana', 1, 2, 1),
(341, 'UK', 'Europe/London', 0, 1, 0),
(342, 'LU', 'Europe/Luxembourg', 1, 2, 1),
(343, 'ES', 'Europe/Madrid', 1, 2, 1),
(344, 'MT', 'Europe/Malta', 1, 2, 1),
(345, 'AX', 'Europe/Mariehamn', 2, 3, 2),
(346, 'BY', 'Europe/Minsk', 3, 3, 3),
(347, 'MC', 'Europe/Monaco', 1, 2, 1),
(348, 'RU', 'Europe/Moscow', 3, 3, 3),
(349, 'NO', 'Europe/Oslo', 1, 2, 1),
(350, 'FR', 'Europe/Paris', 1, 2, 1),
(351, 'ME', 'Europe/Podgorica', 1, 2, 1),
(352, 'CZ', 'Europe/Prague', 1, 2, 1),
(353, 'LV', 'Europe/Riga', 2, 3, 2),
(354, 'IT', 'Europe/Rome', 1, 2, 1),
(355, 'RU', 'Europe/Samara', 4, 4, 4),
(356, 'SM', 'Europe/San_Marino', 1, 2, 1),
(357, 'BA', 'Europe/Sarajevo', 1, 2, 1),
(358, 'RU', 'Europe/Saratov', 4, 4, 4),
(359, 'RU', 'Europe/Simferopol', 3, 3, 3),
(360, 'MK', 'Europe/Skopje', 1, 2, 1),
(361, 'BG', 'Europe/Sofia', 2, 3, 2),
(362, 'SE', 'Europe/Stockholm', 1, 2, 1),
(363, 'EE', 'Europe/Tallinn', 2, 3, 2),
(364, 'AL', 'Europe/Tirane', 1, 2, 1),
(365, 'RU', 'Europe/Ulyanovsk', 4, 4, 4),
(366, 'UA', 'Europe/Uzhgorod', 2, 3, 2),
(367, 'LI', 'Europe/Vaduz', 1, 2, 1),
(368, 'VA', 'Europe/Vatican', 1, 2, 1),
(369, 'AT', 'Europe/Vienna', 1, 2, 1),
(370, 'LT', 'Europe/Vilnius', 2, 3, 2),
(371, 'RU', 'Europe/Volgograd', 3, 3, 3),
(372, 'PL', 'Europe/Warsaw', 1, 2, 1),
(373, 'HR', 'Europe/Zagreb', 1, 2, 1),
(374, 'UA', 'Europe/Zaporozhye', 2, 3, 2),
(375, 'CH', 'Europe/Zurich', 1, 2, 1),
(376, 'MG', 'Indian/Antananarivo', 3, 3, 3),
(377, 'IO', 'Indian/Chagos', 6, 6, 6),
(378, 'CX', 'Indian/Christmas', 7, 7, 7),
(379, 'CC', 'Indian/Cocos', 6.5, 6.5, 6.5),
(380, 'KM', 'Indian/Comoro', 3, 3, 3),
(381, 'TF', 'Indian/Kerguelen', 5, 5, 5),
(382, 'SC', 'Indian/Mahe', 4, 4, 4),
(383, 'MV', 'Indian/Maldives', 5, 5, 5),
(384, 'MU', 'Indian/Mauritius', 4, 4, 4),
(385, 'YT', 'Indian/Mayotte', 3, 3, 3),
(386, 'RE', 'Indian/Reunion', 4, 4, 4),
(387, 'WS', 'Pacific/Apia', 14, 13, 13),
(388, 'NZ', 'Pacific/Auckland', 13, 12, 12),
(389, 'PG', 'Pacific/Bougainville', 11, 11, 11),
(390, 'NZ', 'Pacific/Chatham', 13.75, 12.75, 12.75),
(391, 'FM', 'Pacific/Chuuk', 10, 10, 10),
(392, 'CL', 'Pacific/Easter', -5, -6, -6),
(393, 'VU', 'Pacific/Efate', 11, 11, 11),
(394, 'KI', 'Pacific/Enderbury', 13, 13, 13),
(395, 'TK', 'Pacific/Fakaofo', 13, 13, 13),
(396, 'FJ', 'Pacific/Fiji', 13, 12, 12),
(397, 'TV', 'Pacific/Funafuti', 12, 12, 12),
(398, 'EC', 'Pacific/Galapagos', -6, -6, -6),
(399, 'PF', 'Pacific/Gambier', -9, -9, -9),
(400, 'SB', 'Pacific/Guadalcanal', 11, 11, 11),
(401, 'GU', 'Pacific/Guam', 10, 10, 10),
(402, 'US', 'Pacific/Honolulu', -10, -10, -10),
(403, 'KI', 'Pacific/Kiritimati', 14, 14, 14),
(404, 'FM', 'Pacific/Kosrae', 11, 11, 11),
(405, 'MH', 'Pacific/Kwajalein', 12, 12, 12),
(406, 'MH', 'Pacific/Majuro', 12, 12, 12),
(407, 'PF', 'Pacific/Marquesas', -9.5, -9.5, -9.5),
(408, 'UM', 'Pacific/Midway', -11, -11, -11),
(409, 'NR', 'Pacific/Nauru', 12, 12, 12),
(410, 'NU', 'Pacific/Niue', -11, -11, -11),
(411, 'NF', 'Pacific/Norfolk', 11, 11, 11),
(412, 'NC', 'Pacific/Noumea', 11, 11, 11),
(413, 'AS', 'Pacific/Pago_Pago', -11, -11, -11),
(414, 'PW', 'Pacific/Palau', 9, 9, 9),
(415, 'PN', 'Pacific/Pitcairn', -8, -8, -8),
(416, 'FM', 'Pacific/Pohnpei', 11, 11, 11),
(417, 'PG', 'Pacific/Port_Moresby', 10, 10, 10),
(418, 'CK', 'Pacific/Rarotonga', -10, -10, -10),
(419, 'MP', 'Pacific/Saipan', 10, 10, 10),
(420, 'PF', 'Pacific/Tahiti', -10, -10, -10),
(421, 'KI', 'Pacific/Tarawa', 12, 12, 12),
(422, 'TO', 'Pacific/Tongatapu', 14, 13, 13),
(423, 'UM', 'Pacific/Wake', 12, 12, 12),
(424, 'WF', 'Pacific/Wallis', 12, 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` int(10) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT 0,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT 0,
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT 1,
  `disable_comments` tinyint(1) UNSIGNED DEFAULT 0,
  `receive_newsletter` tinyint(1) UNSIGNED DEFAULT 1,
  `receive_advice` tinyint(1) UNSIGNED DEFAULT 1,
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT 1,
  `verified_phone` tinyint(1) UNSIGNED DEFAULT 0,
  `blocked` tinyint(1) UNSIGNED DEFAULT 0,
  `closed` tinyint(1) UNSIGNED DEFAULT 0,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `receive_newsletter`, `receive_advice`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `blocked`, `closed`, `last_login_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PK', NULL, 1, 1, 'Muhammad Ali', NULL, 'Administrator', '0123123123', 0, NULL, 'admin@gmail.com', NULL, '$2y$10$EVwuwgxNJ/CY4S2Ny2jSAuDsGQgZgRk1w0sTRZfwqiAv4J5PgxKMC', NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL, '2021-01-08 06:34:02', NULL),
(2, 'PK', 'en', NULL, 1, 'Ali Mughal', 'avatars/pk/2/d37655d153e0422d696740c7640d5f31.jpg', NULL, '+923045903545', NULL, 'Alonewolf', 'Alonewolf@gmail.com', NULL, '$2y$10$x6dipsoLMAmsRwR4atPcEee7DOoe94rQx.YHuUcK6RV0hib0lP9yG', NULL, 0, 1, 0, 1, 1, '127.0.0.1', NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, '2021-01-08 07:03:45', '2021-01-08 07:06:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`,`field_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `subadmin2_code` (`subadmin2_code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `belongs_to` (`belongs_to`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abbr` (`abbr`),
  ADD KEY `active` (`active`),
  ADD KEY `default` (`default`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `package_id` (`package_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_ccbox` (`has_ccbox`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lat` (`lon`,`lat`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `title` (`title`),
  ADD KEY `address` (`address`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `featured` (`featured`),
  ADD KEY `post_type_id` (`post_type_id`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `contact_name` (`contact_name`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation_lang` (`translation_lang`),
  ADD KEY `translation_of` (`translation_of`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `subadmin1_code` (`subadmin1_code`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_zone_id` (`time_zone_id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `phone` (`phone`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `verified_email` (`verified_email`),
  ADD KEY `verified_phone` (`verified_phone`),
  ADD KEY `is_admin` (`is_admin`),
  ADD KEY `can_be_impersonated` (`can_be_impersonated`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2615;

--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28366;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
