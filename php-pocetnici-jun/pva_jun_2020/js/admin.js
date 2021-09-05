$(document).ready(function(){
    popuniSelect();
    popuniKategorije();
    $("#log").change(function(){
        let fajl=$(this).val();
        if(fajl=="0")
        {
            $("#divlogovi").html("");
            return false;
        }
        $.post("ajax/ajax_admin.php?funkcija=log",{fajl:fajl}, function(response){
            $("#divlogovi").html(response);
        })
    })

    $("#brisanje").click(function(){
        let id=$("#vesti").val();
        if(id=="0")
        {
            $("#divVest").html("Niste izabrali vest za brisanje");
            return false;
        }
        if(!confirm("Da li ste sigurni da želite da izbrišete vest?")) return false;
        $.post("ajax/ajax_admin.php?funkcija=brisanje", {id:id}, function(response){
            $("#divVest").html(response);
            popuniSelect();
            ocistiVest();
        })
    })

    $("#btnVest").click(function(){
        let id=$("#id").val();
        let naslov=$("#naslov").val();
        let tekst=$("#tekst").val();
        let kategorije=$("#kategorije").val();
        $.post("ajax/ajax_admin.php?funkcija=vest", {id:id, naslov:naslov, tekst:tekst, kategorije:kategorije}, function(response){
            $("#divVest").html(response);
            popuniSelect();
            ocistiVest();
        })
    })

    

    $("#vesti").change(function(){
        let id=$(this).val();
        if(id=="0")
        {
            ocistiVest();
            return false;
        }
        $.post("ajax/ajax_admin.php?funkcija=prikaziVest", {id:id}, function(response){
            let odg=JSON.parse(response);
            $("#id").val(odg[0].id);
            $("#naslov").val(odg[0].naslov);
            $("#tekst").val(odg[0].tekst);
            $("#kategorije").val(odg[0].idKategorije);
            $("#divVest").html("");
        })
    })
})

function popuniSelect()
{
    let vest=$("#vesti");
    $.post("ajax/ajax_admin.php?funkcija=popuniSelect", function(response){
        let odg=JSON.parse(response);
        vest.empty();
        vest.append("<option value='0'>--izaberite vest--</option>");
        for(let i=0;i<odg.length;i++)
        {
            if(odg[i].naslov.length>60)odg[i].naslov=odg[i].naslov.substr(0,60)+"...";
            vest.append("<option value='"+ odg[i].id +"'>"+ odg[i].naslov +"</option>");
        }
    })
}

function popuniKategorije()
{
    let kategorije=$("#kategorije");
    $.post("ajax/ajax_admin.php?funkcija=popuniKategorije", function(response){
        let odg=JSON.parse(response);
        kategorije.empty();
        kategorije.append("<option value='0'>--izaberite kategoriju--</option>");
        for(let i=0;i<odg.length;i++)
        {
            kategorije.append("<option value='"+ odg[i].id +"'>"+ odg[i].nazivKategorije +"</option>");
        }
    })
}

function ocistiVest(){
    $("input").val("");
    $("#vest").val("0");
    $("#tekst").val("");
    $("#kategorije").val("0");
}