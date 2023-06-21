USE `Examendrie`;

DROP VIEW IF EXISTS vwGetAllPostcodes;

CREATE VIEW vwGetAllPostcodes AS
SELECT DISTINCT
    Postcode
FROM `Contact`;