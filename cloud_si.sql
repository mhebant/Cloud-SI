-- phpMyAdmin SQL Dump
-- version 4.6.5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Version du serveur :  5.5.53-MariaDB
-- Version de PHP :  5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cloud_si`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(30) COLLATE latin1_general_cs NOT NULL,
  `mdp` varchar(30) COLLATE latin1_general_cs NOT NULL,
  `lastact` datetime NOT NULL,
  `rang` varchar(10) COLLATE latin1_general_cs NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Contenu de la table `account`
--

INSERT INTO `account` (`id`, `pseudo`, `mdp`, `lastact`, `rang`) VALUES
(1, 'Martin', '****', '2017-04-16 22:34:29', 'membre'),
(2, 'Antoine', '****', '2013-11-14 12:58:36', 'membre'),
(3, 'Thomas', '****', '2014-10-24 15:40:17', 'membre'),
(4, 'Matthieu', '****', '2014-06-06 09:42:10', 'membre');

-- --------------------------------------------------------

--
-- Structure de la table `fichier`
--

CREATE TABLE `fichier` (
  `id` int(250) NOT NULL,
  `name` varchar(50) COLLATE latin1_general_cs NOT NULL,
  `type` varchar(10) COLLATE latin1_general_cs NOT NULL,
  `place` varchar(50) COLLATE latin1_general_cs NOT NULL,
  `version` int(250) NOT NULL,
  `pseudo` varchar(30) COLLATE latin1_general_cs NOT NULL,
  `date` datetime NOT NULL,
  `code` varchar(20) COLLATE latin1_general_cs NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Contenu de la table `fichier`
--

INSERT INTO `fichier` (`id`, `name`, `type`, `place`, `version`, `pseudo`, `date`, `code`) VALUES
(1, 'Projet SI', 'dossier', '/', 1, 'Martin', '2013-09-20 00:00:00', ''),
(14, 'ST 2.1.docx', 'fichier', '/Projet SI/Solutions Techniques/', 8, '', '0000-00-00 00:00:00', 'V2VLB55IDT'),
(8, 'Cahier des charges.doc', 'fichier', '/Projet SI/', 8, '', '0000-00-00 00:00:00', 'H5XUXY0U2Y'),
(9, 'Note de cadrage.docx', 'fichier', '/Projet SI/', 2, '', '0000-00-00 00:00:00', 'UBL0BZ0Q2G'),
(10, 'Répartition des taches.doc', 'fichier', '/Projet SI/', 1, '', '0000-00-00 00:00:00', 'HRB23DRFYO'),
(13, 'FAST.xlsx', 'fichier', '/Projet SI/Solutions Techniques/', 4, '', '0000-00-00 00:00:00', 'S4QF2DB5CQ'),
(15, 'Solutions Techniques', 'dossier', '/Projet SI/', 0, '', '0000-00-00 00:00:00', ''),
(16, 'ST 3.1.docx', 'fichier', '/Projet SI/Solutions Techniques/', 3, '', '0000-00-00 00:00:00', 'XQOAA6SJ8T'),
(17, 'Critères d\'apréciation.doc', 'fichier', '/Projet SI/', 2, '', '0000-00-00 00:00:00', 'NNF7DRPA0Y'),
(32, 'PPT revue 2.pptx', 'fichier', '/Projet SI/Revue de projet/', 3, '', '0000-00-00 00:00:00', 'O2ND6UUCWC'),
(18, 'Carnet de bord projet.docx', 'fichier', 'bin:/Projet SI/', 1, '', '0000-00-00 00:00:00', '45E03SCRUN'),
(19, 'ST 4.2.2.docx', 'fichier', '/Projet SI/Solutions Techniques/', 3, '', '0000-00-00 00:00:00', '7XXUM37MVD'),
(20, 'S.T 4.2.2.odt', 'fichier', 'bin:/Projet SI/Solutions Techniques/', 3, '', '0000-00-00 00:00:00', 'YE2H4EZ16G'),
(21, 'ST 2.3.docx', 'fichier', '/Projet SI/Solutions Techniques/', 2, '', '0000-00-00 00:00:00', 'TAWHN9F3ZF'),
(22, 'ST 2.4.docx', 'fichier', '/Projet SI/Solutions Techniques/', 2, '', '0000-00-00 00:00:00', '3BBTVJOMTL'),
(23, 'ST 1.docx', 'fichier', '/Projet SI/Solutions Techniques/', 1, '', '0000-00-00 00:00:00', '4QY27Z35PU'),
(24, 'ST 4.2.1 .docx', 'fichier', '/Projet SI/Solutions Techniques/', 2, '', '0000-00-00 00:00:00', 'FXO2IJQLV5'),
(25, 'Test USB.docx', 'fichier', '/Projet SI/', 5, '', '0000-00-00 00:00:00', 'D97733AHDX'),
(26, 'Carnet de bord.docx', 'fichier', '/Projet SI/', 3, '', '0000-00-00 00:00:00', 'HAA763N48V'),
(27, 'Revue de projet', 'dossier', '/Projet SI/', 0, '', '0000-00-00 00:00:00', ''),
(28, 'PPT revue 1.ppt', 'fichier', '/Projet SI/Revue de projet/', 8, '', '0000-00-00 00:00:00', 'JWL42YGAO6'),
(29, 'Fiche de commande.xlsx', 'fichier', '/Projet SI/', 5, '', '0000-00-00 00:00:00', 'U4582GI04J'),
(30, 'UART.docx', 'fichier', '/Projet SI/', 1, '', '0000-00-00 00:00:00', '2ZYXUBKQVU'),
(31, 'Arduino_Program.ino', 'fichier', '/Projet SI/', 2, '', '0000-00-00 00:00:00', 'TOEN6JKSCW'),
(33, 'Densité batterie.png', 'fichier', '/Projet SI/Revue de projet/', 1, '', '0000-00-00 00:00:00', 'FLLOBQ9C2E'),
(34, 'PPT revue 3_Martin.pptx', 'fichier', '/Projet SI/Revue de projet/', 3, '', '0000-00-00 00:00:00', 'MJ6HBVIBCP'),
(35, 'PPT revue 3_Matthieu.pptx', 'fichier', '/Projet SI/Revue de projet/', 1, '', '0000-00-00 00:00:00', 'XZKOI21F11'),
(36, 'PPT revue 3_Thomas.ppt', 'fichier', '/Projet SI/Revue de projet/', 2, '', '0000-00-00 00:00:00', 'GGA0G47RKO');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(250) NOT NULL,
  `pseudo` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `date` datetime NOT NULL,
  `file` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `pseudo`, `message`, `date`, `file`) VALUES
(1, 'Martin', 'Le \"cloud\" est ouvert pour le projet de SI !!!!', '2013-09-21 20:41:00', 'no'),
(21, '[Server]', 'Martin a uploadé le fichier /Projet SI/Cahier des charges.doc', '2013-09-21 20:59:10', 'H5XUXY0U2Y'),
(22, '[Server]', 'Martin a uploadé le fichier /Projet SI/Note de cadrage.doc', '2013-09-21 21:03:48', 'UBL0BZ0Q2G'),
(23, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>Premier remplissage du cahier des charges. Il est encore incomplet', '2013-09-23 17:26:01', 'H5XUXY0U2Y'),
(24, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>J\'y ai ajouté tout ce qui concerne la partie économique.', '2013-09-29 12:43:55', 'H5XUXY0U2Y'),
(25, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Note de cadrage.doc : <br>Nous avons fini de complèter le document. Version Officiel 2014', '2013-09-30 17:30:40', 'UBL0BZ0Q2G'),
(26, '[Server]', 'Martin a renommé /Projet SI/Note de cadrage.doc en Note de cadrage.docx', '2013-09-30 17:30:55', 'UBL0BZ0Q2G'),
(27, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>Replissage des schemas, il reste quelques détails à régler et à finaliser', '2013-09-30 17:33:19', 'H5XUXY0U2Y'),
(28, '[Server]', 'Martin a uploadé le fichier /Projet SI/Répartition des taches.doc', '2013-10-01 19:21:07', 'HRB23DRFYO'),
(31, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>J\'ai commencé a remplir le SADT mais il reste des champs vides (+ ajout dans la liste de ce que le système doit faire). Complétion de la chaîne d\'information et d\'énergie et du tableau de caractérisation des fonctions.', '2013-10-03 21:16:12', 'H5XUXY0U2Y'),
(32, '[Server]', 'Martin a uploadé le fichier /Projet SI/FAST.xlsx', '2013-10-07 17:34:13', 'S4QF2DB5CQ'),
(33, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>Modifications mineurs', '2013-10-07 17:35:13', 'H5XUXY0U2Y'),
(34, '[Server]', 'Martin a reuploadé le fichier /Projet SI/FAST.xlsx : <br>J\'ai finalisé notre première version du FAST:\\n<ul class=\"list\">\\n<li>Flèches</li>\\n<li>Légende</li>\\n</ul>', '2013-10-07 18:50:13', 'S4QF2DB5CQ'),
(35, '[Server]', 'Martin a uploadé le fichier /Projet SI/ST 2.1.docx', '2013-10-14 17:31:41', 'V2VLB55IDT'),
(36, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>Précision des solutions techniques.', '2013-10-14 17:33:18', 'H5XUXY0U2Y'),
(37, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Solutions Techniques/ST 3.1.docx', '2013-10-26 10:17:39', 'XQOAA6SJ8T'),
(38, 'Matthieu', 'J\'ai uploadé le document ST3.1, il correspond au choix des panneaux solaires. Il n\'est pas complet parce que je ne me souvenais plus des résultats des mesures que nous avions effectués sur les panneaux du lycée.', '2013-10-26 10:19:58', 'no'),
(39, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/FAST.xlsx : <br>Ajout de la FT 4.2.3 : Amplifier et de sa ST', '2013-11-04 15:09:58', 'S4QF2DB5CQ'),
(40, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Critères d\'apréciation', '2013-11-04 15:11:46', 'NNF7DRPA0Y'),
(41, '[Server]', 'Matthieu a renommé /Projet SI/Critères d\'apréciation en Critères d\'apréciation.doc', '2013-11-04 15:14:17', 'NNF7DRPA0Y'),
(42, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Critères d\'apréciation.doc : <br>Le détail des FP a été ajouté. Pour toutes informations supplémentaires voir le FAST.', '2013-11-04 15:21:49', 'NNF7DRPA0Y'),
(120, 'Martin', 'Si besoin d\'un ampli, voir des circuits comme LM386 (nécessite 4-12V) où LM831 (double bande, fonctionne en 5V).<br>\\nhttp://www.ti.com/lit/ds/symlink/lm831.pdf', '2014-04-05 17:15:28', 'no'),
(44, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Solutions Techniques/ST 3.1.docx : <br>Modification des mesures pour les panneaux solaires disponible au lycée.', '2013-11-04 16:38:09', 'XQOAA6SJ8T'),
(45, 'Matthieu', 'Le site sur lequel il y les HP est : http://www.diysoundgroup.com/speaker-kits.html', '2013-11-04 17:11:39', 'no'),
(46, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Ajout des critères d\'appréciations de la batterie. Nouvelle solution : les batteries externe que l\'on peut acheté sur le marché.', '2013-11-04 17:21:08', 'V2VLB55IDT'),
(47, '[Server]', 'Martin a uploadé le fichier /Projet SI/Carnet de bord projet.docx', '2013-11-04 17:29:01', '45E03SCRUN'),
(48, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Solutions Techniques/ST 4.2.2.docx', '2013-11-09 22:38:31', '7XXUM37MVD'),
(49, 'Matthieu', 'J\'ai uploadé le fichier ST 4.2.2.docx qui correspond à la solution technique des HP. Pour l\'instant il n\'y a que des liens vers des solutions possible. Thomas si tu peux t\'en occuper. Sinon préviens moi, remarque, préviens moi quoique tu fasses. Merci.', '2013-11-09 22:51:17', 'no'),
(56, '[Server]', 'Martin a uploadé le fichier /Projet SI/Solutions Techniques/ST 2.4.docx', '2013-11-15 21:33:16', '3BBTVJOMTL'),
(55, '[Server]', 'Martin a uploadé le fichier /Projet SI/Solutions Techniques/ST 2.3.docx', '2013-11-15 21:00:32', 'TAWHN9F3ZF'),
(54, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Ajout des inconvénients et avantages des solutions. Un petit peu de mise en page et quelques corrections.', '2013-11-15 20:59:51', 'V2VLB55IDT'),
(57, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Solutions Techniques/FAST.xlsx : <br>Correction d\'erreur de frappes, suppression des FT et ST optionnelles (extravagantes). Ajout des commentaires TAF.', '2013-11-18 15:00:48', 'S4QF2DB5CQ'),
(58, '[Server]', 'Martin a uploadé le fichier /Projet SI/Solutions Techniques/ST1.docx', '2013-11-18 17:41:28', '4QY27Z35PU'),
(59, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Ajout conclusion', '2013-11-18 17:42:11', 'V2VLB55IDT'),
(60, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.3.docx : <br>Ajout Emplacement', '2013-11-18 17:42:46', 'TAWHN9F3ZF'),
(61, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.4.docx : <br>Choix de 5 niveaux/LEDs', '2013-11-18 17:43:22', '3BBTVJOMTL'),
(62, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 3.1.docx : <br>Mise en page plus propre, Ajout d\'une nouvelle solution: le panneau Solariflex Power 8-12W', '2013-11-18 17:43:54', 'XQOAA6SJ8T'),
(63, '[Server]', 'Martin a renommé /Projet SI/Solutions Techniques/ST1.docx en ST 1.docx', '2013-11-18 17:44:20', '4QY27Z35PU'),
(64, '[Server]', 'Thomas a reuploadé le fichier /Projet SI/Solutions Techniques/ST 4.2.2.docx : <br>Trouvé un équivalent moitié moins cher et moins consommateur pour les mêmes performances.', '2013-11-25 15:26:13', '7XXUM37MVD'),
(65, '[Server]', 'Thomas a uploadé le fichier /Projet SI/Solutions Techniques/S.T 4.2.1 .docx', '2013-11-25 16:14:09', 'FXO2IJQLV5'),
(66, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Test USB.docx', '2013-12-02 17:22:51', 'D97733AHDX'),
(67, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Test USB.docx : <br>Ajout des mesures du 9/12/2013, schéma, déductions et conclusions tiré des expériences', '2013-12-09 20:48:12', 'D97733AHDX'),
(68, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Carnet de bord (2).docx', '2013-12-14 11:38:51', 'HAA763N48V'),
(69, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Ajout des types de batteries et précision du choix de batterie lithium.', '2013-12-16 15:59:33', 'V2VLB55IDT'),
(70, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Test USB.docx : <br>Très légère modification.', '2013-12-16 16:11:44', 'D97733AHDX'),
(71, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Test USB.docx : <br>Précision des résultats avec les expériences de cette séance', '2013-12-16 17:33:41', 'D97733AHDX'),
(72, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Test USB.docx : <br>Conclusion tiré des expériences sur le caractéristiques que doit remplir la batterie', '2014-01-06 16:00:20', 'D97733AHDX'),
(73, '[Server]', 'Thomas a reuploadé le fichier /Projet SI/Solutions Techniques/ST 4.2.2.docx : <br>Passer en .docx et ai ajouté les critères\\n', '2014-01-06 17:08:34', '7XXUM37MVD'),
(74, '[Server]', 'Martin a renommé /Projet SI/Carnet de bord (2).docx en Carnet de bord.docx', '2014-01-06 18:24:18', 'HAA763N48V'),
(75, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt', '2014-01-06 19:18:56', 'JWL42YGAO6'),
(76, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Ajout des résultats des experiences', '2014-01-11 21:01:46', 'JWL42YGAO6'),
(77, '[Server]', 'Thomas a uploadé le fichier /Projet SI/Fiche de commande.xlsx', '2014-01-13 15:58:58', 'U4582GI04J'),
(78, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Cahier des charges.doc : <br>Mise en page du Cahier des Charges, il est maintenant en version finale.', '2014-01-13 17:11:47', 'H5XUXY0U2Y'),
(79, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Fiche de commande.xlsx : <br>Nette amélioration graphique apportée au document', '2014-01-13 17:30:28', 'U4582GI04J'),
(80, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Carnet de bord.docx : <br>Mise à jour hebdomadaire', '2014-01-13 17:31:04', 'HAA763N48V'),
(81, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Fiche de commande.xlsx : <br>Ajout de la rubrique \"Quantité théorique\".', '2014-01-20 14:45:44', 'U4582GI04J'),
(82, 'Martin', 'Bac STI Station de recharge pour véhicule électrique:<br>\\nhttp://eduscol.education.fr/sti/sites/eduscol.education.fr.sti/files/concours-examens/1001/1001-sti2d-ett-metropole-juin-2013-non-doublant.pdf#overlay-context=concours_examens/enseignements-technologiques-transversaux-bac-sti2d-metropole-juin-2013', '2014-01-20 17:32:01', 'no'),
(83, 'Martin', 'Voir aussi: <br>\\r\\nhttp://eduscol.education.fr/sti/concours_examens/enseignements-technologiques-transversaux-bac-sti2d-metropole-juin-2013', '2014-01-20 17:33:45', 'no'),
(84, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Ajout du schéma bloc avec les entrés/sorties', '2014-01-20 18:38:23', 'JWL42YGAO6'),
(85, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/S.T 4.2.1 .docx : <br>Ajout d\'une parti envisagent une réception de la musique par Bluetooth.', '2014-01-25 21:46:55', 'FXO2IJQLV5'),
(86, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Ajout du bloc RN52 au schéma bloc', '2014-01-26 19:37:27', 'JWL42YGAO6'),
(87, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Mise à jour et réunification des deux documents.', '2014-01-27 09:12:35', 'JWL42YGAO6'),
(88, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Correction de quelques détails de mise en page', '2014-01-27 09:57:58', 'JWL42YGAO6'),
(89, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Carnet de bord.docx : <br>Ajout du 20/01 et du 27/01', '2014-01-27 10:03:18', 'HAA763N48V'),
(90, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Ajout de plus d\'information sur les test réalisé pour la baterie (photos...). Ajout de doc sur la RN52 et le Teste de charge', '2014-02-02 18:41:11', 'JWL42YGAO6'),
(102, '[Server]', 'Martin a uploadé le fichier /Projet SI/Arduino_Program.ino', '2014-03-11 21:00:41', 'TOEN6JKSCW'),
(92, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Revue de projet 1/PPT revue 1.ppt : <br>Changement de l\'ordre de la mise en page.', '2014-02-03 14:43:28', 'JWL42YGAO6'),
(93, '[Server]', 'Thomas a reuploadé le fichier /Projet SI/Fiche de commande.xlsx : <br>Ajout du modème bluetooth', '2014-02-03 14:59:21', 'U4582GI04J'),
(94, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Fiche de commande.xlsx : <br>Le site de commande du modèle Bluetooth a été ajouté', '2014-02-10 15:12:13', 'U4582GI04J'),
(96, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Réécriture complète du fichier, il montre l\'évolution de la réflexion sur la batterie, ajout entre autre des tests USB effectué pour caractériser les grandeur nécessaire de la batterie.', '2014-02-10 17:16:51', 'V2VLB55IDT'),
(97, '[Server]', 'Martin a renommé /Projet SI/Solutions Techniques/S.T 4.2.1 .docx en ST 4.2.1 .docx', '2014-02-19 10:29:06', 'FXO2IJQLV5'),
(99, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Modification mineur de mise en page', '2014-02-19 20:21:16', 'V2VLB55IDT'),
(100, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 4.2.1 .docx : <br>Réécriture complète du fichier, il montre l\'évolution de la réflexion sur l\'acquisition de la musique. Ajout des solution envisagé, des critère et de la solution retenu', '2014-02-19 20:23:29', 'FXO2IJQLV5'),
(101, '[Server]', 'Martin a uploadé le fichier /Projet SI/UART.docx', '2014-02-21 10:41:44', '2ZYXUBKQVU'),
(116, '[Server]', 'Martin a uploadé le fichier /Projet SI/Revue de projet/Densité batterie.png', '2014-03-31 20:12:33', 'FLLOBQ9C2E'),
(114, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Arduino_Program.ino : <br>Résolution de bugs et test sur la arduino du lycée.', '2014-03-17 21:06:11', 'TOEN6JKSCW'),
(115, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Revue de projet/PPT revue 2.pptx', '2014-03-31 18:30:49', 'O2ND6UUCWC'),
(117, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Solutions Techniques/ST 2.1.docx : <br>Ajout des informations sur la batterie et le protocole pour la courbe de décharge.<br>\\r\\nJ\'ai aussi bossé sur le testeur de charge.', '2014-03-31 22:05:43', 'V2VLB55IDT'),
(118, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet/PPT revue 2.pptx : <br>Ajout du nouveau schéma bloc.', '2014-04-02 18:43:09', 'O2ND6UUCWC'),
(119, 'Martin', 'J\'ai fait des diapos sur la batterie et d\'autre composant qui servent a adapter la tension. Je vous les montrerais Lundi, et on verra les quels on gardes.', '2014-04-03 20:48:06', 'no'),
(121, '[Server]', 'Matthieu a reuploadé le fichier /Projet SI/Revue de projet/PPT revue 2.pptx : <br>Finalisation de la présentation et regroupement de toutes les parties', '2014-04-07 17:29:36', 'O2ND6UUCWC'),
(122, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Revue de projet/PPT revue 3_Martin.pptx', '2014-05-26 14:51:23', 'MJ6HBVIBCP'),
(123, '[Server]', 'Matthieu a uploadé le fichier /Projet SI/Revue de projet/PPT revue 3_Matthieu.pptx', '2014-06-06 09:41:45', 'XZKOI21F11'),
(124, '[Server]', 'Thomas a uploadé le fichier /Projet SI/Revue de projet/PPT revue 3_Thomas.ppt', '2014-06-09 21:20:43', 'GGA0G47RKO'),
(125, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet/PPT revue 3_Martin.pptx : <br>Dernière version', '2014-06-10 22:11:31', 'MJ6HBVIBCP'),
(126, '[Server]', 'Thomas a reuploadé le fichier /Projet SI/Revue de projet/PPT revue 3_Thomas.ppt : <br>Fichier corrigé et prêt à l\'emploie', '2014-06-10 23:25:04', 'GGA0G47RKO'),
(127, '[Server]', 'Martin a reuploadé le fichier /Projet SI/Revue de projet/PPT revue 3_Martin.pptx : <br>Last version', '2014-06-11 11:29:55', 'MJ6HBVIBCP');

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `id` int(250) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `onglet` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `css` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `name`, `onglet`, `css`, `url`) VALUES
(1, 'accueil', 'accueil', 'no', 'page/accueil.php'),
(2, 'message', 'message', 'css/message.css', 'page/message.php'),
(3, 'inscription', 'no', 'css/inscription.css', 'page/inscription.php'),
(4, 'nmessage', 'message', 'no', 'page/nmessage.php'),
(5, 'fichier', 'fichier', 'css/fichier.css', 'page/fichier.php'),
(6, 'settings', 'no', 'no', 'page/settings.php'),
(8, 'mfichier', 'fichier', 'no', 'page/mfichier.php'),
(9, 'nfichier', 'fichier', 'no', 'page/nfichier.php');

-- --------------------------------------------------------

--
-- Structure de la table `tchat`
--

CREATE TABLE `tchat` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(30) COLLATE latin1_general_cs NOT NULL,
  `msg` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Contenu de la table `tchat`
--

INSERT INTO `tchat` (`id`, `pseudo`, `msg`, `date`) VALUES
(1, 'Martin', 'Ya quelqu\'un ??', '2013-09-29 21:30:08'),
(2, 'Martin', ':D', '2013-10-10 12:48:46'),
(3, 'Antoine', 'Pour info, tous refonctionnent. C\'était les plugs qui étaient désynchronisés. J\'ai remis la box avec les derniers paramètres sauvegardés.', '2013-10-14 14:49:02'),
(4, 'Antoine', 'Bon courage', '2013-10-14 14:49:08'),
(5, 'Martin', 'Ha OK !!', '2013-10-14 14:56:25'),
(6, 'Matthieu', 'C\'est fini ! :(', '2013-10-14 17:28:43'),
(7, 'Martin', 'Matthieu vien !!', '2013-11-04 14:53:19'),
(8, 'Martin', 'écoute moi!!!!!!!!!!!!!', '2013-11-04 14:53:31'),
(9, 'Matthieu', 'qu\'est-ce qu\'il y a ?', '2013-11-04 14:58:33'),
(10, 'Martin', 'rien c\'est thomas qui a ecri ça ...', '2013-11-04 15:00:51'),
(11, 'Matthieu', 'J\'ai uploadé le fichier !', '2013-11-04 15:12:13'),
(12, 'Matthieu', 'vous en pensez quoi ?', '2013-11-04 15:13:22'),
(13, 'Thomas', 'Si quelqu\'un peut m\'expliquer le problème de format ce serait génial...', '2013-11-11 14:41:00'),
(14, 'Thomas', '*Yo', '2013-11-18 16:15:59'),
(15, 'Matthieu', 'cf CdCF', '2013-12-16 15:54:18'),
(16, 'Thomas', 'yo', '2013-12-16 15:54:37'),
(17, 'Matthieu', 'test', '2013-12-16 15:54:59'),
(18, 'Thomas', 'ya pas le PRIX ??????? Sa me sert a rien !!!!', '2013-12-16 15:55:56'),
(19, 'Matthieu', 'Je cherche, je te tiens au courant', '2013-12-16 15:56:11'),
(20, 'Thomas', 'grouille', '2013-12-16 15:56:21'),
(21, 'Thomas', 'j\'en ai beesoin rapidement!!!!!', '2013-12-16 15:56:37'),
(22, 'Thomas', '{[|`^@]]', '2013-12-16 15:57:08'),
(23, 'Thomas', '~#{[|`^@]}¤µ%£¨+°0988', '2013-12-16 15:57:30'),
(24, 'Thomas', '?', '2013-12-16 15:57:58'),
(25, 'Thomas', '£$', '2013-12-16 15:58:10'),
(26, 'Matthieu', 'celui là ? http://www.bymatao.com/article-sac-a-dos-186.htm', '2013-12-16 15:58:17'),
(27, 'Thomas', 'non', '2013-12-16 15:58:37'),
(28, 'Thomas', 'on a besoin d\'un bipoche', '2013-12-16 15:58:47'),
(29, 'Thomas', 'et si j\'ai regarder', '2013-12-16 15:58:55'),
(30, 'Matthieu', 'tu peux la créer', '2013-12-16 15:59:04'),
(31, 'Thomas', 'LOL', '2013-12-16 15:59:11'),
(32, 'Matthieu', 'http://www.bureau-vallee.fr/bagagerie-maroquinerie/sac-%C3%A0-dos-walker-classic-noir-2-compartiments', '2013-12-16 16:01:25'),
(33, 'Matthieu', 'Celui ci ?', '2013-12-16 16:01:29'),
(34, 'Thomas', 'nickel', '2013-12-16 16:02:13'),
(35, 'Thomas', 'très bien', '2013-12-16 16:02:18'),
(36, 'Matthieu', 'J\'essaye de le trouver en noir', '2013-12-16 16:02:27'),
(37, 'Matthieu', 'j\'avais compris \"nickel\"', '2013-12-16 16:02:37'),
(38, 'Thomas', 'c\'était pour appuyer mon approbation', '2013-12-16 16:05:21'),
(39, 'Matthieu', 'http://www.rentreediscount.com/Sac-a-dos-2-comp-Cristo-XL-Garanti-10ans-emplacement-ordi-L35xH45xP22,19788.html?catalogParam[shopId]=12463', '2013-12-16 16:05:29'),
(40, 'Thomas', 'et en noir se sera parfait', '2013-12-16 16:05:37'),
(41, 'Matthieu', 'Il est mieux en noir et avec une poche au fond', '2013-12-16 16:05:49'),
(42, 'Thomas', 'Génial!!! il est encore mieux pour les modifs et en plus le fond est déja doublé !!!', '2013-12-16 16:06:55'),
(43, 'Matthieu', 'Normalement le noir à autant de poche que celui là : http://www.rentreediscount.com/Sac-a-dos-Walker-Classic-Bi-Color-Noir-Blanc-kaki,20508.html', '2013-12-16 16:06:57'),
(44, 'Thomas', 'moins cool', '2013-12-16 16:07:24'),
(45, 'Thomas', 'je préfère le noir uniforme', '2013-12-16 16:07:40'),
(46, 'Thomas', 'plus neutre', '2013-12-16 16:07:45'),
(47, 'Matthieu', 'Le nombre de poche je ne parle pas de la couleur', '2013-12-16 16:07:45'),
(48, 'Thomas', 'plus agréable', '2013-12-16 16:07:52'),
(49, 'Thomas', 'ok pas de problème', '2013-12-16 16:08:09'),
(50, 'Matthieu', 'tu vois', '2013-12-16 16:08:50'),
(51, 'Matthieu', 'Il reste quoi à faire ?', '2013-12-16 16:10:00'),
(52, 'Thomas', 'mathlab et les question fonctionnelles', '2013-12-16 16:13:06'),
(53, 'Matthieu', 'Je me replonge dans MatLab', '2013-12-16 16:13:33'),
(54, 'Matthieu', 'Le schéma bloc c\'est avec MatLab ?', '2013-12-16 16:14:44'),
(55, 'Thomas', 'oui ou avec un bloc', '2013-12-16 16:15:05'),
(56, 'Thomas', 'genre comme le fast', '2013-12-16 16:15:18'),
(57, 'Matthieu', 'avec un exxcel pas un bloc', '2013-12-16 16:16:32'),
(58, 'Thomas', 'Oui mais je ne me souvenais plus de ce qu\'avais utilisé Martin', '2013-12-16 16:17:10'),
(59, 'Matthieu', 'ok', '2013-12-16 16:45:12'),
(60, 'Matthieu', '', '2013-12-16 16:45:13'),
(61, 'Matthieu', '', '2013-12-16 16:45:13'),
(62, 'Matthieu', '', '2013-12-16 16:45:13'),
(63, 'Matthieu', '', '2013-12-16 16:45:13'),
(64, 'Matthieu', '', '2013-12-16 16:45:13'),
(65, 'Matthieu', '', '2013-12-16 16:45:13'),
(66, 'Matthieu', '', '2013-12-16 16:45:13'),
(67, 'Matthieu', '', '2013-12-16 16:45:13'),
(68, 'Matthieu', 'test', '2014-01-06 14:57:07'),
(69, 'Thomas', 'test feedback : Test useless', '2014-01-06 15:10:09'),
(70, 'Thomas', 'Sa avance. Et vous??', '2014-01-06 15:12:52'),
(71, 'Matthieu', 'c\'était pour martin', '2014-01-06 15:13:22'),
(72, 'Matthieu', 'ça bosse', '2014-01-06 15:13:36'),
(73, 'Thomas', 'OK bonne chance avec mathlab et le résumé', '2014-01-06 15:14:23'),
(74, 'Matthieu', 'merci', '2014-01-06 15:14:55'),
(75, 'Thomas', 'De rien', '2014-01-06 15:15:19'),
(76, 'Matthieu', 'c\'était pour martin', '2014-01-06 15:18:03'),
(77, 'Matthieu', 't\'en es où Thomas ?', '2014-01-06 15:52:33'),
(78, 'Thomas', 'au point mort je cherche qqc', '2014-01-06 15:52:57'),
(79, 'Matthieu', 'en rapport avec le projet ?', '2014-01-06 15:53:13'),
(80, 'Thomas', 'non c\'était des snipers', '2014-01-06 15:58:26'),
(81, 'Thomas', 'es-ce que sa sa te va ??', '2014-01-06 16:08:11'),
(82, 'Thomas', 'http://www.tissus.net/21-354-587_tarp-yacht-12.html?$category=2zmudvyfuny', '2014-01-06 16:08:13'),
(83, 'Matthieu', 'ça me va, prend le en noir : http://www.tissus.net/21-354-154_tarp-yacht-7.html', '2014-01-06 16:10:35'),
(84, 'Thomas', 'Ya juste un probl regarde le prix', '2014-01-06 16:17:20'),
(85, 'Matthieu', '0.5m c\'est 19.98', '2014-01-06 16:19:39'),
(86, 'Thomas', 'ouais enfin....bonjours le budjet', '2014-01-06 16:22:21'),
(87, 'Matthieu', 'ça rentre sans problème', '2014-01-06 16:22:37'),
(88, 'Thomas', 'ok', '2014-01-06 16:22:48'),
(89, 'Matthieu', 'tu n\'auras pas besoin de + de 0.5 ?', '2014-01-06 16:22:57'),
(90, 'Thomas', 'nn', '2014-01-06 16:23:23'),
(91, 'Thomas', 'suffisent', '2014-01-06 16:23:29'),
(92, 'Matthieu', 'ok donc c\'est bon', '2014-01-06 16:28:04'),
(93, 'Thomas', 'vous faîtes quoi', '2014-01-06 16:28:23'),
(94, 'Matthieu', 'On bosse', '2014-01-06 16:28:32'),
(95, 'Thomas', 'sur quoi?? (trop bien il font comme moi)', '2014-01-06 16:29:15'),
(96, 'Matthieu', 'Je prépare la revue n°1 et Martin planche sur MatLab', '2014-01-06 16:29:27'),
(97, 'Thomas', 'ok', '2014-01-06 16:29:34'),
(98, 'Thomas', 'Ouais !!!!!', '2014-01-06 17:09:20'),
(99, 'Thomas', 'Débugé !!!!', '2014-01-06 17:09:32'),
(100, 'Matthieu', 'Alors fini ton TAF', '2014-01-06 17:09:54'),
(101, 'Thomas', 'Ah le \"Théorème des accroissements finis\"', '2014-01-06 17:11:22'),
(102, 'Thomas', 'Il est déja démontrer j\'ai plus rien à faire', '2014-01-06 17:11:45'),
(103, 'Thomas', 'C\'est partit', '2014-01-13 14:54:16'),
(104, 'Thomas', 'PROBLEME !!!!!', '2014-01-13 14:59:08'),
(105, 'Thomas', 'regarde ce lien :', '2014-01-13 14:59:17'),
(106, 'Thomas', 'http://www.solariflex.com/souples-et-pliables/195-panneau-solaire-power8-12w.html', '2014-01-13 14:59:19'),
(107, 'Thomas', 'Le prix passera', '2014-01-13 15:00:30'),
(108, 'Thomas', 'pas je pense', '2014-01-13 15:04:06'),
(109, 'Matthieu', 'Il s\'élève à combien', '2014-01-13 15:48:36'),
(110, 'Thomas', '283? au total', '2014-01-13 15:59:21'),
(111, 'Matthieu', 'Seulement ?', '2014-01-13 15:59:40'),
(112, 'Thomas', 'J\'arrive et ai uploader le fichier tu peux le regarder', '2014-01-13 16:00:03'),
(113, 'Thomas', 'C\'est chiant d\'être tout seul....on se sent seul', '2014-01-31 23:12:04'),
(114, 'Matthieu', 'Bonjour Martin !', '2014-02-10 14:43:55'),
(115, 'Matthieu', '8465138543587463251684132416213574651356746251389436213', '2014-02-10 14:45:21'),
(116, 'Martin', 'Bonjour !!!', '2014-02-10 14:45:50'),
(117, 'Martin', 'http://www.microchip.com/wwwproducts/Devices.aspx?dDocName=en560765', '2014-02-10 14:51:25'),
(127, 'Martin', 'eeeeé', '2014-04-02 18:47:19'),
(126, 'Martin', 'https://www.sparkfun.com/products/11777', '2014-03-31 16:37:23');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichier`
--
ALTER TABLE `fichier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tchat`
--
ALTER TABLE `tchat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `fichier`
--
ALTER TABLE `fichier`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `tchat`
--
ALTER TABLE `tchat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
