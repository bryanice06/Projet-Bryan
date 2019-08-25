<?php

$pdo = include 'PDOConnection.php';

if (array_key_exists('title', $_POST)) { // Si la clé 'title' existe dans le tableau $_POST
    
        // on récupère les données du formulaire
        $title = $_POST['title'];
        
        // A ce stade on pourrait vérifier la validité des données, c'est ce qu'on appelle la "validation des données"
        // Par exemple : est-ce que le titre est bien rempli ? 
        
        // On insère les données dans la table Post
        $sql = 'INSERT INTO Manga (Title)
                VALUES (?)';
                
        $query = $pdo->prepare($sql);
        
        $query->execute([$title]);
        
        // Est-ce que il y a un fichier transmis dans le formulaire ?
        //if ($_FILES['image1','image2','image3','image4','image5','image6','image7','image8','image9']['name']){
        if ($_FILES['image1']['name']){
            
            // Au préalable on devrait vérifier la validité du fichier transmis et les éventuelles erreurs
            // var_dump($_FILES['image']['error']);
            // Liste des codes d'erreurs : https://www.darklaunch.com/2009/05/01/php-file-upload-error-codes-upload-err-ok
            // Le cas échéant on afficherait à l'utilisateur un message d'erreur
            
            // 1. Enregistrer le nom du fichier dans la BDD dans un champ Image de la table Post
            /*$sql = 'UPDATE Manga
                    SET Image1 = ?
                    Image2 = ? 
                    Image3 = ? 
                    Image4 = ? 
                    Image5 = ? 
                    Image6 = ? 
                    Image7 = ? 
                    Image8 = ? 
                    Image9 = ? 
                    WHERE Id = ?';*/
                    
            $sql = 'UPDATE Manga SET Image1 = ? WHERE Id = ?';
            
            $filename = $_FILES['image1']['name'];
            
            $id = $pdo->lastInsertId();
            
            $query = $pdo->prepare($sql);
            //$query->execute([$filename, $filename, $filename, $filename, $filename, $filename, $filename, $filename, $filename, $id]);
            $query->execute([$filename, $id]);
            
            // 2. Copier le fichier du dossier temporaire vers le serveur
            $source = $_FILES['image1']['tmp_name'];
            $destination = 'uploads/manga/' . $filename;
            
            move_uploaded_file($source, $destination);
            
            if ($_FILES['image2']['name']){
            
                    
                $sql = 'UPDATE Manga SET Image2 = ? WHERE Id = ?';
                
                $filename = $_FILES['image2']['name'];
                
                //$id = $pdo->lastInsertId();
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $id]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image2']['tmp_name'];
                $destination = 'uploads/manga/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
            
            if ($_FILES['image3']['name']){
                
                        
                $sql = 'UPDATE Manga SET Image3 = ? WHERE Id = ?';
                
                $filename = $_FILES['image3']['name'];
                
                //$id = $pdo->lastInsertId();
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $id]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image3']['tmp_name'];
                $destination = 'uploads/manga/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
        }
        header('Location: admin.php');
        exit; 
        
}

    $template = 'add_manga';
    
    include 'layout.phtml';