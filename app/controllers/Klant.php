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
}
