<?php
session_start();
If (isset($_POST['pseudo'])==false or isset($_POST['mdp'])==false)
	{
	$_SESSION['pseudo']='';
	$_SESSION['mdp']='';
	}
Else
	{
	$_SESSION['pseudo']=$_POST['pseudo'];
	$_SESSION['mdp']=$_POST['mdp'];
	}

If (isset($_GET['r'])==false)
	{
	$return = 'accueil';
	}
Else
	{
	$return = $_GET['r'];
	}
	
header('Location: ' . $return);
?>