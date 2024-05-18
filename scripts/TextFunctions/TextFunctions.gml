/// @desc
function draw_text_border(_x, _y, _str) {
	draw_set_color(BLACK);
	draw_text(_x+1, _y, _str);
	draw_text(_x-1, _y, _str);
	draw_text(_x, _y+1, _str);
	draw_text(_x, _y-1, _str);
	draw_set_color(WHITE);
	draw_text(_x, _y, _str);
}