<?= require(APPROOT . '/views/includes/Navbar.php');?>
<div>
    <div class="reserveringTitel" style="align:right;">
        <form <?= URLROOT; ?>/dag3leverancier/index" method="post" >
            <label for="cars">Selecteer leveranciertype</label>
                <select id="type" name="type">
                <option value="Bedrijf">Bedrijf</option>
                <option value="Instelling">Instelling</option>
                <option value="Overheid">Overheid</option>
                <option value="Donor">Donor</option>
                <option value="Particulier">Particulier</option>
                
            </select>
            <button type="submit">Toon Leveranciers</button>
        </form>
    </div>
    <table style="font-family: arial, sans-serif;  border-collapse: collapse;  width: 100%;">
        <thead style="border: 1px solid #dddddd;  text-align: left;  padding: 8px;">
            <th>Naam</th>
            <th>Contactpersoon</th>
            <th>Email</th>
            <th>Mobiel</th>
            <th>Leveranciernummer</th>
            <th>leveranciertype</th>
            <th>Product Details</th>
        </thead>
        <tbody>
            <?= $data['rows']; ?>
        </tbody>
    </table>
</div>
<button href="/landingpages/home">Click Me!</button>

<?php require(APPROOT . '/views/includes/Footer.php');?>