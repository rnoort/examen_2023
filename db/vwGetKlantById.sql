USE `Examendrie`;

DROP VIEW IF EXISTS vwGetKlant;

CREATE VIEW vwGetKlant AS
SELECT 
     per.Id
    ,per.Voornaam
    ,per.Tussenvoegsel
    ,per.Achternaam
    ,per.Geboortedatum
    ,per.TypePersoon
    ,per.IsVertegenwoordiger
    ,con.Email
    ,con.Mobiel
    ,con.Straat
    ,con.Huisnummer
    ,con.Toevoeging
    ,con.Woonplaats
    ,con.Postcode
FROM `Persoon` per
INNER JOIN `Gezin` gez
ON per.GezinId = gez.Id
INNER JOIN `ContactPerGezin` cge
ON cge.GezinId = gez.Id
INNER JOIN `Contact` con
ON con.Id = cge.ContactId;
