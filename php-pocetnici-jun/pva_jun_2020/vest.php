<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vesti</title>
    <script src='js/jquery-3.4.1.js'></script>
    <script src='js/vest.js'></script>
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
if(!login()) 
{
    echo "<h1>Morate biti prijavljeni da biste videli vest</h1>";
    echo "<a href='index.php'>Početna</a>";
    exit();
}
prikaziPodatke();

?>
<h1>VIŠER - Najnovije vesti</h1>
<?php
if(!isset($_GET['id']))
{
    echo "<h1>Niste izabrali vest za pregled</h1>";
    echo "<a href='index.php'>Početna</a>";
    exit();
}
$id=$_GET['id'];
$upit="UPDATE vesti SET brojPregleda=brojPregleda+1 WHERE id=".$id;
$db->query($upit);
$upit="SELECT * FROM vwvesti WHERE id=".$id;
$rez=$db->query($upit);
if($db->num_rows($rez)>0)
{
    while($red=$db->fetch_object($rez))
    {
        $klasa="prikazVestiPrijavljen";
        echo "<div class='$klasa'>";
        echo "<a href='index.php?kategorija=$red->idKategorije'>$red->nazivKategorije</a><br>";
        echo "<h2>$red->naslov</h2>";   
        echo "$red->tekst<br>";
        echo "<b>$red->ime $red->prezime</b><br>";
        echo date("d.m.Y H:i", strtotime($red->vreme))."<br>";
        echo "Broj pregleda: $red->brojPregleda<br>";
        echo "<br>";
        echo "<div class='dugme' onclick='povecajLikes($id)'>Dopada mi se (<span id='brojLikes'>$red->likes</span>)</div> ";
        echo "<div class='dugme' onclick='povecajDislikes($id)'>Ne dopada mi se (<span id='brojDislikes'>$red->dislikes</span>)</div> " ;
        echo "</div>";
    }
}
else
    echo "Nema takva vest u bazi";
?>
</body>
</html>
