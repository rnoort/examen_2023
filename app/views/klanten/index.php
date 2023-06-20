<?php require(APPROOT . '/views/includes/Navbar.php');?>

<h3 class="text-center"> <?= $data['title'] ?></h3>


<table class="table table-hover ">
    <thead>
        <tr>
            <th scope="col">Voornaam</th>
            <th scope="col">Tussenvoegsel</th>
            <th scope="col">Achternaam</th>
            <th scope="col">AantalVolwassenen</th>
            <th scope="col">AantalKinderen</th>
            <th scope="col">AantalBabys</th>
        </tr>
    </thead>
    <tbody>
         <?= $data['rows']  ?>
    </tbody>

</table>

<a href="<?= URLROOT ?>/klanten/create">
   Nieuwe Klant
</a>