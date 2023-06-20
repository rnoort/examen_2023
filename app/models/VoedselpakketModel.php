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

    public function getAllVoedselpakketten()
    {
        $this->db->query("SELECT voe.DatumSamenstelling, voe.DatumUitgifte, kla.Voornaam, kla.Tussenvoegsel, kla.Achternaam FROM `Voedselpakket` voe INNER JOIN `Klant` kla ON kla.Id = voe.KlantId");
        return $this->db->resultSet();
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
            return $this->db->single();
        } catch (PDOException $e) {
            throw $e;
        }
    }

    public function getVoedselpakketById($id)
    {
        $this->db->query("CALL spGetVoedselpakketById(:id)");
        $this->db->bind(":id", $id);
        return $this->db->single();
    }
    
    public function getProductenByVoedselpakketId($id)
    {
        $this->db->query("CALL spGetProductenByVoedselpakketId(:id)");
        $this->db->bind(":id", $id);
        return $this->db->resultSet();
    }

    public function getProductById($productId)
    {
        $this->db->query("CALL spGetProductById(:productId)");
        $this->db->bind(":productId", $productId);
        return $this->db->single();
    }

    public function deleteVoedselpakket($id)
    {
        try {
            $this->db->query("CALL spDeleteVoedselpakket(:id)");
            $this->db->bind(":id", $id);
            return $this->db->single();
        }   catch (PDOException $e) {
            throw $e;
        }
    }
}