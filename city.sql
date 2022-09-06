CREATE DATABASE citysport;

USE citysport

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

SELECT User, Host FROM mysql.user;

CREATE TABLE `clients` (
  `idxClient` int(9) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(75) NOT NULL,
  `contact` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL,
  PRIMARY KEY (`idxClient`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `commandes` (
  `idxCommande` int(9) NOT NULL AUTO_INCREMENT,
  `idxClient` int(9) NOT NULL,
  `date` varchar(10) NOT NULL,
  PRIMARY KEY (`idxCommande`),
  INDEX par_ind (`idxClient`),
    FOREIGN KEY (`idxClient`)
        REFERENCES clients(`idxClient`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `marques` (
  `idxMarque` int(9) NOT NULL AUTO_INCREMENT,
  `marque` varchar(25) NOT NULL,
  `logo` varchar(10) NOT NULL,
  PRIMARY KEY (`idxMarque`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `chaussures` (
  `idxChaussure` int(9) NOT NULL AUTO_INCREMENT,
  `idxMarque` int(9) NOT NULL,
  `taille` int(2) NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `prix` float NOT NULL,
  `nomChaussure` varchar(25) NOT NULL,
  PRIMARY KEY (`idxChaussure`),  
  INDEX par_ind (`idxMarque`),
    FOREIGN KEY (`idxMarque`)
        REFERENCES marques(`idxMarque`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `detailcommandes` (
  `idxCommande` int(9) NOT NULL AUTO_INCREMENT,
  `idxChaussure` int(9) NOT NULL,
  `quantite` int(3) NOT NULL,
  PRIMARY KEY (`idxCommande`),
  INDEX par_ind (`idxChaussure`),
    FOREIGN KEY (`idxChaussure`)
        REFERENCES chaussures(`idxChaussure`)
        ON DELETE CASCADE
  
) ENGINE=Innodb DEFAULT CHARSET=utf8;



INSERT INTO `marques` (`idxMarque`, `marque`, `logo`) VALUES
(1, 'Adidas', 'LogoAdidas'),
(2, 'Nike', 'LogoNike'),
(3, 'Puma', 'LogoPuma');


INSERT INTO `chaussures` (`idxChaussure`, `idxMarque`, `taille`, `couleur`, `prix`, `nomChaussure`) VALUES
(3, 3, 45, 'rouge', 50000, 'SPARCO'),
(1, 1, 35, 'gris', 23000, 'ADENCO'),
(2, 2, 40, 'Jaune', 40000, 'NIKE ZOOM');


-- LISTE LES MARQUES CONTENUS DANS DANS LA TABLES CHAUSSURES
SELECT marque FROM marques;

-- SUPPRIME LA CHASSURE DE MARQUE SPARCO
DELETE FROM chaussures WHERE idxChaussure = 1;  

-- MISE A JOUR LA CHASSURE DE MARQUE SPARCO
UPDATE chaussures SET nomChaussure = 'ADENCO2' WHERE idxChaussure = 2;