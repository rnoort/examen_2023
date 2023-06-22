<?php

include APPROOT . "/views/Includes/Navbar.php";

?>

<div class="klanten">
    <div class="row">
        <div class="col">
            <h1>Overzicht Klanten</h1>
        </div>
        <div class="col">
            <form action="<?= URLROOT ?>/klant" method="post">
                <select name="postcode" id="postcode" required>
                    <option <?php if (!isset($_POST['postcode'])) echo "selected"; ?> disabled>Selecteer Postcode</option>
                    <?php foreach($data['Postcodes'] as $postcode): ?>
                        <option value="<?= $postcode->Postcode ?>" 
                            <?php 
                            if (isset($_POST['postcode'])) 
                            {
                                if ($postcode->Postcode == $_POST['postcode']) 
                                    echo "selected";
                            } ?>
                            >
                            <?= $postcode->Postcode ?>
                        </option>
                    <?php endforeach; ?>
                </select>
                <button type="submit" class="gray">Toon Klanten</button>                
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
        <?php if ($data['Klanten']):?>
        <?php foreach($data['Klanten'] as $klant): ?>
            <tr>
                <td><?= $klant->Naam ?></td>
                <td><?= $klant->Tussenvoegsel ? "$klant->Voornaam $klant->Tussenvoegsel $klant->Achternaam" : "$klant->Voornaam $klant->Achternaam" ?></td>
                <td><?= $klant->Email ?></td>
                <td><?= $klant->Mobiel ?></td>
                <td><?= "$klant->Straat $klant->Huisnummer $klant->Toevoeging" ?></td>
                <td><?= $klant->Woonplaats ?></td>
                <td class="center"><a href="<?= URLROOT ?>/klant/details/<?= $klant->Id ?>"><i class='bx bx-notepad'></i></a></td>
            </tr>
        <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="7"><div class="error">Er zijn geen klanten bekent die de geselecteerde postcode hebben</div></td>
            </tr>
        <?php endif; ?>
    </table>
    <div class="flex-end">
        <a href="/landingpages/index"<?= URLROOT ?>" class="blue">home</a>
    </div>
</div>