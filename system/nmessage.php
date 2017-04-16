<?php
session_start();

if (!isset($_SESSION['pseudo']) || $_SESSION['state']!='connected') {
	header('Location: /nmessage');
	die;
}
	
include('../database.php');
$requete = $bdd->prepare('SELECT * FROM account WHERE pseudo=?');
$requete->execute(array($_SESSION['pseudo']));	$dataaccount = $requete->fetch();
$requete->closeCursor();

$requete = $bdd->prepare("INSERT INTO message(pseudo,message,date) VALUES (?,?,?)");
$d = new DateTime();
$s = $d->format("Y-m-d H:i:s");

$requete->execute(array($dataaccount['pseudo'],stripslashes($_POST['message']),$s));
$requete->closeCursor();
header('Location: /nmessage!n=ok');
?>