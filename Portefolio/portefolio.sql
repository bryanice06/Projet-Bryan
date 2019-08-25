-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Mar 27 Mars 2018 à 08:36
-- Version du serveur: 5.5.57-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `portefolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `Manga`
--

CREATE TABLE IF NOT EXISTS `Manga` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Image1` varchar(255) NOT NULL,
  `Image2` varchar(255) NOT NULL,
  `Image3` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Contenu de la table `Manga`
--

INSERT INTO `Manga` (`Id`, `Title`, `Image1`, `Image2`, `Image3`) VALUES
(28, 'Sword Art Online', '73f4ed7393ba04bdb3e118c9fe7a4b8902e1a027b7ac8db32a0886f7180c899c.jpg', '640956.jpg', 'sword_art_online_fanart_by_aintza_k-d69ztsj.jpg'),
(29, 'Ao No Exorcist', 'ao_no_exorcist_wallpaper___rin_by_umi_no_mizu-d95fw9r.png', 'img-36107103ba.jpg', 'Ao-No-Exorcist-ao-no-exorcist-21074219-1754-1240.jpg'),
(30, 'Guilty Crown', 'f6c.png', '193980.jpg', 'GUILTY.CROWN.full.1952586.jpg'),
(31, 'Code Breaker', '4d0405028a4f73b014cb61acf47f2892.jpg', 'fc7840e7034a8a26846f03ca2e1e48c3--anime-characters-code-breaker-ogami.jpg', 'code_breaker_ogami__toki__rui__yuuki_and_heike_by_lissaaller-d5kct06.jpg'),
(32, 'Mahouka Koukou No Rettousei', 'hqdefault.jpg', '113f46a0b30bf0dfe5c7bc158fba5af0.png', 'mahouka_koukou_no_rettousei_wallpaper__hd__by_nimevolution-d7ionjd.png'),
(33, 'Fate/Stay Night: Unlimited Blade Works', '633122.png', '644423.jpg', 'maxresdefault (1).jpg'),
(34, 'Black Bullet', 'GNCA-1410.jpg', 'thumb-1920-534929.jpg', 'black_bullet___the_queens_by_asakurashinji-d7q74qd.jpg'),
(35, 'Shakugan No Shana', '283610-EiraDicra.jpg', '8046698a8bdfb244cd21108e9fe7b968--fire-element-shakugan-no-shana.jpg', 'shakugan_no_shana_wallpaper_by_vanillex33-d5wdmsf.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `Sport`
--

CREATE TABLE IF NOT EXISTS `Sport` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Image1` varchar(255) NOT NULL,
  `Image2` varchar(255) NOT NULL,
  `Image3` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `Sport`
--

INSERT INTO `Sport` (`Id`, `Title`, `Image1`, `Image2`, `Image3`) VALUES
(2, 'Football "Mon Club"', 'bg-ogc-nice-1.jpg', 'Balotelli-3.jpg', 'nice2.jpg'),
(3, 'Ski, Surf "La fous d''allos"', '6a00d8341c80d353ef019b03f907f5970d.jpg', '640x480_forfaits-de-ski-alpin-2572.jpg', 'default-val-d-allos-dad70-1.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
