-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           11.6.2-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage des données de la table bande_cv.auth_group : ~0 rows (environ)
DELETE FROM `auth_group`;

-- Listage des données de la table bande_cv.auth_group_permissions : ~0 rows (environ)
DELETE FROM `auth_group_permissions`;

-- Listage des données de la table bande_cv.auth_permission : ~56 rows (environ)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add cv', 7, 'add_cv'),
	(26, 'Can change cv', 7, 'change_cv'),
	(27, 'Can delete cv', 7, 'delete_cv'),
	(28, 'Can view cv', 7, 'view_cv'),
	(29, 'Can add etudiant', 8, 'add_etudiant'),
	(30, 'Can change etudiant', 8, 'change_etudiant'),
	(31, 'Can delete etudiant', 8, 'delete_etudiant'),
	(32, 'Can view etudiant', 8, 'view_etudiant'),
	(33, 'Can add competence', 9, 'add_competence'),
	(34, 'Can change competence', 9, 'change_competence'),
	(35, 'Can delete competence', 9, 'delete_competence'),
	(36, 'Can view competence', 9, 'view_competence'),
	(37, 'Can add experience', 10, 'add_experience'),
	(38, 'Can change experience', 10, 'change_experience'),
	(39, 'Can delete experience', 10, 'delete_experience'),
	(40, 'Can view experience', 10, 'view_experience'),
	(41, 'Can add formation', 11, 'add_formation'),
	(42, 'Can change formation', 11, 'change_formation'),
	(43, 'Can delete formation', 11, 'delete_formation'),
	(44, 'Can view formation', 11, 'view_formation'),
	(45, 'Can add langue', 12, 'add_langue'),
	(46, 'Can change langue', 12, 'change_langue'),
	(47, 'Can delete langue', 12, 'delete_langue'),
	(48, 'Can view langue', 12, 'view_langue'),
	(49, 'Can add loisir', 13, 'add_loisir'),
	(50, 'Can change loisir', 13, 'change_loisir'),
	(51, 'Can delete loisir', 13, 'delete_loisir'),
	(52, 'Can view loisir', 13, 'view_loisir'),
	(53, 'Can add projet', 14, 'add_projet'),
	(54, 'Can change projet', 14, 'change_projet'),
	(55, 'Can delete projet', 14, 'delete_projet'),
	(56, 'Can view projet', 14, 'view_projet');

-- Listage des données de la table bande_cv.auth_user : ~1 rows (environ)
DELETE FROM `auth_user`;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$600000$cru4bsMWxnRKAeFcnIGBWi$1iKz0uY61xpUMKh6VfMsTLPtyW7c+zIecs/rJQWs2tA=', '2025-01-23 20:39:12.986962', 1, 'elvina', '', '', '', 1, 1, '2025-01-23 20:37:19.364987');

-- Listage des données de la table bande_cv.auth_user_groups : ~0 rows (environ)
DELETE FROM `auth_user_groups`;

-- Listage des données de la table bande_cv.auth_user_user_permissions : ~0 rows (environ)
DELETE FROM `auth_user_user_permissions`;

-- Listage des données de la table bande_cv.django_admin_log : ~0 rows (environ)
DELETE FROM `django_admin_log`;

-- Listage des données de la table bande_cv.django_content_type : ~14 rows (environ)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(9, 'gestion', 'competence'),
	(7, 'gestion', 'cv'),
	(8, 'gestion', 'etudiant'),
	(10, 'gestion', 'experience'),
	(11, 'gestion', 'formation'),
	(12, 'gestion', 'langue'),
	(13, 'gestion', 'loisir'),
	(14, 'gestion', 'projet'),
	(6, 'sessions', 'session');

