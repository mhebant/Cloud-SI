<div class="content_box">

<?php
if ($_SESSION['state']=='connected') {
	
	if(isset($_GET['emp']))
		$emp=str_replace("\\", "/", urldecode($_GET['emp']));
	
	?>
	<h1>Uloader Fichier</h1>
<?php if(isset($_GET['e'])) { 
		switch($_GET['e'])
		{
			case "0":
				echo '<span style="color: #31B404; font-size: 20px;">Fichier enregistrée !!!</span>';
				break;
			case "1":
				echo '<span style="color: #FF0000; font-size: 20px;">Une erreur est survenu !!!</span>';
				break;
		}
	}
	elseif(!isset($_GET['emp']) || $_GET['emp']=="")
		echo '<span style="color: #FF0000; font-size: 20px;">L\'emplacement ne peut etre vide !!!</span>';
	else { ?>
	<form method="post" action="sys/nfichier" enctype="multipart/form-data">
		<p>
			Fichier:<input type="file" name="file"/><br>
			Nom: <input type="text" value="" name="name" placeholder="Nom" size="50" maxlength="50" /> (avec l'extension)<br>
			Emplacement: <?php echo $emp; ?><br>
			<input type="hidden" name="emp" value="<?php echo $emp; ?>"/>
			<input class="submit" type="submit" value="Envoyé"/>
		</p>
	</form>
	<?php } }
else { ?> <span style="color: #FF0000">Vous n'avez pas le droit d'accèder à cette zone.</span> <?php } ?>

</div>