	<?php
	if ($_SESSION['state']=='connected') {
	
		$requete = $bdd->prepare('SELECT * FROM message');
		$requete->execute();
		$resultat = $requete->fetchAll();
		
		$nb_message = count($resultat);
		
		$requete = $bdd->prepare('SELECT * FROM message ORDER BY id DESC');
		$requete->execute();
		
		if (empty($_GET['np']))
			$num_page = 1;
		else
			$num_page = $_GET['np'];
		
		//On se place au niveau de la première news de la page		
		$first_message_of_page = ($num_page - 1) * 10;
		for ($nb = 0; $nb < $first_message_of_page; $nb++)
			{
				$requete->fetch();
			}
			
        //élément de la liste
        for ($nb = 0; $nb < 10; $nb++)
			{
	        $datamessage_box = $requete->fetch(); 
				?>
<div class="content_message">
	<h2><?php echo $datamessage_box['pseudo']; ?> :</h2> 
	le <?php $d=new DateTime($datamessage_box['date']); echo $d->format("d/m/Y à H\hi:s");?>
	<p><?php echo $datamessage_box['message'] ?></p>
    <div class="cleaner"></div>
</div>		
	<?php
				
				if ($datamessage_box['id'] == 1) break; 
			} ?>
			
	<p style="text-align: center"><?php

		$nb_page = floor(($nb_message - 1) / 10) + 1;
	 
		for ($nb = 1; $nb < $nb_page + 1; $nb++)
			{
			if ($nb != 1)
				echo '-';
			if ($nb == $num_page)
				echo '<b>' . $nb . '</b>';
			else
				echo '<a href="/message-' . $nb . '">' . $nb . '</a>';
			}
			?></p>
			
	<?php }
	else { ?> <span style="color: #FF0000">Vous n'avez pas le droit d'accèder à cette zone.</span> <?php } ?>
