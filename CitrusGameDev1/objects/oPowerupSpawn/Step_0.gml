/// @description Insert description here
// You can write your code in this editor
spawntimer--;
powerupspawn = irandom_range(0,2);
if(spawntimer <= 0) {
	if(powerupspawn == 1)
	{
		instance_create_layer((x+random_range(-500,500)),(y+random_range(-500,500)),"Instances",oBulletPowerup);
	}
	else
	{
		instance_create_layer((x+random_range(-500,500)),(y+random_range(-500,500)),"Instances",oPowerup);
	}
	spawntimer = 480;
}