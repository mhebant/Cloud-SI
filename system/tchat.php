<?php session_start();

if (!isset($_SESSION['state']) || $_SESSION['state']!='connected') {
	die;
}
include('../database.php');

if(isset($_POST['id']))
{
	$requete = $bdd->prepare('SELECT * FROM tchat ORDER BY id DESC');
	$requete->execute();
	$message = array();

	for($i=0; $i<10; $i++)
	{
		$data = $requete->fetch();
		if($i==0 && $_POST['id']==$data['id'])
			break;
		if($i==0)
			$id=$data['id'];
		$message[$i] = $data;
		if($data['id'] == 1 )
			break;
	}
	$requete->closeCursor();
	if(isset($id))
		echo $id . '/LastId/';
	else
		echo 'n';
	for($i=count($message)-1; $i>=0; $i--)
	{
		/*$ago = new DateTime($message[$i]['date'])->diff(new DateTime());
		if($ago->days != 0)
			$date = 'il y a ' . $ago->days . ' jours';
		elseif($ago->hours != 0)
			$date = 'il y a ' . $ago->hours . ' heures';
		elseif($ago->minutes != 0)
			$date = 'il y a ' . $ago->minutes . ' minutes';*/
		echo '<h6>' . utf8_encode($message[$i]['pseudo']) . ': </h6>' . $message[$i]['msg'] . '<div class="inter"></div>';
	}
}
elseif(isset($_POST['msg']))
{
	$requete = $bdd->prepare("INSERT INTO tchat(pseudo,msg,date) VALUES (?,?,?)");
	$d = new DateTime();
	$s = $d->format("Y-m-d H:i:s");
	//$requete->execute(array($_SESSION['pseudo'],utf8_decode(stripslashes($_POST['msg'])),$s));
	$requete->execute(array($_SESSION['pseudo'],stripslashes($_POST['msg']),$s));
	$requete->closeCursor();
	
	echo 'n';
}
else
{
	$requete = $bdd->prepare('SELECT * FROM account WHERE lastact > ?');
	$d = new DateTime();
	$d->modify('-5 second');
	$s = $d->format("Y-m-d H:i:s");
	$requete->execute(array($s));
	$data = $requete->fetchAll();
	foreach($data as $row)
	{
		echo '<img src="images/tchat/connect.png" alt="o"/>' . $row['pseudo'] . '<br>';
	}
	$requete->closeCursor();
}

$requete = $bdd->prepare("UPDATE account SET lastact=? WHERE pseudo=?");
$d = new DateTime();
$s = $d->format("Y-m-d H:i:s");
$requete->execute(array($s, $_SESSION['pseudo']));
$requete->closeCursor();
?>