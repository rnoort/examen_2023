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

    <div class="p-4 w-full max-w-xs">
        <form method="post" action="/leverancier/create">
            <div class="mb-2">
                <label for="bedrijfsnaam" class="block mb-2 text-sm font-medium text-gray-900">Bedrijfsnaam</label>
                <input name="bedrijfsnaam" type="text" id="bedrijfsnaam" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required> 
            </div>
            <h2 class="text-2xl">Contactpersoon</h2>
            <div class="mb-2">
                <label for="contactnaam" class="block mb-2 text-sm font-medium text-gray-900">Naam</label>
                <input name="contactnaam" type="text" id="contactnaam" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required> 
                <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Email</label>
                <input name="email" type="email" id="email" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required> 
                <label for="telefoonnummer" class="block mb-2 text-sm font-medium text-gray-900">Telefoonnummer</label>
                <input name="telefoonnummer" type="text" id="telefoonnummer" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required> 
            </div>
            <h2 class="text-2xl">Adres</h2>
            <div class="mb-2">
                <label for="straatnaam" class="block mb-2 text-sm font-medium text-gray-900">Straatnaam</label>
                <input name="straatnaam" type="text" id="straatnaam" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required> 
                <label for="huisnummer" class="block mb-2 text-sm font-medium text-gray-900">Huisnumer</label>
                <input name="huisnummer" type="text" id="huisnummer" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required> 
                <label for="toevoeging" class="block mb-2 text-sm font-medium text-gray-900">Toevoeging</label>
                <input name="toevoeging" type="text" id="toevoeging" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded"> 
                <label for="postcode" class="block mb-2 text-sm font-medium text-gray-900">Postcode</label>
                <input name="postcode" type="text" id="postcode" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required>
                <label for="plaats" class="block mb-2 text-sm font-medium text-gray-900">Plaats</label>
                <input name="plaats"type="text" id="plaats" class="focus:ring-blue-500 focus:border-blue-500 bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded" required>  
            </div>

            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">Submit</button>
        </form>
    </div>
</body>

</html>