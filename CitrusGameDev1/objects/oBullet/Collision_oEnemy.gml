/// @description Insert description here
// You can write your code in this editor
instance_destroy(other);
audio_play_sound(enemyDeath,5,false);
global.gamescore += 10;
with (oGame) scoreTextScale = 1.5;
instance_destroy();