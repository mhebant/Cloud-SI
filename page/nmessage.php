<div class="content_box">

	<h1>Nouveau Message</h1>
		
	<div class="cleaner_h30"></div>

	<?php if (isset($_GET['n'])) { ?>
		<span style="color: #31B404; font-size: 20px" >Message enregistrée !!!</span>
	<?php } 
	elseif ($_SESSION['state']=='connected') { ?>
		<form method="post" action="sys/nmessage">
			<p>
			Message:
			<textarea name="message" wrap="soft" rows="10" cols="70"></textarea></br>
			</br>
			<input class="submit" type="submit" value="Poster"/>
			</p>
		</form>
	<?php }
	else { ?> <span style="color: #FF0000">Vous n'avez pas le droit d'accèder à cette zone.</span> <?php } ?>

</div>