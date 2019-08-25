<?php

$pdo = include 'PDOConnection.php';

if (array_key_exists('title', $_POST)) { // Si la clé 'title' existe dans le tableau $_POST
    
        // on récupère les données du formulaire
        $title = $_POST['title'];
        
        $sql = 'INSERT INTO Sport (Title)
                VALUES (?)';
                
        $query = $pdo->prepare($sql);
        
        $query->execute([$title]);
        
      
        if ($_FILES['image1']['name']){
            
                    
            $sql = 'UPDATE Sport SET Image1 = ? WHERE Id = ?';
            
            $filename = $_FILES['image1']['name'];
            
            $id = $pdo->lastInsertId();
            
            $query = $pdo->prepare($sql);
            $query->execute([$filename, $id]);
            
            // 2. Copier le fichier du dossier temporaire vers le serveur
            $source = $_FILES['image1']['tmp_name'];
            $destination = 'uploads/sport/' . $filename;
            
            move_uploaded_file($source, $destination);
            
            if ($_FILES['image2']['name']){
            
                    
                $sql = 'UPDATE Sport SET Image2 = ? WHERE Id = ?';
                
                $filename = $_FILES['image2']['name'];
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $id]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image2']['tmp_name'];
                $destination = 'uploads/sport/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
            
            if ($_FILES['image3']['name']){
                
                        
                $sql = 'UPDATE Sport SET Image3 = ? WHERE Id = ?';
                
                $filename = $_FILES['image3']['name'];
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $id]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image3']['tmp_name'];
                $destination = 'uploads/sport/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
        }
        header('Location: admin.php');
        exit; 
        
}

    $template = 'add_sport';
    
    include 'layout.phtml';