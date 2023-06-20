<?php

    class LeverancierModel
    {
        private $db;

        public function __construct()
        {
            $this->db = new Database();
        }

        public function getLeveranciers() 
        {
            $this->db->query("CALL getLeveranciers;");
            return $this->db->resultSet();
        }

        public function getLeverancierById($id)
        {

        }

        // public function deleteScore($id)
        // {
        //     $this->db->query("DELETE FROM Score WHERE id = :id;");
        //     $this->db->bind(":id", $id);
        //     $this->db->execute();
        // }
        // public function getScoresByReservation($id)
        // {
        //     $this->db->query("SELECT * FROM Score WHERE reserveringId = :id ORDER BY naam;");
        //     $this->db->bind(":id", $id);
        //     $this->db->execute();
        //     return $this->db->resultSet();
        // }

        // public function createScore($naam, $totaal, $reserveringId)
        // {
        //     $this->db->query("CALL spCreateScore(:naam, :totaal, :rid)");
        //     $this->db->bind(":naam", $naam);
        //     $this->db->bind(":totaal", $totaal);
        //     $this->db->bind(":rid", $reserveringId);
        //     $this->db->execute();
        // }

        // public function editScore($id, $naam, $totaal)
        // {
        //     $this->db->query("UPDATE Score SET naam = :naam, totaal = :totaal WHERE id = :id;");
        //     $this->db->bind(":id", $id);
        //     $this->db->bind(":naam", $naam);
        //     $this->db->bind(":totaal", $totaal);
        //     $this->db->execute();
        // }

        // public function getReservations()
        // {
        //     $this->db->query("SELECT * FROM Reservering;");
        //     $this->db->execute();
        //     return $this->db->resultSet();
        // }

        // public function getScoreById($id)
        // {
        //     $this->db->query("SELECT * FROM Score WHERE id = :id;");
        //     $this->db->bind(":id", $id);
        //     $this->db->execute();
        //     return $this->db->single();
        // }

    }