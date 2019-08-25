<?php

$pdo = include 'PDOConnection.php';

$sql = 'SELECT *
        FROM Manga
        ORDER BY Title';
    
$query = $pdo->prepare($sql);

$query->execute();

$mangas = $query->fetchAll();
    
    include 'manga.phtml';