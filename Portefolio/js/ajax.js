function onAjaxRemoveManga(mangaId)
{
    var selector; // stocke l'attribut id de la balise à supprimer
    
    // Lorsque le client (navigteur) va recevoir la réponse HTTP de la requête AJAX, il va exécuter cette fonction
    // On peut récupérer automatiquement en paramètre du callback la réponse du serveur à la requête HTTP AJAX
    // console.log(postId);
    
    // On va devoir supprimer la ligne du tableau qui correspond à l'article supprimé
    // Question 1 : comment savoir quel article a été supprimé ? 
    //      Réponse = le fichier delete_post.php va renvoyer comme réponse au client l'id de l'article
    // Question 2 : comment repérer/identifier la ligne à supprimer ? comment supprimer un élément en jQuery ?
    //      Réponse : méthode remove() de jQuery + ajouter un attribut id aux balises <tr> du tableau
    selector = '#manga-' + mangaId;
    
    // postId : 34
    // id du <tr> : post-34
    // selector : #post-34
    
    $(selector).remove();
}

function onAjaxRemoveSport(sportId)
{
    var selector;
    
    selector = '#sport-' + sportId;
    
    $(selector).remove();
}