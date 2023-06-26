<?php

include APPROOT . "/views/Includes/Navbar.php";

?>

<div class="voedselpakket">

    <div>
        <h1>Voedselpakket aanpassen</h1>
        <p><?= $data['Naam'] ?></p>
    </div>
    <form action="<?=URLROOT?>/voedselpakket/aanpassen/<?= $data['Id'] ?>" method="post" id="aanpassen">
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
            <div class="dates">
                <div class="text red">
                    <p>Datum Samenstelling:</p>
                    <p>Datum Uitgifte:</p>
                </div>
                <div class="values">
                    <p><?= $data['Voedselpakket']->DatumSamenstelling ?></p>
                    <?php if ($data['Voedselpakket']->DatumUitgifte == NULL): ?>
                    <p><input type="datetime-local" name="uitgifte" id="uitgifte"></p>
                    <?php else: ?>
                    <p><?= $data['Voedselpakket']->DatumUitgifte ?></p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
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
                <td class="input"><input type="number" name="<?= $product->Id ?>" id="product_<?= $product->Id ?>" min="0" max="<?= $product->AantalInVoorraad ?>" value="<?php if ($product->Aantal != NULL) echo $product->Aantal ?>"></td>
            </tr>
            <?php endforeach; ?>
        </table>
        <input type="submit" value="Aanpassen">
        <p class="red"><?= $data['Error'] ?></p>
    </form>
</div>