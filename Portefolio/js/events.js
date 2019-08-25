"use strict";

function onClickNav() 
{
    $('.ul-a ul').toggleClass('hidden');
    $('.fa-sort-desc').toggleClass('fa-sort-asc');
}

function onClickRemoveManga()
{
    var mangaId;
    
    // 1. Récupérer l'id de l'article à supprimer (dans l'attribut data-id du lien cliqué)
    
    // Accès à la valeur d'un attribut data en javascript natif
    // postId = this.dataset.id; 
    // postId = this.getAttribute('data-id');
    
    // Accès à la valeur d'un attribut data en jQuery
    mangaId = $(this).data('id');
    // postId = $(this).attr('data-id');
    
    // 2. Lancer une requête AJAX en POST vers le fichier delete_post.php en transmettant l'id de l'article
    // Faire une requête AJAX en POST avec jQuery : méthode $.post() Doc. : http://api.jquery.com/jQuery.post/
    // Paramètres de la méthode $.post() :
    // - 1) Url : delete_post.php (fichier/url vers lequel on envoie la requête HTTP)
    // - 2) Data (données transmsies) : {postId: xx} (l'id de l'article à supprimer)
    // - 3) Callback (fonction appelée lors du succès de la requête HTTP) : onAjaxRemovePost
    $.post('delete_manga.php', {mangaId: mangaId}, onAjaxRemoveManga);
}

function onClickRemoveSport()
{
    var sportId;
    
    sportId = $(this).data('id');
   
    $.post('delete_sport.php', {sportId: sportId}, onAjaxRemoveSport);
}