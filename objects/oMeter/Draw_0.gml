// TODO: finish all of this crap

// Get 9-slice params
var _box_nineslice = sprite_get_nineslice(sprite_index);
var _meter_frac = 0.5;

// Draw meter
draw_sprite_stretched(
	sprite_index,
	image_index,
	x,
	y,
	METER_LEN,
	sprite_height
);
