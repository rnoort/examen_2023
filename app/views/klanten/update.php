<?php require(APPROOT . '/views/includes/Navbar.php');?>
<h3 class="text-center"><?= $data['title']; ?></h3>
<form class="form-group" action="<?= URLROOT; ?>/klanten/update" method="post">
    <table>
        <tbody>
            <tr>
                <td>
                    <input class="form-control" type="text" name="Voornaam" value="<?= $data['row']->Voornaam; ?>">
                </td>
            </tr>
            <tr>
                <td>
                    <input class="form-control" type="text" name="Tussenvoegsel" value="<?= $data['row']->TussenVoegsel; ?>">
                </td>
            </tr>

            <tr>
                <td>
                    <input class="form-control" type="text" name="Achternaam" value="<?= $data['row']->Achternaam; ?>">
                </td>
            </tr>
            <tr>
                <td>
                    <input class="form-control" type="text" name="AantalVolwassenen" value="<?= $data['row']->AantalVolwassenen; ?>">
                </td>
            </tr>
            <tr>
                <td>
                    <input class="form-control" type="text" name="AantalKinderen" value="<?= $data['row']->AantalKinderen; ?>">
                </td>
            </tr>
            <tr>
                <td>
                    <input class="form-control" type="text" name="AantalBabys" value="<?= $data['row']->AantalBabys; ?>">
                </td>
            </tr>

            <tr>
                <td>
                    <input type="hidden" name="Id" value="<?= $data['row']->Id; ?>">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="Verstuur">
                </td>
            </tr>
        </tbody>
    </table>
</form>