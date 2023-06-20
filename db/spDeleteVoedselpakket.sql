USE Examen;
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