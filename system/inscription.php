<?php 
session_start();


function verif($str){
    preg_match("/([^A-Za-z0-9 ])/",$str,$result);
	//On cherche tt les caractères autre que [A-Za-z ] ou [0-9]
    if(empty($result)){return false;}
    return true;
}

function error($error){
	$url='Location: /inscription!r=' . $_GET['r'] . '&e=' . $error;
	If (!empty($_POST['pseudo'])) {$url .= '&pseudo=' . $_POST['pseudo'];}
	return $url;
}

include('../database.php');

If (empty($_POST['pseudo']) or strlen($_POST['pseudo'])>30 or verif($_POST['pseudo']))
{
	header(error(1));
	die;
}

switch ($_POST['pseudo'])
{
	case "Martin":
		break;
	case "Matthieu":
		break;
	case "Thomas":
		break;
	default:
		header(error(1));
		die;
	}

$requete = $bdd->prepare('SELECT * FROM account WHERE pseudo=?');
$requete->execute(array($_POST['pseudo']));
$datainscr = $requete->fetch();
$requete->closeCursor();

If (!empty($datainscr['id'])) 
{ 	
	header(error(2));
	die;
}

If (empty($_POST['mdp']) or strlen($_POST['mdp'])>30 or verif($_POST['mdp']) )
{
	header(error(3));
	die;
}

If ($_POST['mdp'] != $_POST['conf'])
{
	header(error(4));
	die;
}

If (empty($_POST['code']) or empty($_SESSION['captcha']) or strtoupper($_POST['code'])!=$_SESSION['captcha'])
{
	header(error(5));
	die;
}
$requete = $bdd->prepare("INSERT INTO account(pseudo,mdp,rang) VALUES (?,?,'membre')");
$requete->execute(array($_POST['pseudo'],$_POST['mdp']));
$requete->closeCursor();

header('Location: /inscription!e=0');
?>
