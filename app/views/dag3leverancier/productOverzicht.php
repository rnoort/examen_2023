<?= require(APPROOT . '/views/includes/Navbar.php');?>

<div>
    <table style="font-family: arial, sans-serif;  border-collapse: collapse;  width: 30%;">
        <tr><td><strong>Naam:</strong></td><td><?= $data['leverancierData']->Naam ?></td></tr>
        <tr><td><strong>Leveranciersnummer:</strong></td><td><?= $data['leverancierData']->LeveranciersNummer ?></td></tr>
        <tr><td><strong>LeveranciersType:</strong></td><td><?= $data['leverancierData']->LeveranciersType ?></td></tr>
    </table>

    <table style="font-family: arial, sans-serif;  border-collapse: collapse;  width: 100%;">
        <thead style="border: 1px solid #dddddd;  text-align: left;  padding: 8px;">
            <th>Naam</th>
            <th>Soort allergie</th>
            <th>Barcode</th>
            <th>Houdbaarheidsdatum</th>
            <th>Wijzig product</th>
        </thead>
        <tbody>
            <?= $data['rows']; ?>
        </tbody>
    </table>
</div>

<?php require(APPROOT . '/views/includes/Footer.php');?>