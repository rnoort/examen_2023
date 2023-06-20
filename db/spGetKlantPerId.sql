USE Examen;
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