<div class="sidebar_box">

	<!-- Non conecté ou connection invalide -->
	<?php If ($_SESSION['state']=='no' or $_SESSION['state']=='invalid') {?>
	
	<h3>Connexion</h3>
	
	<?php If ($_SESSION['state']=='invalid') {echo '<font color="#FF0000">Le pseudo ou le mot de passe est invalide !</font>';}?>
	
    <form method="post" action="sys/connexion!r=/<?php echo $namepage?>">
		<p style="text-align: center"><input type="text" name="pseudo" placeholder="Pseudo" size="30" maxlength="30" style="width: 210px; margin-bottom: 2px"/>
		<br>
		<input type="password" name="mdp" placeholder="Mot de passe" size="30" maxlength="30" style="width: 210px"/>
		<br>
		<br>
		<input class="submit" type="submit" value="Se connecter"/></p>
	</form>
	
	<h6 style="text-align: center"><a href="/inscription">S'inscrire</a></h6>
	
	<!-- Connecté --> 
	<?php } Else { ?>
	
	<h3>Mon profil</h3>
	
	<p>Salut <?php echo $dataaccount['pseudo'];?> [<?php echo $dataaccount['rang'];?>]</p>
	
    <?php if ($namepage=='message') { ?>
		<h6><a href='/nmessage'>+Message</a></h6>
	<?php } ?>
	<h6><a id="tchat_button">Tchat</a></h6>
	
	<h6><a href="/settings">Parametre du compte</a></h6>
	<h6></br><a href="sys/deconnexion!r=/<?php echo $namepage?>">Déconnexion</a></h6>
	
	<?php } ?>
	
    <div class="cleaner"></div>     
</div>