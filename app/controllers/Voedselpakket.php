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
        // if a post has been submitted enter this block
		if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            // loops through all the post inputs and creates a comma separated string so it can later be put in the db in 1 stored procedure
            $csvString = "";
            foreach ($_POST as $key => $product)
            {
                if (strlen($product) == 0)
                    continue;
                if (strlen($csvString) > 0)
                    $csvString .= ",";
                $csvString .= $key . ":" . $product;
            }

            // validation here!

            // put voedselpakket in db
            $this->voedselpakketModel->createVoedselpakket($klantId, $csvString);

            header("Location: " . URLROOT . "/voedselpakket/");
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

    private function validateCreate($post)
    {

    }
}
