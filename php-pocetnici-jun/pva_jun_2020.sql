-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 05:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pva_jun_2020`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `id` int(3) UNSIGNED NOT NULL,
  `nazivKategorije` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `nazivKategorije`) VALUES
(1, 'Svet'),
(2, 'Kultura'),
(3, 'Sport'),
(4, 'Zabava');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `id` int(3) UNSIGNED NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lozinka` varchar(256) NOT NULL,
  `status` enum('Administrator','Urednik','Pretplatnik') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `email`, `lozinka`, `status`) VALUES
(1, 'Пера', 'Перић', 'ppera', 'ppera', 'Administrator'),
(2, 'Laza', 'Lazić', 'llaza', 'llaza', 'Urednik'),
(3, 'Običan', 'Smrtnik', 'korime', 'lozinka', 'Pretplatnik');

-- --------------------------------------------------------

--
-- Table structure for table `vesti`
--

CREATE TABLE `vesti` (
  `id` int(3) UNSIGNED NOT NULL,
  `naslov` varchar(200) NOT NULL,
  `tekst` text NOT NULL,
  `idKorisnika` int(3) NOT NULL,
  `idKategorije` int(3) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `dislikes` int(11) NOT NULL DEFAULT 0,
  `brojPregleda` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vesti`
--

INSERT INTO `vesti` (`id`, `naslov`, `tekst`, `idKorisnika`, `idKategorije`, `vreme`, `likes`, `dislikes`, `brojPregleda`) VALUES
(1, 'Fotografija studentkinje iz Srbije uvršćena u 20 najboljih radova', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\n\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 1, 1, '2020-05-29 11:47:41', 0, 0, 0),
(2, 'Enigma zvana Isijavanje: Četiri decenije od premijere čuvenog Kjubrikovog filma', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 2, 2, '2020-05-29 11:47:41', 0, 0, 0),
(3, 'Bend Obojeni program u godini jubileja: Prvi album veliki kao kosmos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 1, 3, '2020-05-29 12:47:41', 0, 0, 0),
(4, 'INTERVJU Goran Marković: Da li ćemo ikada uspeti da živimo mirno?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 2, 4, '2020-05-29 13:47:41', 0, 0, 0),
(5, 'Jela Cello: Odbila sam ponudu iz Holivuda HOĆU DA STVARAM MUZIKU KOJU OSEĆAM', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 1, 2, '2020-05-29 13:49:41', 0, 0, 0),
(6, 'Gorčin Stojanović: Potpukovniku nema ko da napiše...', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 2, 2, '2020-05-29 14:47:41', 0, 0, 0),
(7, 'Republika preuzela Muzej Nikole Tesle, uskoro bi mogao da bude premešten na NOVU LOKACIJU', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 1, 3, '2020-05-29 14:50:41', 5, 1, 2),
(8, 'Otvorena izložba autoportreta Jovane Dragić u Singidunumu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus non enim praesent elementum facilisis. Fringilla est ullamcorper eget nulla facilisi etiam. Etiam sit amet nisl purus in mollis. Egestas integer eget aliquet nibh praesent tristique magna. Vitae elementum curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Ultrices eros in cursus turpis massa tincidunt dui. Donec et odio pellentesque diam. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id.\r\n\r\nCommodo quis imperdiet massa tincidunt nunc pulvinar sapien et. Ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Neque viverra justo nec ultrices dui sapien eget mi. Etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. Interdum consectetur libero id faucibus. Arcu non odio euismod lacinia at quis risus sed. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Sit amet nisl purus in mollis nunc sed id. Scelerisque fermentum dui faucibus in. Dui faucibus in ornare quam viverra orci sagittis eu volutpat. Auctor urna nunc id cursus metus aliquam. Cursus sit amet dictum sit amet. Risus quis varius quam quisque id diam vel quam.', 2, 2, '2020-05-29 13:55:41', 15, 10, 14);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwvesti`
-- (See below for the actual view)
--
CREATE TABLE `vwvesti` (
`id` int(3) unsigned
,`naslov` varchar(200)
,`tekst` text
,`idKorisnika` int(3)
,`idKategorije` int(3)
,`vreme` timestamp
,`likes` int(11)
,`dislikes` int(11)
,`brojPregleda` int(3)
,`ime` varchar(50)
,`prezime` varchar(100)
,`nazivKategorije` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `vwvesti`
--
DROP TABLE IF EXISTS `vwvesti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwvesti`  AS  select `vesti`.`id` AS `id`,`vesti`.`naslov` AS `naslov`,`vesti`.`tekst` AS `tekst`,`vesti`.`idKorisnika` AS `idKorisnika`,`vesti`.`idKategorije` AS `idKategorije`,`vesti`.`vreme` AS `vreme`,`vesti`.`likes` AS `likes`,`vesti`.`dislikes` AS `dislikes`,`vesti`.`brojPregleda` AS `brojPregleda`,`korisnici`.`ime` AS `ime`,`korisnici`.`prezime` AS `prezime`,`kategorije`.`nazivKategorije` AS `nazivKategorije` from ((`vesti` join `korisnici` on(`vesti`.`idKorisnika` = `korisnici`.`id`)) join `kategorije` on(`vesti`.`idKategorije` = `kategorije`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vesti`
--
ALTER TABLE `vesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorije`
--
ALTER TABLE `kategorije`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vesti`
--
ALTER TABLE `vesti`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
