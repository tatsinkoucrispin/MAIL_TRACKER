-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 03 mars 2024 à 10:20
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gbov2`
--

-- --------------------------------------------------------

--
-- Structure de la table `affecter`
--

DROP TABLE IF EXISTS `affecter`;
CREATE TABLE IF NOT EXISTS `affecter` (
  `ID_DEPARTEMENT` int DEFAULT NULL,
  `N_ARRIVEE` int DEFAULT NULL,
  KEY `ID_DEPARTEMENT` (`ID_DEPARTEMENT`),
  KEY `N_ARRIVEE` (`N_ARRIVEE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `courrier_arrivee`
--

DROP TABLE IF EXISTS `courrier_arrivee`;
CREATE TABLE IF NOT EXISTS `courrier_arrivee` (
  `N_ARRIVEE` int NOT NULL,
  `ANNEE` int DEFAULT NULL,
  `OBJET_ARRIVEE` varchar(255) DEFAULT NULL,
  `DATE_ARRIVEE` date DEFAULT NULL,
  `PIECE_JOINTE_ARRIVEE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`N_ARRIVEE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `courrier_depart_ext`
--

DROP TABLE IF EXISTS `courrier_depart_ext`;
CREATE TABLE IF NOT EXISTS `courrier_depart_ext` (
  `N_DEPART_EXT` int NOT NULL,
  `ANNEE` int DEFAULT NULL,
  `OBJET_DEPART_EXT` varchar(255) DEFAULT NULL,
  `DATE_DEPART_EXT` date DEFAULT NULL,
  `PIECE_JOINTE_DEPART_EXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`N_DEPART_EXT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `ID_DEPARTEMENT` int NOT NULL,
  `NOM_DEPARTEMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DEPARTEMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `destinataire`
--

DROP TABLE IF EXISTS `destinataire`;
CREATE TABLE IF NOT EXISTS `destinataire` (
  `ID_DES` int NOT NULL,
  `NOM_DES` varchar(255) DEFAULT NULL,
  `ADRESSE_DES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DES`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expediteur`
--

DROP TABLE IF EXISTS `expediteur`;
CREATE TABLE IF NOT EXISTS `expediteur` (
  `ID_EXP` int NOT NULL,
  `NOM_EXP` varchar(255) DEFAULT NULL,
  `ADRESSE_EXP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_EXP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `ID_PERSONNEL` int NOT NULL,
  `ID_DEPARTEMENT` int DEFAULT NULL,
  `NOM_PERSONNEL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PERSONNEL`),
  KEY `ID_DEPARTEMENT` (`ID_DEPARTEMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recevoir_interne`
--

DROP TABLE IF EXISTS `recevoir_interne`;
CREATE TABLE IF NOT EXISTS `recevoir_interne` (
  `N_DEPART_INT` int DEFAULT NULL,
  `ID_PERSONNEL` int DEFAULT NULL,
  KEY `N_DEPART_INT` (`N_DEPART_INT`),
  KEY `ID_PERSONNEL` (`ID_PERSONNEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transmettre3`
--

DROP TABLE IF EXISTS `transmettre3`;
CREATE TABLE IF NOT EXISTS `transmettre3` (
  `N_DEPART_INT` int DEFAULT NULL,
  `ID_PERSONNEL` int DEFAULT NULL,
  KEY `N_DEPART_INT` (`N_DEPART_INT`),
  KEY `ID_PERSONNEL` (`ID_PERSONNEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `IDCOMPTE` int NOT NULL,
  `NOMUTILISATEUR` varchar(255) DEFAULT NULL,
  `MOTDEPASSE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TYPECOMPTE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDCOMPTE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`IDCOMPTE`, `NOMUTILISATEUR`, `MOTDEPASSE`, `TYPECOMPTE`) VALUES
(1, 'tatsinkou', 'crispin', 'administrateur');
-- Insérer des données dans la table "departement"
INSERT INTO `departement` (`ID_DEPARTEMENT`, `NOM_DEPARTEMENT`) VALUES
(1, 'Département 1'),
(2, 'Département 2'),
(3, 'Département 3');

-- Insérer des données dans la table "personnel"
INSERT INTO `personnel` (`ID_PERSONNEL`, `ID_DEPARTEMENT`, `NOM_PERSONNEL`) VALUES
(1, 1, 'Personnel 1'),
(2, 1, 'Personnel 2'),
(3, 2, 'Personnel 3'),
(4, 2, 'Personnel 4'),
(5, 3, 'Personnel 5');

-- Insérer des données dans la table "destinataire"
INSERT INTO `destinataire` (`ID_DES`, `NOM_DES`, `ADRESSE_DES`) VALUES
(1, 'Destinataire 1', 'Adresse Destinataire 1'),
(2, 'Destinataire 2', 'Adresse Destinataire 2'),
(3, 'Destinataire 3', 'Adresse Destinataire 3');

-- Insérer des données dans la table "expediteur"
INSERT INTO `expediteur` (`ID_EXP`, `NOM_EXP`, `ADRESSE_EXP`) VALUES
(1, 'Expéditeur 1', 'Adresse Expéditeur 1'),
(2, 'Expéditeur 2', 'Adresse Expéditeur 2'),
(3, 'Expéditeur 3', 'Adresse Expéditeur 3');

-- Insérer des données dans la table "courrier_arrivee"
INSERT INTO `courrier_arrivee` (`N_ARRIVEE`, `ANNEE`, `OBJET_ARRIVEE`, `DATE_ARRIVEE`, `PIECE_JOINTE_ARRIVEE`) VALUES
(1, 2024, 'Objet Courrier Arrivée 1', '2024-02-15', 'Piece Jointe 1'),
(2, 2024, 'Objet Courrier Arrivée 2', '2024-02-16', 'Piece Jointe 2'),
(3, 2024, 'Objet Courrier Arrivée 3', '2024-02-17', 'Piece Jointe 3');

-- Insérer des données dans la table "courrier_depart_ext"
INSERT INTO `courrier_depart_ext` (`N_DEPART_EXT`, `ANNEE`, `OBJET_DEPART_EXT`, `DATE_DEPART_EXT`, `PIECE_JOINTE_DEPART_EXT`) VALUES
(1, 2024, 'Objet Courrier Départ Ext 1', '2024-02-15', 'Piece Jointe 1'),
(2, 2024, 'Objet Courrier Départ Ext 2', '2024-02-16', 'Piece Jointe 2'),
(3, 2024, 'Objet Courrier Départ Ext 3', '2024-02-17', 'Piece Jointe 3');

-- Insérer des données dans la table "courrier_depart_int"
INSERT INTO `courrier_depart_int` (`N_DEPART_INT`, `ID_DEPARTEMENT`, `ANNEE`, `OBJET_DAPART_INT`, `DATE_DEPART_INT`, `PIECE_JOINTE_DEPART_INT`) VALUES
(1, 1, 2024, 'Objet Courrier Départ Int 1', '2024-02-15', 'Piece Jointe 1'),
(2, 1, 2024, 'Objet Courrier Départ Int 2', '2024-02-16', 'Piece Jointe 2'),
(3, 2, 2024, 'Objet Courrier Départ Int 3', '2024-02-17', 'Piece Jointe 3');

-- Insérer des données dans la table "transmettre3"
INSERT INTO `transmettre3` (`N_DEPART_INT`, `ID_PERSONNEL`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insérer des données dans la table "recevoir_interne"
INSERT INTO `recevoir_interne` (`N_DEPART_INT`, `ID_PERSONNEL`) VALUES
(1, 2),
(2, 3),
(3, 1);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
