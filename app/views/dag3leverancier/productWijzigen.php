<h1>Wijzig product</h1>
            <form action="<?= URLROOT; ?>/dag3leverancier/productWijzigen/<?= $data['id'] ?>" method="post" class="formcolumn">
                <p><?= $data['notification'] ?></p>
                <input id="datum" name="datum" type="date"><br>
                <button type="sumbit">Wijzigen HoudbaarheidsDatum</button>
                <div>
                    <a href="/dag3leverancier/index">terug</a> 
                    <a href="/dag3landingpages/index">home</a>
                </div>
            </form>
           