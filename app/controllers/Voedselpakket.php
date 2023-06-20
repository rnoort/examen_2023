<?php

class Voedselpakket extends Controller
{
	private VoedselpakketModel $voedselpakketModel;

	public function __construct()
	{
		$this->voedselpakketModel = $this->model('VoedselpakketModel');
	}

	public function index()
	{
		$this->view('Voedselpakket/index');
	}

    public function aanmaken($klantId = null)
    {
		if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            var_dump($_POST);
        }

        // klantId is needed to access this page, as this id ties the voedselpakket to the klant. As such, it will redirect the user back to root
        if (!isset($klantId))
            header("Location: " . URLROOT);
        
        // Get all necessary information about the klant
        $klant = $this->voedselpakketModel->getKlantPerId($klantId);
        $allergieen = $this->voedselpakketModel->getAllergieenPerKlantId($klantId);
        $wensen = $this->voedselpakketModel->getWensenPerKlantId($klantId);

        $producten = $this->voedselpakketModel->getAvailableProducten();

        $data = [
            "Naam" => strlen($klant->Tussenvoegsel) > 0 ? "$klant->Voornaam $klant->Tussenvoegsel $klant->Achternaam" : "$klant->Voornaam $klant->Achternaam",
            "Klant" => $klant,
            "Allergieen" => $allergieen,
            "Wensen" => $wensen,
            "Producten" => $producten
        ];
        $this->view('Voedselpakket/aanmaken', $data);
    }
}
