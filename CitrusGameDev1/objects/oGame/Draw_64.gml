/// @description Draw Score Count
if (room != rTitle && room != rGameOver)
{
	scoreTextScale = max(scoreTextScale * 0.95, 1);
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(RES_W-8,12,"Score: " + string(global.gamescore), scoreTextScale, scoreTextScale,0);
	draw_set_color(c_white);
	draw_text_transformed(RES_W-10,10,"Score: " + string(global.gamescore), scoreTextScale, scoreTextScale,0);
}
else if (room == rGameOver)
{
	scoreTextScale = max(scoreTextScale * 0.95, 1);
	DrawSetText(c_black, fMenu, fa_right, fa_top);
	draw_text_transformed(RES_W-420,500,"Your Score Was: " + string(global.gamescore), scoreTextScale*2, scoreTextScale*2,0);
	draw_set_color(c_white);
	draw_text_transformed(RES_W-422,498,"Your Score Was: " + string(global.gamescore), scoreTextScale*2, scoreTextScale*2,0);
}
