<?php session_start();

function verif($str){
    preg_match("/([^A-Za-z0-9 ])/",$str,$result);
	//On cherche tt les caractères autre que [A-Za-z ] ou [0-9]
    if(empty($result)){return false;}
    return true;
}

If ($_SESSION['state']=='connected') {
include('../database.php');

If (!empty($_GET['m']))
{
	If ($_GET['m']=='mdp')
	{
		If (empty($_POST['mdp']) or strlen($_POST['mdp'])>30 or verif($_POST['mdp']) )
		{
		header('Location: /settings!e=11');
		die;
		}
		If ($_POST['mdp'] != $_POST['conf'])
		{
		header('Location: /settings!e=12');
		die;
		}
		$requete = $bdd->prepare('UPDATE account SET mdp=? WHERE pseudo=?');
		$requete->execute(array($_POST['mdp'],$_SESSION['pseudo']));
		$requete->closeCursor();
		$_SESSION['mdp']=$_POST['mdp'];
		header('Location: /settings!e=10');
		die;
	}
}

If (!empty($_GET['a']))
{
	If ($_GET['a']=='del')
	{
		$requete = $bdd->prepare('DELETE FROM account WHERE pseudo=?');
		$requete->execute(array($_SESSION['pseudo']));
		$requete->closeCursor();
		unset($_SESSION['pseudo']);
		unset($_SESSION['mdp']);
		header('Location: /');
		die;
	}
}
}
?>