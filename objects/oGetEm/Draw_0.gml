/// @desc

// Box
draw_sprite_stretched(
	box_sprite,
	0,
	x,
	y,
	GET_EM_W,
	GET_EM_H
);

// Text
draw_set_text(fntText, WHITE, fa_center, fa_middle);
var _text = "Get 'em!";
draw_text_transformed(
	x + GET_EM_W/2,
	y + 8,
	_text,
	2/3,
	2/3,
	0
);

// Enemy
draw_sprite_ext(
	enemy_sprite,
	0,
	x + 8 + sprite_get_xoffset(enemy_sprite),
	y + 40 + sprite_get_yoffset(enemy_sprite),
	2/3,
	2/3,
	0,
	WHITE,
	1
);

// Qty
draw_set_text(fntText, WHITE, fa_left, fa_top);
draw_text_transformed(
	x + 24,
	y + 40,
	$"x {enemy_qty}",
	2/3,
	2/3,
	0
);

// Battle timer
if (time_remaining_s <= TIME_WARNING_S) {
	var _frame = ceil((1 - max(time_remaining_s, 0)/TIME_WARNING_S)*sprite_get_number(sBattleTimer)) - 1;
	var _scale = 1 + 0.5*abs(sin(16*(1 - time_remaining_s/TIME_WARNING_S))); // Hackjob function to make the timer bounce
	var _rot = 8*sin(19*(1 - time_remaining_s/TIME_WARNING_S)); // Hackjob function to make the timer rotate
	draw_sprite_ext(
		sBattleTimer,
		_frame,
		x + GET_EM_W/2,
		y + 28,
		_scale,
		_scale,
		_rot,
		WHITE,
		1
	)
}