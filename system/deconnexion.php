<?php
session_start();
session_destroy();

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