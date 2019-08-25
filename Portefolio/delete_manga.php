<?php

    // Connexion à la BDD
    $pdo = include 'PDOConnection.php';
    
    // Récupérer l'id de l'article à supprimer
    // $postId = $_GET['postId'];
    $mangaId = $_POST['mangaId'];
    
    // Requête SQL de suppression de l'article
    $sql = 'DELETE FROM Manga WHERE Id = ?';
    $query = $pdo->prepare($sql);
    $query->execute([$mangaId]);
    
    // Retour d'une valeur pour test
    echo $mangaId;