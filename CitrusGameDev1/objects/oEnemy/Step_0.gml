/// @description Calculate Physics

hsp = xdirection * walksp;

vsp = vsp + grv;

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