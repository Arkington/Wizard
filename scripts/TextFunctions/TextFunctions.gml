/// @desc
function draw_text_border(_x, _y, _str, _scale = 1) {
	var _colour = draw_get_color();
	draw_set_color(BLACK);
	draw_text(_x+1, _y, _str);
	draw_text(_x-1, _y, _str);
	draw_text(_x, _y+1, _str);
	draw_text(_x, _y-1, _str);
	draw_set_color(_colour);
	draw_text(_x, _y, _str);
}

function draw_text_border_ext(_x, _y, _str, _sep, _width, _scale, _angle) {
	var _colour = draw_get_color();
	draw_set_color(BLACK);
	draw_text_ext_transformed(_x+_scale, _y, _str, _sep, _width, _scale, _scale, _angle);
	draw_text_ext_transformed(_x-_scale, _y, _str, _sep, _width, _scale, _scale, _angle);
	draw_text_ext_transformed(_x, _y+_scale, _str, _sep, _width, _scale, _scale, _angle);
	draw_text_ext_transformed(_x, _y-_scale, _str, _sep, _width, _scale, _scale, _angle);
	draw_set_color(_colour);
	draw_text_ext_transformed(_x, _y, _str, _sep, _width, _scale, _scale, _angle);
}

function draw_text_edge_ext(_x, _y, _str, _sep, _width, _scale, _angle, _colour, _alpha) {
	draw_text_ext_transformed_color(_x+_scale, _y, _str, _sep, _width, _scale, _scale, _angle, BLACK, BLACK, BLACK, BLACK, _alpha);
	draw_text_ext_transformed_color(_x, _y, _str, _sep, _width, _scale, _scale, _angle, _colour, _colour, _colour, _colour, _alpha);
}