-- Listage des données de la table bande_cv.django_migrations : ~20 rows (environ)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-01-23 20:36:12.569464'),
	(2, 'auth', '0001_initial', '2025-01-23 20:36:12.917871'),
	(3, 'admin', '0001_initial', '2025-01-23 20:36:12.987220'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2025-01-23 20:36:13.003275'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-23 20:36:13.030622'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2025-01-23 20:36:13.111898'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2025-01-23 20:36:13.140680'),
	(8, 'auth', '0003_alter_user_email_max_length', '2025-01-23 20:36:13.181101'),
	(9, 'auth', '0004_alter_user_username_opts', '2025-01-23 20:36:13.194024'),
	(10, 'auth', '0005_alter_user_last_login_null', '2025-01-23 20:36:13.224107'),
	(11, 'auth', '0006_require_contenttypes_0002', '2025-01-23 20:36:13.230020'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-23 20:36:13.240917'),
	(13, 'auth', '0008_alter_user_username_max_length', '2025-01-23 20:36:13.267310'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-23 20:36:13.297421'),
	(15, 'auth', '0010_alter_group_name_max_length', '2025-01-23 20:36:13.334103'),
	(16, 'auth', '0011_update_proxy_permissions', '2025-01-23 20:36:13.347807'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-23 20:36:13.374251'),
	(18, 'gestion', '0001_initial', '2025-01-23 20:36:13.664367'),
	(19, 'gestion', '0002_remove_etudiant_identifiant_remove_experience_duree_and_more', '2025-01-23 20:36:13.724228'),
	(20, 'sessions', '0001_initial', '2025-01-23 20:36:13.759074');

-- Listage des données de la table bande_cv.django_session : ~2 rows (environ)
DELETE FROM `django_session`;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0u7qvtqt960rgf8qk79v4wim5wiyno9w', 'eyJ1dGlsaXNhdGV1ciI6Mn0:1tcnWE:cogfAY-3z95_sqF2UgJ3s4NJvm1A0atCC6G-Bm2vWeo', '2025-02-11 15:28:50.482958'),
	('5qpohirtnbh1emen2m28ijcqzb5b9gei', '.eJxVjMEOwiAQRP-FsyEFSpEevfsNze6yCNq0SYGT8d9tkx50jjNv3ltM0GqaWuFtykGMQonLb4dAL16OITxheayS1qVuGeWByHMt8r4Gnm8n-ydIUNL-HiiwBo6EPVHUQVk72N4YB4hkWO9Bja5niops565sotPe4-CRO9_t0lbznAtUbpsY9ecLyVE-Hw:1tcR6a:62znuyt14GrK5fVvIZKlxR5TYXrV0pJrFrI-QMulK_w', '2025-02-10 15:32:52.803254');

-- Listage des données de la table bande_cv.gestion_competence : ~3 rows (environ)
DELETE FROM `gestion_competence`;
INSERT INTO `gestion_competence` (`id`, `titre`, `niveau`, `cv_id`) VALUES
	(1, 'ELEVEUSE PROFESSIONNELLE', 13, 3),
	(2, 'COUTURIER PROFESSIONNEL', 90, 4),
	(3, 'DEVELOPPEMENT', 60, 7);

-- Listage des données de la table bande_cv.gestion_cv : ~7 rows (environ)
DELETE FROM `gestion_cv`;
INSERT INTO `gestion_cv` (`id`, `titre`, `description`, `date_creation`, `etudiant_id`) VALUES
	(1, 'cv professionnel', 'missionnaire', '2025-01-23', 1),
	(2, 'CV PROFESSIONNEL', 'ELEVEUR DE POULETS', '2025-01-27', 1),
	(3, 'ENTREPRISE', 'ELEVEUSE DE POULETS', '2025-01-27', 1),
	(4, 'CV PROFESSIONNEL', 'COUTURIER', '2025-01-27', 2),
	(5, 'RECHERCHE D\'INVERSTISSEURS', 'JE SUIS UN ENTREPRENEUR A LA RECHERCHE DES INVERSTISSEURS', '2025-01-27', 3),
	(6, 'ENTREPRISE', 'missionnaire', '2025-01-27', 2),
	(7, 'cv sotra', 'CV ABOBO1', '2025-01-28', 2);

-- Listage des données de la table bande_cv.gestion_etudiant : ~3 rows (environ)
DELETE FROM `gestion_etudiant`;
INSERT INTO `gestion_etudiant` (`id`, `prenom`, `nom`, `email`, `contact`, `age`, `photo`, `nationalite`, `situation_matrimoniale`, `mobile`, `facebook`, `linkedin`, `instagram`, `mot_de_passe`) VALUES
	(1, 'Elvina', 'Pilahi', 'elvinapilahi@gmail.com', '0758078772', 23, 'photos/photo__MHM05kM.jpg', 'Ivoirienne', 'Celibataire', '0747487691', NULL, NULL, NULL, 'pbkdf2_sha256$600000$BFAYGXSCnmKSOo8hBu2jQQ$JN2NEEkg/WxgUQbVo2nIpDimUQySqg4yrSUCcjQsXTM='),
	(2, 'VODI', 'SIMON', 'vodisimon@gmail.com', '0150962154', 43, 'photos/IMG-20250124-WA0045_vQ7fnX2.jpg', 'Ivoirienne', 'Divorcé', '0757473090', NULL, NULL, NULL, 'pbkdf2_sha256$600000$aIpSRjxAzgdztmVFq0QcdU$FUc8DKXzdXTbkF4c0VSVeID19rC3A5/sd9RGYAsbMGY='),
	(3, 'ARMEL', 'ZAH BI', 'armelza@gmail.com', '0709090909', 30, 'photos/IMG-20250124-WA0047_Rt2tvBS.jpg', 'Ivoirienne', 'Celibataire', '0757473090', NULL, NULL, NULL, 'pbkdf2_sha256$600000$3PwW9rOfgbpjNpdlG0GeJ5$xb+FQq9O3vDLjrjWhNLcLKOXIDgXbEez1tjFNTQPuy0=');

-- Listage des données de la table bande_cv.gestion_experience : ~5 rows (environ)
DELETE FROM `gestion_experience`;
INSERT INTO `gestion_experience` (`id`, `date_debut`, `date_fin`, `titre`, `entreprise`, `localite_entreprise`, `taches`, `cv_id`) VALUES
	(1, '2018-10-23', '2024-12-30', 'FERME DE POULET', 'COQ-POUL IVOIRE', '', 'RESPONSABLE TECHNIQUE ET NUTRITION DES TETES DE POULETS', 3),
	(2, '2012-10-10', '2013-12-31', 'COUTURIER', 'AMA STYLE', '', 'COUDRE LES VETEMENTS POUR LA MARQUE AMAS', 4),
	(3, '2008-10-10', '2009-12-31', 'COUTURIER VACATAIRE ', 'BOB,BG,LORI FASHION ET PATCHA STYLE', '', 'COUDRE LES VETEMENTS HOMMES,FEMMES ET ENFANTS POUR CES MARQUES PENDANT MES TEMPS DE VACANCES ET CONGES', 4),
	(4, '2020-02-14', '2023-10-31', 'PROPRIETAIRE DE PLUSIEURS BOUTIQUE EN LIGNE', 'ANONYME', '', 'CREER DES COMMERCES AVOIR DES MARCHERS ET INVERSTISSEURS PUIS VENDRE', 5),
	(5, '2012-01-31', '2016-06-04', 'ASSISTANT COMPTABLE', 'COMPTABILITE SODECI', '', 'Assistanat en comptabilite', 7);

-- Listage des données de la table bande_cv.gestion_formation : ~11 rows (environ)
DELETE FROM `gestion_formation`;
INSERT INTO `gestion_formation` (`id`, `diplomes`, `etablissement`, `date_debut`, `date_fin`, `localite`, `cv_id`) VALUES
	(1, 'licence1', 'Nangui abrogoua', '2021-07-15', '2020-10-10', 'Abobo-Adjame', 1),
	(2, 'MAITRISE EN PA', 'NANGUI ABROGOUA', '2024-12-30', '2018-10-23', 'ABIDJAN', 3),
	(3, 'MASTER1', 'NANGUI ABROGOUA', '2023-12-30', '2019-10-05', 'Abobo-Adjame', 3),
	(4, 'LICENCE 3', 'Nangui abrogoua', '2022-12-31', '2019-10-10', 'Abobo-Adjame', 3),
	(5, 'BAC', 'LYCEE MODERNE DE PORT-BOUET', '2013-12-31', '2012-10-10', 'PORT-BOUET1', 4),
	(6, 'BEPC', 'LYCEE MODERNE DE PORT-BOUET', '2009-12-31', '2008-10-10', 'PORT-BOUET', 4),
	(7, 'CERTIFICAT DE COUTURE', 'NOTRE DAME DE LA PAIX', '2006-10-10', '2005-05-03', 'VRIDI', 4),
	(8, 'LICENCE EN MARKETING DIGITAL', 'AXE MARKETING', '2023-10-31', '2020-02-14', 'ABIDJAN', 5),
	(9, 'BAC', 'LYCEE MODERNE DE PORT-BOUET', '2008-12-31', '2007-07-06', 'ABIDJAN', 6),
	(10, 'BEPC', 'LYCEE CLASSIQUE', '2016-06-04', '2012-01-31', 'COCODY', 7),
	(11, 'BTS', 'UTC COCODY', '2024-10-08', '2022-09-06', 'COCODY', 7);

-- Listage des données de la table bande_cv.gestion_langue : ~5 rows (environ)
DELETE FROM `gestion_langue`;
INSERT INTO `gestion_langue` (`id`, `nom`, `niveau`, `cv_id`) VALUES
	(1, 'FRANCAIS ET BAOULE', 'Débutant', 3),
	(2, 'FRANCAIS ET BAOULE', 'Débutant', 4),
	(3, 'FRANCAIS ET BAOULE', 'Débutant', 6),
	(4, 'FRANCAIS', 'Débutant', 7),
	(5, 'ANGLAIS', 'Débutant', 7);

-- Listage des données de la table bande_cv.gestion_loisir : ~4 rows (environ)
DELETE FROM `gestion_loisir`;
INSERT INTO `gestion_loisir` (`id`, `libelle`, `cv_id`) VALUES
	(1, 'DANSE ,MUSIQUE ET SPORT', 3),
	(2, 'DANSE ,MUSIQUE ET SPORT', 4),
	(3, 'BASKET', 7),
	(4, 'FOOTABALL', 7);

-- Listage des données de la table bande_cv.gestion_projet : ~1 rows (environ)
DELETE FROM `gestion_projet`;
INSERT INTO `gestion_projet` (`id`, `titre`, `date_debut`, `date_fin`, `description`, `cv_id`) VALUES
	(1, 'PROPRIETAIRE DE MA PROPRE FERME MAIS POUR LE MOMENT AVOIR UN POSTE DANS UNE ENTREPRISE DE LA PLACE', '2000-01-01', NULL, 'AVOIR UN POSTE DANS VOTRE ENTREPRISE ME PERMETTRA D\'ETRE UNE EXPERTE DANS CE DOMAINE', 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
