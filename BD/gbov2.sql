-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 05 mars 2024 à 17:51
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
  `REPONSE` text,
  PRIMARY KEY (`N_ARRIVEE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `courrier_arrivee`
--

INSERT INTO `courrier_arrivee` (`N_ARRIVEE`, `ANNEE`, `OBJET_ARRIVEE`, `DATE_ARRIVEE`, `PIECE_JOINTE_ARRIVEE`, `REPONSE`) VALUES
(1, 2024, 'Réception d un colis', '2024-02-15', 'Facture.pdf', 'En cours de traitement'),
(2, 2024, 'Demande de devis', '2024-02-16', 'Contrat.pdf', 'En attente'),
(3, 2024, 'Confirmation de rendez-vous', '2024-02-17', 'Planning.pdf', 'Traité');

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
  `REPONSE` text,
  PRIMARY KEY (`N_DEPART_EXT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `courrier_depart_ext`
--

INSERT INTO `courrier_depart_ext` (`N_DEPART_EXT`, `ANNEE`, `OBJET_DEPART_EXT`, `DATE_DEPART_EXT`, `PIECE_JOINTE_DEPART_EXT`, `REPONSE`) VALUES
(1, 2024, 'Demande de partenariat', '2024-02-15', 'Proposition.pdf', 'En cours de traitement'),
(2, 2024, 'Réponse à une offre', '2024-02-16', 'Contrat.pdf', 'Accepté'),
(3, 2024, 'Invitation à un événement', '2024-02-17', 'Programme.pdf', 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `courrier_depart_int`
--

DROP TABLE IF EXISTS `courrier_depart_int`;
CREATE TABLE IF NOT EXISTS `courrier_depart_int` (
  `N_DEPART_INT` int NOT NULL,
  `ID_DEPARTEMENT` int DEFAULT NULL,
  `ANNEE` int DEFAULT NULL,
  `OBJET_DAPART_INT` varchar(255) DEFAULT NULL,
  `DATE_DEPART_INT` date DEFAULT NULL,
  `PIECE_JOINTE_DEPART_INT` varchar(255) DEFAULT NULL,
  `REPONSE` text,
  PRIMARY KEY (`N_DEPART_INT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `courrier_depart_int`
--

INSERT INTO `courrier_depart_int` (`N_DEPART_INT`, `ID_DEPARTEMENT`, `ANNEE`, `OBJET_DAPART_INT`, `DATE_DEPART_INT`, `PIECE_JOINTE_DEPART_INT`, `REPONSE`) VALUES
(1, 1, 2024, 'Demande de congé', '2024-02-15', 'Formulaire.pdf', 'En attente'),
(2, 1, 2024, 'Rapport de réunion', '2024-02-16', 'Notes.pdf', 'Traité'),
(3, 2, 2024, 'Plan marketing', '2024-02-17', 'Présentation.pdf', 'En cours de traitement');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `ID_DEPARTEMENT` int NOT NULL,
  `NOM_DEPARTEMENT` varchar(255) DEFAULT NULL,
  `RESPONSABLE` text,
  PRIMARY KEY (`ID_DEPARTEMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`ID_DEPARTEMENT`, `NOM_DEPARTEMENT`, `RESPONSABLE`) VALUES
(1, 'Ressources Humaines', 'John Doe'),
(2, 'Marketing', 'Jane Smith'),
(3, 'Finance', 'Alice Johnson');
-- --------------------------------------------------------

--
-- Structure de la table `destinataire`
--

DROP TABLE IF EXISTS `destinataire`;
CREATE TABLE IF NOT EXISTS `destinataire` (
  `ID_DES` int NOT NULL,
  `NOM_DES` varchar(255) DEFAULT NULL,
  `ADRESSE_DES` varchar(255) DEFAULT NULL,
  `TEL_DES` text,
  `FAX_DES` text,
  PRIMARY KEY (`ID_DES`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `destinataire`
--

INSERT INTO `destinataire` (`ID_DES`, `NOM_DES`, `ADRESSE_DES`, `TEL_DES`, `FAX_DES`) VALUES
(1, 'Mairie de Ville 1', '1 Rue de la Mairie, 75001 Ville 1', '01 23 45 67 89', '01 23 45 67 88'),
(2, 'Entreprise A', '123 Rue de l Entreprise, 75002 Ville 2', '01 23 45 67 90', '01 23 45 67 91'),
(3, 'Organisation B', '456 Avenue de l Organisation, 75003 Ville 3', '01 23 45 67 92', '01 23 45 67 93');


-- --------------------------------------------------------

--
-- Structure de la table `expediteur`
--

DROP TABLE IF EXISTS `expediteur`;
CREATE TABLE IF NOT EXISTS `expediteur` (
  `ID_EXP` int NOT NULL,
  `NOM_EXP` varchar(255) DEFAULT NULL,
  `ADRESSE_EXP` varchar(255) DEFAULT NULL,
  `TEL_EXP` text,
  `FAX_EXP` text,
  PRIMARY KEY (`ID_EXP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `expediteur`
--

INSERT INTO `expediteur` (`ID_EXP`, `NOM_EXP`, `ADRESSE_EXP`, `TEL_EXP`, `FAX_EXP`) VALUES
(1, 'Société XYZ', '789 Boulevard de la Société, 75004 Ville 4', '01 23 45 67 94', '01 23 45 67 95'),
(2, 'Association C', '101 Rue de l Association, 75005 Ville 5', '01 23 45 67 96', '01 23 45 67 97'),
(3, 'Particulier D', '111 Avenue du Particulier, 75006 Ville 6', '01 23 45 67 98', '01 23 45 67 99');


-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `ID_PERSONNEL` int NOT NULL,
  `ID_DEPARTEMENT` int DEFAULT NULL,
  `NOM_PERSONNEL` varchar(255) DEFAULT NULL,
  `ADRESSE_PERSONNEL` text,
  `TEL_PERSONNEL` text,
  `NOM_DEPARTEMENT` text,
  PRIMARY KEY (`ID_PERSONNEL`),
  KEY `ID_DEPARTEMENT` (`ID_DEPARTEMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`ID_PERSONNEL`, `ID_DEPARTEMENT`, `NOM_PERSONNEL`, `ADRESSE_PERSONNEL`, `TEL_PERSONNEL`, `NOM_DEPARTEMENT`) VALUES
(1, 1, 'Jean Dupont', '2 Rue Jean Dupont, 75007 Ville 7', '01 23 45 67 00', 'Département Administratif'),
(2, 1, 'Marie Martin', '3 Rue Marie Martin, 75008 Ville 8', '01 23 45 67 01', 'Département Administratif'),
(3, 2, 'Paul Dubois', '4 Rue Paul Dubois, 75009 Ville 9', '01 23 45 67 02', 'Département Technique'),
(4, 2, 'Sophie Durand', '5 Rue Sophie Durand, 75010 Ville 10', '01 23 45 67 03', 'Département Technique'),
(5, 3, 'Pierre Moreau', '6 Rue Pierre Moreau, 75011 Ville 11', '01 23 45 67 04', 'Département Commercial');


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

--
-- Déchargement des données de la table `recevoir_interne`
--

INSERT INTO `recevoir_interne` (`N_DEPART_INT`, `ID_PERSONNEL`) VALUES
(1, 2),
(2, 3),
(3, 1);

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

--
-- Déchargement des données de la table `transmettre3`
--

INSERT INTO `transmettre3` (`N_DEPART_INT`, `ID_PERSONNEL`) VALUES
(1, 1),
(2, 2),
(3, 3);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
