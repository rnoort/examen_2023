USE VoedselbankMaaskantje;
DROP PROCEDURE IF EXISTS spCreateKlant;

DELIMITER //

CREATE PROCEDURE spCreateKlant(
	Voornaam			Varchar,
	Tussenvoegsel		Varchar,
    Achternaam			Varchar,
    AdresId				INT,
	ContactId			INT,
    AantalVolwassenen	INT,
    AantalKinderen		INT,
	AantalBabys			INT
	)

BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    	ROLLBACK;
    	SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
    
    START TRANSACTION;
		INSERT INTO Klant
        (
			Voornaam,
			Tussenvoegsel,
			Achternaam,
			AantalVolwassenen,
            AantalKinderen,
			AantalBabys
		)
        VALUES
        (
			Voornaam,
			Tussenvoegsel,
			Achternaam,
			AantalVolwassenen,
            AantalKinderen,
			AantalBabys
		);
	COMMIT;
END //
