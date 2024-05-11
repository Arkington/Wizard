/// @desc

var _rumble = 2;
var _x_adj = (state == StateAsleep) ? 0 : random_range(-_rumble, _rumble);
var _y_adj = (state == StateAsleep) ? 0 : random_range(-_rumble, _rumble);

draw_sprite_ext(
	sprite_index,
	image_index,
	x + _x_adj,
	y + _y_adj,
	image_xscale,
	image_yscale,
	angle + 90,
	image_blend,
	image_alpha
)