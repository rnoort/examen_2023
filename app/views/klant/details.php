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
            <a href="<?= URLROOT ?>/klant/wijzigen/<?= $data['Id'] ?>" class="blue">Wijzig</a>
        </div>
        <div class="col">
            <a href="<?= URLROOT ?>/klant" class="blue">terug</a>
            <a href="<?= URLROOT ?>" class="blue">home</a>
        </div>
    </div>
</div>