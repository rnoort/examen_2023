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
    </header>

    <div class="p-4 w-full">
        <?php if (empty($_GET["m"])): ?>
            <p>Weet je zeker dat je <span class="font-bold">
                    <?= $data["record"]->Bedrijfsnaam ?>
                </span> wilt verwijderen?</p>

            <form method="post">
                <input type="hidden" value="<?= $data["record"]->Id ?>" name="id">
                <button type="submit"
                    class="bg-red-400 hover:bg-red-500 font-bold px-4 py-1 p-2 rounded text-black">Verwijderen</button>
            </form>
            <br>
            <a class="bg-green-400 hover:bg-green-500 font-bold px-4 py-1 p-2 rounded text-black"
                href="<?= URLROOT . '/leverancier' ?>">Terug</a>
        <?php else: ?>
            <p>De leverancier is verwijderd</p>
            <?php header("refresh: 3;url=" . URLROOT . "/leverancier"); ?>
        <?php endif; ?>
    </div>
</body>

</html>