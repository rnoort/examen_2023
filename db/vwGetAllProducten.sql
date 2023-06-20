USE `Examen`;

CREATE VIEW vwGetAvailableProducten AS
SELECT pro.Id, pro.ProductNaam, pro.AantalInVoorraad, cat.Naam  FROM `Product` pro INNER JOIN `Categorie` cat ON cat.Id = pro.CategorieId WHERE pro.AantalInVoorraad > 0;