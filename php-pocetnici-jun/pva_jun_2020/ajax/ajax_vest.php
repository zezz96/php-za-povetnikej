<?php
session_start();
require_once("../klase/classBaza.php");
require_once("../klase/classLog.php");
$db=new Baza();
if(!$db->connect())
{
    echo "Baza trenutno nije dostupna!!!!";
    exit();
}
$funkcija=$_GET['funkcija'];
if($funkcija=="povecajLikes")
{
    $id=$_GET['id'];
    $upit="UPDATE vesti SET likes=likes+1 WHERE id=".$id;
    $db->query($upit);
    $upit="SELECT id, naslov, likes FROM vesti WHERE id=".$id;
    $rez=$db->query($upit);
    $red=$db->fetch_object($rez);
    Log::upisiLog("../logovi/statistika.txt", "Korisnik '".$_SESSION['ime']."' je lajkovao vest '$red->naslov'");
    echo $red->likes;
}

if($funkcija=="povecajDislikes")
{
    $id=$_GET['id'];
    $upit="UPDATE vesti SET dislikes=dislikes+1 WHERE id=".$id;
    $db->query($upit);
    $upit="SELECT id, naslov, dislikes FROM vesti WHERE id=".$id;
    $rez=$db->query($upit);
    $red=$db->fetch_object($rez);
    Log::upisiLog("../logovi/statistika.txt", "Korisnik '".$_SESSION['ime']."' je dislajkovao vest '$red->naslov'");
    echo $red->dislikes;
}


?>