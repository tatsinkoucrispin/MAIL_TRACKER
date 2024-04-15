<?php
    include "connexion/config.php";
    $id = $_GET['modifier'];

    if(isset($_POST['mDes'])){
        $nom =$_POST['nom'];
        $adresse =$_POST['adresse'];
        $tele = $_POST['tele'];
        $fax = $_POST['fax'];

        if($nom==null || $adresse==null){
            echo "<div class='alert alert-danger almessage' role='alert'>
            Veuillez remplir les champs obligatoires!
             </div>";
        }else{
            $expsql = "UPDATE destinataire SET NOM_DES = :nom, ADRESSE_DES = :adresse, TEL_DES = :tele, FAX_DES = :fax where ID_DES = '$id'";
                $query = $conn->prepare($expsql);
                $query->bindParam(':nom', $nom, PDO::PARAM_STR);
                $query->bindParam(':adresse', $adresse, PDO::PARAM_STR);
                $query->bindParam(':tele', $tele, PDO::PARAM_STR);
                $query->bindParam(':fax', $fax, PDO::PARAM_STR);
                $query->execute(); 
                echo "<div class='alert alert-success almessage' role='alert'>
				Destinataire modifié avec succès!
             </div>";
        }
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
    
    
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
	<title>AdminSite</title>
</head>
<body>
	
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand"><img src="image/Mail.jpg" width="55" height="55" style="margin-top:20px;"><span>Mail Tracker</span></a>
		<ul class="side-menu">
			<li><a href="pageAcc.php" class="active"><i class='bx bxs-dashboard icon' ></i>Page d'accueil</a></li>
			
			<li>
				<a href="#"><i class='bx bx-envelope icon' ></i>Ajout d'un Courrier<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="courrierA.php">Arrivée</a></li>
					<li><a href="courrierDepartEx.php">Départ externe</a></li>
					<li><a href="courrierDepartIn.php">Départ interne</a></li>
				</ul>
			</li>
			<li><a href="expediteur.php"><i class='bx bx-send icon' ></i>Expéditeur</a></li>
			<li><a href="destinataire.php"><i class='bx bx-envelope-open icon' ></i>Destinataire</a></li>
			<li><a href="departement.php"><i class='bx bx-briefcase-alt-2 icon' ></i>Département</a></li>
			<li><a href="personnel.php"><i class='bx bxs-user-pin icon' ></i>Personnel</a></li>
			
			<li>
				<a href="#"><i class='bx bxs-notepad icon' ></i>Edition <i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="filtreCA.php">Arrivée</a></li>
					<li><a href="filtreCD.php">Départ</a></li>

				</ul>
			</li>
            <li>
				<a href="#"><i class='bx bx-list-plus icon' ></i>Mise à jour<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="listeCA.php">Arrivée</a></li>
					<li><a href="listeCDE.php">Départ Externe</a></li>
					<li><a href="listeCDI.php">Départ Interne</a></li>

				</ul>
			</li>
			<?php
			session_start();
			if($_SESSION['typeC']=='admin'){
			?>
			<li><a href="gestionU.php"><i class='bx bxs-user-pin icon' ></i>Gestion des utilisateurs</a></li>
			<?php }?>
			<li><a href="settings.php"><i class='bx bx-cog icon'></i>Paramètres</a></li>
			<li><a href="deconn.php"><i class='bx bx-log-out icon' ></i> Déconnexion</a></li>
			
			
			
		</ul>
	</section>
	<!-- SIDEBAR -->

	<!-- NAVBAR -->
	<section id="content">
		<!-- NAVBAR -->
      
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="data">
				<div class="content-data">
					<div class="details">
						<div class="recentOrders">
							<div class="cardHeader">
								<h2>Modification d'un destinataire</h2><br>
							</div>
		
                        <form action="" method="POST">
                        <?php 
                                $sql = "SELECT * FROM destinataire where Id_DES = '$id'";
                                $des = $conn->prepare($sql);
                                $des->execute();
                                $tabDes=$des->fetchAll(PDO::FETCH_ASSOC);
                                foreach($tabDes as $value){
                                ?>
                            <div class="mb-3">
                                <label>Nom :</label>
                                <input type="text" value="<?php echo $value['NOM_DES']?>" name="nom" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label>Adresse :</label>
                                <input type="text" value="<?php echo $value['ADRESSE_DES']?>" name="adresse" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label>N&#186; Tele :</label>
                                <input type="tel" value="<?php echo $value['TEL_DES']?>" name="tele" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label>Fax :</label>
                                <input type="tel" value="<?php echo $value['FAX_DES']?>" name="fax" class="form-control">
                            </div>
                            <?php }?>
                            <div class="mb-4">
                                <button type="submit" name="mDes" class="btn btn-success btn-lg">Modifier</button>
                                <button type="submit" name="" class="btn btn-danger"><a href="destinataire.php">Annuler</a></button>
                            </div>
                            

                        </form>

                        
						</div>
		
						<!-- ================= New Customers ================ -->
					  
					</div>

				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>