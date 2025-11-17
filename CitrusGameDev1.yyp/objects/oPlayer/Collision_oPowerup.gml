/// @description Insert description here
// You can write your code in this editor
if(other.got == false)
{
	oGun.firerate = oGun.firerate - 2;
	if(oGun.firerate <= 2)
	{
		oGun.firerate = 2;
	}
	audio_play_sound(powerup, 5, false);
	other.got = true;
	other.sprite_index = sPowerupGet;
	image_index = 0;
}