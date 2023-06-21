<?php

include APPROOT . "/views/Includes/Navbar.php";

?>

<div class="klanten">
    <div class="row">
        <div class="col">
            <a href="<?= URLROOT ?>/klant"><h1>Overzicht Klanten</h1></a>
        </div>
        <div class="col">
            <form action="">
                <select name="postcode" id="postcode">
                    <option value="" selected disabled>Selecteer Postcode</option>
                    <option value="">Balls</option>
                </select>
                <button type="submit">Toon Klanten</button>                
            </form>
        </div>
    </div>
    <table>
        <tr>
            <th>Naam Gezin</th>
            <th>Vertegenwoordiger</th>
            <th>E-mailadres</th>
            <th>Mobiel</th>
            <th>Adres</th>
            <th>Woonplaats</th>
            <th>Klant Details</th>
        </tr>
        <?php foreach($data['Klanten'] as $klant): ?>
        <tr>
            <td><?= $klant->Naam ?></td>
            <td><?= $klant->Tussenvoegsel ? "$klant->Voornaam $klant->Tussenvoegsel $klant->Achternaam" : "$klant->Voornaam $klant->Achternaam" ?></td>
            <td><?= $klant->Email ?></td>
            <td><?= $klant->Mobiel ?></td>
            <td><?= "$klant->Straat $klant->Huisnummer $klant->Toevoeging" ?></td>
            <td><?= $klant->Woonplaats ?></td>
            <td class="center"><a href=""><i class='bx bx-notepad'></i></a></td>
        </tr>
        <?php endforeach; ?>
    </table>
    <div class="home">
        <a href="<?= URLROOT ?>"><button>home</button></a>
    </div>
</div>