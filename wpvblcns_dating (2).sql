-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 19, 2025 at 04:03 PM
-- Server version: 8.4.6
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wpvblcns_dating`
--

-- --------------------------------------------------------

--
-- Table structure for table `activation_codes`
--

CREATE TABLE `activation_codes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `code` varchar(100) NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int NOT NULL,
  `ad_1` text NOT NULL,
  `ad_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `ad_1`, `ad_2`) VALUES
(1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `blocked_users`
--

CREATE TABLE `blocked_users` (
  `id` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sexual_preference` int NOT NULL,
  `country` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `order_by` int NOT NULL,
  `sexual_orientation` int NOT NULL,
  `age_range` varchar(20) NOT NULL,
  `distance_range` varchar(20) NOT NULL,
  `location_dating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`id`, `user_id`, `sexual_preference`, `country`, `city`, `order_by`, `sexual_orientation`, `age_range`, `distance_range`, `location_dating`) VALUES
(9, 20, 3, 'All Countries', '', 2, 1, '16,100', '0,500', 0),
(10, 12, 3, 'Egypt', '', 2, 1, '', '', 0),
(11, 19, 3, 'All Countries', '', 2, 1, '16,100', '0,500', 0),
(13, 20, 3, 'All Countries', '', 2, 1, '16,100', '0,500', 0),
(14, 20, 3, 'All Countries', '', 2, 1, '16,100', '0,500', 0),
(15, 20, 3, 'All Countries', '', 2, 1, '16,100', '0,500', 0),
(25, 121, 3, 'All Countries', '', 4, 1, '18,99', '0,500', 0),
(26, 316, 3, 'United States', '', 3, 1, '17,25', '0,500', 0),
(27, 324, 2, 'All Countries', '', 4, 1, '0,100 ', '0,500', 0);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `time` int NOT NULL,
  `accepted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user1`, `user2`, `time`, `accepted`) VALUES
(1, 121, 20, 1452539954, 1),
(2, 12, 20, 1452908537, 1),
(3, 12, 121, 1476667925, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `path` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `user1`, `user2`, `path`, `time`) VALUES
(1, 20, 12, '26.png', 1456263594),
(4, 20, 12, '9.png', 1456263815),
(5, 20, 12, '8.png', 1456263821),
(6, 20, 12, '21.png', 1456263828),
(7, 20, 121, '10.png', 1456266041),
(8, 20, 121, '13.png', 1456266148),
(9, 20, 190, '18.png', 1456266163),
(10, 20, 186, '26.png', 1456266174),
(11, 20, 192, '5.png', 1456266182),
(12, 20, 218, '2.png', 1456322306),
(13, 20, 218, '4.png', 1456322309),
(14, 20, 220, '11.png', 1456322332),
(15, 20, 220, '14.png', 1456322334),
(16, 20, 222, '26.png', 1456322345),
(17, 20, 222, '15.png', 1456322355),
(18, 20, 223, '5.png', 1456322368),
(19, 20, 219, '16.png', 1456322375),
(20, 20, 219, '17.png', 1456322379),
(21, 20, 0, '12.png', 1473207538),
(23, 20, 0, '21.png', 1473219303),
(24, 20, 121, '21.png', 1473219417),
(25, 20, 121, '9.png', 1473219718),
(26, 20, 121, '11.png', 1473220080),
(27, 20, 121, '2.png', 1473257648),
(28, 20, 121, '5.png', 1475168559),
(29, 20, 121, '17.png', 1475181430),
(30, 121, 12, '3.png', 1475833757),
(60, 121, 20, '12.png', 1476574173),
(61, 121, 19, '12.png', 1476583011);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `message` text,
  `user1` int DEFAULT NULL,
  `user2` int DEFAULT NULL,
  `is_sticker` int DEFAULT NULL,
  `is_photo` int DEFAULT NULL,
  `sticker_id` int DEFAULT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  `is_promoted` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  `is_fake_sent` tinyint(1) DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `user1`, `user2`, `is_sticker`, `is_photo`, `sticker_id`, `photo_path`, `is_promoted`, `time`, `is_fake_sent`, `read`) VALUES
(75, 'Hey, how are you doing?', 20, 121, 0, 0, 0, '', 0, 1476063716, 0, 1),
(76, 'Not much, you?', 121, 20, 0, 0, 0, '', 0, 1476063716, 0, 0),
(77, 'Just chillin. You free tonight?', 20, 121, 0, 0, 0, '', 0, 1476063716, 0, 1),
(78, 'Hey there!', 19, 121, 0, 0, 0, '', 0, 1476063716, 0, 1),
(79, 'How are you?', 19, 121, 0, 0, 0, '', 0, 1476063716, 0, 1),
(80, 'You look very pretty.', 19, 121, 0, 0, 0, '', 0, 1476063716, 0, 1),
(87, '', 121, 20, 1, 0, 15, '', 0, 1476063716, 0, 0),
(91, 'Hehe', 121, 20, 0, 0, 0, '', 0, 1476574418, 0, 0),
(92, 'Thank you!', 121, 19, 0, 0, 0, '', 0, 1476574434, 0, 0),
(93, '', 121, 19, 1, 0, 14, '', 0, 1476574444, 0, 0),
(103, 'Happy holidays!', 121, 12, 0, 0, 0, NULL, NULL, 1482596190, 0, 0),
(104, '', 121, 12, 1, 0, 14, NULL, NULL, 1482596207, 0, 0),
(105, 'undefined', 121, 0, 0, 0, 0, NULL, NULL, 1486567817, 0, 0),
(106, 'Test', 121, 317, 0, 0, 0, NULL, NULL, 1757420264, 0, 0),
(107, 'Hi', 334, 20, 0, 0, 0, NULL, NULL, 1757421736, 0, 0),
(108, 'Hello from admin', 334, 20, 0, 0, 0, NULL, NULL, 1757421743, 0, 0),
(109, 'Hi too', 334, 121, 0, 0, 0, NULL, NULL, 1757421751, 0, 1),
(110, 'Now what', 334, 317, 0, 0, 0, NULL, NULL, 1757421795, 0, 0),
(111, 'Hi', 334, 121, 0, 0, 0, NULL, NULL, 1757488350, 0, 1),
(112, 'Hi', 334, 121, 0, 0, 0, NULL, NULL, 1757488426, 0, 1),
(113, 'Hi', 333, 317, 0, 0, 0, NULL, NULL, 1757489153, 0, 0),
(114, 'Hi again', 333, 12, 0, 0, 0, NULL, NULL, 1757489174, 0, 0),
(115, 'Yesy', 333, 316, 0, 0, 0, NULL, NULL, 1757489191, 0, 0),
(116, 'Test', 333, 316, 0, 0, 0, NULL, NULL, 1757489195, 0, 0),
(117, 'Test', 333, 316, 0, 0, 0, NULL, NULL, 1757489198, 0, 0),
(118, 'Test', 333, 316, 0, 0, 0, NULL, NULL, 1757489201, 0, 0),
(119, 'Test', 333, 317, 0, 0, 0, NULL, NULL, 1757489218, 0, 0),
(120, 'test', 333, 317, 0, 0, 0, NULL, NULL, 1757489226, 0, 0),
(121, 'test', 333, 317, 0, 0, 0, NULL, NULL, 1757489230, 0, 0),
(122, 'test', 333, 317, 0, 0, 0, NULL, NULL, 1757489233, 0, 0),
(123, 'Hi! What\'s up?', 324, 335, 0, 0, 0, NULL, NULL, 1757491901, 1, 0),
(124, 'How\'s your day going?', 332, 337, 0, 0, 0, NULL, NULL, 1757492579, 1, 0),
(125, 'Hi', 335, 332, 0, 0, 0, NULL, NULL, 1757493171, 0, 0),
(126, 'You look interesting!', 332, 326, 0, 0, 0, NULL, NULL, 1757493323, 1, 1),
(127, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757493357, 0, 1),
(128, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757494054, 0, 1),
(129, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757494138, 0, 1),
(130, 'Hi there', 326, 121, 0, 0, 0, NULL, NULL, 1757494846, 0, 1),
(131, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757495866, 0, 1),
(132, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757495943, 0, 1),
(133, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757495962, 0, 1),
(134, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757496438, 0, 1),
(135, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757496452, 0, 1),
(136, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757496464, 0, 1),
(137, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757496478, 0, 1),
(138, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757496478, 0, 1),
(139, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757496769, 0, 1),
(140, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757496950, 0, 1),
(141, 'Hi', 121, 317, 0, 0, 0, NULL, NULL, 1757496994, 0, 0),
(142, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757497454, 0, 1),
(143, 'Hi', 121, 20, 0, 0, 0, NULL, NULL, 1757497527, 0, 0),
(144, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757499590, 0, 1),
(145, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757499691, 0, 1),
(146, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757499692, 0, 1),
(147, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757499692, 0, 1),
(148, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757499692, 0, 1),
(149, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757499692, 0, 1),
(150, 'to you', 326, 121, 0, 0, 0, NULL, NULL, 1757499698, 0, 1),
(151, 'to you', 326, 121, 0, 0, 0, NULL, NULL, 1757499698, 0, 1),
(152, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757501277, 0, 1),
(153, 'We', 121, 326, 0, 0, 0, NULL, NULL, 1757501947, 0, 1),
(154, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757502682, 0, 1),
(155, 'Hi', 326, 121, 0, 0, 0, NULL, NULL, 1757502798, 0, 1),
(156, 'Hello from admin', 326, 121, 0, 0, 0, NULL, NULL, 1757504309, 0, 1),
(157, 'Hi', 121, 326, 0, 0, 0, NULL, NULL, 1757504387, 0, 0),
(158, 'Save me from this boredom ?', 318, 338, 0, 0, 0, NULL, NULL, 1757507339, 1, 0),
(159, 'I think boredom makes me more talkative lol', 320, 339, 0, 0, 0, NULL, NULL, 1757508207, 1, 0),
(160, 'Why do people even sign up if they don’t reply?', 323, 339, 0, 0, 0, NULL, NULL, 1757509334, 1, 0),
(161, 'Not in the best mood tbh', 323, 340, 0, 0, 0, NULL, NULL, 1757509604, 1, 0),
(162, 'I just made coffee and now I’m too awake to sleep, thought I’d see who’s online ?', 319, 341, 0, 0, 0, NULL, NULL, 1757509714, 1, 0),
(163, 'How’s your day going?', 329, 342, 0, 0, 0, NULL, NULL, 1757509873, 1, 0),
(164, 'Don’t waste my time if you’re not fun', 321, 121, 0, 0, 0, NULL, NULL, 1757522726, 1, 1),
(165, 'You look sooo hot ?', 319, 121, 0, 0, 0, NULL, NULL, 1757526541, 1, 1),
(166, 'You have that look that makes me imagine things I probably shouldn’t be saying here…', 332, 121, 0, 0, 0, NULL, NULL, 1757568209, 1, 1),
(167, 'Honestly, I keep wondering what it’d be like if we met in person, just the two of us ?', 327, 121, 0, 0, 0, NULL, NULL, 1757731496, 1, 1),
(168, 'Why do people even sign up if they don’t reply?', 323, 121, 0, 0, 0, NULL, NULL, 1757911162, 1, 1),
(169, 'You seem like the adventurous type ?', 327, 121, 0, 0, 0, NULL, NULL, 1757934036, 1, 1),
(170, 'I feel like we might actually vibe well if we keep talking ?', 325, 121, 0, 0, 0, NULL, NULL, 1757943616, 1, 1),
(171, 'Am I doing this right? ?', 325, 121, 0, 0, 0, NULL, NULL, 1757946928, 1, 1),
(172, 'Scrolling endlessly because I’m bored ?', 328, 343, 0, 0, 0, NULL, NULL, 1757955497, 1, 0),
(173, 'Today’s been surprisingly good ☀️ how about yours?', 329, 344, 0, 0, 0, NULL, NULL, 1757955589, 1, 1),
(174, 'You seem like a positive person, am I right?', 326, 345, 0, 0, 0, NULL, NULL, 1757955977, 1, 0),
(175, 'Some convos are just better when they’re easygoing', 327, 346, 0, 0, 0, NULL, NULL, 1757956062, 1, 0),
(176, 'Hey ?', 324, 121, 0, 0, 0, NULL, NULL, 1758015609, 1, 1),
(177, 'You have that look that makes me imagine things I probably shouldn’t be saying here…', 326, 324, 0, 0, 0, NULL, NULL, 1758015937, 1, 0),
(178, 'You gonna reply or nah?', 318, 121, 0, 0, 0, NULL, NULL, 1758016124, 1, 1),
(179, 'Have you ever laughed so hard you cried?', 324, 121, 0, 0, 0, NULL, NULL, 1758017618, 1, 1),
(180, 'Good vibes only ✌️', 326, 121, 0, 0, 0, NULL, NULL, 1758113832, 1, 1),
(181, 'Wanna chat and kill some time?', 322, 121, 0, 0, 0, NULL, NULL, 1758120427, 1, 1),
(182, 'Just relaxing and scrolling, nothing serious', 327, 121, 0, 0, 0, NULL, NULL, 1758131245, 1, 1),
(183, 'I bet you’re the kind of person who doesn’t hold back when it matters ?', 323, 121, 0, 0, 0, NULL, NULL, 1758132775, 1, 1),
(184, 'Some days just feel brighter, don’t you agree?', 320, 121, 0, 0, 0, NULL, NULL, 1758255299, 1, 1),
(185, 'What do you value most in people?', 326, 121, 0, 0, 0, NULL, NULL, 1758272388, 1, 1),
(186, 'Do you like talking about big ideas or keeping it casual?', 324, 121, 0, 0, 0, NULL, NULL, 1758285074, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `url` varchar(1000) NOT NULL,
  `content` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `time` int NOT NULL,
  `is_read` int NOT NULL,
  `is_screen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `receiver_id`, `url`, `content`, `icon`, `time`, `is_read`, `is_screen`) VALUES
