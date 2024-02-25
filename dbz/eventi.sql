-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.27-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database bellieventi
DROP DATABASE IF EXISTS `bellieventi`;
CREATE DATABASE IF NOT EXISTS `bellieventi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `bellieventi`;

-- Dump della struttura di tabella bellieventi.amicizieutenti
CREATE TABLE IF NOT EXISTS `amicizieutenti` (
  `Id_Amicizia` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Utente1` int(11) DEFAULT NULL,
  `Id_Utente2` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Amicizia`),
  KEY `Id_Utente1` (`Id_Utente1`),
  KEY `Id_Utente2` (`Id_Utente2`),
  CONSTRAINT `Id_Utente1` FOREIGN KEY (`Id_Utente1`) REFERENCES `utenti` (`Id_Utente`),
  CONSTRAINT `Id_Utente2` FOREIGN KEY (`Id_Utente2`) REFERENCES `utenti` (`Id_Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella bellieventi.amicizieutenti: ~0 rows (circa)

-- Dump della struttura di tabella bellieventi.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `ID_Evento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL DEFAULT 'Nuovo Evento',
  `Luogo` varchar(50) NOT NULL DEFAULT 'Da definire',
  `Indirizzo` varchar(50) NOT NULL DEFAULT 'Da definire',
  `Citta` varchar(50) NOT NULL DEFAULT 'Da definire',
  `Data` date NOT NULL,
  `Ora` time NOT NULL,
  `Informazioni_Luogo` varchar(600) NOT NULL DEFAULT 'Da definire',
  `Descrizione_Evento` varchar(300) NOT NULL DEFAULT 'Da definire',
  `Tipo` varchar(10) NOT NULL DEFAULT 'Privato',
  `ID_Host` int(11) NOT NULL,
  PRIMARY KEY (`ID_Evento`),
  KEY `ID_Host` (`ID_Host`),
  CONSTRAINT `ID_Host` FOREIGN KEY (`ID_Host`) REFERENCES `utenti` (`Id_Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella bellieventi.evento: ~0 rows (circa)

-- Dump della struttura di tabella bellieventi.invito
CREATE TABLE IF NOT EXISTS `invito` (
  `ID_Invito` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Invitato` int(11) DEFAULT NULL,
  `ID_Evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Invito`),
  KEY `ID_Invitato` (`ID_Invitato`),
  KEY `ID_Event` (`ID_Evento`),
  CONSTRAINT `ID_Event` FOREIGN KEY (`ID_Evento`) REFERENCES `evento` (`ID_Evento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_Invitato` FOREIGN KEY (`ID_Invitato`) REFERENCES `utenti` (`Id_Utente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella bellieventi.invito: ~0 rows (circa)

-- Dump della struttura di tabella bellieventi.partecipazione
CREATE TABLE IF NOT EXISTS `partecipazione` (
  `ID_Partecipazione` int(11) NOT NULL,
  `ID_Utente` int(11) DEFAULT NULL,
  `ID_Evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Partecipazione`),
  KEY `ID_Utente` (`ID_Utente`),
  KEY `ID_Evento` (`ID_Evento`),
  CONSTRAINT `ID_Evento` FOREIGN KEY (`ID_Evento`) REFERENCES `evento` (`ID_Evento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ID_Utente` FOREIGN KEY (`ID_Utente`) REFERENCES `utenti` (`Id_Utente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella bellieventi.partecipazione: ~0 rows (circa)

-- Dump della struttura di tabella bellieventi.utenti
CREATE TABLE IF NOT EXISTS `utenti` (
  `Id_Utente` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `Data_Nascita` date DEFAULT NULL,
  PRIMARY KEY (`Id_Utente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella bellieventi.utenti: ~10 rows (circa)
INSERT INTO `utenti` (`Id_Utente`, `Username`, `Password`, `Mail`, `Nome`, `Cognome`, `Data_Nascita`) VALUES
	(1, 'sunnyday23', 'segreta', 'user1@example.com', 'John', 'Doe', '1990-01-01'),
	(2, 'guitarlover', 'segreta', 'user2@example.com', 'Jane', 'Smith', '1985-03-15'),
	(3, 'dancequeen', 'segreta', 'user3@example.com', 'Alice', 'Johnson', '1988-07-20'),
	(4, 'sportsfanatic', 'segreta', 'user4@example.com', 'Bob', 'Brown', '1992-11-10'),
	(5, 'travelbug', 'segreta', 'user5@example.com', 'Emily', 'Wilson', '1995-04-25'),
	(6, 'bookworm', 'segreta', 'user6@example.com', 'Michael', 'Taylor', '1983-09-08'),
	(7, 'foodie', 'segreta', 'user7@example.com', 'Sophia', 'Martinez', '1987-12-12'),
	(8, 'starwarsfan', 'segreta', 'user8@example.com', 'William', 'Anderson', '1991-06-30'),
	(9, 'musicjunkie', 'segreta', 'user9@example.com', 'Olivia', 'Garcia', '1989-02-18'),
	(10, 'photographylover', 'segreta', 'user10@example.com', 'Daniel', 'Lee', '1986-10-05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
