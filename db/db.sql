drop database if exists examen;
create database examen;

use examen;

CREATE TABLE `Leverancier` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Bedrijfsnaam` varchar(100) NOT NULL,
  `AdresId` int NOT NULL,
  `ContactNaam` varchar(100) NOT NULL,
  `ContactId` int NOT NULL,
  `EerstVolgendeLevering` date,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Contact` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Email` varchar(320) NOT NULL,
  `Telefoonnummer` varchar(25) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Adres` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Straatnaam` varchar(100) NOT NULL,
  `Huisnummer` int(5) NOT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Plaats` varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Klant` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Voornaam` varchar(20),
  `Tussenvoegsel` varchar(10),
  `Achternaam` varchar(20),
  `AdresId` int NOT NULL,
  `ContactId` int NOT NULL,
  `AantalVolwassenen` int NOT NULL DEFAULT 1,
  `AantalKinderen` int NOT NULL DEFAULT 0,
  `AantalBabys` int NOT NULL DEFAULT 0,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Voedselpakket` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `DatumSamenstelling` datetime NOT NULL,
  `DatumUitgifte` datetime NOT NULL,
  `KlantId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `VoedselpakketProduct` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `VoedselpakketId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Product` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `ProductNaam` Varchar(30) UNIQUE NOT NULL,
  `Streepjescode` Varchar(13) UNIQUE NOT NULL,
  `AantalInVoorraad` int,
  `CategorieId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Categorie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` Varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Rol` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(30) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Gebruiker` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Gebruikersnaam` varchar(16) NOT NULL,
  `Wachtwoord` varchar(60) NOT NULL,
  `ContactId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `GebruikerRol` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `GebruikerId` int NOT NULL,
  `RolId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Allergie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(60) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `KlantAllergie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `KlantId` int NOT NULL,
  `AllergieId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `Wens` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(60) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `KlantWens` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `KlantId` int NOT NULL,
  `WensId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL,
  `GewijzigdOp` datetime NOT NULL
) ENGINE=InnoDB;

ALTER TABLE `Leverancier` ADD FOREIGN KEY (`AdresId`) REFERENCES `Adres` (`Id`);

ALTER TABLE `Leverancier` ADD FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`Id`);

ALTER TABLE `Klant` ADD FOREIGN KEY (`AdresId`) REFERENCES `Adres` (`Id`);

ALTER TABLE `Klant` ADD FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`Id`);

ALTER TABLE `Voedselpakket` ADD FOREIGN KEY (`KlantId`) REFERENCES `Klant` (`Id`);

ALTER TABLE `VoedselpakketProduct` ADD FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`);

ALTER TABLE `VoedselpakketProduct` ADD FOREIGN KEY (`VoedselpakketId`) REFERENCES `Voedselpakket` (`Id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`CategorieId`) REFERENCES `Categorie` (`Id`);

ALTER TABLE `Gebruiker` ADD FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`Id`);

ALTER TABLE `GebruikerRol` ADD FOREIGN KEY (`GebruikerId`) REFERENCES `Gebruiker` (`Id`);

ALTER TABLE `GebruikerRol` ADD FOREIGN KEY (`RolId`) REFERENCES `Rol` (`Id`);

ALTER TABLE `KlantAllergie` ADD FOREIGN KEY (`KlantId`) REFERENCES `Klant` (`Id`);

ALTER TABLE `KlantAllergie` ADD FOREIGN KEY (`AllergieId`) REFERENCES `Allergie` (`Id`);

ALTER TABLE `KlantWens` ADD FOREIGN KEY (`KlantId`) REFERENCES `Klant` (`Id`);

ALTER TABLE `KlantWens` ADD FOREIGN KEY (`WensId`) REFERENCES `Wens` (`Id`);

