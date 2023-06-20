USE Examen;
DROP PROCEDURE IF EXISTS spGetAllProductenByVoedselpakketId;

DELIMITER //
    
CREATE PROCEDURE spGetAllProductenByVoedselpakketId
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
        SELECT 
            vpw.Aantal,
            pro.AantalInVoorraad,
            pro.ProductNaam, 
            cat.Naam, 
            Pro.Id 
        FROM (SELECT 
                * 
            FROM VoedselpakketProduct vpr 
            WHERE vpr.VoedselpakketId = _id
        ) vpw 
        RIGHT JOIN Product pro 
        ON vpw.ProductId = pro.Id 
        INNER JOIN Categorie cat 
        ON pro.CategorieId = cat.Id;
END //