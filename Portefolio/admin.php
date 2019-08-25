<?php

$pdo = include 'PDOConnection.php';

$sql = 'SELECT *
        FROM Manga
        ORDER BY Id';
    
$query = $pdo->prepare($sql);

$query->execute();

$mangas = $query->fetchAll();


$sql = 'SELECT *
        FROM Sport
        ORDER BY Id';
    
$query = $pdo->prepare($sql);

$query->execute();

$sports = $query->fetchAll();

    $template = 'admin';
    
    include 'layout.phtml';