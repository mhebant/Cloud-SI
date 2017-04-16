<?php
session_start();

if (!isset($_SESSION['pseudo']) || $_SESSION['state']!='connected') {
	header('Location: /nfichier');
	die;
}


//      \/?!:<>|"*[]
if(preg_match('#[\\\/\?\!:<>|"\*\[\]]#',$_POST['name'])){
	header('Location: /nfichier!e=2');
	die;
}

if (isset($_FILES['file']['tmp_name']) && $_FILES['file']['error'] == 0 && $_POST['name']!="") 
{ 
	include('../database.php');
	
	$lettre = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	do {
		$code="";
		for($i = 0; $i<10; $i++) {
			$code .= $lettre[mt_rand(0,35)];
		}
		$requete = $bdd->prepare('SELECT * FROM fichier WHERE code=?');
		$requete->execute(array($code));
		$datainscr = $requete->fetch();
		$requete->closeCursor();
	} while(!empty($datainscr['id']));
	
	@mkdir("/volume1/web/cloud/files/" . $code, 0777, true);
	
	move_uploaded_file($_FILES['file']['tmp_name'], '/volume1/web/cloud/files/' . $code . '/[1]' . $_POST['name']);
	
	$requete = $bdd->prepare("INSERT INTO fichier(name,type,place,version,code) VALUES (?,?,?,?,?)");
	$requete->execute(array($_POST['name'],"fichier",stripslashes($_POST['emp']),"1",$code));
	$requete->closeCursor();
	
	$requete = $bdd->prepare("INSERT INTO message(pseudo,message,date,file) VALUES (?,?,?,?)");
	$d = new DateTime();
	$s = $d->format("Y-m-d H:i:s");
	$requete->execute(array("[Server]",utf8_encode($_SESSION['pseudo'] . " a uploadé le fichier ") . stripslashes($_POST['emp']) . $_POST['name'],$s,$code));
	$requete->closeCursor();
	
	header('Location: /nfichier!e=0');
}
else
{
	header('Location: /nfichier!e=1');
}
?>