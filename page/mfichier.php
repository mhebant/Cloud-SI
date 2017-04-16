<div class="content_box">

<?php
if ($_SESSION['state']=='connected' ) { ?>
	<h1>Modifier Fichier</h1>
<?php if(!isset($_GET['e'])) { 
	$requete = $bdd->prepare('SELECT * FROM fichier WHERE id=?');
	$requete->execute(array($_GET['n']));
	$datafichier = $requete->fetch();
?>
	<h3>Modifier le nom</h3>
	<form method="post" action="sys/mfichier">
		<p>
			Nom: <input type="text" value="<?php echo $datafichier['name']; ?>" name="name" placeholder="Nom" size="50" maxlength="50" /> (avec l'extension)<br>
			<input type="hidden" name="id" value="<?php echo $_GET['n']; ?>" />
			<input class="submit" type="submit" value="Modifier"/>
		</p>
	</form>
	<h3>Reuploader le fichier</h3>
	<p style="color: red;">Faire attention que personne n'est modifier le fichier entre le moment où vous avez téléchargé le fichier et maintenet !!</p>
	<form method="post" action="sys/rfichier" enctype="multipart/form-data">
		<p>
			Fichier:
			<input type="file" name="file"/><br>
			Modifications apportée:
			<textarea name="message" wrap="soft" rows="10" cols="70"></textarea><br>
			<input type="hidden" name="id" value="<?php echo $_GET['n']; ?>" />
			<input class="submit" type="submit" value="Modifier"/>
		</p>
	</form>
<?php } else { 
			switch($_GET['e'])
			{
				case "0":
					echo '<span style="color: #31B404; font-size: 20px">Fichier enregistrée !!!</span>';
					break;
				case "1":
					echo '<span style="color: color="#FF0000; font-size: 20px">Une erreur est survenu !!!</span>';
					break;
			}
		} ?>
	<?php  }
else { ?> <span style="color: #FF0000">Vous n'avez pas le droit d'accèder à cette zone.</span> <?php } ?>

</div>