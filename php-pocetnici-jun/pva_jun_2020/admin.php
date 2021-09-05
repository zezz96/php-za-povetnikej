<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Administrativni panel</title>
    <script src='js/jquery-3.4.1.js'></script>
    <script src='js/admin.js'></script>
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
if(login() and ($_SESSION['status']=='Administrator' or $_SESSION['status']=='Urednik'))
    prikaziPodatke();
else
{
    echo "Morate biti prijavljeni kao Administrator ili Urednik da biste videli ovu stranicu<br><a href='index.php'>Prijavite se</a>";
    exit();
}
?>
<h1>Administrativni panel</h1>
<div>
<div class='opcija'>
    <h3>Dodavanje/izmena/brisanje vesti</h3>
    <select name="vesti" id="vesti"></select> <br><br>
    <button id="brisanje" type="button">Obrišite izabranu vest</button><br><hr>
    <input type="text" name="id" id="id" readonly/><br><br>
    <input type="text" name="naslov" id="naslov" size="70" placeholder="Unesite naslov"/><br><br>
    <textarea name="tekst" id="tekst" cols="65" rows="10" placeholder="Unesite tekst"></textarea><br><br>
    <select name="kategorije" id="kategorije"></select><br><br>
    <button id="btnVest" name="btnVest">Snimite izmene/vest</button><br><br>
    <div id="divVest"></div>
</div>
<?php
if($_SESSION['status']=="Administrator")
{
?>
<div class='opcija'>
    <h3>Logovi</h3>
    <select name="log" id="log">
        <option value="0">--izaberite log--</option>
        <option value="logovanje.txt">Logovanja</option>
        <option value="statistika.txt">Statistika</option>
    </select><br><br>
    <div id='divlogovi'></div>
</div>
<?php
}
?>

</div>
</body>
</html>
