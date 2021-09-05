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
if($funkcija=="log")
{
    $fajl=$_POST['fajl'];
    if(file_exists("../logovi/".$fajl))
    {
        $odgovor=file_get_contents("../logovi/".$fajl);
        $odgovor=str_replace("\r\n", "<br>", $odgovor);
        echo $odgovor;
    }
    else
        echo "Fajl ne postoji!!!!";
    
}

if($funkcija=="popuniSelect")
{
    
    $upit="SELECT * FROM vesti";
    if($_SESSION['status']=="Urednik")$upit.=" WHERE idKorisnika=".$_SESSION['id'];
    $rez=$db->query($upit);
    $sve=$db->fetch_all($rez);
    echo JSON_encode($sve, 256);
}

if($funkcija=="popuniKategorije")
{
    $upit="SELECT * FROM kategorije";
    $rez=$db->query($upit);
    $sve=$db->fetch_all($rez);
    echo JSON_encode($sve, 256);
}

if($funkcija=="brisanje")
{
    $id=$_POST['id'];
    $upit="DELETE FROM vesti WHERE id=$id";
    $db->query($upit);
    if($db->affected_rows()==1)
    {
        echo "Uspešno izbrisana vest";  
        Log::upisiLog("../logovi/statistika.txt", "Korisnik '".$_SESSION['ime']."' je obrisao vest sa id-jem $id");
    }
        
    else
        echo "Greška prilikom brisanja vesti<br>".$db->error();
}

if($funkcija=="prikaziVest")
{
    $id=$_POST['id'];
    $upit="SELECT * FROM vesti WHERE id=$id";
    $rez=$db->query($upit);
    $sve=$db->fetch_all($rez);
    echo JSON_encode($sve, 256);
}

if($funkcija=="vest")
{
    $id=$_POST['id'];
    $naslov=$_POST['naslov'];
    $tekst=$_POST['tekst'];
    $idKategorije=$_POST['kategorije'];
    if($naslov=="" or $tekst=="" or $idKategorije=="0")
    {
        echo "Niste uneli sve podatke!!!";
        exit();
    }
    if($id=="")
        $upit="INSERT INTO vesti (naslov, tekst, idKorisnika, idKategorije) VALUES ('{$naslov}', '{$tekst}', ".$_SESSION['id'].",{$idKategorije})";
    else
        $upit="UPDATE vesti SET naslov='{$naslov}', tekst='{$tekst}', idKategorije={$idKategorije} WHERE id=$id";
    $db->query($upit);
    if($db->error())
        echo "GREŠKA<br>".$db->error();
    else if($id=="")
    {
        echo "Uspešno snimljeni podaci";
        Log::upisiLog("../logovi/statistika.txt", "Korisnik '".$_SESSION['ime']."' je dodao vest '$naslov'");
    }
    else 
    {
        echo "Uspešno izmenjeni podaci";
        Log::upisiLog("../logovi/statistika.txt", "Korisnik '".$_SESSION['ime']."' je izmenio vest '$naslov'");
    }

}

