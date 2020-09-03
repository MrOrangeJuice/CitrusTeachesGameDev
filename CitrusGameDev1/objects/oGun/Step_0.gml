/// @description Insert description here
// You can write your code in this editor
x = oPlayer.x;
y = oPlayer.y;

if(bullets > 2)
{
	sprite_index = sGun_power_up_in_hand3;
}
else if(bullets > 1)
{
	sprite_index = sGun_power_up_in_hand;
}

image_angle = point_direction(x,y,mouse_x,mouse_y);

firingdelay = firingdelay - 1;
recoil = max(0,recoil-1);

if (mouse_check_button(mb_left)) && (firingdelay < 0)
{
	recoil = 4;
	firingdelay = firerate;
	sndEffect = irandom_range(1,5);
	switch(sndEffect)
	{
		case 1:
			audio_play_sound(shoot,5,false);
			break;
		case 2:
			audio_play_sound(shoot2,5,false);
			break;
		case 3:
			audio_play_sound(shoot3,5,false);
			break;
		case 4:
			audio_play_sound(shoot4,5,false);
			break;
		case 5:
			audio_play_sound(gun,5,false);
			break;
		
	}
	for(i = 0; i < bullets; i++)
	{
			with (instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed = 25;
				direction = other.image_angle + (random_range(-3,3) * oGun.bullets);
				image_angle = direction;
			}
	}
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}