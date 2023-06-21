<?php

class Dag3LeverancierModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database(); // Maak een instantie van de Database-klasse voor databaseverbinding
    }

    public function getLeveranciers(){
        
        try
        {
            $this->db->query('SELECT 	
                                lev.Naam as Naam,
                                lev.ContactPersoon as ContactPersoon,
                                con.Email as Email,
                                con.Mobiel as Mobiel,
                                lev.LeveranciersNummer,
                                lev.LeveranciersType
                                from `ContactPerLeverancier` cpl
                                inner join `leverancier` lev
                                on lev.Id = cpl.LeverancierId
                                Inner join `contact` con
                                on con.Id = cpl.ContactId;');
            return $this->db->resultSet(); // Retourneer het resultaat van de query
        }

        catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }

    public function getLeveranciersByType($result){
        
        try
        {
            $this->db->query('SELECT 	
                                lev.Naam as Naam,
                                lev.ContactPersoon as ContactPersoon,
                                con.Email as Email,
                                con.Mobiel as Mobiel,
                                lev.LeveranciersNummer,
                                lev.LeveranciersType
                                from `ContactPerLeverancier` cpl
                                inner join `leverancier` lev
                                    on lev.Id = cpl.LeverancierId
                                Inner join `contact` con
                                    on con.Id = cpl.ContactId
                                where lev.LeveranciersType = :result;');

            $this->db->bind(':result', $result, PDO::PARAM_STR); // Bind de parameter aan de query
            return $this->db->resultSet(); // Retourneer het resultaat van de query
        }

        catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}
