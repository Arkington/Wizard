/// @desc

var _x_adj = (state = StateNoticed) ? random_range(-1, 1) : 0;

draw_sprite(
	sprite_index,
	image_index,
	x + _x_adj,
	y
)