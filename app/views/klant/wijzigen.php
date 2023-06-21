<?php

include APPROOT . "/views/Includes/Navbar.php";

?>

<div class="klanten">
    <h1>Wijzig Klant Details <?= $data['Klant']->Tussenvoegsel ? "{$data['Klant']->Voornaam} {$data['Klant']->Tussenvoegsel} {$data['Klant']->Achternaam}" : "{$data['Klant']->Voornaam} {$data['Klant']->Achternaam}" ?></h1>

    <?= (isset($data['ErrorMessage'])) ? "<div class='message error'>{$data['ErrorMessage']}</div>" : ""; ?>
    <?= (isset($data['SuccessMessage'])) ? "<div class='message success'>{$data['SuccessMessage']}</div>" : ""; ?>

    <form action="<?= URLROOT ?>/klant/wijzigen/<?= $data['Id'] ?>" method="post" id="wijzigen">
        <table>
            <tr>
                <td>Voornaam</td>
                <td>
                    <input type="text" name="voornaam" id="voornaam" value="<?= $_POST['voornaam'] ?? $data['Klant']->Voornaam ?>" maxlength="30" required>
                    <?php if (isset($data['voornaamError'])) echo "<p>{$data['voornaamError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Tussenvoegsel</td>
                <td>
                    <input type="text" name="tussenvoegsel" id="tussenvoegsel" value="<?= $_POST['tussenvoegsel'] ?? $data['Klant']->Tussenvoegsel ?>" maxlength="10">
                    <?php if (isset($data['tussenvoegselError'])) echo "<p>{$data['tussenvoegselError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Achternaam</td>
                <td>
                    <input type="text" name="achternaam" id="achternaam" value="<?= $_POST['achternaam'] ?? $data['Klant']->Achternaam ?>" maxlength="30" required>
                    <?php if (isset($data['achternaamError'])) echo "<p>{$data['achternaamError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Geboortedatum</td>
                <td>
                    <input type="date" name="geboortedatum" id="geboortedatum" value="<?= $_POST['geboortedatum'] ?? $data['Klant']->Geboortedatum ?>" required>
                    <?php if (isset($data['geboortedatumError'])) echo "<p>{$data['geboortedatumError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Type Persoon</td>
                <td>
                    <input type="text" name="typepersoon" id="typepersoon" value="<?= $_POST['typepersoon'] ?? $data['Klant']->TypePersoon ?>" required maxlength="15" disabled>
                    <?php if (isset($data['typepersonError'])) echo "<p>{$data['typepersoonError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Vertegenwoordiger</td>
                <td>
                    <input type="text" name="vertegenwoordiger" id="vertegenwoordiger" value="<?= $_POST['vertegenwoordiger'] ?? $data['Klant']->IsVertegenwoordiger ? "Ja" : "Nee" ?>" required disabled>
                    <?php if (isset($data['vertegenwoordigerError'])) echo "<p>{$data['vertegenwoordigerError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Straatnaam</td>
                <td>
                    <input type="text" name="straatnaam" id="straatnaam" value="<?= $_POST['straatnaam'] ?? $data['Klant']->Straat ?>" maxlength="50" required>
                    <?php if (isset($data['straatnaamError'])) echo "<p>{$data['straatnaamError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Huisnummer</td>
                <td>
                    <input type="number" name="huisnummer" id="huisnummer" value="<?= $_POST['huisnummer'] ?? $data['Klant']->Huisnummer ?>" required>
                    <?php if (isset($data['huisnummerError'])) echo "<p>{$data['huisnummerError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Toevoeging</td>
                <td>
                    <input type="text" name="toevoeging" id="toevoeging" value="<?= $_POST['toevoeging'] ?? $data['Klant']->Toevoeging ?>" maxlength="3">
                    <?php if (isset($data['toevoegingError'])) echo "<p>{$data['toevoegingError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Postcode</td>
                <td>
                    <input type="text" name="postcode" id="postcode" value="<?= $_POST['postcode'] ?? $data['Klant']->Postcode ?>" maxlength="6" required>
                    <?php if (isset($data['postcodeError'])) echo "<p>{$data['postcodeError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Woonplaats</td>
                <td>
                    <input type="text" name="woonplaats" id="woonplaats" value="<?= $_POST['woonplaats'] ?? $data['Klant']->Woonplaats ?>" maxlength="50" required>
                    <?php if (isset($data['woonplaatsError'])) echo "<p>{$data['woonplaatsError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td>
                    <input type="email" name="email" id="email" value="<?= $_POST['email'] ?? $data['Klant']->Email ?>" maxlength="320" required>
                    <div class="float">
                        <i class='bx bxs-envelope'></i>
                    </div>
                    <?php if (isset($data['emailError'])) echo "<p>{$data['emailError']}</p>" ?>
                </td>
            </tr>
            <tr>
                <td>Mobiel</td>
                <td>
                    <input type="tel" name="mobiel" id="mobiel" value="<?= $_POST['mobiel'] ?? $data['Klant']->Mobiel ?>" maxlength="15" required>
                    <?php if (isset($data['mobielError'])) echo "<p>{$data['mobielError']}</p>" ?>
                </td>
            </tr>
        </table>
        <div class="row">
            <div class="col">
                <button type="submit" class="blue">Wijzig Klant Details</button>
            </div>
            <div class="col">
                <a href="<?= URLROOT ?>/klant" class="blue">terug</a>
                <a href="<?= URLROOT ?>" class="blue">home</a>
            </div>
        </div>
    </form>
</div>


