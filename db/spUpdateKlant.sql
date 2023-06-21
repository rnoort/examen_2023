USE `Examendrie`;
DROP PROCEDURE IF EXISTS spUpdateKlant;

DELIMITER //
    
CREATE PROCEDURE spUpdateKlant
(
    _id             int,
    _voornaam       Varchar(30),
    _tussenvoegsel  Varchar(10),
    _achternaam     Varchar(30),
    _geboortedatum  date,
    _straatnaam     Varchar(50),
    _huisnummer     int,
    _toevoeging     Varchar(3),
    _postcode       Varchar(6),
    _woonplaats     Varchar(50),
    _email          Varchar(320),
    _mobiel         Varchar(15)

)

BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        UPDATE `Persoon` per
        INNER JOIN `Gezin` gez
        ON per.GezinId = gez.Id
        INNER JOIN `ContactPerGezin` cge
        ON cge.GezinId = gez.Id
        INNER JOIN `Contact` con
        ON con.Id = cge.ContactId
        SET 
             per.Voornaam = _voornaam
            ,per.Tussenvoegsel = _tussenvoegsel
            ,per.Achternaam = _achternaam
            ,per.Geboortedatum = _geboortedatum
            ,con.Straat = _straatnaam
            ,con.Huisnummer = _huisnummer
            ,con.Toevoeging = _toevoeging
            ,con.Postcode = _postcode
            ,con.Woonplaats = _woonplaats
            ,con.Email = _email
            ,con.Mobiel = _mobiel
        WHERE per.Id = _id;
        COMMIT;
END; //