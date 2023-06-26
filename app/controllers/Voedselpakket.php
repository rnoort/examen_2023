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
        if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        
            if (isset($_POST['persoon']))
                header("Location: " . URLROOT . "/voedselpakket/aanmaken/{$_POST['persoon']}");
        }

        $data = ["Voedselpakketten" => $this->voedselpakketModel->getAllVoedselpakketten(), "Klanten" => $this->voedselpakketModel->getAllKlanten()];
		$this->view('Voedselpakket/index', $data);
	}

    public function aanmaken($klantId = null)
    {
        // klantId is needed to access this page, as this id ties the voedselpakket to the klant. As such, it will redirect the user back to root
        if (!isset($klantId))
            header("Location: " . URLROOT);

        $error = "";

        // if a post has been submitted enter this block
		if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            // validation here!
            $error = $this->validateCreateVoedselpakket($_POST);

            if (strlen($error) == 0)
            {
                // loops through all the post inputs and creates a comma separated string so it can later be put in the db in 1 stored procedure
                $csvString = "";
                foreach ($_POST as $key => $product)
                {
                    if (strlen($product) == 0)
                        continue;
                    if ($product == 0)
                        continue;
                    if (strlen($csvString) > 0)
                        $csvString .= ",";
                    $csvString .= $key . ":" . $product;
                }

                // no products were selected
                if (strlen($csvString) == 0)
                    $error = "Error: U moet producten selecteren";
    
                // put voedselpakket in db
                else if (!$this->voedselpakketModel->createVoedselpakket($klantId, $csvString))
                {
                    header("Location: " . URLROOT . "/voedselpakket/");
                } else {
                    $error = "Er is iets fout gegaan, probeer het later opnieuw of neem contact op met het beheer";
                }
            }
        }
        
        // Get all necessary information about the klant
        $klant = $this->voedselpakketModel->getKlantPerId($klantId);
        $allergieen = $this->voedselpakketModel->getAllergieenPerKlantId($klantId);
        $wensen = $this->voedselpakketModel->getWensenPerKlantId($klantId);

        $producten = $this->voedselpakketModel->getAvailableProducten();
        $data = [
            "Naam" => isset($klant->Tussenvoegsel) ? "$klant->Voornaam $klant->Tussenvoegsel $klant->Achternaam" : "$klant->Voornaam $klant->Achternaam",
            "Klant" => $klant,
            "Allergieen" => $allergieen,
            "Wensen" => $wensen,
            "Producten" => $producten,
            "Error" => $error
        ];
        $this->view('Voedselpakket/aanmaken', $data);
    }

    public function inzien($id)
    {
        $error = "";

        // id is needed to access this page
        if (!isset($id))
            header("Location: " . URLROOT);

        // gets the data for this voedselpakket from the database and checks if it exists at all
        $voedselpakket = $this->voedselpakketModel->getVoedselpakketById($id);
        if (!$voedselpakket)
        {
            $error = "Dit voedselpakket bestaat niet";
            $data = ["Error" => $error];
        }
        else {
            $voedselpakketProducten = $this->voedselpakketModel->getProductenByVoedselpakketId($id);
    
            $klantId = $voedselpakket->KlantId;
    
            // Get all necessary information about the klant
            $klant = $this->voedselpakketModel->getKlantPerId($klantId);
            $allergieen = $this->voedselpakketModel->getAllergieenPerKlantId($klantId);
            $wensen = $this->voedselpakketModel->getWensenPerKlantId($klantId);
    
            $data = [
                "Naam" => isset($klant->Tussenvoegsel) ? "$klant->Voornaam $klant->Tussenvoegsel $klant->Achternaam" : "$klant->Voornaam $klant->Achternaam",
                "Klant" => $klant,
                "Allergieen" => $allergieen,
                "Wensen" => $wensen,
                "Producten" => $voedselpakketProducten,
                "Voedselpakket" => $voedselpakket,
                "Id" => $id,
                "Error" => $error
            ];
        }
        $this->view('Voedselpakket/inzien', $data);
    }

    public function verwijderen($id)
    {
        // id is needed to access this page
        if (!isset($id))
            header("Location: " . URLROOT);
        $data = ["Id" => $id];
        $this->view('Voedselpakket/verwijderen', $data);
    }

    public function definitief($id)
    {
        // id is needed to access this page
        if (!isset($id))
            header("Location: " . URLROOT);
        if (!$this->voedselpakketModel->deleteVoedselpakket($id))
        {
            header("Location: " . URLROOT . "/voedselpakket/");
        } else {
            $error = "Er is iets fout gegaan, probeer het later opnieuw of neem contact op met het beheer";
        }
    }

    public function aanpassen($id)
    {
        $error = "";

        // id is needed to access this page
        if (!isset($id))
            header("Location: " . URLROOT);

        // gets the data for this voedselpakket from the database and checks if it exists at all
        $voedselpakket = $this->voedselpakketModel->getVoedselpakketById($id);
        if (!$voedselpakket)
        {
            $error = "Dit voedselpakket bestaat niet";
            $data = ["Error" => $error];
        }
        else {

            // if a post has been submitted enter this block
		    if ($_SERVER["REQUEST_METHOD"] == "POST")
            {
			    $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
             
                // validation here!
                $error = $this->validateUpdateVoedselpakket($_POST);

                if (strlen($error) == 0)
                {
                    // loops through all the post inputs and creates a comma separated string so it can later be put in the db in 1 stored procedure
                    $csvString = "";
                    foreach ($_POST as $key => $product)
                    {
                        // uitgifte should not be put in th csv
                        if ($key != 'uitgifte')
                        {
                            // first variable in the csv should not be started with a comma
                            if (strlen($csvString) > 0)
                                $csvString .= ",";
                            // if there's nothing in the form value, insert a 0 in the csv
                            if (strlen($product) == 0)
                                $csvString .= $key . ":0";
                            else
                                $csvString .= $key . ":" . $product;
                        }
                    }
    
                    $this->voedselpakketModel->updateVoedselpakket($_POST, $csvString, $id);
    
                    $voedselpakket = $this->voedselpakketModel->getVoedselpakketById($id);
                }
            }

            // gets all products with the amounts in this voedselpakket but also all the products that are not in this voedselpakket 
            $voedselpakketProducten = $this->voedselpakketModel->getAllProductenByVoedselpakketId($id);

            $klantId = $voedselpakket->KlantId;
    
            // Get all necessary information about the klant
            $klant = $this->voedselpakketModel->getKlantPerId($klantId);
            $allergieen = $this->voedselpakketModel->getAllergieenPerKlantId($klantId);
            $wensen = $this->voedselpakketModel->getWensenPerKlantId($klantId);
    
            $data = [
                "Naam" => isset($klant->Tussenvoegsel) > 0 ? "$klant->Voornaam $klant->Tussenvoegsel $klant->Achternaam" : "$klant->Voornaam $klant->Achternaam",
                "Klant" => $klant,
                "Allergieen" => $allergieen,
                "Wensen" => $wensen,
                "Producten" => $voedselpakketProducten,
                "Voedselpakket" => $voedselpakket,
                "Id" => $id,
                "Error" => $error
            ];
        }
        $this->view('Voedselpakket/aanpassen', $data);
    }

    public function validateCreateVoedselpakket($post)
    {
        foreach ($post as $key => $product)
        {
            if (strlen($product) == 0)
                continue;
            if ($product < 0)
                return "Product aantal mag niet lager dan 0 zijn";
            if ($product > $this->voedselpakketModel->getProductById($key)->AantalInVoorraad)
                return "Product aantal mag niet hoger zijn dan er in het voorraad beschikbaar zijn";
        }
        return "";
    }
    
    public function validateUpdateVoedselpakket($post)
    {
        foreach ($post as $key => $product)
        {
            if (strlen($product) == 0 || $key == "uitgifte")
                continue;
            if ($product < 0)
                return "Product aantal mag niet lager dan 0 zijn";
            if ($product > $this->voedselpakketModel->getProductById($key)->AantalInVoorraad)
                return "Product aantal mag niet hoger zijn dan er in het voorraad beschikbaar zijn";
        }
        return "";
    }
}
