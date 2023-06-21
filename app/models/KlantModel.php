<?php

class KlantModel
{
	private Database $db;

	public function __construct()
	{
		$this->db = new Database();
	}

    public function getAllKlanten()
    {
        $this->db->query("SELECT * FROM vwGetAllKlanten");
        return $this->db->resultSet();
    }

    public function getAllKlantenByPostcode($postcode)
    {
        $this->db->query("SELECT * FROM vwGetAllKlanten WHERE Postcode = :postcode");
        $this->db->bind(":postcode", $postcode);
        return $this->db->resultSet();
    }

    public function getAllPostcodes()
    {
        $this->db->query("SELECT * FROM vwGetAllPostcodes");
        return $this->db->resultSet();
    }

    public function getKlantById($id)
    {
        $this->db->query("SELECT * FROM vwGetKlant WHERE Id = :id");
        $this->db->bind(":id", $id);
        return $this->db->single();
    }

    public function updateKlant($post, $id)
    {
        try
        {
            $this->db->query("CALL spUpdateKlant(:id, :voornaam, :tussenvoegsel, :achternaam, :geboortedatum, :straatnaam, :huisnummer, :toevoeging, :postcode, :woonplaats, :email, :mobiel)");
            $this->db->bind(":id", $id);
            $this->db->bind(":voornaam", $post['voornaam']);
            $this->db->bind(":tussenvoegsel", $post['tussenvoegsel'] == '' ? NULL : $post['tussenvoegsel']);
            $this->db->bind(":achternaam", $post['achternaam']);
            $this->db->bind(":geboortedatum", $post['geboortedatum']);
            $this->db->bind(":straatnaam", $post['straatnaam']);
            $this->db->bind(":huisnummer", $post['huisnummer']);
            $this->db->bind(":toevoeging", $post['toevoeging'] == '' ? NULL : $post['toevoeging']);
            $this->db->bind(":postcode", $post['postcode']);
            $this->db->bind(":woonplaats", $post['woonplaats']);
            $this->db->bind(":email", $post['email']);
            $this->db->bind(":mobiel", $post['mobiel']);
            return $this->db->single();
        } catch (PDOException $e)
        {
            throw $e;
        }
    }
}