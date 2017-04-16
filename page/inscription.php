<div class="content_box">
	
    <h1>Inscription</h1>
	
        <div class="colonne">
            <form method="post" action="system/inscription">
				<p align="right">
				Pseudo: <input type="text" <?php if (!empty($_GET['pseudo'])) echo 'value=' . $_GET['pseudo'];?> name="pseudo" placeholder="Pseudo" size="20" maxlength="30" /><br>
				Mot de passe: <input type="password" name="mdp" placeholder="Mot de passe" size="20" maxlength="30" /><br>
				Confirmation: <input type="password" name="conf" placeholder="Confirmation" size="20" maxlength="30" /><br>
				<p style="text-align: center"><img src="/tool/captcha/img" alt="Code de vérification" /><br>
				Recopiez le code: <input type="text" name="code" size="6" maxlength="6" /><br>
				<br>
				<input class="submit" type="submit" value="S'inscrir"/>
				</p></p>
			</form>
		</div>
        <div class="colonne">
			<p>
				<?php if (!isset($_GET['e'])) { ?>
                Seule les personnes participant au projet de SI concerné sont autorisé à s'inscrir. Ne soyez pas étonné si votre inscription n'abouti pas.<br>
				Le site est entièrement consacré au projet de SI, toute utilisation non coforme sera sanctionné. Le webmaster se garde le droit à toute modification/supression des données présentent sur le site sans préavis.
				<?php } elseif ($_GET['e']==0) { ?>
				<span style="color: #31B404; font-size: 20px">Vous avez été inscrit(e) !!!</span><br>
				Vous pouvez désaprèsent vous connecter.<br>
				Bienvenue :)
				<?php } elseif ($_GET['e']==1) { ?>
				<span style="color: #FF0000">Le pseudo est invalide !!</span><br>
				Il ne doit contenir que des lettres et des chiffres.
				<?php } elseif ($_GET['e']==2) { ?>
				<span style="color: #FF0000">Ce pseudo est deja utilisé !!</span><br>
				Vous devez en choisir un autre.
				<?php } elseif ($_GET['e']==3) { ?>
				<span style="color: #FF0000">Le mot de passe est invalide !!</span><br>
				Il ne doit contenir que des lettres et des chiffres.
				<?php } elseif ($_GET['e']==4) { ?>
				<span style="color: #FF0000">La confirmation du mot de passe est incorrecte !!</span><br>
				Vous devez confirmer correctement votre mot de passe.
				<?php } elseif ($_GET['e']==5) { ?>
				<span style="color: #FF0000">Vous avez mal recopié le code !!</span><br>
				Vous devez recommencé. Se code sert à verifier que vous êtes une personne réel.
				<?php } ?>
			</p>
        </div>
		        
        <div class="cleaner"></div>

		<p style="text-align: center"><br>En vous inscrivant, vous acceptez les conditions énoncé ci-dessus</p>
        
</div>
