<?php

class Dag3Leverancier extends controller{
    public function __construct()
    {
        $this->model = $this->model('Dag3LeverancierModel');
    }

    public function index()
    {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $records = $this->model->getLeveranciersByType($_POST['type']);  
        } else {
            $records = $this->model->getLeveranciers();
        }
        // variable met de data van de database

        $rows = '';
       
        // checkt of er leveranciers zijn
        if($records == null)
        {
            $rows .= '<tr>
                        <td>Er zijn geen leveranciers bekend van het geselecteerde leverancierstype</td>
                    </tr>';
        } else {
            // insert de data in elke row van de tabel
            foreach($records as $value)
            {
                $rows .="
                <tr>
                    <td>$value->Naam</td>
                    <td>$value->ContactPersoon</td>
                    <td>$value->Email</td>
                    <td>$value->Mobiel</td>
                    <td>$value->LeveranciersNummer</td>
                    <td>$value->LeveranciersType</td>
                </tr>";
            }
        }

        // array voor alle data om mee te sturen naar de view
        $data = [
            'rows' => $rows
        ];

        // redirect naar de view
        $this->view('dag3leverancier/index', $data);
        
    }
}