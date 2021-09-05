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
if($funkcija=="prijava")
{
    if(isset($_POST['korime']) and isset($_POST['lozinka']))
    {
        $korime=$_POST['korime'];
        $lozinka=$_POST['lozinka'];
        if($korime=="" or $lozinka=="")
        {
            echo "Svi podaci su obavezni";
            exit();
        }
        
        $upit="SELECT * FROM korisnici WHERE email='{$korime}'";
        $rez=$db->query($upit);
        if($db->num_rows($rez)==0)
        {
            echo "Ne postoji korisnik sa korisničkim imenom <b>'{$korime}'</b>";
            Log::upisiLog("../logovi/logovanje.txt", "Pogrešni podaci: '{$korime}' i '{$lozinka}'");
            exit();
        }
        $red=$db->fetch_object($rez);
        if($red->lozinka!=$lozinka)
        {
            echo "Pogrešna lozinka za korisnika <b>'{$korime}'</b>";
            Log::upisiLog("../logovi/logovanje.txt", "Pogrešni podaci: '{$korime}' i '{$lozinka}'");
            exit();
        }
        $_SESSION['id']=$red->id;
        $_SESSION['ime']="$red->ime $red->prezime";
        $_SESSION['status']=$red->status;
        Log::upisiLog("../logovi/logovanje.txt", "Uspešno logovanje za korisnika {$korime}");
        echo "1";
    }
}


?>