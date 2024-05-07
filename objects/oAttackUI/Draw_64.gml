/// @desc
var atk_pos = {};
var spr_scale = 1.5;
atk_pos[UP] = {x: RESOLUTION_W/2, y: 12};
atk_pos[LEFT] = {x: RESOLUTION_W/2 - 16, y: 16};
atk_pos[RIGHT] = {x: RESOLUTION_W/2 + 16, y: 16};
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
	var _frame_sprite = (i == atk_select) ? sItemFrameSelected : sItemFrame;
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
