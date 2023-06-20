<?php

Class KlantenModel{

    private $db;

    public function __construct(){
        $this->db = new Database();
    }


    //haalt de klanten uit de database en zet ze in de variabele result
    public function getKlanten(){
        $this->db->query("select 
        Kl.Id,
        Kl.Voornaam,
	    Kl.TussenVoegsel,
	    Kl.Achternaam,
        Kl.AantalVolwassenen,
	    Kl.AantalKinderen,
        Kl.AantalBabys
        
        from Klant as Kl");

        $result = $this->db->resultSet();
        return $result;
    }


    //zet de nieuwe klanten in de database
    public function newKlant($post){
        //CALL insert_persoon_and_contact('test', 'de', 'test', '0687654321', 'test@gmail.com');
        $this->db->query("CALL spCreateKlant(:Voornaam, :Tussenvoegsel, :Achternaam, :AantalVolwassenen, :AantalKinderen, :AantalBabys)");
        $this->db->bind(':Voornaam', $post['Voornaam']);
        $this->db->bind(':Tussenvoegsel', $post['Tussenvoegsel']);
        $this->db->bind(':Achternaam', $post['Achternaam']);
        $this->db->bind(':AantalVolwassenen', $post['AantalVolwassenen']);
        $this->db->bind(':AantalKinderen', $post['AantalKinderen']);
        $this->db->bind(':AantalBabys', $post['AantalBabys']);
        return $this->db->execute();
    }

    //verwijdert de klanten en alles waar de klanten aan vast zaten
     public function deleteKlanten($id){
        $this->db->query('DELETE FROM KlantAllergie WHERE KlantId = :id');
        $this->db->bind(':id', $id, PDO::PARAM_INT);
        $this->db->execute();
        $this->db->query('DELETE FROM KlantWens WHERE KlantId = :id');
        $this->db->bind(':id', $id, PDO::PARAM_INT);
        $this->db->execute();

        $this->db->query("SELECT Id FROM VoedselPakket Where KlantId = :id;");
        $this->db->bind(':id', $id, PDO::PARAM_INT);
        $voedselpakketen = $this->db->resultSet();

        foreach($voedselpakketen as $pakket) {
            $this->db->query("DELETE FROM VoedselPakketProduct WHERE VoedselpakketId = :id;");
            $this->db->bind(":id", $pakket->Id);
            $this->db->execute();
        }

        $this->db->query('DELETE FROM VoedselPakket WHERE KlantId = :id');
        $this->db->bind(':id', $id, PDO::PARAM_INT);
        $this->db->execute();
        $this->db->query('DELETE FROM Klant WHERE id = :id');
        $this->db->bind(':id', $id, PDO::PARAM_INT);
        return $this->db->execute();
    }

      public function getSingleKlant($id = NULL)
    {
        $this->db->query("select 
        Kl.Id,
        Kl.Voornaam,
	    Kl.TussenVoegsel,
	    Kl.Achternaam,
        Kl.AantalVolwassenen,
	    Kl.AantalKinderen,
        Kl.AantalBabys
        
        from Klant as Kl");
        $this->db->bind(':id', $id, PDO::PARAM_INT);
        return $this->db->single();
    }

    //zet de veranderde data in de database
     public function updateKlant($post)
         {
               //CALL update_person_and_contact(1, 'sjonnie', 'default', 'mol', '06123456', 'sjon@kurk.nl');
                $this->db->query("UPDATE Klant SET Voornaam = :Voornaam, Tussenvoegsel = :Tussenvoegsel, Achternaam = :Achternaam, AantalVolwassenen = :AantalVolwassenen, AantalKinderen = :AantalKinderen, AantalBabys = :AantalBabys WHERE Id = :Id");
                $this->db->bind(':Id', $post['Id']);
                $this->db->bind(':Voornaam', $post['Voornaam']); 
                $this->db->bind(':Tussenvoegsel', $post['Tussenvoegsel']);
                $this->db->bind(':Achternaam', $post['Achternaam']);
                $this->db->bind(':AantalVolwassenen', $post['AantalVolwassenen']);
                $this->db->bind(':AantalKinderen', $post['AantalKinderen']);
                $this->db->bind(':AantalBabys', $post['AantalBabys']);
                return $this->db->execute();
        }
    

}