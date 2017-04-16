<?php
session_start();

$longueur_code = 6;
$lettres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';
$longueur = strlen($lettres);
$code = '';
$largeur = 250;
$hauteur = 50;

$police = array('trebuc.ttf');
$image = imagecreatetruecolor($largeur, $hauteur);
$fonce = imagecolorallocate($image, mt_rand(0, 70), mt_rand(0, 70), mt_rand(0, 70));

//lignes "horizontales" sur le fond
for($i = 0; $i < 6; $i++)
{
        $couleur_ligne = imagecolorallocate($image, mt_rand(150, 255), mt_rand(150, 255), mt_rand(150, 255));
        imageline($image, 0, mt_rand(0, $hauteur), $largeur, mt_rand(0, $hauteur), $couleur_ligne);
}

//lignes "verticales" sur le fond
for($i = 0; $i < 6; $i++)
{
        $couleur_ligne = imagecolorallocate($image, mt_rand(150, 255), mt_rand(150, 255), mt_rand(150, 255));
        imageline($image, mt_rand(0, $largeur), 0, mt_rand(0, $largeur), $hauteur, $couleur_ligne);
}

$x = mt_rand(2,20);
for($i = 0; $i < $longueur_code; $i++)
{
        $lettre_ajouter = $lettres[mt_rand(0,$longueur-1)];
        $code .=  $lettre_ajouter;
        $angle = mt_rand(-25, 20);
        $taille_police = mt_rand(25,35);
        $hauteur_police = ($hauteur / 2) + ($taille_police/2);
        $couleur_texte = imagecolorallocate($image, mt_rand(150, 255), mt_rand(150, 255), mt_rand(150, 255));
        imagettftext($image, $taille_police, $angle, $x, $hauteur_police, $couleur_texte, realpath($police[array_rand($police)]), $lettre_ajouter);
        
        $x += 1.2 * $taille_police + mt_rand(0,2);
}


$_SESSION['captcha'] = $code;

header('Content-type: image/png');
imagepng($image);
imagedestroy($image);
?>