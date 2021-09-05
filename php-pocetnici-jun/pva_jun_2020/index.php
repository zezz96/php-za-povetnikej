<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Početna</title>
    <script src='js/jquery-3.4.1.js'></script>
    <script src='js/index.js'></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php
session_start();
require_once("funkcije.php");
require_once("klase/classBaza.php");
require_once("klase/classLog.php");
$db=new Baza();
if(!$db->connect())
{
    echo "Greška prilikom konekcije na bazu!!!<br>".$db->error();
    exit();
}
if(login() AND isset($_GET['odjava']))
{
    Log::upisiLog("logovi/logovanje.txt", "Odjava korisnika '{$_SESSION['ime']}'");
    odjaviKorisnika();
}
if(login())
    prikaziPodatke();
else
{
    ?>
    <div class='podaciPrijava'>
        <input type="text" name='korime' id='korime' placeholder="Unesite korisničko ime"/> 
        <input type="text" name='lozinka' id='lozinka' placeholder="Unesite lozinku"/> 
        <button type='button' id='dugmeZaPrijavu'>Prijavite se</button><br>
        <div id="odgovor"></div>
    </div>
    <?php
}
?>
<h1>VIŠER - Najnovije vesti</h1>
<?php
$upit="SELECT * FROM vwvesti order by id DESC";
if(isset($_GET['kategorija'])) 
    $upit="SELECT * FROM vwvesti WHERE idKategorije=".$_GET['kategorija']." order by id DESC";
$rez=$db->query($upit);
if($db->num_rows($rez)>0)
{
    while($red=$db->fetch_object($rez))
    {
        $klasa="prikazVesti";
        if(login())$klasa="prikazVestiPrijavljen";
        echo "<div class='$klasa'>";
        if(login()){
            echo "<a href='index.php?kategorija=$red->idKategorije'>$red->nazivKategorije</a><br>";
        }
        $naslov=$red->naslov;
        if(login())$naslov="<a href='vest.php?id=$red->id'>$naslov</a>";
        echo "<h2>$naslov</h2>";
        if(login()){
            $sve=explode(" ", $red->tekst);
            $niz=array_splice($sve, 0, 75);
            $tekst=implode(" ", $niz);
            echo "$tekst .....<br>";
            echo "<b>$red->ime $red->prezime</b><br>";
        }
        echo date("d.m.Y H:i", strtotime($red->vreme))."<br>";
        echo "Broj pregleda: $red->brojPregleda<br>";
        echo "<br>";
        echo "</div>";
    }
}
else
    echo "Nema ni jedna vest u bazi";
?>
</body>
</html>
