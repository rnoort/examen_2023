<?php

include APPROOT . "/views/Includes/Navbar.php";

?>

<div class="klanten">
    <h1>Klant Details <?= $data['Klant']->Tussenvoegsel ? "{$data['Klant']->Voornaam} {$data['Klant']->Tussenvoegsel} {$data['Klant']->Achternaam}" : "{$data['Klant']->Voornaam} {$data['Klant']->Achternaam}" ?></h1>

    <table>
        <?php foreach ($data['Klant'] as $key => $value): ?>
        <?php if ($key == "Id") continue; ?>
        <tr>
            <td><?= $key ?></td>
            <?php if ($key != "IsVertegenwoordiger"): ?>
                <td><?= $value ?></td>
            <?php else: ?>
                <td><?= $value == 1 ? "Ja" : "Nee" ?></td>
            <?php endif; ?>
        </tr>
        <?php endforeach; ?>
    </table>
    <div class="row">
        <div class="col">
            <a href="<?= URLROOT ?>/klant/wijzig/"<?= $data['Id'] ?>><button class="blue">Wijzig</button></a>
        </div>
        <div class="col">
            <a href="<?= URLROOT ?>/klant"><button class="blue">terug</button></a>
            <a href="<?= URLROOT ?>"><button class="blue">home</button></a>
        </div>
    </div>
</div>