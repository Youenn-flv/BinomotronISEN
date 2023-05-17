-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 17 mai 2023 à 09:03
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomotron`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

CREATE TABLE `apprenant` (
  `id_apprenant` int NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `mail` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `apprenant`
--

INSERT INTO `apprenant` (`id_apprenant`, `nom`, `prenom`, `mail`) VALUES
(1, 'COULM', 'Morgan', 'morgan.coulm@isen-ouest.yncrea.fr'),
(2, 'ULVOAS', 'Camille', 'camille.ulvoas@isen-ouest.yncrea.fr'),
(3, 'PAUL', 'Yves', 'yves.paul@isen-ouest.yncrea.fr'),
(4, 'PERTRON', 'Laura', 'laura.pertron@isen-ouest.yncrea.fr'),
(5, 'BOIREAU', 'Frédéric', 'frederic.boireau@isen-ouest.yncrea.fr'),
(7, 'NEEDHAM', 'Jonathan', 'jonathan.needham@isen-ouest.yncrea.fr'),
(8, 'LARDIC', 'Jérémy', 'jeremy.lardic@isen-ouest.yncrea.fr'),
(9, 'RENNARD', 'Mickaël', 'mickael.rennard@isen-ouest.yncrea.fr'),
(10, 'MOHAMMAD', 'Ibrahim', 'ibrahim.mohammad@isen-ouest.yncrea.fr'),
(11, 'DUBIGNY', 'Andy', 'andy.dubigny@isen-ouest.yncrea.fr'),
(12, 'GUEVEL', 'Pierre-Marie', 'pierre-marie.guevel@isen-ouest.yncrea.fr'),
(13, 'FEULVARC’H', 'Youenn', 'youenn.feulvarc-h@isen-ouest.yncrea.fr'),
(14, 'QUENET', 'Gwendal', 'gwendal.quenet@isen-ouest.yncrea.fr'),
(15, 'CARAES', 'Alexandre', 'alexandre.caraes@isen-ouest.yncrea.fr'),
(16, 'SUCHY-REINARD', 'Bastien', 'bastien.suchy-reinard@isen-ouest.yncrea.fr');

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `id_groupe` int NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `id_projets` int NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `regroupement`
--

CREATE TABLE `regroupement` (
  `id_projets` int NOT NULL,
  `id_apprenant` int NOT NULL,
  `id_groupes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `apprenant`
--
ALTER TABLE `apprenant`
  ADD PRIMARY KEY (`id_apprenant`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id_projets`);

--
-- Index pour la table `regroupement`
--
ALTER TABLE `regroupement`
  ADD KEY `id_apprenant` (`id_apprenant`),
  ADD KEY `id_projets` (`id_projets`),
  ADD KEY `id_groupes` (`id_groupes`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `apprenant`
--
ALTER TABLE `apprenant`
  MODIFY `id_apprenant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id_groupe` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `id_projets` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `regroupement`
--
ALTER TABLE `regroupement`
  ADD CONSTRAINT `regroupement_ibfk_1` FOREIGN KEY (`id_apprenant`) REFERENCES `apprenant` (`id_apprenant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `regroupement_ibfk_2` FOREIGN KEY (`id_projets`) REFERENCES `projets` (`id_projets`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `regroupement_ibfk_3` FOREIGN KEY (`id_groupes`) REFERENCES `groupes` (`id_groupe`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
