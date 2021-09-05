function povecajLikes(id)
{
    $.get("ajax/ajax_vest.php?funkcija=povecajLikes", {id:id}, function(response){
        $("#brojLikes").html(response);
    })
}

function povecajDislikes(id)
{
    $.get("ajax/ajax_vest.php?funkcija=povecajDislikes", {id:id}, function(response){
        $("#brojDislikes").html(response);
    })
}