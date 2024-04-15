-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 mars 2024 à 18:59
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

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
  `ID_DEPARTEMENT` int(11) DEFAULT NULL,
  `N_ARRIVEE` int(11) DEFAULT NULL,
  KEY `ID_DEPARTEMENT` (`ID_DEPARTEMENT`),
  KEY `N_ARRIVEE` (`N_ARRIVEE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affecter`
--

INSERT INTO `affecter` (`ID_DEPARTEMENT`, `N_ARRIVEE`) VALUES
(1, 4),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `courrier_arrivee`
--

DROP TABLE IF EXISTS `courrier_arrivee`;
CREATE TABLE IF NOT EXISTS `courrier_arrivee` (
  `N_ARRIVEE` int(11) NOT NULL,
  `ANNEE` int(11) DEFAULT NULL,
  `OBJET_ARRIVEE` varchar(255) DEFAULT NULL,
  `DATE_ARRIVEE` date DEFAULT NULL,
  `PIECE_JOINTE_ARRIVEE` varchar(255) DEFAULT NULL,
  `REPONSE` text,
  `ID_EXP` int(11) NOT NULL,
  PRIMARY KEY (`N_ARRIVEE`),
  KEY `fk_expediteur_id_exp` (`ID_EXP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courrier_arrivee`
--

INSERT INTO `courrier_arrivee` (`N_ARRIVEE`, `ANNEE`, `OBJET_ARRIVEE`, `DATE_ARRIVEE`, `PIECE_JOINTE_ARRIVEE`, `REPONSE`, `ID_EXP`) VALUES
(1, 2024, 'Réception d un colis', '2024-02-15', 'Facture.pdf', 'En cours de traitement', 0),
(2, 2024, 'Demande de devis', '2024-02-16', 'Contrat.pdf', 'En attente', 0),
(3, 2024, 'Confirmation de rendez-vous', '2024-02-17', 'Planning.pdf', 'Traité', 0),
(4, 2024, 'cahier charge', '2024-03-14', 'TANKO SIME Leïla Kaltoumi CV.pdf', 'Avec Reponse', 4),
(5, 2024, 'Demande de stage professionnel', '2024-03-10', 'Campus France CSI et Esperts.xlsx', 'Avec Reponse', 2);

-- --------------------------------------------------------

--
-- Structure de la table `courrier_depart_ext`
--

DROP TABLE IF EXISTS `courrier_depart_ext`;
CREATE TABLE IF NOT EXISTS `courrier_depart_ext` (
  `N_DEPART_EXT` int(11) NOT NULL AUTO_INCREMENT,
  `ANNEE` int(11) DEFAULT NULL,
  `OBJET_DEPART_EXT` varchar(255) DEFAULT NULL,
  `DATE_DEPART_EXT` date DEFAULT NULL,
  `PIECE_JOINTE_DEPART_EXT` varchar(255) DEFAULT NULL,
  `REPONSE` text,
  `ID_DEPARTEMENT` int(11) NOT NULL,
  `ID_DES` int(11) NOT NULL,
  PRIMARY KEY (`N_DEPART_EXT`),
  KEY `fk_departement_id_departement` (`ID_DEPARTEMENT`),
  KEY `fk_destinataire_id_des` (`ID_DES`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courrier_depart_ext`
--

INSERT INTO `courrier_depart_ext` (`N_DEPART_EXT`, `ANNEE`, `OBJET_DEPART_EXT`, `DATE_DEPART_EXT`, `PIECE_JOINTE_DEPART_EXT`, `REPONSE`, `ID_DEPARTEMENT`, `ID_DES`) VALUES
(1, 2024, 'Reponse à la demande d\'emploi', '2024-03-09', 'Campus France CSI et Esperts.xlsx', 'Oui', 2, 1),
(2, 2024, 'Réponse à la demande de stage', '2024-03-10', 'ges_stock.sql', 'Non', 3, 2),
(3, 2024, 'Réponse à demande stage professionnel', '2023-10-19', 'manifest.mf', 'Oui', 1, 1),
(5, 2024, 'Réponse a la demande d\'aide de l\'orphelinat', '2024-03-09', 'build.xml', 'Oui', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `courrier_depart_int`
--

DROP TABLE IF EXISTS `courrier_depart_int`;
CREATE TABLE IF NOT EXISTS `courrier_depart_int` (
  `N_DEPART_INT` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DEPARTEMENT` int(11) DEFAULT NULL,
  `ANNEE` int(11) DEFAULT NULL,
  `OBJET_DAPART_INT` varchar(255) DEFAULT NULL,
  `DATE_DEPART_INT` date DEFAULT NULL,
  `PIECE_JOINTE_DEPART_INT` varchar(255) DEFAULT NULL,
  `REPONSE` text,
  PRIMARY KEY (`N_DEPART_INT`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courrier_depart_int`
--

INSERT INTO `courrier_depart_int` (`N_DEPART_INT`, `ID_DEPARTEMENT`, `ANNEE`, `OBJET_DAPART_INT`, `DATE_DEPART_INT`, `PIECE_JOINTE_DEPART_INT`, `REPONSE`) VALUES
(1, 1, 2024, 'Demande de congé', '2024-02-15', 'Formulaire.pdf', 'En attente'),
(2, 1, 2024, 'Rapport de réunion', '2024-02-16', 'Notes.pdf', 'Traité'),
(3, 2, 2024, 'Plan marketing', '2024-02-17', 'Présentation.pdf', 'En cours de traitement'),
(4, 2, 2024, 'demande de congés', '2024-03-15', 'Bdcollege.SQL', 'Non');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `ID_DEPARTEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_DEPARTEMENT` varchar(255) DEFAULT NULL,
  `RESPONSABLE` text,
  PRIMARY KEY (`ID_DEPARTEMENT`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`ID_DEPARTEMENT`, `NOM_DEPARTEMENT`, `RESPONSABLE`) VALUES
(1, 'Ressources Humaines', 'John Doe'),
(2, 'Marketing', 'Jane Smith'),
(3, 'Finance', 'Alice Johnson'),
(4, 'Maintenance Informatique', 'Njaha Nathan');

-- --------------------------------------------------------

--
-- Structure de la table `destinataire`
--

DROP TABLE IF EXISTS `destinataire`;
CREATE TABLE IF NOT EXISTS `destinataire` (
  `ID_DES` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_DES` varchar(255) DEFAULT NULL,
  `ADRESSE_DES` varchar(255) DEFAULT NULL,
  `TEL_DES` text,
  `FAX_DES` text,
  PRIMARY KEY (`ID_DES`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `destinataire`
--

INSERT INTO `destinataire` (`ID_DES`, `NOM_DES`, `ADRESSE_DES`, `TEL_DES`, `FAX_DES`) VALUES
(1, 'Mairie de Ville 1', '1 Rue de la Mairie, 75001 Ville 1', '01 23 45 67 89', '01 23 45 67 88'),
(2, 'Entreprise A', '123 Rue de l Entreprise, 75002 Ville 2', '01 23 45 67 90', '01 23 45 67 91'),
(3, 'Organisation B', '456 Avenue de l Organisation, 75003 Ville 3', '01 23 45 67 92', '01 23 45 67 93'),
(4, 'Entreprise A', 'Douala bonamoussadi', '65544823', '654785249'),
(5, 'Entreprise A', 'Douala bonamoussadi', '65544823', '654785249'),
(6, 'Entreprise A', 'Douala bonamoussadi', '65544823', '654785249'),
(7, 'Organisation B', '456 Avenue de l Organisation, 7500 Ville 3', '0123456792', '01236793'),
(8, 'Organisation B', '456 Avenue de l Organisation, 7500 Ville 3', '0123456792', '01236793'),
(9, 'Entreprise A', 'Douala bonamoussadi', '65544823', '654785249'),
(10, 'Entreprise A', 'Douala bonamoussadi', '65544823', '654785249'),
(11, 'Mairie de Ville 1', '1 Rue de la Mairie, 75002 Ville 2', '0123456789', '01236788'),
(12, 'Entreprise A', 'Douala bonamoussadi', '65544823', '654785249'),
(13, 'Mairie de Ville 1', 'Douala bonamoussadi', '65544823', '654785249'),
(14, 'Mairie de Ville 1', '1 Rue de la Mairie, 75001 Ville 1', '0123456789', '0123456788'),
(15, 'Mairie de Ville 1', '1 Rue de la mairie, 75001 Ville 1', '0123456789', '0123456788');

-- --------------------------------------------------------

--
-- Structure de la table `expediteur`
--

DROP TABLE IF EXISTS `expediteur`;
CREATE TABLE IF NOT EXISTS `expediteur` (
  `ID_EXP` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_EXP` varchar(255) DEFAULT NULL,
  `ADRESSE_EXP` varchar(255) DEFAULT NULL,
  `TEL_EXP` text,
  `FAX_EXP` text,
  PRIMARY KEY (`ID_EXP`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `expediteur`
--

INSERT INTO `expediteur` (`ID_EXP`, `NOM_EXP`, `ADRESSE_EXP`, `TEL_EXP`, `FAX_EXP`) VALUES
(1, 'Société XYZ', '789 Boulevard de la Société, 75004 Ville 4', '01 23 45 67 94', '01 23 45 67 95'),
(2, 'Association C', '101 Rue de l Association, 75005 Ville 5', '01 23 45 67 96', '01 23 45 67 97'),
(3, 'Particulier D', '111 Avenue du Particulier, 75006 Ville 6', '01 23 45 67 98', '01 23 45 67 99'),
(4, 'Djouda Patric', 'Douala bonamoussadi', '515515555455155', '3655478'),
(17, 'Association C', '101 Rue de l Association, 75005 Ville 5', '01 23 45 67 96', '01 23 45 67 97'),
(16, 'Djouda Patric', 'Douala bonamoussadi', '515515555455155', '3655478'),
(15, 'Djouda Patric', 'Douala bonamoussadi', '515515555455155', '3655478'),
(14, 'Djouda Patric', 'Douala bonamoussadi', '515515555455155', '3655478'),
(13, 'Djouda Patric', 'Douala bonamoussadi', '515515555455155', '3655478'),
(12, 'Djouda Patric', 'Douala bonamoussadi', '515515555455155', '3655478');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `ID_PERSONNEL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DEPARTEMENT` int(11) DEFAULT NULL,
  `NOM_PERSONNEL` varchar(255) DEFAULT NULL,
  `ADRESSE_PERSONNEL` text,
  `TEL_PERSONNEL` text,
  `NOM_DEPARTEMENT` text,
  PRIMARY KEY (`ID_PERSONNEL`),
  KEY `ID_DEPARTEMENT` (`ID_DEPARTEMENT`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`ID_PERSONNEL`, `ID_DEPARTEMENT`, `NOM_PERSONNEL`, `ADRESSE_PERSONNEL`, `TEL_PERSONNEL`, `NOM_DEPARTEMENT`) VALUES
(1, 1, 'Jean Dupont', '2 Rue Jean Dupont, 75007 Ville 7', '01 23 45 67 00', 'Département Administratif'),
(2, 1, 'Marie Martin', '3 Rue Marie Martin, 75008 Ville 8', '01 23 45 67 01', 'Département Administratif'),
(3, 2, 'Paul Dubois', '4 Rue Paul Dubois, 75009 Ville 9', '01 23 45 67 02', 'Département Technique'),
(4, 2, 'Sophie Durand', '5 Rue Sophie Durand, 75010 Ville 10', '01 23 45 67 03', 'Département Technique'),
(5, 3, 'Pierre Moreau', '6 Rue Pierre Moreau, 75011 Ville 11', '01 23 45 67 04', 'Département Commercial'),
(6, 3, 'Noupa', 'Sorelle', '699332458', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `recevoir_interne`
--

DROP TABLE IF EXISTS `recevoir_interne`;
CREATE TABLE IF NOT EXISTS `recevoir_interne` (
  `N_DEPART_INT` int(11) DEFAULT NULL,
  `ID_PERSONNEL` int(11) DEFAULT NULL,
  KEY `N_DEPART_INT` (`N_DEPART_INT`),
  KEY `ID_PERSONNEL` (`ID_PERSONNEL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recevoir_interne`
--

INSERT INTO `recevoir_interne` (`N_DEPART_INT`, `ID_PERSONNEL`) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `transmettre`
--

DROP TABLE IF EXISTS `transmettre`;
CREATE TABLE IF NOT EXISTS `transmettre` (
  `ID_PERSONNEL` int(11) NOT NULL,
  `N_ARRIVEE` int(11) NOT NULL,
  PRIMARY KEY (`ID_PERSONNEL`,`N_ARRIVEE`),
  KEY `fk_transmettre_courrier_arrivee` (`N_ARRIVEE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transmettre`
--

INSERT INTO `transmettre` (`ID_PERSONNEL`, `N_ARRIVEE`) VALUES
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `transmettre3`
--

DROP TABLE IF EXISTS `transmettre3`;
CREATE TABLE IF NOT EXISTS `transmettre3` (
  `N_DEPART_INT` int(11) DEFAULT NULL,
  `ID_PERSONNEL` int(11) DEFAULT NULL,
  `N_DEPART_EXT` int(11) NOT NULL,
  KEY `N_DEPART_INT` (`N_DEPART_INT`),
  KEY `ID_PERSONNEL` (`ID_PERSONNEL`),
  KEY `fk_n_depart_ext` (`N_DEPART_EXT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transmettre3`
--

INSERT INTO `transmettre3` (`N_DEPART_INT`, `ID_PERSONNEL`, `N_DEPART_EXT`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 3, 0),
(NULL, NULL, 5),
(NULL, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `IDCOMPTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMUTILISATEUR` varchar(255) DEFAULT NULL,
  `MOTDEPASSE` varchar(60) DEFAULT NULL,
  `TYPECOMPTE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDCOMPTE`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`IDCOMPTE`, `NOMUTILISATEUR`, `MOTDEPASSE`, `TYPECOMPTE`) VALUES
(1, 'tatsinkou', 'crispin', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