(1, 316, 'user/121', '<b>Nathalie</b> liked your profile', 'icon icon-heart', 1488053105, 0, 0),
(2, 334, 'user/121', '<b>Nathalie</b> liked your profile', 'icon icon-heart', 1488053105, 0, 0),
(3, 20, 'user/121', '<b>Nathalie</b> liked your profile', 'icon icon-heart', 1476660886, 0, 1),
(4, 351, 'user/121', '<b>Nathalie</b> liked your profile', 'icon icon-heart', 1476660892, 0, 0),
(5, 325, 'user/121', '<b>Nathalie</b> liked your profile', 'icon icon-heart', 1476660894, 0, 0),
(6, 336, 'user/121', '<b>Nathalie</b> liked your profile', 'icon icon-heart', 1476660895, 0, 0),
(7, 121, 'user/12', '<b>Madison</b> sent you a friend request', 'icon icon-bubble', 1488053105, 1, 1),
(9, 12, 'user/20', '<b>Dave</b> liked your profile', 'icon icon-heart', 1488053105, 0, 1),
(10, 316, 'user/20', '<b>Dave</b> liked your profile', 'icon icon-heart', 1488053105, 0, 0),
(11, 250, 'user/20', '<b>Dave</b> liked your profile', 'icon icon-heart', 1488053105, 0, 0),
(12, 317, 'user/20', '<b>Dave</b> liked your profile', 'icon icon-heart', 1488053105, 0, 0),
(13, 121, 'user/12', '<b>Madison</b> messaged you', 'icon icon-bubble', 1488053105, 1, 0),
(14, 121, 'user/12', '<b>Madison</b> messaged you', 'icon icon-bubble', 1488053105, 1, 0),
(15, 121, 'user/12', '<b>Madison</b> messaged you', 'icon icon-bubble', 1488053105, 1, 0),
(16, 121, 'user/12', '<b>Madison</b> messaged you', 'icon icon-bubble', 1488053105, 1, 0),
(17, 121, 'user/12', '<b>Madison</b> messaged you', 'icon icon-bubble', 1488053105, 1, 0),
(18, 250, 'user/12', '<b>Madison</b> messaged you', 'icon icon-bubble', 1488053105, 0, 0),
(19, 12, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1488053105, 0, 0),
(20, 12, 'user/121', 'Sent a sticker', 'icon icon-bubble', 1488053105, 0, 0),
(22, 121, 'user/19', '<b>Justin</b> liked your profile', 'ti-heart', 1488053307, 1, 1),
(23, 12, 'user/19', '<b>Justin</b> liked your profile', 'ti-heart', 1488053312, 0, 0),
(24, 250, 'user/19', '<b>Justin</b> liked your profile', 'ti-heart', 1488053322, 0, 0),
(25, 316, 'user/19', '<b>Justin</b> liked your profile', 'ti-heart', 1488053331, 0, 0),
(26, 20, 'user/19', '<b>Justin</b> liked your profile', 'ti-heart', 1488054091, 0, 0),
(27, 317, 'user/19', '<b>Justin</b> liked your profile', 'ti-heart', 1488054101, 0, 0),
(28, 317, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757420264, 0, 0),
(29, 333, 'user/121', '<b>Nathalie</b> sent you a friend request', 'icon icon-plus', 1757421092, 0, 0),
(30, 20, 'user/334', '<b>Test</b> messaged you', 'icon icon-bubble', 1757421736, 0, 0),
(31, 20, 'user/334', '<b>Test</b> messaged you', 'icon icon-bubble', 1757421743, 0, 0),
(32, 121, 'user/334', '<b>Test</b> messaged you', 'icon icon-bubble', 1757421751, 1, 0),
(33, 317, 'user/334', '<b>Test</b> messaged you', 'icon icon-bubble', 1757421795, 0, 0),
(34, 12, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(35, 19, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(36, 20, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(37, 121, '#', 'Hi users', 'fa fa-globe', 1757486847, 1, 0),
(38, 250, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(39, 316, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(40, 317, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(41, 318, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(42, 319, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(43, 320, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(44, 321, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(45, 322, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(46, 323, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(47, 324, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(48, 325, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(49, 326, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(50, 327, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(51, 328, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(52, 329, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(53, 330, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(54, 331, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(55, 332, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(56, 333, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(57, 334, '#', 'Hi users', 'fa fa-globe', 1757486847, 0, 0),
(58, 121, 'user/334', '<b>Test</b> messaged you', 'icon icon-bubble', 1757488350, 1, 0),
(59, 121, 'user/334', '<b>Test</b> messaged you', 'icon icon-bubble', 1757488426, 1, 0),
(60, 317, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489153, 0, 0),
(61, 12, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489174, 0, 0),
(62, 316, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489191, 0, 0),
(63, 316, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489195, 0, 0),
(64, 316, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489198, 0, 0),
(65, 316, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489201, 0, 0),
(66, 317, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489218, 0, 0),
(67, 317, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489226, 0, 0),
(68, 317, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489230, 0, 0),
(69, 317, 'user/333', '<b>Mia</b> messaged you', 'icon icon-bubble', 1757489233, 0, 0),
(70, 334, 'user/335', '<b>Testboy</b> liked your profile', 'ti-heart', 1757491941, 0, 0),
(71, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757493357, 0, 0),
(72, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757494054, 0, 0),
(73, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757494138, 0, 0),
(74, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757494846, 1, 0),
(75, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757495866, 1, 0),
(76, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757495943, 1, 0),
(77, 317, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757496994, 0, 0),
(78, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757497454, 0, 0),
(79, 334, 'user/121', '<b>Nathalie</b> liked your profile', 'ti-heart', 1757497490, 0, 0),
(80, 12, 'user/121', '<b>Nathalie</b> liked your profile', 'ti-heart', 1757497492, 0, 0),
(81, 20, 'user/121', '<b>Nathalie</b> liked your profile', 'ti-heart', 1757497494, 0, 0),
(82, 20, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757497527, 0, 0),
(83, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757499590, 0, 0),
(84, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499691, 1, 0),
(85, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499692, 1, 0),
(86, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499692, 1, 0),
(87, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499692, 1, 0),
(88, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499692, 1, 0),
(89, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499698, 1, 0),
(90, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757499698, 1, 0),
(91, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757501277, 0, 0),
(92, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757501947, 0, 0),
(93, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757502682, 1, 0),
(94, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757502798, 1, 0),
(95, 121, 'user/326', '<b>Jane</b> messaged you', 'icon icon-bubble', 1757504309, 1, 0),
(96, 326, 'user/121', '<b>Nathalie</b> messaged you', 'icon icon-bubble', 1757504387, 0, 0),
(97, 325, 'user/121', '<b></b> sent you a friend request', 'icon icon-plus', 1757945894, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `owned_sticker_packs`
--

CREATE TABLE `owned_sticker_packs` (
  `id` int NOT NULL,
  `pack_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owned_sticker_packs`
--

INSERT INTO `owned_sticker_packs` (`id`, `pack_id`, `user_id`) VALUES
(1, 1, 121);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `page_title` text NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_title`, `content`) VALUES
(1, 'Terms of Service', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n\r\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \r\n\r\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(2, 'About Us', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n\r\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \r\n\r\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n\r\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `path` varchar(100) NOT NULL,
  `is_active` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `name`, `author`, `version`, `icon`, `path`, `is_active`) VALUES
(2, 'Mass Email', 'Condor5', '2.7', 'fa-envelope', 'mass_email', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profile_dislikes`
--

CREATE TABLE `profile_dislikes` (
  `id` int NOT NULL,
  `profile_id` int NOT NULL,
  `viewer_id` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_dislikes`
--

INSERT INTO `profile_dislikes` (`id`, `profile_id`, `viewer_id`, `time`) VALUES
(1, 316, 121, 1757420748),
(2, 317, 121, 1757497488);

-- --------------------------------------------------------

--
-- Table structure for table `profile_likes`
--

CREATE TABLE `profile_likes` (
  `id` int NOT NULL,
  `profile_id` int NOT NULL,
  `viewer_id` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `profile_likes`
--

INSERT INTO `profile_likes` (`id`, `profile_id`, `viewer_id`, `time`) VALUES
(2, 12, 20, 1476775910),
(3, 316, 20, 1476775911),
(4, 250, 20, 1476778779),
(5, 317, 20, 1476778785),
(7, 121, 19, 1488053307),
(8, 12, 19, 1488053312),
(9, 250, 19, 1488053322),
(10, 316, 19, 1488053331),
(11, 20, 19, 1488054091),
(12, 317, 19, 1488054101),
(13, 334, 335, 1757491941),
(14, 334, 121, 1757497490),
(15, 12, 121, 1757497492),
(16, 20, 121, 1757497494);

-- --------------------------------------------------------

--
-- Table structure for table `profile_views`
--

CREATE TABLE `profile_views` (
  `id` int NOT NULL,
  `profile_id` int NOT NULL,
  `viewer_id` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `profile_views`
--

INSERT INTO `profile_views` (`id`, `profile_id`, `viewer_id`, `time`) VALUES
(1, 12, 121, 1476368557),
(2, 317, 121, 1476369722),
(3, 20, 121, 1476370084),
(4, 316, 121, 1476371058),
(5, 0, 121, 1476390965),
(6, 19, 121, 1476409063),
(7, 121, 121, 1476409502),
(8, 250, 121, 1476415507),
(9, 316, 12, 1476638350),
(10, 121, 12, 1476638354),
(11, 12, 12, 1476638356),
(12, 19, 12, 1476638357),
(13, 250, 12, 1476638358),
(14, 317, 350, 1476639259),
(15, 350, 121, 1476639723),
(16, 316, 353, 1476645542),
(17, 250, 353, 1476645576),
(18, 351, 121, 1476646580),
(19, 332, 121, 1476655969),
(20, 334, 121, 1481416616),
(21, 459, 121, 1483745324),
(22, 121, 19, 1488053271),
(23, 333, 121, 1757421081),
(24, 331, 121, 1757421120),
(25, 121, 334, 1757421710),
(26, 317, 334, 1757421787),
(27, 317, 333, 1757489145),
(28, 12, 333, 1757489166),
(29, 316, 333, 1757489184),
(30, 121, 336, 1757492175),
(31, 332, 335, 1757493162),
(32, 326, 121, 1757493332),
(33, 326, 326, 1757494307),
(34, 121, 326, 1757494825),
(35, 319, 121, 1757505140),
(36, 340, 340, 1757509647),
(37, 341, 341, 1757509724),
(38, 322, 121, 1757934061),
(39, 325, 121, 1757945884),
(40, 121, 343, 1757955529),
(41, 323, 344, 1757955619),
(42, 324, 121, 1758015753),
(43, 121, 324, 1758015993);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `fortumo_service_id` varchar(50) NOT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `stripe_secret_key` varchar(255) DEFAULT NULL,
  `stripe_publishable_key` varchar(255) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `credits_price_100` int NOT NULL,
  `credits_price_500` int NOT NULL,
  `credits_price_1000` int NOT NULL,
  `credits_price_1500` int NOT NULL,
  `gift_price` int NOT NULL,
  `feature_price` int NOT NULL,
  `sticker_pack_price` int NOT NULL,
  `vip_1_month` int NOT NULL,
  `vip_3_months` int NOT NULL,
  `vip_6_months` int NOT NULL,
  `facebook_link` varchar(100) NOT NULL,
  `twitter_link` varchar(100) NOT NULL,
  `google_plus_link` varchar(100) NOT NULL,
  `email_sender` varchar(100) NOT NULL,
  `smtp_host` varchar(100) NOT NULL,
  `smtp_username` varchar(100) NOT NULL,
  `smtp_password` varchar(100) NOT NULL,
  `smtp_encryption` varchar(100) NOT NULL,
  `smtp_port` varchar(10) NOT NULL,
  `winter_theme` int NOT NULL,
  `pesapal_consumer_key` varchar(100) DEFAULT NULL,
  `pesapal_consumer_secret` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `fortumo_service_id`, `paypal_email`, `stripe_secret_key`, `stripe_publishable_key`, `currency`, `credits_price_100`, `credits_price_500`, `credits_price_1000`, `credits_price_1500`, `gift_price`, `feature_price`, `sticker_pack_price`, `vip_1_month`, `vip_3_months`, `vip_6_months`, `facebook_link`, `twitter_link`, `google_plus_link`, `email_sender`, `smtp_host`, `smtp_username`, `smtp_password`, `smtp_encryption`, `smtp_port`, `winter_theme`, `pesapal_consumer_key`, `pesapal_consumer_secret`) VALUES
(1, '', 'wanjirujoy138@gmail.com', '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', 'pk_live_51GwmzUJZtI2dhiMwbekLK5wjQWUdKrNCaZyKWR74OHwwIlemt2kmLi45s6DnFwOvpOR9CKaR9uhy7ozZRHGVGjLv00Rwa4bLMw', 'USD', 1, 5, 10, 15, 100, 300, 250, 500, 1500, 3000, 'https://www.facebook.com/envato', 'https://twitter.com/envato', 'https://plus.google.com/+envato', 'martinkolarov9@gmail.com', 'smtp.dreamhost.com', 'info@naughtyhaughty.com', 'dj@Topaz27899310', 'tls', '465', 0, '672Mj2/gbUHRWtxvhmeB8MpZPBEUD2Wh', 'VEVMLKeV5m+WAYqEiqBEWsvRk8w=');

-- --------------------------------------------------------

--
-- Table structure for table `stickers`
--

CREATE TABLE `stickers` (
  `id` int NOT NULL,
  `pack_id` int NOT NULL,
  `path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stickers`
--

INSERT INTO `stickers` (`id`, `pack_id`, `path`) VALUES
(1, 1, '1.png'),
(2, 1, '2.png'),
(3, 1, '3.png'),
(4, 1, '4.png'),
(5, 1, '5.png'),
(6, 1, '6.png'),
(7, 1, '7.png'),
(8, 1, '8.png'),
(9, 1, '9.png'),
(10, 1, '10.png'),
(11, 1, '11.png'),
(12, 1, '12.png'),
(13, 1, '13.png'),
(14, 1, '14.png'),
(15, 1, '15.png'),
(16, 1, '16.png'),
(17, 2, '1.png'),
(18, 2, '2.png'),
(19, 2, '3.png'),
(20, 2, '4.png'),
(21, 2, '5.png'),
(22, 2, '6.png'),
(23, 2, '7.png'),
(24, 2, '8.png'),
(25, 2, '9.png'),
(26, 2, '10.png'),
(27, 2, '11.png'),
(28, 2, '12.png'),
(29, 2, '13.png'),
(30, 2, '14.png'),
(31, 2, '15.png'),
(32, 2, '16.png'),
(33, 2, '17.png'),
(34, 2, '18.png'),
(35, 2, '19.png'),
(36, 2, '20.png'),
(37, 3, '1.png'),
(38, 3, '2.png'),
(39, 3, '3.png'),
(40, 3, '4.png'),
(41, 3, '5.png'),
(42, 3, '6.png'),
(43, 3, '7.png'),
(44, 3, '8.png'),
(45, 3, '9.png'),
(46, 3, '10.png'),
(47, 3, '11.png'),
(48, 3, '12.png'),
(49, 3, '13.png'),
(50, 3, '14.png');

-- --------------------------------------------------------

--
-- Table structure for table `sticker_packs`
--

CREATE TABLE `sticker_packs` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cover` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_premium` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sticker_packs`
--

INSERT INTO `sticker_packs` (`id`, `name`, `cover`, `is_premium`) VALUES
(1, 'Savvy Abbey', '6.png', 1),
(2, 'Sandy', '2.png', 1),
(3, 'Bao Bao', '1.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `transaction_amount` int NOT NULL,
  `transaction_name` varchar(200) NOT NULL,
  `status` int NOT NULL,
  `user_id` int NOT NULL,
  `token` varchar(123) NOT NULL,
  `credits_to_add` int NOT NULL,
  `method` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_amount`, `transaction_name`, `status`, `user_id`, `token`, `credits_to_add`, `method`) VALUES
(1, 2, '100 Credits', 0, 20, '2f7ddab2f9f0cb1f6beff7d7ea84e4fc', 100, 1),
(2, 10, '500 Credits', 0, 20, '2ea0b64eba74756b3de70c097a68ed9c', 500, 1),
(3, 10, '500 Credits', 0, 20, 'd596700c2f5648921b599016e81ae9ff', 500, 3),
(4, 2, '100 Credits', 0, 20, 'f75cdd55ef6becdbe0133aa41d6d1ff4', 100, 3),
(5, 2, '100 Credits', 0, 20, '66c292993148d6b592df9847085746f7', 100, 3),
(6, 8, '400 Credits', 0, 20, '6d2e9a79593c3f87ded6ba89916d62f0', 400, 1),
(7, 18, '900 Credits', 0, 20, '7a525b647ac3950cac8c3f8397088154', 900, 3),
(8, 2, '100 Credits', 0, 20, '94e215cd8ca763334343987f8b13cf6a', 100, 3);

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_photos`
--

CREATE TABLE `uploaded_photos` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `path` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_instagram` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `uploaded_photos`
--

INSERT INTO `uploaded_photos` (`id`, `user_id`, `path`, `is_instagram`, `time`) VALUES
(16, 121, 'd64909cad3b0922fa338fbc4fa31124713768185_629422937213893_1042281455_n.jpg', 0, 1471137947),
(17, 121, '20f72a0142c043590e89c5a367faca4b13737097_1080897195309259_969103843_n.jpg', 0, 1471137959),
(18, 121, '192c2c8f9f136d178b988f7c94a3743113649383_938289572965684_795231051_n.jpg', 0, 1471137988),
(19, 121, '99ba1450564891c7fac91249d172495013597740_899836836811666_1327390116_n.jpg', 0, 1471138018),
(20, 121, 'cdf5a8f53e80903df6363fe3c3fb424913423498_459279414282457_757812880_n.jpg', 0, 1471138028),
(21, 121, '5ea7728b9b10ab80118748e571c2927813549383_540490202828488_1559680432_n.jpg', 0, 1471138052),
(24, 121, '0e5efcc534f56d5cc0c6824d81da22f113259521_1767805206790053_1740625501_n.jpg', 0, 1471138118),
(25, 121, 'fbeef70b6827c00c07f64b367b19824e13258968_1010942828993524_2043956845_n.jpg', 0, 1471138136),
(50, 12, '5c7d043ea9d4c81eca727a51d7e1c47413423618_1085957468131302_639342158_n.jpg', 0, 1473289039),
(52, 12, '65335fc4ee906924c0d4bd5fefb94cd612950295_1721923328097087_1394584198_n.jpg', 0, 1473289257),
(53, 12, '58e1e1f61e8307b62972667e457be64e12907130_632945260195690_1295856776_n (1).jpg', 0, 1473289305),
(301, 250, '5046b9662b62f4840d2cb51367a98bce1935598_170577573309744_2444956376011796608_n.jpg', 0, 1473366807),
(302, 250, '309f83b97839c709872b271f9d45223212717901_140517613000627_544625955038330000_n.jpg', 0, 1473366815),
(303, 250, 'c8ff3e15bfeb236b8140d828d834eca712654629_122570218128700_7101414265121819022_n.jpg', 0, 1473366820),
(304, 250, 'f06338e4ee06788dd6a11de87e49852d12341063_130152937352208_8746270854138607820_n.jpg', 0, 1473366825),
(305, 250, '515b5624200a22859a1921aba55837c512321643_156826298036425_3235552786128752336_n.jpg', 0, 1473366834),
(306, 250, 'a749c83e6bcfcb858acf4db517214f1810407066_121557594896629_4444391297539507437_n.jpg', 0, 1473366840),
(308, 316, 'e65aaf07101e20b6c036d1ec73165bf913712502_967127906742268_1102873957_n.jpg', 0, 1476168255),
(311, 316, '255b6405dbb1b4011b26c00ad6600d0f13181529_1576284296002205_1960514059_n.jpg', 0, 1476168591),
(312, 316, '83064ebfad6399674db964c1c36e938913126616_1745963722354507_909746710_n.jpg', 0, 1476168614),
(313, 316, 'd9f89e3f3d69dab1d1a3d70da97ebe9412964995_255363421475395_1295701062_n.jpg', 0, 1476168636),
(315, 316, '5abc3612b284e1537d7fc3b0a3ea2d4012519166_456355174564632_1501564170_n.jpg', 0, 1476168707),
(320, 317, '0712a9d04b4525226af5c82955b57db513643658_1066922773345658_82770667_n.jpg', 0, 1476170581);

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_photo_comments`
--

CREATE TABLE `uploaded_photo_comments` (
  `id` int NOT NULL,
  `photo_id` int NOT NULL,
  `commenter_id` int NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_photo_comments`
--

INSERT INTO `uploaded_photo_comments` (`id`, `photo_id`, `commenter_id`, `comment`) VALUES
(32, 13, 20, 'Beautiful photo!'),
(33, 17, 20, 'Stunning eyes!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(123) DEFAULT NULL,
  `country` varchar(199) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `bio` text,
  `gender` varchar(20) DEFAULT NULL,
  `sexual_interest` int DEFAULT NULL,
  `instagram_username` varchar(50) DEFAULT NULL,
  `profile_picture` varchar(200) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `registered` int DEFAULT NULL,
  `last_login` int DEFAULT NULL,
  `last_active` int DEFAULT NULL,
  `updated_preferences` int DEFAULT NULL,
  `updated_name` int DEFAULT NULL,
  `is_admin` int DEFAULT NULL,
  `is_incognito` int DEFAULT NULL,
  `is_verified` int DEFAULT NULL,
  `has_disabled_ads` int DEFAULT NULL,
  `is_increased_exposure` int DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `interests` text,
  `uploaded_photos` int DEFAULT NULL,
  `is_vip` int DEFAULT NULL,
  `vip_expiration` int DEFAULT NULL,
  `ghost_mode_start` int DEFAULT NULL,
  `verified_badge_start` int DEFAULT NULL,
  `spotlight_start` int DEFAULT NULL,
  `disable_ads_start` int DEFAULT NULL,
  `ghost_mode_expiration` int DEFAULT NULL,
  `verified_badge_expiration` int DEFAULT NULL,
  `spotlight_expiration` int DEFAULT NULL,
  `disable_ads_expiration` int DEFAULT NULL,
  `height` text,
  `weight` int DEFAULT NULL,
  `last_encounter` int DEFAULT NULL,
  `is_fake` tinyint(1) DEFAULT '0',
  `next_fake_time` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `country`, `city`, `credits`, `latitude`, `longitude`, `age`, `bio`, `gender`, `sexual_interest`, `instagram_username`, `profile_picture`, `ip`, `registered`, `last_login`, `last_active`, `updated_preferences`, `updated_name`, `is_admin`, `is_incognito`, `is_verified`, `has_disabled_ads`, `is_increased_exposure`, `language`, `interests`, `uploaded_photos`, `is_vip`, `vip_expiration`, `ghost_mode_start`, `verified_badge_start`, `spotlight_start`, `disable_ads_start`, `ghost_mode_expiration`, `verified_badge_expiration`, `spotlight_expiration`, `disable_ads_expiration`, `height`, `weight`, `last_encounter`, `is_fake`, `next_fake_time`) VALUES
(12, 'Madison Beer', 'madisonbeer@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', 'New York', 10, '', '', 22, 'Loving ya ', 'Female', 1, 'davefrancosig', 'be6d8b018882738ad1d52bcfe8e5ed2e14156127_315611852125286_1674664816_n.jpg', '::1', 1439286270, 1482064344, 1482627565, 1, 0, 0, 0, 1, 0, 1, 'english', 'Singing,Hiking,Exploring,Music', 4, 1, 1491298220, 0, 0, 0, 0, 0, 0, 0, 0, '169', 50, 250, 0, 0),
(19, 'Justin Bieber', 'justinbieber@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', 'New York', 10, '42.716544299999995', '23.139228499999998', 21, 'Hey guys ;)', 'Male', 1, 'justinbieber', 'ebdb09aaff7611c3940efa04d69f35b613736909_1094099234002741_858562481_n.jpg', '127.0.0.1', 1439317970, 1488053260, 1488053286, 0, 1, 0, 0, 1, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 317, 0, 0),
(20, 'Dave Franco', 'davefranco@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', 'New York', 9850, '', '', 26, 'Welcome to my profile ;) :P', 'Male', 1, 'dave_franco_fan', 'ee0c2b4e90ccc978a672547acc7036cd11357700_903808249668053_300388208_n.jpg', '::1', 1439418997, 1476778674, 1482627565, 0, 1, 1, 1, 1, 1, 0, 'english', 'Video Games,Computers,Football,Drinking', 0, 0, 0, 1470872006, 1470872006, 0, 1470872006, 1474106699, 1474106699, 0, 1474104689, '175', 75, 19, 0, 0),
(121, '', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', '', 'nairobi', 2990, '-1.2547002', '36.9252078', 0, '', '', 0, '', 'c8ff3cd6cc8322b6eca0b4eb7e05222512534177_878313762282969_1626513728_n.jpg', '102.68.79.69', 1452539673, 1758113832, 1758286981, 1, 0, 1, 0, 1, 0, 1, 'english', 'Cosmetics,Skydiving,Swimming', 9, 1, 1491298220, 1475519762, 1475519762, 1475519762, 1475519762, 1491298220, 1491298220, 1491298220, 1491298220, '', 0, 250, 0, 1758285646),
(250, 'Nicole Williams', 'nicolewilliams@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', 'New York', 100, '42.7147601', '23.1714689', 23, '', 'Female', 1, '', '1eac0eaa8bf7c53a64c547062260f86113924994_261904607528593_349332101909269609_n.jpg', '::1', 1473365950, 1473368473, 1482627565, 1, 0, 0, 0, 0, 0, 1, 'english', '', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0, 20, 0, 0),
(316, 'Gabby DeMartino', 'gabidemartino@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', 'New York', 2950, '42.7147615', '23.1714689', 19, '', 'Female', 1, '', '2c3d5085d4972c5caa8a073ad821da8913556779_868922016574007_511438478_n.jpg', '::1', 1452539673, 1476167625, 1482627565, 1, 0, 1, 0, 0, 0, 1, 'english', 'Vlogging,Cosmetics,Food', 5, 1, 1491298220, 1475519762, 1475519762, 1475519762, 1475519762, 1491298220, 1491298220, 1491298220, 1491298220, '165', 48, 12, 0, 0),
(317, 'Aidette Cancino', 'aidettecancino@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', 'New York', 2950, '42.7147615', '23.1714689', 19, 'Couldn\'t think of anything to put here xoxo', 'Female', 1, '', '9df68c8ec1d5232300d3e4d48c4261c812328477_1034122216609060_1386835886_n.jpg', '::1', 1452539673, 1476169751, 1482627565, 1, 0, 1, 0, 0, 0, 1, 'english', 'Vlogging,Cosmetics,Food', 1, 1, 1491298220, 1475519762, 1475519762, 1475519762, 1475519762, 1491298220, 1491298220, 1491298220, 1491298220, '165', 48, 12, 0, 0),
(318, 'Sarah Lorenzo', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 22, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/1.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(319, 'Jane Antar', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 34, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/2.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(320, 'Zuhur Rizzo', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 33, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/3.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(321, 'Miranda Amari', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 25, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/4.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(322, 'Miranda Chabot', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 31, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/5.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(323, 'Yasmeen Amari', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 31, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/6.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(324, 'Haifa Castro', 'haifacastro@ymail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', 'United States', '', 10, '', '', 23, '', 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/7.png', '102.68.79.69', 1757420847, 1758017473, 1758017473, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, 1, 0),
(325, 'Giovanna Konig', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 33, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/8.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(326, 'Jane Amari', 'JaneAmari@ymail.com', '21232f297a57a5a743894a0e4a801fc3', 'United States', '', 97, '-1.2', '36.9', 34, '', 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/9.png', '102.68.79.69', 1757420847, 1757493319, 1757506120, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 316, 1, 0),
(327, 'Yasmeen Antar', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 26, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/10.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(328, 'Zuhur Saliba', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 27, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/11.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(329, 'Salwa Castro', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 20, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/12.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(330, 'Olivie Castro', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 30, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/13.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(331, 'Annette Savard', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 35, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/14.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(332, 'Olivie Antar', 'fake@fake.com', 'e10adc3949ba59abbe56e057f20f883e', 'United States', '', 10, NULL, NULL, 32, NULL, 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/15.png', '', 1757420847, NULL, 1757420847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(333, 'Mia Amari', 'MiaAmari@ymail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', 'United States', '', 0, '-1.2', '36.9', 32, '', 'Female', 4, NULL, 'https://contact.gmalinkproperties.co.ke//img/ug/female/16.png', '102.68.79.69', 1757420847, 1757489142, 1757491023, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 0, 0),
(334, 'Test', 'test@ymail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', '', '', 0, '-1.2', '36.9', 30, '', 'Male', 1, NULL, 'default_avatar.png', '102.68.79.69', 1757421576, 1757488058, 1757489015, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 0, 0),
(338, 'Testboy7@ymail.com', 'testboy7@ymail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', '', '', 100, '-1.2', '36.9', 29, NULL, 'Male', 1, NULL, 'default_avatar.png', '102.68.79.69', 1757507318, 1757507334, 1757508106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(339, 'Testboy200@gmail.com', 'testboy200@gmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', '', '', 100, '-1.2', '36.9', 30, NULL, 'Male', 1, NULL, 'default_avatar.png', '102.68.79.69', 1757508193, 1757508206, 1757509559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 334, 0, 0),
(340, 'Test33@gmail.com', 'test33@gmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', 'Kenya', 'Nairobi', 100, '-1.2', '36.9', 0, NULL, 'Male', 1, NULL, 'default_avatar.png', '102.68.79.69', 1757509588, 1757509600, 1757509672, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, 250, 0, 0),
(341, 'Test40@gmail.com', 'test40@gmail.com', 'dbb4ebea280b5b895af59abf6142e97a', 'Roysambu location', 'Kamiti Road', 100, '-1.2', '36.9', 0, 'Test', 'Male', 1, NULL, 'default_avatar.png', '102.68.79.69', 1757509702, 1757509766, 1757515781, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dating', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', 200, 20, 0, 0),
(342, 'Test4000@gmail.com', 'Test4000@gmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', NULL, NULL, 100, NULL, NULL, 35, NULL, 'Male', NULL, NULL, 'default_avatar.png', NULL, 1757509868, 1757509868, 1757509889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 316, 0, 0),
(343, 'Test5000@gmail.com', 'test5000@gmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', '', '', 0, '', '', 27, NULL, 'Male', 1, NULL, 'default_avatar.png', '102.68.79.69', 1757955474, 1757955492, 1757955546, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 0, 0),
(344, 'Test10000@gmail.com', 'Test10000@gmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', NULL, NULL, 0, NULL, NULL, 50, NULL, 'Male', NULL, NULL, 'default_avatar.png', NULL, 1757955586, 1757955586, 1757955673, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, 0, 0),
(345, 'Test2025@gmail.com', 'test2025@gmail.com', '5c18b3563f360e732928d000c1b94b99', NULL, NULL, 0, NULL, NULL, 25, NULL, 'Male', NULL, NULL, 'default_avatar.png', NULL, 1757955976, 1757955976, 1757956028, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 340, 0, 0),
(346, 'Test2026@gmail.com', 'test2026@gmail.com', '5d9c68c6c50ed3d02a2fcf54f63993b6', NULL, NULL, 0, NULL, NULL, 24, NULL, 'Male', NULL, NULL, 'default_avatar.png', NULL, 1757956059, 1757956059, 1757956082, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activation_codes`
--
ALTER TABLE `activation_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_sticker_packs`
--
ALTER TABLE `owned_sticker_packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_dislikes`
--
ALTER TABLE `profile_dislikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_likes`
--
ALTER TABLE `profile_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_views`
--
ALTER TABLE `profile_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticker_packs`
--
ALTER TABLE `sticker_packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded_photos`
--
ALTER TABLE `uploaded_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded_photo_comments`
--
ALTER TABLE `uploaded_photo_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activation_codes`
--
ALTER TABLE `activation_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blocked_users`
--
ALTER TABLE `blocked_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `owned_sticker_packs`
--
ALTER TABLE `owned_sticker_packs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile_dislikes`
--
ALTER TABLE `profile_dislikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile_likes`
--
ALTER TABLE `profile_likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `profile_views`
--
ALTER TABLE `profile_views`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stickers`
--
ALTER TABLE `stickers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sticker_packs`
--
ALTER TABLE `sticker_packs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `uploaded_photos`
--
ALTER TABLE `uploaded_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `uploaded_photo_comments`
--
ALTER TABLE `uploaded_photo_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
