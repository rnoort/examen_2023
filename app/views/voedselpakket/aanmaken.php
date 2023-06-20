<?php

include APPROOT . "/views/Includes/Navbar.php";

?>

<div class="voedselpakket">

    <div>
        <h1>Voedselpakket aanmaken</h1>
        <p><?= $data['Naam'] ?></p>
    </div>
    <div class="info">
        <div class="people">
            <div class="text red">
                <p>Volwassenen:</p>
                <p>Kinderen:</p>
                <p>Baby's:</p>
            </div>
            <div class="values">
                <p><?= $data['Klant']->AantalVolwassenen ?></p>
                <p><?= $data['Klant']->AantalKinderen ?></p>
                <p><?= $data['Klant']->AantalBabys ?></p>
            </div>
        </div>
        <div class="wishes">
            <div class="text red">
                <p>Allergieën:</p>
                <p>Wensen:</p>
            </div>
            <div class="values">
                <p><?php 
                if (empty($data['Allergieen'])) 
                    echo "NVT"; 
                else { 
                    echo $data['Allergieen'][0]->Naam;
                    for ($i = 1; $i < count($data['Allergieen']); $i++) 
                    {
                        echo ", ";
                        echo $data['Allergieen'][$i]->Naam;
                    } 
                } ?></p>
                <p>
                    <?php 
                if (empty($data['Wensen'])) 
                    echo "NVT"; 
                else { 
                    echo $data['Wensen'][0]->Naam;
                    for ($i = 1; $i < count($data['Wensen']); $i++) 
                    {
                        echo ", ";
                        echo $data['Wensen'][$i]->Naam;
                    } 
                } ?>
                </p>
            </div>
        </div>
    </div>
    <form action="<?=URLROOT?>/voedselpakket/aanmaken/<?= $data['Klant']->Id ?>" method="post" id="aanmaken">
        <table>
            <tr>
                <th>Naam</th>
                <th>Categorie</th>
                <th>Aantal in voorraad</th>
                <th>Aantal</th>
            </tr>
            <?php foreach($data['Producten'] as $product): ?>
            <tr>
                <td><?= $product->ProductNaam ?></td>
                <td><?= $product->Naam ?></td>
                <td><?= $product->AantalInVoorraad ?></td>
                <td class="input"><input type="number" name="<?= $product->Id ?>" id="product_<?= $product->Id ?>"></td>
            </tr>
            <?php endforeach; ?>
        </table>
        <input type="submit" value="Aanmaken">
    </form>
</div>