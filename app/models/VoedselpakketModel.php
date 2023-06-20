<?php

class VoedselpakketModel
{
	private Database $db;

	public function __construct()
	{
		$this->db = new Database();
	}

    public function getKlantPerId($klantId)
    {
        $this->db->query("CALL spGetKlantPerId(:klantId)");
        $this->db->bind(":klantId", $klantId);
        return $this->db->single();
    }

    public function getAllergieenPerKlantId($klantId)
    {
        $this->db->query("CALL spGetAllergieenPerKlantId(:klantId)");
        $this->db->bind(":klantId", $klantId);
        return $this->db->resultSet();
    }

    public function getWensenPerKlantId($klantId)
    {
        $this->db->query("CALL spGetWensenPerKlantId(:klantId)");
        $this->db->bind(":klantId", $klantId);
        return $this->db->resultSet();
    }

    public function getAvailableProducten()
    {
        $this->db->query("SELECT * FROM vwGetAvailableProducten");
        return $this->db->resultSet();
    }

    public function createVoedselpakket($klantId, $csvString)
    {
        try {
            $this->db->query("CALL spCreateVoedselpakket(:csvString, :klantId)");
            $this->db->bind(":csvString", $csvString);
            $this->db->bind(":klantId", $klantId);
            return $this->db->execute();
        } catch (PDOException $e) {
            throw $e;
        }

    }
}