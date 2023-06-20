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
            try {
                $this->db->query("CALL getLeveranciers;");
                return $this->db->resultSet();
            } catch(PDOException $e) {
                throw $e;
            }
        }

        public function getLeverancierById($id)
        {
            try {
                $this->db->query("CALL getLeverancierById(:id);");
                $this->db->bind(":id", $id);
                return $this->db->single();
            } catch(PDOException $e) {
                throw $e;
            }
        }

        public function deleteLeverancier($id)
        {
            $this->db->query("CALL deleteLeverancier(:id)");
            $this->db->bind(":id", $id);
            $this->db->execute();
        }

        public function createLeverancier($post)
        {
            try {
                $this->db->query("CALL createLeverancier(:bedrijfsnaam, :naam, :email, :telefoonnummer, :straatnaam, :huisnummer, :toevoeging, :postcode, :plaats, :eerstvolgendelevering);");
                $this->db->bind(":bedrijfsnaam", $post["bedrijfsnaam"]);
                $this->db->bind(":naam", $post["contactnaam"]);
                $this->db->bind(":email", $post["email"]);
                $this->db->bind(":telefoonnummer", $post["telefoonnummer"]);
                $this->db->bind(":straatnaam", $post["straatnaam"]);
                $this->db->bind(":huisnummer", $post["huisnummer"]);
                $this->db->bind(":toevoeging", $post["toevoeging"]);
                $this->db->bind(":postcode", $post["postcode"]);
                $this->db->bind(":plaats", $post["plaats"]);
                $this->db->bind(":eerstvolgendelevering", $post["eerstvolgendelevering"] == "" ? null : $post["eerstvolgendelevering"]);
                $this->db->execute();
            } catch(PDOException $e) {
                throw $e;
            }
        }

        public function updateLeverancier($post)
        {
            try {
                $this->db->query("CALL updateLeverancier(:id, :bedrijfsnaam, :naam, :email, :telefoonnummer, :straatnaam, :huisnummer, :toevoeging, :postcode, :plaats, :eerstvolgendelevering);");
                $this->db->bind(":id", $post["lId"]);
                $this->db->bind(":bedrijfsnaam", $post["bedrijfsnaam"]);
                $this->db->bind(":naam", $post["contactnaam"]);
                $this->db->bind(":email", $post["email"]);
                $this->db->bind(":telefoonnummer", $post["telefoonnummer"]);
                $this->db->bind(":straatnaam", $post["straatnaam"]);
                $this->db->bind(":huisnummer", $post["huisnummer"]);
                $this->db->bind(":toevoeging", $post["toevoeging"]);
                $this->db->bind(":postcode", $post["postcode"]);
                $this->db->bind(":plaats", $post["plaats"]);
                $this->db->bind(":eerstvolgendelevering", $post["eerstvolgendelevering"] == "" ? null : $post["eerstvolgendelevering"]);
                $this->db->execute();
            } catch(PDOException $e) {
                throw $e;
            }
        }
    }