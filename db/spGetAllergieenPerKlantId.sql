USE Examen;
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