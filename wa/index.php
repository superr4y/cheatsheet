<?php
session_start();
######## config #########
$cookie_name = 'PHPAUTH';
$time_interval = 10;
$knock_count = 3;
$solution = 'W3ihn4cht3n';
#########################
?>

<html>
<head>
<style>
body{
background-color: black;
color: green;
}
</style>
</head>
<title>Weihnachtsaufgabe 2013</title>
<body>

<?php
if(!isset($_SESSION['start'])){
    // first time
    $_SESSION['start'] = time();
} 

if((int)($_SESSION['start']+$time_interval) < time()) {
    // time is over, check condition and reset everything
    #echo "[D] reset the session\n";
    $cookie = $_COOKIE[$cookie_name];

    if(isset($cookie) and is_numeric($cookie) and (int)$cookie == $knock_count){
        // you win :-)
        echo "\n<h1>L&ouml;sung: ".$solution."</h1>\n";
        ?><a href="http://www.youtube.com/watch?v=wyz_2DEah4o" target="_blank"><img src="hacker.gif" /></a><?php
    } else {
?><a href="http://www.youtube.com/watch?v=oHg5SJYRHA0" target="_blank"><img src="noob.gif" /></a><br />    
<?php
    }
    // reset all
    setcookie($cookie_name, 0);
    $cookie = 0;
    $_SESSION['start'] = time();
} else {
    $cookie = $_COOKIE[$cookie_name];
}



if(isset($cookie) and is_numeric($cookie)){
    $cookie = (int)$cookie;
    $cookie = $cookie + 1;
    setcookie($cookie_name, $cookie);
    #echo "[D] increase cookie value\n";
    #echo $cookie."\n";
    #echo $_SESSION['start'];
} else {
    setcookie($cookie_name, 0);
    #echo "[D] set cookie\n";
}

?>
<h1>Weihnachtaufgabe 2013</h1>
<?php

$text_array = array(
"Denkt Euch, ich habe das Christkind gesehen,<br />
ich hab's &uuml;berfahren, es war ein Versehen.<br />
Ich hatte gerade die &Auml;uglein zu,<br />
ich tr&auml;umte beim Fahren in himmlischer Ruh.<br />
"
,
"Das Christkind hat in dieser heiligen Nacht<br />
Bekanntschaft mit meinem K&uuml;hler gemacht.<br />
Sp&auml;ter sah ich auch noch den Weihnachtsmann,<br />
er feuerte grad' seine Renntiere an.<br />
"
,
"Ich &uuml;berholte den langsamen Wicht,<br />
doch sah ich den Gegenverkehr dabei nicht.<br />
Ich wich noch aus, doch leider nicht Santa,<br />
ein kurzes Rumsen und er klebte am Manta.<br />
"
,
"Am Ende sah ich auch den Nikolaus,<br />
er st&uuml;rmte gerade aus dem Freudenhaus.<br />
Er kam ganz hektisch &uuml;ber die Kreuzung gelaufen,<br />
wollt am Automaten neue Pr&auml;ser sich kaufen.<br />
"
,
"Mein Auto und mich hat er wohl nicht gesehen,<br />
jedenfalls blieben von ihm nur die Stiefel stehen.<br />
So ist die Moral von dem Gedicht,<br />
Fahr zu schnell Dein Auto nicht.<br />
"
,
"Denn als ich zuhause war, da musste ich heulen,<br />
mein sch&ouml;ner Wagen, der hatte drei Beulen,<br />
vom Christkind, vom Niklas und vom Santa Claus,<br />
ja, dieses Jahr f&auml;llt Weihnachten dann wohl aus!<br />
");
echo "<div id=\"gedicht\" >".$text_array[rand(0, count($text_array)-1)]."</div>";

?>
</body>
</html>
