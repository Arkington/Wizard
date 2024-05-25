// Get 9-slice params
var _box_nineslice = sprite_get_nineslice(sprite_index);

// Draw meter fluid
draw_sprite_stretched(
	sMeterFluid,
	image_index,
	x,
	y,
	clamp(bar_fill, 0, 1)*METER_LEN - 2,
	sprite_height
)

// Glow for filled meter
if (bar_fill >= 1) {
	draw_set_alpha(0.5*(1 - abs(sin(current_time/200))));
	draw_rectangle(
		x,
		y,
		x + METER_LEN - 2,
		y + 5,
		false
	)
	draw_set_alpha(1);
}

// Draw meter
draw_sprite_stretched(
	sMeter,
	image_index,
	x,
	y,
	METER_LEN,
	sprite_height
);
