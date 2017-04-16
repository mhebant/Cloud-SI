<?php session_start(); ?>

<?php //Ouverture de la base de donné
	include('database.php'); 
?>
<?php //Récuperatuion du contenu de la page
	If (isset($_GET['p'])==false)
		{
		$namepage = 'accueil';
		}
	Else
		{	
		$namepage = $_GET['p'];
		}
	$requete = $bdd->prepare('SELECT * FROM page WHERE name=?');
	$requete->execute(array($namepage));$datapage = $requete->fetch();
	$requete->closeCursor();
?>
<?php //Verification identifiant et mot de passe et chargement des donné du compte
	If (isset($_SESSION['pseudo'])==false or isset($_SESSION['mdp'])==false)
		{	
		$_SESSION['state']='no';
		}
	ElseIf ($_SESSION['pseudo']=='' or $_SESSION['mdp']=='')
		{
		$_SESSION['state']='invalid';
		unset($_SESSION['pseudo']);
		unset($_SESSION['mdp']);
		}
	Else 	
		{	
		$requete = $bdd->prepare('SELECT * FROM account WHERE pseudo=?');
		$requete->execute(array($_SESSION['pseudo']));	$dataaccount = $requete->fetch();
		$requete->closeCursor();
		If ($dataaccount['mdp']==$_SESSION['mdp'])
			{		
			$_SESSION['state']='connected';
			}
		Else
			{		
			$_SESSION['state']='invalid';
			unset($_SESSION['pseudo']);
			unset($_SESSION['mdp']);
			}	
		}
?>

<!doctype html>
<html lang="fr">
<head>
	<meta charset="utf-8"/>
	<base href="./" />
	<title>Cloud</title>
	<meta name="description" content="" />
	<link href="css/tchat.css" rel="stylesheet" type="text/css" />
	<?php //Chargement du style de la page
	If ($datapage['css']!='no')
		echo '<link href="' . $datapage['css'] . '" rel="stylesheet" type="text/css" />';
	?>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	
	<!-- Script Javascript -->
	<script type="text/javascript">
	function clearText(field)
		{    
		if (field.defaultValue == field.value) 
			field.value = '';
		else if (field.value == '') 
			field.value = field.defaultValue;
		}
	</script>
</head>
<body id="body">
<!-- Nuage -->
<div id="cloud_zone">
	<div class="cloud" ></div>
	<div class="cloud"></div>
	<div class="cloud"></div>
	<div class="cloud"></div>
	<div class="cloud"></div>
	<div class="cloud"></div>
</div>

<!-- Entête -->
<div id="header">
	<div id="site_title">
		<a href=""><img src="images/logo.png" alt="logo" /></a> 
    </div>  
		
	<div id="menu">
		<ul>                
			<li><a href="/" <?php If ($datapage['onglet'] == 'accueil') { ?>class="current"<?php } ?> >Accueil</a></li>
			<li><a href="/fichier" <?php If ($datapage['onglet'] == 'fichier') { ?>class="current"<?php } ?> >Fichier</a></li>
			<li><a href="/message" <?php If ($datapage['onglet'] == 'message') { ?>class="current"<?php } ?> >Message</a></li>
		</ul>
		<div id="search_box" >
			<form action="#" method="post">
				<input type="text" value="Rechercher" name="q" size="10" id="searchfield" title="Rechercher" onfocus="clearText(this)" onblur="clearText(this)" />
				<input type="submit" name="Search" value="" id="searchbutton" title="Rechercher" />
			</form>
		</div>
		<div class="cleaner"></div>
	</div>
	<div class="cleaner"></div>
</div>

<!-- Contenu -->
<div id="content">
	<div id="main_content">
	
		<?php include($datapage['url']) ?>
		
	</div>
	<div id="sidebar">
	
		<?php include('tool/connexion.php') ?>
		<?php if($_SESSION['state']=='connected')
				include('tool/message.php'); ?>
	
	</div>
	<div class="cleaner"></div>
</div>

<!-- Pied de page -->
<div id="footer">
	Copyright &copy; 2013 <a href="/">Cloud</a>
</div>

<script src="js/cloud.js"></script>
<?php if($_SESSION['state']=='connected'){ include("tool/tchat.php"); } ?>
</body>

</html>