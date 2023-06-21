USE `Examendrie`;

DROP VIEW IF EXISTS vwGetAllKlanten;

CREATE VIEW vwGetAllKlanten AS
SELECT 
     per.Id
    ,gez.Naam
    ,per.Voornaam
    ,per.Tussenvoegsel
    ,per.Achternaam
    ,con.Email
    ,con.Mobiel
    ,con.Straat
    ,con.Huisnummer
    ,con.Toevoeging
    ,con.Woonplaats
    ,con.Postcode
FROM `Contact` con 
INNER JOIN `ContactPerGezin` cge 
ON con.Id = cge.ContactId 
INNER JOIN `Gezin` gez 
ON cge.GezinId = gez.Id 
INNER JOIN (
    SELECT 
        * 
    FROM `Persoon` 
    WHERE IsVertegenwoordiger = 1
) per 
ON gez.Id = per.GezinId;
