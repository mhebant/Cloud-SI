(function() { //Début IFE

function addEvent(element, event, func) { //compatibilité Event IE
    if (element.attachEvent) {
        element.attachEvent('on' + event, func);
    } else {
        element.addEventListener(event, func, true);
    }
}
function createCookie(name,value,days) { //création cookie
	var date = new Date();
	date.setTime(date.getTime()+(days*24*60*60*1000));
	var expires = "; expires="+date.toGMTString();
	document.cookie = name+"="+value+expires+"; path=/";
}
function readCookie(name) { //lire cookie
	var nameEquals = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEquals) == 0) return c.substring(nameEquals.length,c.length).split(',');
	}
	return null;
}
function eraseCookie(name) { //supprimer cookie
	createCookie(name,"",-1);
}

var opened = false;
var fixed = 'absolute';
var id = -1;
var lastread = -1;
var msgmissedid = 0;
var xhrMsg = new XMLHttpRequest();
var xhrConnect = new XMLHttpRequest();

{ //Event
	var temp = {};
	var bodyElement = document.getElementById('body');
	var buttonElement = document.getElementById('tchat_button');
	var cursorElement = document.getElementById('cursor');
	var tchatElement = document.getElementById('tchat');
	var contentElement = document.getElementById('tchat_content');
	var topElement = document.getElementById('tchat_top');
	var bottomElement = document.getElementById('tchat_bottom');
	var msgElement = document.getElementById('tchat_msg');
	var textzoneElement = document.getElementById('tchat_textzone');
	var connectBoxElement = document.getElementById('tchat_connectBox');
	var connectContentElement = document.getElementById('tchat_connectContent');
	
	//chargement des parametres
	var cookie = readCookie('tchatset')
	if(cookie != null) { 
		//Syntaxe cookie "tchatset": "posX,posY,width,height,display,lastread,fixed" avec px a la fin de chaque nombre et "display" soit "none" soit "block" et "fixed" soit "absolute" soit "fixed"
		tchatElement.style.left = cookie[0] + 'px';
		tchatElement.style.top = cookie[1] + 'px';
		contentElement.style.width = cookie[2] + 'px';
		contentElement.style.height = cookie[3] + 'px';
		msgElement.style.height = cookie[3] - 24 + "px";
			textzoneElement.style.width = cookie[2] - 4 + "px";
		if(cookie[4]=='none') {
			tchatElement.style.display = 'none'; 
			opened = false; }
		else {
			tchatElement.style.display = 'block';
			opened = true; }
		lastread = parseInt(cookie[5]);
		fixed = cookie[6];
		tchatElement.style.position = fixed;
	}
	//enregistrement des parametres
	addEvent(window, 'unload', function(e) {
		var posX = getComputedStyle(tchatElement, null).left;
		var posY = getComputedStyle(tchatElement, null).top;
		var width = getComputedStyle(contentElement, null).width;
		var height = getComputedStyle(contentElement, null).height;
		var value = posX.substring(0, posX.length - 2) + ',' + posY.substring(0, posY.length - 2) + ',' + width.substring(0, width.length - 2) + ',' + height.substring(0, height.length - 2) + ',' + getComputedStyle(tchatElement, null).display + ',' + lastread + ',' + fixed;
		createCookie('tchatset', value, 1);
		});
	
	//boutton tchat
	addEvent(buttonElement, 'click', function(e) { 
		tchatElement.style.display = 'block';
		opened = true;
		buttonElement.innerHTML = 'Tchat'
		lastread = id;
		});
	//button close
	addEvent(document.getElementById('tchat_close'), 'click', function(e) { 
		tchatElement.style.display = 'none';
		opened = false;
		});
	//boutton connect
	addEvent(document.getElementById('tchat_connect'), 'click', function(e) { 
		xhrConnect.open('POST', 'sys/tchat');
		xhrConnect.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhrConnect.onreadystatechange = function() {
			if (xhrConnect.readyState == 4 && xhrConnect.status == 200) {
				connectContentElement.innerHTML = xhrConnect.responseText;
			}};
		xhrConnect.send();
		connectBoxElement.style.display = 'block';
		});
	addEvent(document.getElementById('tchat_connect'), 'mouseout', function(e) { 
		connectBoxElement.style.display = 'none';
		});
	//Boutton fix
	addEvent(document.getElementById('tchat_fix'), 'click', function(e) { 
		if(fixed == 'absolute')
		{
			fixed = 'fixed';
			var top = getComputedStyle(tchatElement, null).top+ "px";
			tchatElement.style.top =  parseInt(top.substring(0, top.length - 2)) - bodyElement.scrollTop + 'px';
		}
		else
		{
			fixed = 'absolute';
			var top = getComputedStyle(tchatElement, null).top+ "px";
			tchatElement.style.top =  parseInt(top.substring(0, top.length - 2)) + bodyElement.scrollTop + 'px';
		}
		tchatElement.style.position = fixed;
		});
	//envoi message
	addEvent(textzoneElement, 'keydown', function(e) {
		if(e.keyCode==13)
		{
			xhrMsg.open('POST', 'sys/tchat');
			xhrMsg.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhrMsg.send("msg=" + encodeURIComponent(textzoneElement.value));
			textzoneElement.value = '';
			lastread = id + 1;
		}
		});
	//reseize
	addEvent(bottomElement, 'mousedown', function(e) { 
		temp.height = getComputedStyle(contentElement, null).height;
		temp.height = parseInt(temp.height.substring(0, temp.height.length - 2));
		temp.width = getComputedStyle(contentElement, null).width;
		temp.width = parseInt(temp.width.substring(0, temp.width.length - 2));
		temp.x = e.clientX;
		temp.y = e.clientY; 
		temp.action = "resize";
		cursor.style.display = "block";
		cursor.style.top = bodyElement.scrollTop + 'px';
		});
	addEvent(cursorElement, 'mouseup', function(e) { 
		temp.action = "no";
		cursor.style.display = "none";
		});
	addEvent(cursorElement, 'mousemove', function(e) {
		if(temp.action && temp.action == "resize")
		{
			var height = temp.height + (e.clientY - temp.y);
			var width = temp.width + (e.clientX - temp.x);
			
			if(height < 80)height = 80;
			else if(height > 800) height = 800;
			if(width < 80) width = 80;
			else if(width > 900) width = 900;
			
			contentElement.style.height = height + "px";
			contentElement.style.width = width + "px";
			msgElement.style.height = height - 24 + "px";
			textzoneElement.style.width = width - 4 + "px";
		}
		});
	//move
	addEvent(topElement, 'mousedown', function(e) {
		var element = e.target || e.srcElement;
		if(element.id != 'tchat_close' && element.id != 'tchat_connect' && element.id != 'tchat_fix')
		{
			temp.posY = getComputedStyle(tchatElement, null).top;
			temp.posY = parseInt(temp.posY.substring(0, temp.posY.length - 2));
			temp.posX = getComputedStyle(tchatElement, null).left;
			temp.posX = parseInt(temp.posX.substring(0, temp.posX.length - 2));
			temp.x = e.clientX;
			temp.y = e.clientY; 
			temp.action = "move";
			cursor.style.display = "block";
			cursor.style.top = bodyElement.scrollTop + 'px';
		}
		});
	addEvent(cursorElement, 'mouseup', function(e) { 
		temp.action = "no";
		cursor.style.display = "none";
		});
	addEvent(cursorElement, 'mousemove', function(e) {
		if(temp.action && temp.action == "move")
		{
			tchatElement.style.top = (temp.posY + (e.clientY - temp.y)) + "px";
			tchatElement.style.left = (temp.posX + (e.clientX - temp.x)) + "px";
		}
		});
}

//init sound
soundManager.url = 'sound/soundmanager2.swf';
soundManager.debugMode = false;
soundManager.onload = function() {soundManager.createSound('sound','sound/bip.mp3'); };

//init conection et tchat
var actualize = function() {
	xhrMsg.open('POST', 'sys/tchat');
	xhrMsg.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhrMsg.onreadystatechange = function() {
	if (xhrMsg.readyState == 4 && xhrMsg.status == 200) {
		if(xhrMsg.responseText != 'n')
		{
			var reponse = xhrMsg.responseText.split('/LastId/');
			id = parseInt(reponse[0]);
			msgElement.innerHTML = reponse[1];
			msgElement.scrollTop = msgElement.scrollHeight;
			if(lastread == -1)
				lastread = id;
			else
			{
				if(id != lastread)
				{
					soundManager.play('sound');
					if(opened == false)
						buttonElement.innerHTML = 'Tchat (' + (id - lastread) + ')';
				}
			}
		}
	}};
	xhrMsg.send("id=" + id);
}
actualize();
setInterval(actualize, 1000);
	
		
})(); //Fin IFE