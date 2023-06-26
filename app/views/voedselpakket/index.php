<?php 

include APPROOT . "/views/Includes/Navbar.php";

?>
<div class="voedselpakket">
    <table>
        <tr>
            <th>Naam</th>
            <th>Datum Samenstelling</th>
            <th>Datum Uitgifte</th>
            <th>Inzien</th>
        </tr>
        <?php foreach($data['Voedselpakketten'] as $voedselpakket): ?>
        <tr>
            <td><?= $voedselpakket->Tussenvoegsel ? "$voedselpakket->Voornaam $voedselpakket->Tussenvoegsel $voedselpakket->Achternaam" : "$voedselpakket->Voornaam $voedselpakket->Achternaam" ?></td>
            <td><?= $voedselpakket->DatumSamenstelling ?></td>
            <td><?= $voedselpakket->DatumUitgifte ?></td>
            <td><a href=""><a href="<?=URLROOT?>/voedselpakket/inzien/<?=$voedselpakket->Id?>"><i class='bx bx-notepad'></i></a></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>