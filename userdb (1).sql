-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 14 mars 2025 à 21:39
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `userdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `stock` int NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `description`, `stock`, `image_url`) VALUES
(1, 'Things We Never Get Over', 'Lucy Score', 'A romance novel with deep character development.', 0, 'https://i.pinimg.com/236x/6c/3a/90/6c3a901b89d76ea89337a05714697adc.jpg'),
(2, 'The Silent Patient', 'Alex Michaelides', 'A psychological thriller with unexpected twists.', 3, 'https://i.pinimg.com/236x/91/e4/5c/91e45c435f636446702d987fcb6aaf9b.jpg'),
(3, 'Atomic Habits', 'James Clear', 'A book about how small habits lead to big results.', 10, 'https://i.pinimg.com/736x/20/d1/a6/20d1a65703a999cd0b39f87d7bb41c1d.jpg'),
(4, 'Psychology of Money', 'Morgan Housel', 'Exploring the behavioral aspects of personal finance.', 14, 'https://i.pinimg.com/474x/24/d1/72/24d172e10d06b80a0bec4134d6d4c1f7.jpg'),
(5, 'Women Who Think Too Much', 'Susan Nolen-Hoeksema', 'An empowering guide for women dealing with overthinking.', 2, 'https://i.pinimg.com/474x/7f/d0/f8/7fd0f86d7819268ad522d1e02a6aa860.jpg'),
(6, 'Good Vibes, Good Life', 'Vex King', 'A motivational book about self-love and positive thinking.', 10, 'https://i.pinimg.com/474x/b4/3c/ac/b43cac0d8cb8f71b05804d600851254f.jpg'),
(7, 'Focus On What Matters', 'Greg McKeown', 'A guide to finding focus in a world full of distractions.', 7, 'https://i.pinimg.com/474x/c5/ba/68/c5ba6877e37afc66e8b988e647ff2cc3.jpg'),
(8, 'The Art Of Laziness', 'Leo Babauta', 'A light-hearted book on embracing rest and relaxation.', 6, 'https://i.pinimg.com/736x/b0/19/ec/b019eca3d1d22a3ce2d2526cd5a5804c.jpg'),
(9, 'Zero To One', 'Peter Thiel', 'A business book about innovation and building the future.', 4, 'https://i.pinimg.com/474x/f8/87/11/f88711344aee1bb2011b7d4503297bf2.jpg'),
(10, 'Surrounded By Idiots', 'Thomas Erikson', 'Understanding different personality types and improving communication.', 9, 'https://i.pinimg.com/474x/e1/dd/98/e1dd98601bdbf8e04edceee30de03df5.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `duration` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`user_id`, `book_id`, `reservation_date`, `status`, `duration`, `id`) VALUES
(1, 1, '2025-03-01 21:43:18', 'confirmed', NULL, 1),
(1, 1, '2025-03-01 22:02:32', 'pending', NULL, 5),
(1, 1, '2025-03-01 22:04:26', 'pending', NULL, 6),
(1, 10, '2025-03-02 10:03:43', 'pending', NULL, 19),
(1, 5, '2025-03-02 10:22:31', 'pending', NULL, 20),
(2, 3, '2025-03-06 04:06:03', 'pending', 2, 22),
(2, 2, '2025-03-07 13:19:54', 'pending', 2, 23),
(2, 2, '2025-03-07 13:20:01', 'pending', 2, 24),
(2, 2, '2025-03-07 13:56:44', 'pending', 2, 25),
(2, 5, '2025-03-07 13:56:58', 'pending', 1, 26),
(2, 4, '2025-03-07 13:57:06', 'pending', 2, 27),
(2, 8, '2025-03-07 13:57:54', 'pending', 1, 28),
(2, 2, '2025-03-07 13:58:58', 'pending', 2, 29),
(2, 10, '2025-03-07 13:59:06', 'pending', 1, 30),
(1, 2, '2025-03-10 11:52:21', 'pending', 8, 31);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telephone` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `telephone`, `address`) VALUES
(1, 'user1', 'password123', 'user1@example.com', '0612345678', '123, Rue des Lilas, Paris'),
(2, 'user2', 'securepass456', 'user2@example.com', '0712345678', '456, Avenue du Soleil, Lyon'),
(3, 'user3', 'mypassword789', 'user3@example.com', '0812345678', '789, Boulevard des Champs, Marseille');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
