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
        <h1 class="font-bold text-3xl">Leveranciers</h1>
        <a class="bg-green-400 hover:bg-green-500 font-bold px-4 py-2 rounded"
            href="<?= URLROOT . "/leverancier/create" ?>">Toevoegen</a>
    </header>

    <div class="p-4">
        <?php if (empty($data["records"])): ?>
            <p>Er staan geen leveranciers in het systeem.</p>
        <?php else: ?>
            <table class="w-full text-sm text-left text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                    <tr>
                        <th scope="col">Bedrijfsnaam</th>
                        <th scope="col">Adres</th>
                        <th scope="col">Contact</th>
                        <th scope="col">Eerst volgende levering</th>
                        <th scope="col">Acties</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data["records"] as $record): ?>
                        <tr>
                            <td>
                                <?= $record->Bedrijfsnaam ?>
                            </td>
                            <td>
                                <?= $record->Straatnaam . " " . $record->Huisnummer . " " . $record->Toevoeging . " " . $record->Postcode . " " . $record->Plaats ?>
                            </td>
                            <td>
                                <pre><?= $record->ContactNaam . $record->Email . $record->Telefoonnummer ?></pre>
                            </td>
                            <td>
                                <?= $record->EerstVolgendeLevering ?>
                            </td>

                            <td><a class="bg-orange-400 hover:bg-orange-500 font-bold px-4 py-2 rounded"
                                    href="<?= URLROOT . '/leverancier/update/' . $record->Id ?>">Wijzigen</a></td>
                            <td><a class="bg-red-400 hover:bg-red-500 font-bold px-4 py-2 rounded"
                                    href="<?= URLROOT . '/leverancier/delete/' . $record->Id ?>">Verwijderen</a></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>
</body>

</html>