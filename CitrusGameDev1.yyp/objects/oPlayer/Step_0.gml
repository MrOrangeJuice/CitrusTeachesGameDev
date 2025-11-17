/// @description Calculate Physics
if(canmove){
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_space);
	key_run = keyboard_check(vk_lshift);
}

// Calculate Movement
if(airborne)
{
	// If player released run in midair, they can't run again until they hit the ground
	if(key_run == false)
	{
		runInAir = false;
	}
}

// Check run
if (key_run && runInAir)
{
	walksp = 10;
	running = true;
}
else
{
	walksp = 6;
	running = false;	
}

if (!place_meeting(x,y+1,oWall))
{
	airborne = true;
}
else 
{
	airborne = false;
	// Reset air run
	runInAir = true;
}

var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

// Jumping
if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -20;
	audio_play_sound(marioJump,5,false);
}

// Variable jump height
if vsp < 0 && (!(key_jump)) //if you're moving upwards in the air but not holding down jump
{
	vsp *= 0.85; //essentially, divide your vertical speed
}

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Animation
image_speed = 1;
if(place_meeting(x,y+1,oWall))
{
	if(sign(hsp) == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerRun;
		if(running)
		{
			image_speed = 2;
		}
		else
		{
			image_speed = 1;
		}
	}
}
else
{
	sprite_index = sPlayerJump;
	image_speed = 0;
	if(sign(vsp) > 0)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}

if (hsp != 0) image_xscale = sign(hsp);

if(dead) {
	sprite_index = sPlayerDeath;
	oGun.visible = false;
	deathtime--;
	if(deathtime == 0){
		room_goto_next();
	}
}

if(keyboard_check_pressed(ord("R"))) {
	game_restart();
}