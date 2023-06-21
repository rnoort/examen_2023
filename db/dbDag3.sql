drop database if exists examendrie;
create database examendrie;

use examendrie;

DROP TABLE IF EXISTS `Persoon`;
DROP TABLE IF EXISTS `ContactPerGezin`;
DROP TABLE IF EXISTS `Gezin`;
DROP TABLE IF EXISTS `Contact`;

CREATE TABLE `Contact` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Straat` Varchar(50) NOT NULL,
  `Huisnummer` int NOT NULL,
  `Toevoeging` Varchar(3),
  `Postcode` Varchar(6) NOT NULL,
  `Woonplaats` Varchar(50) NOT NULL,
  `Email` Varchar(320) NOT NULL,
  `Mobiel` Varchar(15) NOT NULL,
  `IsActief` Bit NOT NULL DEFAULT 1,
  `Opmerking` Varchar(255),
  `DatumAangemaakt` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DatumGewijzigd` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE `Gezin` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` Varchar(40) NOT NULL,
  `Code` Varchar(5) NOT NULL UNIQUE,
  `Omschrijving` Varchar(20) NOT NULL,
  `AantalVolwassenen` Int NOT NULL,
  `AantalKinderen` Int NOT NULL,
  `AantalBabys` Int NOT NULL,
  `TotaalAantalPersonen` Int GENERATED ALWAYS AS (`AantalVolwassenen` + `AantalKinderen` + `AantalBabys`) STORED NOT NULL,
  `IsActief` Bit NOT NULL DEFAULT 1,
  `Opmerking` Varchar(255),
  `DatumAangemaakt` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DatumGewijzigd` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE `ContactPerGezin` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `GezinId` int NOT NULL,
  `ContactId` int NOT NULL,
  `IsActief` Bit NOT NULL DEFAULT 1,
  `Opmerking` Varchar(255),
  `DatumAangemaakt` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DatumGewijzigd` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;

CREATE TABLE `Persoon` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `GezinId` Int,
  `Voornaam` Varchar(30) NOT NULL,
  `Tussenvoegsel` Varchar(10),
  `Achternaam` Varchar(30) NOT NULL,
  `Geboortedatum` Date NOT NULL,
  `TypePersoon` Varchar(15) NOT NULL,
  `IsVertegenwoordiger` Bit NOT NULL,
  `IsActief` Bit NOT NULL DEFAULT 1,
  `Opmerking` Varchar(255),
  `DatumAangemaakt` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DatumGewijzigd` Datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB;

ALTER TABLE `ContactPerGezin` ADD FOREIGN KEY (`GezinId`) REFERENCES `Gezin` (`Id`);

ALTER TABLE `ContactPerGezin` ADD FOREIGN KEY (`ContactId`) REFERENCES `Contact` (`Id`);

ALTER TABLE `Persoon` ADD FOREIGN KEY (`GezinId`) REFERENCES `Gezin` (`Id`);

