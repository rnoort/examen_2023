USE Examen;
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