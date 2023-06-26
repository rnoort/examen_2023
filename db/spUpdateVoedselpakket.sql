USE `Examen`;
DROP PROCEDURE IF EXISTS spUpdateVoedselpakket;

DELIMITER //
    
CREATE PROCEDURE spUpdateVoedselpakket
(
    ToSplit VARCHAR(1000),
    _date datetime,
    _id int
)

BEGIN

	DECLARE Remainder TEXT;
	DECLARE Pos INT DEFAULT 1;
	DECLARE Str VARCHAR(1000);
  DECLARE SubPos INT DEFAULT 1;
  DECLARE _Aantal INT UNSIGNED DEFAULT 0;
	DECLARE _ProductId INT UNSIGNED DEFAULT 0;

    
    START TRANSACTION;
        UPDATE `Voedselpakket` SET `DatumUitgifte` = _date WHERE `Id` = _id;
		    SET Remainder = ToSplit;

        WHILE CHAR_LENGTH(Remainder) > 0 AND Pos > 0 DO
			  SET Pos = INSTR(Remainder, ',');
			  IF Pos = 0 THEN
			  	SET Str = Remainder;
			  ELSE
			  	SET Str = LEFT(Remainder, Pos - 1);
			  END IF;
			  IF TRIM(Str) != '' THEN
			  	SET SubPos = INSTR(Str, ':');
				SET _ProductId = CAST(LEFT(Str, SubPos - 1) AS UNSIGNED);
				SET _Aantal = CAST(SUBSTRING(Str, SubPos + 1, CHAR_LENGTH(Str) - SubPos) AS UNSIGNED);
				IF (SELECT EXISTS(SELECT * FROM `VoedselpakketProduct` WHERE `VoedselpakketId` = _id AND `ProductId` = _ProductId)) THEN
					UPDATE `VoedselpakketProduct` SET `Aantal` = _Aantal WHERE VoedselpakketId = _id AND `ProductId` = _ProductId;
				ELSE
					INSERT INTO `VoedselpakketProduct` (
			  	  	           `VoedselpakketId`
                        ,`ProductId`
                        ,`Aantal`
                        ) 
					VALUES (
			  	  	           _id
                        ,_ProductId
                        ,_Aantal
			  	  );
				END IF;
			  END IF;

			  SET Remainder = SUBSTRING(Remainder, Pos + 1);
		    END WHILE;
      COMMIT;
END; //