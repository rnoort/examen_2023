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
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `VoedselpakketProduct` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `VoedselpakketId` int NOT NULL,
  `Aantal` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
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
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Categorie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` Varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Rol` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(30) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Gebruiker` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Gebruikersnaam` varchar(16) NOT NULL,
  `Wachtwoord` varchar(60) NOT NULL,
  `ContactId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `GebruikerRol` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `GebruikerId` int NOT NULL,
  `RolId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Allergie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(60) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `KlantAllergie` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `KlantId` int NOT NULL,
  `AllergieId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `Wens` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Naam` varchar(60) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
  `AangemaaktOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GewijzigdOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `KlantWens` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `KlantId` int NOT NULL,
  `WensId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT 0,
  `Opmerking` text,
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


DROP PROCEDURE IF EXISTS getLeveranciers;
DELIMITER //
CREATE PROCEDURE getLeveranciers
(
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN 
    ROLLBACK;
    SELECT 'ERROR';
  end;
  START TRANSACTION;
    SELECT Leverancier.Id as lId, Leverancier.*, Contact.*, Adres.* FROM Leverancier INNER JOIN Adres on Leverancier.AdresId = Adres.Id INNER JOIN Contact on Leverancier.ContactId = Contact.Id;
  COMMIT;
end //
DELIMITER ;

DROP PROCEDURE IF EXISTS getLeverancierById;
DELIMITER //
CREATE PROCEDURE getLeverancierById
(
  p_id INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN 
    ROLLBACK;
    SELECT 'ERROR';
  end;
  START TRANSACTION;
     	SELECT Leverancier.Id as lId, Leverancier.*, Contact.*, Adres.* FROM Leverancier INNER JOIN Adres on Leverancier.AdresId = Adres.Id INNER JOIN Contact on Leverancier.ContactId = Contact.Id WHERE Leverancier.Id = p_id;
  COMMIT;
end //
DELIMITER ;


DROP PROCEDURE IF EXISTS deleteLeverancier;
DELIMITER //
CREATE PROCEDURE deleteLeverancier
(
  p_id INT
)
BEGIN

  DECLARE contactId INT unsigned DEFAULT 0;
  DECLARE adresId INT unsigned DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN 
    ROLLBACK;
    SELECT 'ERROR';
  end;
  START TRANSACTION;
    SET contactId = (SELECT ContactId from Leverancier WHERE Id = p_id);
    SET adresId = (SELECT AdresId from Leverancier WHERE Id = p_id);

    DELETE FROM Contact WHERE id = contactId;
    DELETE FROM Adres WHERE id = adresId;
    DELETE FROM Leverancier WHERE Id = p_id;
  COMMIT;
end //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateLeverancier;
DELIMITER //
CREATE PROCEDURE updateLeverancier
(
  p_id int,
  p_bedrijfsnaam varchar(100),
  p_contactnaam varchar(100),
  p_contactemail varchar(320),
  p_contacttelefoonnummer varchar(25),
  p_straatnaam varchar(100),
  p_huisnummer int(5),
  p_toevoeging varchar(4),
  p_postcode varchar(6),
  p_plaats varchar(50),
  p_eerstvolgendelevering date
)
begin
	
  DECLARE contactId INT unsigned DEFAULT 0;
  DECLARE adresId INT unsigned DEFAULT 0;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN 
    ROLLBACK;
    SELECT 'ERROR';
  end;


  START TRANSACTION;
    SET contactId = (SELECT ContactId from Leverancier WHERE Id = p_id);
    SET adresId = (SELECT AdresId from Leverancier WHERE Id = p_id);

    

    UPDATE Contact SET Email = p_contactemail, Telefoonnummer = p_contacttelefoonnummer WHERE Id = contactId;
    UPDATE Adres SET Straatnaam = p_straatnaam, Huisnummer = p_huisnummer, Toevoeging = p_toevoeging, Postcode = p_postcode, Plaats = p_plaats WHERE Id = AdresId;
    UPDATE Leverancier SET Bedrijfsnaam = p_bedrijfsnaam, ContactNaam = p_contactnaam, EerstVolgendeLevering = p_eerstvolgendelevering WHERE Id = p_id;
  COMMIT;
end //
DELIMITER ;




DROP PROCEDURE IF EXISTS createLeverancier;
DELIMITER //
CREATE PROCEDURE createLeverancier
(
  p_bedrijfsnaam varchar(100),
  p_contactnaam varchar(100),
  p_contactemail varchar(320),
  p_contacttelefoonnummer varchar(25),
  p_straatnaam varchar(100),
  p_huisnummer int(5),
  p_toevoeging varchar(4),
  p_postcode varchar(6),
  p_plaats varchar(50),
  p_eerstvolgendelevering date
)
begin
	
  DECLARE contactId INT unsigned DEFAULT 0;
  DECLARE adresId INT unsigned DEFAULT 0;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN 
    ROLLBACK;
    SELECT 'ERROR';
  end;


  START TRANSACTION;
    INSERT INTO Contact (Email, Telefoonnummer) VALUES (p_contactemail, p_contacttelefoonnummer);
    SET contactId = LAST_INSERT_ID();

    INSERT INTO Adres (Straatnaam, Huisnummer, Toevoeging, Postcode, Plaats) VALUES (p_straatnaam, p_huisnummer, p_toevoeging, p_postcode, p_plaats);
    SET adresId = LAST_INSERT_ID();

    INSERT INTO Leverancier (Bedrijfsnaam, AdresId, ContactNaam, ContactId, EerstVolgendeLevering) VALUES (p_bedrijfsnaam, adresId, p_contactnaam, contactId, p_eerstvolgendelevering);
  COMMIT;
end //
DELIMITER ;


DROP PROCEDURE IF EXISTS spCreateVoedselpakket;

DELIMITER //
    
CREATE PROCEDURE spCreateVoedselpakket
(
    ToSplit VARCHAR(1000),
    _klantId INT
)

BEGIN

	DECLARE Remainder TEXT;
	DECLARE Pos INT DEFAULT 1;
	DECLARE Str VARCHAR(1000);
    DECLARE SubPos INT DEFAULT 1;
    DECLARE Aantal INT UNSIGNED DEFAULT 0;
	DECLARE ProductId INT UNSIGNED DEFAULT 0;
	DECLARE VoedselpakketId INT UNSIGNED DEFAULT 0;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
		SET Remainder = ToSplit;
        
        INSERT INTO `Voedselpakket` (`KlantId`, `DatumSamenstelling`) VALUES (_klantId, CURRENT_TIMESTAMP);
		SET VoedselpakketId = last_insert_id();

		WHILE CHAR_LENGTH(Remainder) > 0 AND Pos > 0 DO
			SET Pos = INSTR(Remainder, ',');
			IF Pos = 0 THEN
				SET Str = Remainder;
			ELSE
				SET Str = LEFT(Remainder, Pos - 1);
			END IF;
			IF TRIM(Str) != '' THEN
				SET SubPos = INSTR(Str, ':');
                SET ProductId = CAST(LEFT(Str, SubPos - 1) AS UNSIGNED);
                SET Aantal = CAST(SUBSTRING(Str, SubPos + 1, CHAR_LENGTH(Str) - SubPos) AS UNSIGNED);
				INSERT INTO `VoedselpakketProduct` (
					 `VoedselpakketId`
                    ,`ProductId`
                    ,`Aantal`
                    ) 
				VALUES (
					 VoedselpakketId
                    ,ProductId
                    ,Aantal
				);
				-- UPDATE `Product` 
                -- SET `AantalInVoorraad` = `AantalInVoorraad` - Aantal
                -- WHERE `Id` = ProductId;
			END IF;

			SET Remainder = SUBSTRING(Remainder, Pos + 1);
		END WHILE;
        COMMIT;
END; //

DROP PROCEDURE IF EXISTS spDeleteVoedselpakket;

DELIMITER //
    
CREATE PROCEDURE spDeleteVoedselpakket
(
	_id	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        DELETE FROM `VoedselpakketProduct` WHERE VoedselpakketId = _id;
        DELETE FROM `Voedselpakket` WHERE Id = _id;
        COMMIT;
END //

DROP PROCEDURE IF EXISTS spGetAllergieenPerKlantId;

DELIMITER //
    
CREATE PROCEDURE spGetAllergieenPerKlantId
(
	_klantId	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT ale.Naam FROM `Klant` kla INNER JOIN `KlantAllergie` kal ON kal.KlantId = kla.Id INNER JOIN `Allergie` ale ON ale.Id = kal.AllergieId WHERE kla.Id = _klantId;
        COMMIT;	
END //

DROP PROCEDURE IF EXISTS spGetAllProductenByVoedselpakketId;

DELIMITER //
    
CREATE PROCEDURE spGetAllProductenByVoedselpakketId
(
	_id	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT 
            vpw.Aantal,
            pro.AantalInVoorraad,
            pro.ProductNaam, 
            cat.Naam, 
            Pro.Id 
        FROM (SELECT 
                * 
            FROM VoedselpakketProduct vpr 
            WHERE vpr.VoedselpakketId = _id
        ) vpw 
        RIGHT JOIN Product pro 
        ON vpw.ProductId = pro.Id 
        INNER JOIN Categorie cat 
        ON pro.CategorieId = cat.Id;
END //

DROP PROCEDURE IF EXISTS spGetKlantPerId;

DELIMITER //
    
CREATE PROCEDURE spGetKlantPerId
(
	_klantId	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT Id, Voornaam, Tussenvoegsel, Achternaam, AantalVolwassenen, AantalKinderen, AantalBabys FROM `Klant` WHERE Id = _klantId;
        COMMIT;	
END //

DROP PROCEDURE IF EXISTS spGetProductById;

DELIMITER //
    
CREATE PROCEDURE spGetProductById
(
	_productId	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT `AantalInVoorraad` FROM `Product` WHERE `Id` = _productId;
END //


DROP PROCEDURE IF EXISTS spGetProductenByVoedselpakketId;

DELIMITER //
    
CREATE PROCEDURE spGetProductenByVoedselpakketId
(
	_id	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT vpr.Aantal, pro.ProductNaam, pro.AantalInVoorraad, cat.Naam FROM `VoedselpakketProduct` vpr INNER JOIN `Product` pro ON pro.Id = vpr.ProductId INNER JOIN `Categorie` cat ON cat.Id = pro.CategorieId WHERE vpr.VoedselpakketId = _id;
END //


DROP PROCEDURE IF EXISTS spGetVoedselpakketById;

DELIMITER //
    
CREATE PROCEDURE spGetVoedselpakketById
(
	_id	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT DatumSamenstelling, DatumUitgifte, KlantId FROM `Voedselpakket` WHERE Id = _id;
END //



DROP PROCEDURE IF EXISTS spGetWensenPerKlantId;

DELIMITER //
    
CREATE PROCEDURE spGetWensenPerKlantId
(
	_klantId	INT
)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
            
	START TRANSACTION;
        SELECT wen.Naam FROM `Klant` kla  INNER JOIN `KlantWens` kwe ON kwe.KlantId = kla.Id INNER JOIN `Wens` wen ON wen.Id = kwe.WensId WHERE kla.Id = _klantId;
        COMMIT;	
END //

DROP PROCEDURE IF EXISTS spUpdateVoedselpakket;

DELIMITER //
    
CREATE PROCEDURE spUpdateVoedselpakket
(
    _date datetime,
    _id int
)

BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        UPDATE `Voedselpakket` SET `DatumUitgifte` = _date WHERE `Id` = _id;
        COMMIT;
END; //

CREATE VIEW vwGetAvailableProducten AS
SELECT pro.Id, pro.ProductNaam, pro.AantalInVoorraad, cat.Naam  FROM `Product` pro INNER JOIN `Categorie` cat ON cat.Id = pro.CategorieId WHERE pro.AantalInVoorraad > 0;