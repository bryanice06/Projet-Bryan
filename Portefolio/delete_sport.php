<?php

    // Connexion à la BDD
    $pdo = include 'PDOConnection.php';
    
    // Récupérer l'id de l'article à supprimer
    // $postId = $_GET['postId'];
    $sportId = $_POST['sportId'];
    
    // Requête SQL de suppression de l'article
    $sql = 'DELETE FROM Sport WHERE Id = ?';
    $query = $pdo->prepare($sql);
    $query->execute([$sportId]);
    
    // Retour d'une valeur pour test
    echo $sportId;