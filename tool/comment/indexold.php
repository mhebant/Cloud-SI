<?php $widht=$_GET['widht'];
$height=$_GET['height'];
$iframeheight = ((int) $height) - ((int) '70');
$pseudo=$_GET['pseudo'];
$app=$_GET['app']; ?>
document.write('<link href="/MHfr78/tool/comment/style.css" rel="stylesheet" type="text/css" />');
document.write('<div class="box" style="width:<?php echo $widht; if ($widht != '100%') echo 'px'; ?>;height:<?php echo $height; if ($height != '100%') echo 'px'; ?>">');
	
	document.write('<div class="top"><span class="left"></span><span class="right"></span></div>');
	
	document.write('<div class="contner">');
		document.write('<div class="left"></div>');
		document.write('<div class="right"></div>');
		document.write('<div class="content">');
			document.write('<iframe width="<?php echo $widht; ?>" height="<?php echo $iframeheight; ?>" frameborder="0" scrolling="auto" src="/MHfr78/tool/comment/comment.php?app=<?php echo $app; ?>" ></iframe>');
			document.write('<form class="form" method="post" action="/MHfr78/system/addcomment.php" >');
				document.write('<?php echo $pseudo; ?>: </br>');
				document.write('<input type="text" style="widht=100%;" maxlength="200" name="msg" />');
			document.write('</form>');
		document.write('</div>');
	document.write('</div>');
	
	document.write('<div class="bottom"><span class="left"></span><span class="right"></span></div>');
	
document.write('</div>');
