//(function() { //Début IEF

function replace(i) {
	var c = cloud[i];
	if(Math.floor(Math.random()+0.5)==0)
	{
		c.y = Math.floor(Math.random() * (heightPage - 350)) + 50;
		c.x = -340;
		c.element.style.width = "340px";
		do
		{
			c.speed = Math.floor(Math.random() * 5);
		}
		while(c.speed==0);
	}
	else
	{
		c.y = Math.floor(Math.random() * (heightPage - 350)) + 50;
		c.x = widthPage;
		c.element.style.width = "0px";
		do
		{
			c.speed = Math.floor(Math.random() * 5) - 5;
		}
		while(c.speed==0);
	}
}

function update() {
	for(var i = 0; i<cloud.length; i++)
	{
		var c = cloud[i];
		c.x += c.speed;
		if(c.x > widthPage - 340)
		{
			c.element.style.width = widthPage - c.x + "px";
		}
		if(c.x < -340 || c.x > widthPage)
		{
			replace(i);
		}
		c.element.style.left = c.x + "px";
		c.element.style.top = c.y + "px";
	}
	timerCloud = setTimeout("update()",30);
}

var cloudElement = document.getElementById('cloud_zone').getElementsByTagName('div');
var body = document.getElementsByTagName('body');
var cloud = [];

var widthPage = body[0].offsetWidth;
var heightPage = body[0].offsetHeight;
if(heightPage < window.innerHeight) { heightPage = window.innerHeight; }
for(var i = 0; i<cloudElement.length; i++)
{
	var c = {};
	c.element = cloudElement[i];
	c.x = Math.floor(Math.random() * (widthPage + 341)) - 340;
	c.y = Math.floor(Math.random() * (heightPage - 300)) + 50;
	do
	{
		c.speed = Math.floor(Math.random() * 10) - 5;
	}
	while(c.speed==0);
	cloud.push(c);
}

update();

//})(); //Fin IEF