<?php

    // Connexion à la BDD
    $pdo = include 'PDOConnection.php';

    // Si la variable $_POST est vide, ça signifie qu'on vient d'arriver sur la page, le formulaire n'a pas encore été soumis
    if (empty($_POST)) {

        $sportId = $_GET['sportId'];
        
        
        // Aller chercher les données de l'article à modifier pour pré-remplir le formulaire
        $sql = 'SELECT * FROM Sport WHERE Id = ?';
        $query = $pdo->prepare($sql);
        $query->execute([$sportId]);
        $sport = $query->fetch();
        
        // Affichage du formulaire
        $template = 'edit_sport';
        include 'layout.phtml';
    }
    
    // Sinon (le formulaire a été soumis)
    else {
      
        // Récupérer les données du formulaire
        $sportId = $_POST['sportId'];
        $title  = $_POST['title'];
        
        // Modification des données dans la base
        $sql = 'UPDATE Sport 
                SET Title = ?
                WHERE Id = ?';
                
        $query = $pdo->prepare($sql);
        $query->execute([$title, $sportId]);
        
        if ($_FILES['image1']['name']){
                    
            $sql = 'UPDATE Sport SET Image1 = ? WHERE Id = ?';
            
            $filename = $_FILES['image1']['name'];
            
            
            $query = $pdo->prepare($sql);
            $query->execute([$filename, $sportId]);
            
            // 2. Copier le fichier du dossier temporaire vers le serveur
            $source = $_FILES['image1']['tmp_name'];
            $destination = 'uploads/sport/' . $filename;
            
            move_uploaded_file($source, $destination);
            
            if ($_FILES['image2']['name']){
            
                    
                $sql = 'UPDATE Sport SET Image2 = ? WHERE Id = ?';
                
                $filename = $_FILES['image2']['name'];
                
                //$id = $pdo->lastInsertId();
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $SportId]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image2']['tmp_name'];
                $destination = 'uploads/sport/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
            
            if ($_FILES['image3']['name']){
                
                        
                $sql = 'UPDATE Sport SET Image3 = ? WHERE Id = ?';
                
                $filename = $_FILES['image3']['name'];
                
                //$id = $pdo->lastInsertId();
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $sportId]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image3']['tmp_name'];
                $destination = 'uploads/sport/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
        }
        
        // Redirection vers l'admin.php
        header('Location: admin.php');
        exit; 
    }