<?php

class Leverancier extends Controller
{

    private $model;

    public function __construct() 
    {
        $this->model = $this->model("LeverancierModel");
    }

    public function index()
    {
        // Get all leveranciers from the database
        $records = $this->model->getLeveranciers();

        // Make data object
        $data = [
            "records" => $records
        ];
        
        // // Message
        // if(!empty($_GET) && isset($_GET["m"]))
        // {
        //     $parts = explode($_GET["m"]);

        //     $action = $parts[0];
        //     $status = $parts[1];

        //     var_dump($parts);
        // }

        // Show a overview of all leveranciers, pass all the records to the overview
        $this->view('leveranciers/index', $data);
    }

    public function create()
    {
        // Clean
        $_POST = filter_input_array(INPUT_POST);
        $_GET = filter_input_array(INPUT_GET);

        if($_SERVER["REQUEST_METHOD"] == "GET") 
        {
            // Make data object
            $data = [
                "post" => $_POST,
            ];

            // Show create page
            $this->view('leveranciers/create', $data);
        } 
            else if($_SERVER["REQUEST_METHOD"] == "POST")
        {
            // Validate
            if(!isset($_POST["bedrijfsnaam"])) return;
            if(!isset($_POST["contactnaam"])) return;
            if(!isset($_POST["email"])) return;
            if(!isset($_POST["telefoonnummer"])) return;
            if(!isset($_POST["straatnaam"])) return;
            if(!isset($_POST["huisnummer"])) return;
            if(!isset($_POST["postcode"])) return;
            if(!isset($_POST["plaats"])) return;
            
            // Create leverancier
            $this->model->createLeverancier($_POST);

            // Send back to overview with a message
            header("location: " . URLROOT . "/leverancier/create?m=s");
        }
    }

    public function delete($id = NULL)
    {
        if($_SERVER["REQUEST_METHOD"] == "GET")
        {
            // Get leverancier from database
            $leverancier = $this->model->getLeverancierById($id);
            
            // Make data object
            $data = [
                "record" => $leverancier
            ];

            // Show page with confirmation
            $this->view("leveranciers/delete", $data);
        }
            else if($_SERVER["REQUEST_METHOD"] == "POST")
        {
            // Delete leverancier
            $this->model->deleteLeverancier($id);
            
            // Show message
            header("location: " . URLROOT . "/leverancier/delete?m=s");
        }
    }

}