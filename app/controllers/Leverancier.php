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

        // Show a overview of all leveranciers, pass all the records to the overview
        $this->view('leveranciers/index', $data);
    }

    // TESTING
    public function add($numb1, $numb2)
    {
        $sum = $numb1 + $numb2;

        return $sum;
    }

}