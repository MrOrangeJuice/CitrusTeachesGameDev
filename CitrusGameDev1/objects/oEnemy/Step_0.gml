/// @description Calculate Physics

hsp = xdirection * walksp;

vsp = vsp + grv;
jumptime--;

// Jumping
if (place_meeting(x,y+1,oWall)) && (jumptime <= 0)
{
	vsp = -20;
	jumptime = 300;
	//audio_play_sound(push,5,false);
}

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	xdirection = -1 * xdirection;
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