
USE Examen;
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