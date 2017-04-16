<div class="content_box">
	
                <h1>Mes parametres</h1>
				
				<div class="cleaner_h30"></div>
				
	<?php If ($_SESSION['state']=='connected') {?>
		
				<h3>Modifier mes informations</h3>
				
				<form method="post" action="system/account!m=mdp">
				<p>Nouveau mot de passe: <input type="password" name="mdp" placeholder="Nouveau mot de passe" size="20" maxlength="30" />
				<?php If (!empty($_GET['e']) and $_GET['e']==10) echo '<span style="color: #31B404">Mot de passe modifier !!</span>'; ?>
				<?php If (!empty($_GET['e']) and $_GET['e']==11) echo '<span style="color: #FF0000">Le mot de passe est invalide !!</span>'; ?>
				<?php If (!empty($_GET['e']) and $_GET['e']==12) echo '<span style="color: #FF0000">Le mot de passe est mal confirmé !!</span>'; ?><br>
				Confirmation: <input type="password" name="conf" placeholder="Confirmation" size="20" maxlength="30" />
				<input id="submit" type="submit" value="Modifier"/></p>
				</form>
				
				<h3>Action sur le compte</h3>
				
				<p><a href="system/account!a=del">Suprimer le compte</a></p>

	<?php }
	else { ?> <span style="color: #FF0000">Vous n'êtes pas connecté !!<br>Vous n'avez donc pas le droit d'accèder à cette zone.</span> <?php } ?>
</div>
