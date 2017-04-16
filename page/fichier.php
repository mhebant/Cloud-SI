<?php
if ($_SESSION['state']=='connected') {

	if (isset($_GET['emp']))
		$emp=urldecode($_GET['emp']);
	else
		$emp="\\";
	$emp = str_replace("\\", "/", $emp);

	$requete = $bdd->prepare('SELECT * FROM fichier WHERE place=?');
	$requete->execute(array($emp));
	$resultat = $requete->fetchAll();
		
	$nb_fichier = count($resultat);
		
	$requete = $bdd->prepare('SELECT * FROM fichier WHERE place=? ORDER BY name');
	$requete->execute(array($emp));
 ?>

<div class="fichier_list">

	<?php echo "Emplacement: " . $emp . "<br>"; ?>
	<a href="/nfichier!emp=<?php echo urlencode(str_replace("/", "\\", $emp)); ?>"><img src="images/icon/newfile.png"></a><br><br>

	<ul>
		
<?php if($emp != '/') { ?>
		<li>
			<img src="images/icon/back.png" alt="">
			<h4><a href="<?php echo "/fichier!emp=" . urlencode(str_replace("/", "\\", substr($emp, 0, strrpos($emp, "/", -2) + 1))); ?>">Retour</a></h4>
		</li>
<?php 
	}
    for ($nb = 0; $nb < $nb_fichier; $nb++)
	{
	    $datafichier = $requete->fetch(); 
		
		if ($datafichier['type'] == 'dossier')
			$img="images/icon/folder.png";
		else
		{
			switch (substr(strrchr($datafichier['name'], '.'), 1))
			{
				case 'png':
					$img="images/icon/img.png";
					break;
				case 'jpg':
					$img="images/icon/img.png";
					break;
				case 'doc':
					$img="images/icon/word.png";
					break;
				case 'docx':
					$img="images/icon/word.png";
					break;
				case 'xls':
					$img="images/icon/excel.png";
					break;
				case 'xlsx':
					$img="images/icon/excel.png";
					break;
				case 'ppt':
					$img="images/icon/diapo.png";
					break;
				case 'pptx':
					$img="images/icon/diapo.png";
					break;
				case 'txt':
					$img="images/icon/text.png";
					break;
				default:
					$img="images/icon/file.png";
			}
		 }
		 ?>
				
		<li>
			<img src="<?php echo $img; ?>" alt="">
			<?php if($datafichier['type']=='fichier') { ?><a class="prop" href="/mfichier!n=<?php echo $datafichier['id']; ?>"><span style="color: #FF0000; font-size: 20px">Modifier</span></a><?php } ?>
			<h4><a href="<?php if($datafichier['type']=='dossier') echo "/fichier!emp=" . urlencode(str_replace("/", "\\", $emp) . $datafichier['name'] . "\\") . '"'; else echo "/files/" . $datafichier['code'] . "/[" . $datafichier['version'] . ']' . $datafichier['name'] . '" download="' . $datafichier['name'] . '"'?>><?php echo $datafichier['name']; ?></a></h4>
			<?php if($datafichier['type']=='fichier') { ?><p>Version: <?php echo $datafichier['version'] ?></p><?php } ?>
			
			<?php if($_SESSION['state']=='connected' && $dataaccount['rang']=='modo') { ?>
				
			<?php } ?>
		</li>
		
<?php
	}
?>

	</ul>
	<div class="cleaner"></div>
</div>

<?php }
	else { ?> <span style="color: #FF0000">Vous n'avez pas le droit d'accèder à cette zone.</span> <?php } ?>