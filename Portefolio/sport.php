<?php

$pdo = include 'PDOConnection.php';

$sql = 'SELECT *
        FROM Sport
        ORDER BY Title';
    
$query = $pdo->prepare($sql);

$query->execute();

$sports = $query->fetchAll();

    include 'sport.phtml';