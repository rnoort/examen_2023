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
        $data = ["Klanten" => $this->klantModel->getAllKlanten()];
		$this->view('Klant/index', $data);
	}
}
