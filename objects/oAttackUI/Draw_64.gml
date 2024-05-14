/// @desc
var atk_pos = {};
var spr_scale = 1.5;
atk_pos[0] = {x: MID_X, y: 12}; // TOP/MIDDLE
atk_pos[1] = {x: MID_X - 16, y: 16}; // LEFT
atk_pos[2] = {x: MID_X + 16, y: 16}; // RIGHT
for (var i = 0; i <= 2; i++) {

	// Attack icon (before frame, frame goes over)
	draw_sprite_ext(
		attacks[i].menu_spr,
		0,
		atk_pos[i].x,
		atk_pos[i].y,
		spr_scale,
		spr_scale,
		0,
		c_white,
		1
	);

	// Attack icon frame
	var _frame_sprite = (i == attack_select) ? sItemFrameSelected : sItemFrame;
	if (attacks[i].cooldown == 0) {
		var _frame_index = sprite_get_number(_frame_sprite) - 1;
	} else {
		var _frame_index = (1 - cooldowns[i]/attacks[i].cooldown)*(sprite_get_number(_frame_sprite) - 1);
	}
	draw_sprite(
		_frame_sprite,
		_frame_index,
		atk_pos[i].x,
		atk_pos[i].y
	);
}
