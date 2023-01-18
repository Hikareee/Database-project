-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2023 at 09:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booths`
--

CREATE TABLE `booths` (
  `id` int(10) NOT NULL,
  `booth_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booths`
--

INSERT INTO `booths` (`id`, `booth_name`, `email`, `description`) VALUES
(1, 'FigurStore', 'boothowner1@gmail.com', 'Cheap high quality figurines store '),
(2, 'Kyoid ', 'HanselFaren21@gmail.com', 'Anime figures and merch sellers '),
(3, 'SumiShopu', 'Sumishopu@gmail.com', 'Anime hobby store \r\n'),
(4, 'IsekaiShirts ', 'isekaishirts@yahoo.co.id ', 'High quality anime shirts store that also sells keychains and totebags'),
(5, 'Pins and figs', 'PinsNFigs', 'Store selling anime figures and pins');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) NOT NULL,
  `type_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('open','closed') DEFAULT NULL,
  `address` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `type_id`, `name`, `price`, `description`, `date`, `status`, `address`) VALUES
(1, 1, 'Animeweebfestival', 25000, 'Japanese cultural event ', '2023-01-14 09:00:00', 'open', 'Somewhere over the rainbow \r\n'),
(2, 1, 'AniOne', 50000, 'Jakarta Annual anime lovers gathering, with cos walks, cos talks, and selling booths', '2023-01-14 09:00:00', 'open', 'Pondok Indah Mall');

-- --------------------------------------------------------

--
-- Table structure for table `event_booths`
--

CREATE TABLE `event_booths` (
  `id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `booth_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_booths`
--

INSERT INTO `event_booths` (`id`, `event_id`, `booth_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 1, 4),
(5, 1, 4),
(6, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `event_sponsors`
--

CREATE TABLE `event_sponsors` (
  `id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `sponsor_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_sponsors`
--

INSERT INTO `event_sponsors` (`id`, `event_id`, `sponsor_id`) VALUES
(1, 1, 4),
(2, 1, 3),
(3, 2, 1),
(4, 2, 2),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(10) NOT NULL,
  `type` enum('online','offline') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `type`) VALUES
(1, 'online'),
(2, 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `user_id`, `name`, `email`, `phone`) VALUES
(1, 1, 'George Washed', 'GeorgeWashedUSA@gmail.com', '0812223334455'),
(2, 2, 'Margaret ', 'maragarara@yahoo.co.id', '081871828'),
(4, 8, 'Dumbledore ', 'grandwizzard123@gmail.com', '08122776345');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `rundowns`
--

CREATE TABLE `rundowns` (
  `id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rundowns`
--

INSERT INTO `rundowns` (`id`, `event_id`, `start`, `end`, `title`, `location`, `description`) VALUES
(1, 1, '13:00:00', '15:00:00', 'Costalk', 'Center event stage ', 'Costalk event that will teach people how to cosplay and extra acting tips');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`id`, `name`, `description`) VALUES
(1, 'Crunchyroll', 'Anime streaming services'),
(2, 'Totally a sponsor', 'Sells merch for weebs'),
(3, 'Dancow', 'Powdered milk empire '),
(4, 'Tehpoci', 'Tea seller'),
(5, 'KopiKelupaan', 'Premium coffee seller');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `book_code` varchar(255) DEFAULT NULL,
  `participant_id` int(10) DEFAULT NULL,
  `ticket_type` enum('normal','VIP','VIP+') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `event_id`, `book_code`, `participant_id`, `ticket_type`) VALUES
(1, 1, '13489283', 1, 'VIP+'),
(2, 2, '122345592929', 2, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `role_id` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `phone`, `email`, `username`, `password`) VALUES
(1, 1, 'Administrator', '081234567890', 'adminemail123@gmail.com', 'admin', '0192023a7bbd73250516f069df18b500'),
(2, 2, 'Margaret', '081871828', 'maragarara@yahoo.co.id', 'margaret', '123mgret'),
(3, 2, 'Porter', '081133485399', 'porterJR@gmail.com', 'Porter', 'Pororoport123'),
(8, 2, 'Dumbledore ', '08122776345', 'grandwizzard123@gmail.com', 'Dumbledore', 'avadakedavra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booths`
--
ALTER TABLE `booths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `event_booths`
--
ALTER TABLE `event_booths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `booth_id` (`booth_id`);

--
-- Indexes for table `event_sponsors`
--
ALTER TABLE `event_sponsors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `sponsor_id` (`sponsor_id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rundowns`
--
ALTER TABLE `rundowns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_ibfk_1` (`event_id`),
  ADD KEY `ticket_ibfk_2` (`participant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booths`
--
ALTER TABLE `booths`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event_booths`
--
ALTER TABLE `event_booths`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_sponsors`
--
ALTER TABLE `event_sponsors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rundowns`
--
ALTER TABLE `rundowns`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `event_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_booths`
--
ALTER TABLE `event_booths`
  ADD CONSTRAINT `event_booths_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_booths_ibfk_2` FOREIGN KEY (`booth_id`) REFERENCES `booths` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_sponsors`
--
ALTER TABLE `event_sponsors`
  ADD CONSTRAINT `event_sponsors_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_sponsors_ibfk_2` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rundowns`
--
ALTER TABLE `rundowns`
  ADD CONSTRAINT `rundowns_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
