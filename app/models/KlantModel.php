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
}