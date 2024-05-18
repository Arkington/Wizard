/// @desc

var _rumble = 1;
var _x_adj = (state == StateShooting) ? random_range(-_rumble, _rumble) : 0;

draw_sprite_ext(
	sprite_index,
	image_index,
	x + _x_adj,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)