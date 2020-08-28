/// @description Insert description here
// You can write your code in this editor
spawntime--;
if(spawntime <= 0){
	with (instance_create_layer(x,y,"Enemies",oEnemy)) {
		dir = irandom_range(0,1);
		switch(dir) {
			case 0:
				xdirection = -1;
				break;
			case 1:
				xdirection = 1;
				break;
		}
	}
	spawntime = 300;
}