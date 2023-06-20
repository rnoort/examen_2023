USE `Examen`;
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