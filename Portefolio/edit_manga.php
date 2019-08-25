<?php

    // Connexion à la BDD
    $pdo = include 'PDOConnection.php';

    // Si la variable $_POST est vide, ça signifie qu'on vient d'arriver sur la page, le formulaire n'a pas encore été soumis
    if (empty($_POST)) {

        $mangaId = $_GET['mangaId'];
        
        
        // Aller chercher les données de l'article à modifier pour pré-remplir le formulaire
        $sql = 'SELECT * FROM Manga WHERE Id = ?';
        $query = $pdo->prepare($sql);
        $query->execute([$mangaId]);
        $manga = $query->fetch();
        
        // Affichage du formulaire
        $template = 'edit_manga';
        include 'layout.phtml';
    }
    
    // Sinon (le formulaire a été soumis)
    else {
      
        // Récupérer les données du formulaire
        $mangaId = $_POST['mangaId'];
        $title  = $_POST['title'];
        
        // Modification des données dans la base
        $sql = 'UPDATE Manga 
                SET Title = ?
                WHERE Id = ?';
                
        $query = $pdo->prepare($sql);
        $query->execute([$title, $mangaId]);
        
        if ($_FILES['image1']['name']){
                    
            $sql = 'UPDATE Manga SET Image1 = ? WHERE Id = ?';
            
            $filename = $_FILES['image1']['name'];
            
            
            $query = $pdo->prepare($sql);
            //$query->execute([$filename, $filename, $filename, $filename, $filename, $filename, $filename, $filename, $filename, $id]);
            $query->execute([$filename, $mangaId]);
            
            // 2. Copier le fichier du dossier temporaire vers le serveur
            $source = $_FILES['image1']['tmp_name'];
            $destination = 'uploads/manga/' . $filename;
            
            move_uploaded_file($source, $destination);
            
            if ($_FILES['image2']['name']){
            
                    
                $sql = 'UPDATE Manga SET Image2 = ? WHERE Id = ?';
                
                $filename = $_FILES['image2']['name'];
                
                //$id = $pdo->lastInsertId();
                
                $query = $pdo->prepare($sql);
                $query->execute([$filename, $mangaId]);
                
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
                $query->execute([$filename, $mangaId]);
                
                // 2. Copier le fichier du dossier temporaire vers le serveur
                $source = $_FILES['image3']['tmp_name'];
                $destination = 'uploads/manga/' . $filename;
                
                move_uploaded_file($source, $destination);
                
            }
        }
        
        // Redirection vers l'admin.php
        header('Location: admin.php');
        exit; 
    }