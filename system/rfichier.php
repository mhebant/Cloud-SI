<?php
session_start();

if (!isset($_SESSION['pseudo']) || $_SESSION['state']!='connected') {
	header('Location: /mfichier');
	die;
}

if (isset($_FILES['file']['tmp_name']) && $_FILES['file']['error'] == 0) 
{   
	include('../database.php');
	$requete = $bdd->prepare('SELECT * FROM fichier WHERE id=?');
	$requete->execute(array($_POST['id']));	
	$datafichier = $requete->fetch();
	$requete->closeCursor();

	$requete = $bdd->prepare('UPDATE fichier SET version=? WHERE id=?');
	$requete->execute(array(strval(intval($datafichier['version']) + 1),$_POST['id']));	
	$requete->closeCursor();
	   
	move_uploaded_file($_FILES['file']['tmp_name'], '/volume1/web/cloud/files/' . $datafichier['code'] . '/[' . strval(intval($datafichier['version']) + 1) . ']' . $datafichier['name']);
	
	$requete = $bdd->prepare('SELECT * FROM account WHERE pseudo=?');
	$requete->execute(array($_SESSION['pseudo']));	$dataaccount = $requete->fetch();
	$requete->closeCursor();
	
	$requete = $bdd->prepare("INSERT INTO message(pseudo,message,date,file) VALUES (?,?,?,?)");
	$d = new DateTime();
	$s = $d->format("Y-m-d H:i:s");
	$requete->execute(array("[Server]",utf8_encode($dataaccount['pseudo'] . " a reuploadé le fichier " . $datafichier['place'] . $datafichier['name'] . " : <br>") . stripslashes($_POST['message']),$s,$datafichier['code']));
	$requete->closeCursor();
	
	header('Location: /mfichier!e=0');
}
else
{
	header('Location: /mfichier!e=1');
}
?>