INSERT INTO `Contact` (`Straat`, `Huisnummer`, `Toevoeging`, `Postcode`, `Woonplaats`, `Email`, `Mobiel`) VALUES 
("Prinses Irenestraat", 12, "A", "5271TH", "Maaskantje", "j.van.zevenhuizen@gmail.com",  "+31 623456123"),
("Gibraltarstraat", 234, NULL, "5271TJ", "Maaskantje", "a.bergkamp@hotmail.com",  "+31 623456123"),
("Der Kinderenstraat", 456, "Bis", "5271TH", "Maaskantje", "s.van.de.heuvel@gmail.com",  "+31 623456123"),
("Nachtegaalstraat", 233, "A", "5271TJ", "Maaskantje", "e.scherder@gmail.com",  "+31 623456123"),
("Bertram Russellstraat", 45, NULL, "5271TH", "Maaskantje", "f.de.jong@hotmail.com",  "+31 623456123"),
("Leonardo Da VinciHof", 34, NULL, "5271ZE", "Maaskantje", "h.van.der.berg@gmail.com",  "+31 623456123"),
("Siegfried Knutsenlaan", 234, NULL, "5271ZE", "Maaskantje", "r.ter.weijden@ah.nl",  "+31 623456123"),
("Theo de Bokstraat", 256, NULL, "5271ZH", "Maaskantje", "l.pastoor@gmail.com",  "+31 623456123"),
("Meester van Leerhof", 2, "A", "5271ZH", "Maaskantje", "m.yazidi@gemeenteutrecht.nl",  "+31 623456123"),
("Van Wemelenplantsoen", 300, NULL, "5271TH", "Maaskantje", "b.van.driel@gmail.com",  "+31 623456123"),
("Terlingenhof", 20, NULL, "5271TH", "Maaskantje", "j.pastorius@gmail.com",  "+31 623456356"),
("Veldhoen", 31, NULL, "5271ZE", "Maaskantje", "s.dollaard@gmail.com",  "+31 623452314"),
("ScheringaDreef", 37, NULL, "5271ZE", "Vught", "j.blokker@gemeentevught.nl",  "+31 623452314");

INSERT INTO `Gezin` (`Naam`, `Code`, `Omschrijving`, `AantalVolwassenen`, `AantalKinderen`, `AantalBabys`) VALUES
("ZevenhuizenGezin", "G0001", "Bijstandsgezin", 2, 2, 0),
("BergkampGezin", "G0002", "Bijstandsgezin", 2, 1, 1),
("HeuvelGezin", "G0003", "Bijstandsgezin", 2, 0, 0),
("ScherderGezin", "G0004", "Bijstandsgezin", 1, 0, 2),
("DeJongGezin", "G0005", "Bijstandsgezin", 1, 1, 0),
("VanderBergGezin", "G0006", "AlleenGaande", 1, 0, 0);

INSERT INTO `ContactPerGezin` (`GezinId`, `ContactId`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

INSERT INTO `Persoon` (`GezinId`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Geboortedatum`, `TypePersoon`, `IsVertegenwoordiger`) VALUES
(NULL, "Hans", "van", "Leeuwen", "1958-02-12", "Manager", 0),
(NULL, "Jan", "van der", "Sluijs", "1993-04-30", "Medewerker", 0),
(NULL, "Herman", "den", "Duiker", "1989-08-30", "Vrijwilliger", 0),
(1, "Johan", "van", "Zevenhuizen", "1990-05-20", "Klant", 1),
(1, "Sarah", "den", "Dolder", "1985-03-23", "Klant", 0),
(1, "Theo", "van", "Zevenhuizen", "2015-03-08", "Klant", 0),
(1, "Jantien", "van", "Zevenhuizen", "2016-09-20", "Klant", 0),
(2, "Arjan", NULL, "Bergkamp", "1968-07-12", "Klant", 1),
(2, "Janneke", NULL, "Sanders", "1969-05-11", "Klant", 0),
(2, "Stein", NULL, "Bergkamp", "2009-02-02", "Klant", 0),
(2, "Judith", NULL, "Bergkamp", "2022-02-05", "Klant", 0),
(3, "Mazin", "van", "Vliet", "1968-08-18", "Klant", 0),
(3, "Selma", "van de", "Heuvel", "1965-09-04", "Klant", 1),
(4, "Eva", NULL, "Scherder", "2000-04-07", "Klant", 1),
(4, "Felicia", NULL, "Scherder", "2021-11-29", "Klant", 0),
(4, "Devin", NULL, "Scherder", "2023-03-01", "Klant", 0),
(5, "Frieda", "de", "Jong", "1980-09-04", "Klant", 1),
(5, "Simeon", "de", "Jong", "2018-05-23", "Klant", 0),
(6, "Hanna", "van der", "Berg", "1999-09-09", "Klant", 1);
