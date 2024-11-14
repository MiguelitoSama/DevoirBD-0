-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 14 nov. 2024 à 01:31
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centreformation`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
CREATE TABLE IF NOT EXISTS `appartient` (
  `Specialite_codeSpec` int NOT NULL,
  `Formation_codeForm` int NOT NULL,
  PRIMARY KEY (`Specialite_codeSpec`,`Formation_codeForm`),
  KEY `fk_Specialite_has_Formation_Formation1_idx` (`Formation_codeForm`),
  KEY `fk_Specialite_has_Formation_Specialite1_idx` (`Specialite_codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `est inscrit`
--

DROP TABLE IF EXISTS `est inscrit`;
CREATE TABLE IF NOT EXISTS `est inscrit` (
  `Etudiant_NumCINEtu` int NOT NULL,
  `Session_codeSess` int NOT NULL,
  `typeCours` varchar(45) NOT NULL,
  PRIMARY KEY (`Etudiant_NumCINEtu`,`Session_codeSess`),
  KEY `fk_Etudiant_has_Session_Session1_idx` (`Session_codeSess`),
  KEY `fk_Etudiant_has_Session_Etudiant_idx` (`Etudiant_NumCINEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `NumCINEtu` int NOT NULL,
  `NomEtu` varchar(45) NOT NULL,
  `prenomEtu` varchar(45) NOT NULL,
  `adresseEtu` varchar(45) NOT NULL,
  `villeEtu` varchar(45) NOT NULL,
  `niveauEtu` int NOT NULL,
  PRIMARY KEY (`NumCINEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `codeForm` int NOT NULL,
  `titreForm` varchar(45) NOT NULL,
  `dureeForm` int NOT NULL,
  `prixForm` int NOT NULL,
  PRIMARY KEY (`codeForm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `codeSess` int NOT NULL,
  `nomSess` varchar(45) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `Formation_codeForm` int NOT NULL,
  PRIMARY KEY (`codeSess`),
  KEY `fk_Session_Formation1_idx` (`Formation_codeForm`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `codeSpec` int NOT NULL,
  `nomSpec` varchar(45) NOT NULL,
  `descSpec` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `fk_Specialite_has_Formation_Formation1` FOREIGN KEY (`Formation_codeForm`) REFERENCES `formation` (`codeForm`),
  ADD CONSTRAINT `fk_Specialite_has_Formation_Specialite1` FOREIGN KEY (`Specialite_codeSpec`) REFERENCES `specialite` (`codeSpec`);

--
-- Contraintes pour la table `est inscrit`
--
ALTER TABLE `est inscrit`
  ADD CONSTRAINT `fk_Etudiant_has_Session_Etudiant` FOREIGN KEY (`Etudiant_NumCINEtu`) REFERENCES `etudiant` (`NumCINEtu`),
  ADD CONSTRAINT `fk_Etudiant_has_Session_Session1` FOREIGN KEY (`Session_codeSess`) REFERENCES `session` (`codeSess`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `fk_Session_Formation1` FOREIGN KEY (`Formation_codeForm`) REFERENCES `formation` (`codeForm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
