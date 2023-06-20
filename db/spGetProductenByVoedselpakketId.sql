USE Examen;
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