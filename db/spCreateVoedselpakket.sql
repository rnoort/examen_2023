USE `Examen`;
DROP PROCEDURE IF EXISTS spCreateVoedselpakket;

DELIMITER //
    
CREATE PROCEDURE spCreateVoedselpakket
(
    ToSplit VARCHAR(1000),
    _klantId INT
)

BEGIN

	DECLARE Remainder TEXT;
	DECLARE Pos INT DEFAULT 1;
	DECLARE Str VARCHAR(1000);
    DECLARE SubPos INT DEFAULT 1;
    DECLARE Aantal INT UNSIGNED DEFAULT 0;
	DECLARE ProductId INT UNSIGNED DEFAULT 0;
	DECLARE VoedselpakketId INT UNSIGNED DEFAULT 0;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
		SET Remainder = ToSplit;
        
        INSERT INTO `Voedselpakket` (`KlantId`, `DatumSamenstelling`) VALUES (_klantId, CURRENT_TIMESTAMP);
		SET VoedselpakketId = last_insert_id();

		WHILE CHAR_LENGTH(Remainder) > 0 AND Pos > 0 DO
			SET Pos = INSTR(Remainder, ',');
			IF Pos = 0 THEN
				SET Str = Remainder;
			ELSE
				SET Str = LEFT(Remainder, Pos - 1);
			END IF;
			IF TRIM(Str) != '' THEN
				SET SubPos = INSTR(Str, ':');
                SET ProductId = CAST(LEFT(Str, SubPos - 1) AS UNSIGNED);
                SET Aantal = CAST(SUBSTRING(Str, SubPos + 1, CHAR_LENGTH(Str) - SubPos) AS UNSIGNED);
				INSERT INTO `VoedselpakketProduct` (
					 `VoedselpakketId`
                    ,`ProductId`
                    ,`Aantal`
                    ) 
				VALUES (
					 VoedselpakketId
                    ,ProductId
                    ,Aantal
				);
				UPDATE `Product` 
                SET `AantalInVoorraad` = `AantalInVoorraad` - Aantal
                WHERE `Id` = ProductId;
			END IF;

			SET Remainder = SUBSTRING(Remainder, Pos + 1);
		END WHILE;
        COMMIT;
END; //