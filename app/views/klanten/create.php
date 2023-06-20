<?php require(APPROOT . '/views/includes/Navbar.php');?>
<h3 class="text-center"><?= $data['title'] ?></h3>
<form class="form-group" action="<?= URLROOT; ?>/klanten/create" method="post">
    <table>
        <tbody>
            <tr>
                <td>
                    Voornaam:
                </td>
                <td>
                    <input class="form-control" type="text" name="Voornaam" required>
                </td>
            </tr>
            <tr>
                <td>
                    Tussenvoegsel:
                </td>
                <td>
                    <input class="form-control" type="text" name="Tussenvoegsel">
                </td>
            </tr>
            <tr>
                <td>
                    Achternaam:
                </td>
                <td>
                    <input class="form-control" type="text" name="Achternaam" required>
                </td>
            </tr>
            <tr>
                <td>
                    Aantal Volwassenen:
                </td>
                <td>
                    <input class="form-control" type="text" name="AantalVolwassenen" required>
                </td>
            </tr>
            <tr>
                <td>
                    Aantal Kinderen:
                </td>
                <td>
                    <input class="form-control" type="text" name="AantalKinderen" required>
                </td>
            </tr>
            <tr>
                <td>
                    Aantal Baby's:
                </td>
                <td>
                    <input class="form-control" type="text" name="AantalBabys" required>
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