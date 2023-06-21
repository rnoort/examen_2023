<?php

class Klant extends Controller
{
	private KlantModel $klantModel;

	public function __construct()
	{
		$this->klantModel = $this->model('KlantModel');
	}

	public function index()
	{
        // check if post has been submitted and if it the select field actually has been set, as default selected has no value
		if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['postcode']))
        {
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            // gets all klanten with gives postcode
            $klant = $this->klantModel->getAllKlantenByPostcode($_POST['postcode']);

        // default view
        } else
            $klant = $this->klantModel->getAllKlanten();

        // gets all unique postcodes used for the dropdown/select options
        $data = ["Klanten" => $klant, "Postcodes" => $this->klantModel->getAllPostcodes()];
		$this->view('Klant/index', $data);
	}

    public function details($id = null)
    {
        // no id is given in url
        if (!$id)
            header("Location: " . URLROOT);

        $klant = $this->klantModel->getKlantById($id);

        // klant id does not exist
        if (!$klant)
            header("Location: " . URLROOT);

        $data = ["Klant" => $klant, "Id" => $id];

		$this->view('Klant/details', $data);
    }

    public function wijzigen($id = null)
    {
        $data = [];

        // check if post has been submitted
		if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
			$_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            // validation!
            $data = $this->validateWijzigenKlant($_POST);

            // 0 if no errors were found in user input
            if (count($data) == 0)
            {
                $return = $this->klantModel->updateKlant($_POST, $id);
                if ($return)
                {
                    // error
                    $data["ErrorMessage"] = "De contactgegevens kunnen niet worden gewijzigd";
                } else {
                    $data["SuccessMessage"] = "De klantgegevens zijn gewijzigd";
                    header("Refresh:3; url=" . URLROOT . "/klant/details/$id");
                }
            }
        }

        // no id is given in url
        if (!$id)
            header("Location: " . URLROOT);

        $klant = $this->klantModel->getKlantById($id);

        // klant id does not exist
        if (!$klant)
            header("Location: " . URLROOT);

        $data["Klant"] = $klant;
        $data["Id"] = $id;

		$this->view('Klant/wijzigen', $data);
    }

    private function validateWijzigenKlant($post)
    {
        $data = [];

        // checks every value in array if they are empty
        foreach ($post as $key => $value)
        {
            if ($key == "tussenvoegsel" || $key == "toevoeging")
                continue;
            if (strlen($value) == 0)
                $data[$key . "Error"] = "Veld mag niet leeg zijn";
        }

        // all postcodes in Maaskantje according to google
        $maaskantjePostcodes = ['5271TH', '5271TJ', '5271XT', '5271XV', '5271ZD', '5271ZE', '5271ZG', '5271ZH'];

        // postcode checks whether user input is inside Maaskantje
        if (!in_array($post['postcode'], $maaskantjePostcodes))
            $data['postcodeError'] = "Deze postcode komt niet uit de regio Maaskantje";

        // if any errors occur this message will show atop the screen
        if (count($data) > 0)
            $data["ErrorMessage"] = "De contactgegevens kunnen niet worden gewijzigd";
        return $data;
    }
}
