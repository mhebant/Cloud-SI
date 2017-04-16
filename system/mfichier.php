<?php
session_start();

if (!isset($_SESSION['pseudo']) || $_SESSION['state']!='connected') {
	header('Location: /mfichier');
	die;
}

if(preg_match('#[\\\/\?\!:<>|"\*\[\]]#',$_POST['name'])){
	header('Location: /mfichier!e=2');
	die;
}

if (isset($_POST['name']) && $_POST['name']!="")
{   
	include('../database.php');
	$requete = $bdd->prepare('SELECT * FROM fichier WHERE id=?');
	$requete->execute(array($_POST['id']));	
	$datafichier = $requete->fetch();
	$requete->closeCursor();
	
	rename('/volume1/web/cloud/files/' . $datafichier['code'] . "/[" . $datafichier['version'] . ']' . $datafichier['name'], '/volume1/web/cloud/files/' . $datafichier['code'] . "/[" . $datafichier['version'] . ']' . $_POST['name']);
	
	$requete = $bdd->prepare('UPDATE fichier SET name=? WHERE id=?');
	$requete->execute(array($_POST['name'],$_POST['id']));	
	$requete->closeCursor();

	$requete = $bdd->prepare('SELECT * FROM account WHERE pseudo=?');
	$requete->execute(array($_SESSION['pseudo']));	$dataaccount = $requete->fetch();
	$requete->closeCursor();
	
	$requete = $bdd->prepare("INSERT INTO message(pseudo,message,date,file) VALUES (?,?,?,?)");
	$d = new DateTime();
	$s = $d->format("Y-m-d H:i:s");
	$requete->execute(array("[Server]",utf8_encode($dataaccount['pseudo'] . " a renommé " . $datafichier['place'] . $datafichier['name'] . " en ") . $_POST['name'],$s, $datafichier['code']));
	$requete->closeCursor();
	
	header('Location: /mfichier!e=0');
}
else
{
	header('Location: /mfichier!e=1');
}
?>