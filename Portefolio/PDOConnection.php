<?php

    // Inclusion de la configuration
    include 'config.php';

    // Connexion à la BDD
    $dsn = 'mysql:host=' . $config['host'] . ';dbname=' . $config['dbname']; // Data Source Name
    
    // Pour voir la liste des options : http://php.net/manual/en/ref.pdo-mysql.php
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];
    
    // Création d'un objet PDO pour la connexion à la base de données
    $pdo = new PDO($dsn, $config['user'], $config['password'], $options);
    
    // Exécute une requête SQL pour indiquer l'encodage de communication entre PDO et la BDD
    $pdo->exec('SET NAMES UTF8');
    
    return $pdo;