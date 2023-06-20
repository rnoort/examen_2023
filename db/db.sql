drop database if exists examen;
create database examen;

use examen;

DROP TABLE IF EXISTS `Contact`;
DROP TABLE IF EXISTS `Adres`;
DROP TABLE IF EXISTS `Leverancier`;
DROP TABLE IF EXISTS `Klant`;
DROP TABLE IF EXISTS `Voedselpakket`;
DROP TABLE IF EXISTS `Categorie`;
DROP TABLE IF EXISTS `Product`;
DROP TABLE IF EXISTS `VoedselpakketProduct`;
DROP TABLE IF EXISTS `Rol`;
DROP TABLE IF EXISTS `Gebruiker`;
DROP TABLE IF EXISTS `GebruikerRol`;
DROP TABLE IF EXISTS `Allergie`;
DROP TABLE IF EXISTS `KlantAllergie`;
DROP TABLE IF EXISTS `Wens`;
DROP TABLE IF EXISTS `KlantWens`;


CREATE TABLE `Leverancier` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Bedrijfsnaam` varchar(100) NOT NULL,
  `AdresId` int NOT NULL,
  `ContactNaam` varchar(100) NOT NULL,
  `ContactId` int NOT NULL,
  `EerstVolgendeLevering` date,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Contact` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Email` varchar(320) NOT NULL,
  `Telefoonnummer` varchar(25) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Adres` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Straatnaam` varchar(100) NOT NULL,
  `Huisnummer` int(5) NOT NULL,
  `Toevoeging` varchar(4) NULL,
  `Postcode` varchar(6) NOT NULL,
  `Plaats` varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Voedselpakket` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `DatumSamenstelling` datetime NOT NULL,
  `DatumUitgifte` datetime NULL,
  `KlantId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `VoedselpakketProduct` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `VoedselpakketId` int NOT NULL,
  `Aantal` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Product` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `ProductNaam` Varchar(30) UNIQUE NOT NULL,
  `Streepjescode` Varchar(13) UNIQUE NOT NULL,
  `AantalInVoorraad` int,
  `CategorieId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Categorie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` Varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Rol` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(30) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Gebruiker` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Gebruikersnaam` varchar(16) NOT NULL,
  `Wachtwoord` varchar(60) NOT NULL,
  `ContactId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `GebruikerRol` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `GebruikerId` int NOT NULL,
  `RolId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Allergie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(60) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `KlantAllergie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `KlantId` int NOT NULL,
  `AllergieId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Wens` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(60) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `KlantWens` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `KlantId` int NOT NULL,
  `WensId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text NOT NULL,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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

INSERT INTO `Contact` (`Email`, `Telefoonnummer`) VALUES
("albertrijn@ah.nl", "03027891429"),
("tschellen@picnic.nl", "06849218924"),
("rbald@jumbo.nl", "03080941389"),
("dbert@kruidvat.nl", "0689210293"),
("bdam@aldi.nl", "06829104292"),
("bschulding@gmail.nl", "0679433279"),
("hschort@gmail.nl", "0680910902"),
("blop@gmail.nl", "0628491953"),
("tkok@gmail.nl", "0680941815"),
("tbouw@gmail.nl", "0683901511"),
("mjok@maaskantje.nl", "0679433279"),
("pki@maaskantje.nl", "0619910902"),
("dpolyester@maaskantje.nl", "0628932953"),
("balles@maaskantje.nl", "0685810815"),
("pabraham@maaskantje.nl", "0658101511");

INSERT INTO `Adres` (`Straatnaam`, `Huisnummer`, `Toevoeging`, `Postcode`, `Plaats`) VALUES
("Maarsenlaan", 30, NULL, "3892SE", "Utrecht"),
("Currystraat", 12, NULL, "3822SQ", "Utrecht"),
("Offenbachpad", 2, NULL, "3812SE", "Amsterdam"),
("Ketchuplaan", 10, NULL, "3892SQ", "Rotterdam"),
("Bacheraflaan", 51, NULL, "2892TE", "Haarlem"),
("Getfertsingel", 200, NULL, "1892SE", "Enschede"),
("Coenensparkstraat", 12, NULL, "3825SQ", "Den Haag"),
("Gorsveldweg", 2, NULL, "3819SE", "Harlingen"),
("Arestraat", 10, NULL, "3292SQ", "Zutphen"),
("Westkapellelaan", 11, NULL, "2792TE", "Groningen");

INSERT INTO  `Leverancier` (`Bedrijfsnaam`, `AdresId`, `ContactNaam`, `ContactId`, `EerstVolgendeLevering`) VALUES
("Albert Heijn", 1, "Albert Rijn", 1, "2023/07/21"),
("Picnic", 2, "Thomas ter Schellen", 2, "2023/06/21"),
("Jumbo", 3, "Robby Bald", 3, "2023/07/23"),
("Kruidvat", 4, "Dam van Bert", 4, "2023/06/27"),
("Aldi", 5, "Bert van Dam", 5, "2023/08/01");

INSERT INTO `Klant` (`Voornaam`, `Tussenvoegsel`, `Achternaam`, `AdresId`, `ContactId`, `AantalVolwassenen`, `AantalKinderen`, `AantalBabys`) VALUES
("Barry", NULL, "Schulding", 6, 6, 2, 2, 0),
("Harry", "van", "Schort", 7, 7, 1, 4, 0),
("Bert", NULL, "Lop", 8, 8, 1, 0, 2),
("Tim", "de", "Kok", 9, 9, 2, 3, 0),
("Tom", "de", "Bouw", 10, 10, 2, 0, 2);

INSERT INTO `Voedselpakket` (`DatumSamenstelling`, `DatumUitgifte`, `KlantId`) VALUES
("2023/06/19 20:01", "2023/06/20 11:23", 1),
("2023/06/10 12:01", "2023/06/15 13:10", 2),
("2023/06/18 10:21", "2023/06/19 11:00", 3),
("2023/05/10 15:10", "2023/05/20 11:10", 4),
("2023/06/20 08:20", NULL, 5);

INSERT INTO `Categorie` (`Naam`) VALUES
("Aardappelen, groente, fruit"),
("Kaas, vleeswaren"),
("Zuivel, plantaardig en eieren"),
("Bakkerij en banket"),
("Frisdrank, sappen, koffie en thee"),
("Pasta, rijst en wereldkeuken"),
("Soepen, sauzen, kruiden en olie"),
("Snoep, koek, chips en chocolade"),
("Baby, verzorging em hygiëne");

INSERT INTO `Product` (`ProductNaam`, `Streepjescode`, `AantalInVoorraad`, `CategorieId`) VALUES
("Appel", "0589290125826", 202, 1),
("Peer", "0589290125822", 102, 1),
("Ei", "0289280951326", 105, 3),
("Tomatensoep", "9129012589326", 52, 7),
("Luiers", "1280112589326", 3, 9);

INSERT INTO `VoedselpakketProduct` (`ProductId`, `VoedselpakketId`, `Aantal`) VALUES
(1, 1, 3),
(2, 1, 2),
(3, 1, 1),
(4, 2, 5),
(3, 2, 3);

INSERT INTO `Rol` (`Naam`) VALUES 
("Directie"),
("Magazijnmedewerker"),
("Vrijwilliger");

INSERT INTO `Gebruiker` (`Gebruikersnaam`, `Wachtwoord`, `ContactId`) VALUES
("mjok","$2a$12$pkHke3G7loaDzB.zkRIsMu2uE8fhLWaU13hVDCHbkXk.aQgFhLgde", 11),
("pki","$2a$12$ClWmxnyPfXFJkcVNKgLDZ.mlMEEXI0Dn.vzzppoSV6GB0jNylxfy.", 12),
("dpolyester","$2a$12$djZEvXbuHCpfpWdQjNhXRetCOvQS9jZ/bfqNfUUrLcZ1KUm4hyTiC", 13),
("balles","$2a$12$dHUL81WD1nTToc2xfmknfuxmWotH0g3KNzYbdvORQEK2OzXS9n8Qq", 14),
("pabraham","$2a$12$IFrAMYfvh0nauiU7IGa7ie7GGHpPvigRdtioHo94K4ElGx8YTHUFi", 15);

INSERT INTO `GebruikerRol` (`GebruikerId`, `RolId`) VALUES
(1, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 1);

INSERT INTO `Allergie` (`Naam`) VALUES
("Gluten"),
("Pindas"),
("Schaaldieren"),
("Hazelnoten"),
("Lactose");

INSERT INTO `KlantAllergie` (`KlantId`, `AllergieId`) VALUES
(1, 1),
(1, 4),
(3, 1),
(3, 2),
(3, 5);

INSERT INTO `Wens` (`Naam`) VALUES 
("Geen varkensvlees"),
("Veganistisch"),
("Vegetarisch"),
("Geen champignon"),
("Geen zout");

INSERT INTO `KlantWens` (`KlantId`, `WensId`) VALUES
(1, 1),
(2, 3),
(2, 4),
(2, 5),
(3, 4);
