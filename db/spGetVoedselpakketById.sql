USE Examen;
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