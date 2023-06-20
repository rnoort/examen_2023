<?php
class Klanten extends Controller
{

    private $KlantenModel;

    public function __construct()
    {
         $this->KlantenModel = $this->model('KlantenModel');

    }

     public function index(){
        //zorgt ervoor dat de klanten zichtbaar zijn op de website
     $result = $this->KlantenModel->getKlanten();
        $rows = '';
        foreach ($result as $value) {
            $rows .= "<tr>
                         <td>$value->Voornaam</td>
                         <td>$value->TussenVoegsel</td>
                         <td>$value->Achternaam</td>
                         <td>$value->AantalVolwassenen</td>
                         <td>$value->AantalKinderen</td>
                         <td>$value->AantalBabys</td>
                        <td><a href='/klanten/update/$value->Id'>edit</a></td>
                        <td><a href='/klanten/delete/$value->Id'>delete</a></td>
                      </tr>";
        }

        // Stuur de gegevens uit de model naar de view via het $data array
        $data = [
            'title' => "Klanten",
            'rows' => $rows,
        ];
        $this->view('/klanten/index', $data);
    }

 

   public function create(){
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $_POST= filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $result = $this->KlantenModel->newKlant($_POST);
        if($result){
            echo "het toevoegen is gelukt";
            header('location: ' . URLROOT . '/klanten/create');
        }else{
            echo "het toevoegen is niet gelukt";
            header('location: ' . URLROOT . '/klanten/create');
        }
    }
        else{
           $data = [
            'title' => "klant toevoegen",
            
        ];
    
        $this->view('/klanten/create', $data); 
        }
          
    }


    public function delete($id){
        if($this->KlantenModel->deleteKlanten($id)){
            echo "het verwijderen is gelukt";
            header('location: /klanten/test');
    }
}

public function update($id = Null){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $_POST= filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    
            $this->KlantenModel->updateKlant($_POST);

            header("Location: /klanten/test");
        }
            $row = $this->KlantenModel->getSingleKlant($id);
            $data = [
                'title' => "Klant wijzigen",
                'row' => $row
                     
            ];
        
            $this->view('/klanten/update', $data); 
        }
}