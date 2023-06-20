<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leveranciers</title>
    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
    <header class="flex justify-between p-4">
        <h1 class="font-bold text-3xl">Leverancier wijzigen:
        </h1>
    </header>

    <div class="p-4">
        <?php if (empty($_GET["m"])): ?>
            <form method="post" action="/leverancier/update/<?= $data["record"]->lId ?>">
                <input type="hidden" name="lId" value="<?= $data["record"]->lId ?>" name="id">

                <div class="mb-2">
                    <label for="bedrijfsnaam" class="block mb-2 text-sm font-medium text-gray-900">Bedrijfsnaam</label>
                    <input name="bedrijfsnaam" type="text" id="bedrijfsnaam" maxlength="100"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Bedrijfsnaam ?>">
                    <label for="eerstvolgendelevering" class="block mb-2 text-sm font-medium text-gray-900">Eerst volgende
                        levering</label>
                    <input name="eerstvolgendelevering" type="date" id="eerstvolgendelevering"
                        value="<?= $data["record"]->EerstVolgendeLevering ?>"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded">
                </div>
                <h2 class="text-2xl">Contactpersoon</h2>
                <div class="mb-2">
                    <label for="contactnaam" class="block mb-2 text-sm font-medium text-gray-900">Naam</label>
                    <input name="contactnaam" type="text" id="contactnaam" maxlengt="100"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->ContactNaam ?>">
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
                    <input name="email" type="email" id="email" maxlength="320"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Email ?>">
                    <label for="telefoonnummer" class="block mb-2 text-sm font-medium text-gray-900">Telefoonnummer</label>
                    <input name="telefoonnummer" type="text" id="telefoonnummer" maxlength="15"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Telefoonnummer ?>">
                </div>
                <h2 class="text-2xl">Adres</h2>
                <div class="mb-2">
                    <label for="straatnaam" class="block mb-2 text-sm font-medium text-gray-900">Straatnaam</label>
                    <input name="straatnaam" type="text" id="straatnaam" maxlength="100"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Straatnaam ?>">
                    <label for="huisnummer" class="block mb-2 text-sm font-medium text-gray-900">Huisnumer</label>
                    <input name="huisnummer" type="number" id="huisnummer" max="9999"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Huisnummer ?>">
                    <label for="toevoeging" class="block mb-2 text-sm font-medium text-gray-900">Toevoeging</label>
                    <input name="toevoeging" type="text" id="toevoeging" maxlength="4"
                        value="<?= $data["record"]->Toevoeging ?>"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded">
                    <label for="postcode" class="block mb-2 text-sm font-medium text-gray-900">Postcode</label>
                    <input name="postcode" type="text" id="postcode" maxlength="6"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Postcode ?>">
                    <label for="plaats" class="block mb-2 text-sm font-medium text-gray-900">Plaats</label>
                    <input name="plaats" type="text" id="plaats" maxlength="50"
                        class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"
                        required value="<?= $data["record"]->Plaats ?>">
                </div>

                <button type="submit"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">Wijzigen</button>
            </form>
        <?php else: ?>
            <?php if ($_GET["m"] = "s"): ?>
                <p>De leverancier is gewijzigd</p>
                <?php header("refresh: 3;url=" . URLROOT . "/leverancier"); ?>
            <?php elseif ($_GET["m"] == "f"): ?>
                <p>Er is een fout opgetreden: de database heeft een fout.</p>
                <?php header("refresh: 3;url=" . URLROOT . "/leverancier"); ?>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</body>

</html>