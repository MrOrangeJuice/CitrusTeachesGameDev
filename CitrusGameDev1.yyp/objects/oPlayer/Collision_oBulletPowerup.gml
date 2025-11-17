/// @description Insert description here
// You can write your code in this editor
if(other.got == false)
{
	oGun.bullets = oGun.bullets + 1;
	if(oGun.bullets >= 10)
	{
		oGun.bullets = 10;
	}
	audio_play_sound(powerup, 5, false);
	other.got = true;
	other.sprite_index = sGunPowerupGet;
	image_index = 0;
}