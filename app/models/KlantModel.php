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
}