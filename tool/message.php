<div class="sidebar_box sidebar_message">
    
<?php
$requete = $bdd->prepare('SELECT * FROM message ORDER BY id DESC LIMIT 3');
$requete->execute();
?>
	
    <h3>Derniers Messages</h3>
                        
    <ul>
		<?php //élément de la liste
		for ($nb = 0; $nb < 3; $nb++)
			{
			$datamessage_box = $requete->fetch(); ?>
			
			<li <?php if ($datamessage_box['id'] == 1) echo 'class="last"'; ?>>
				<h6><?php echo $datamessage_box['pseudo']; ?></h6>
				<p><?php if (strlen(strip_tags($datamessage_box['message']))>125) 
							echo substr(strip_tags($datamessage_box['message']),0,125) . '...';
						else
							echo strip_tags($datamessage_box['message']); ?></p>
			</li>
			
			<?php if ($datamessage_box['id'] == 1) break; 
			}?>
    </ul>
    <h6><span style="color: black;">+ </span><a href="/message">Voir toutes les messages</a></h6>
    <div class="cleaner"></div>
	
	<?php $requete->closeCursor(); ?>
	
</div>