"use strict";

jQuery(function($){
    
    // CODE PRINCIPAL
    // Installation des gestionnaires d'événements 
    $('#more').on('click', onClickNav);
    $('.remove').on('click', onClickRemoveManga);
    $('.remove').on('click', onClickRemoveSport);
});