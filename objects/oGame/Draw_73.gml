/// @descr Debug Draw
if !global.debug { exit; }

with (pEntity) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}

with (oPlayer) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

/*
	// Interact range
	var _interact_x = x + lengthdir_x(INTERACT_DIST, direction);
	var _interact_y = y + lengthdir_y(INTERACT_DIST, direction);
	draw_rectangle(
		_interact_x - INTERACT_RANGE,
		_interact_y - INTERACT_RANGE,
		_interact_x + INTERACT_RANGE,
		_interact_y + INTERACT_RANGE,
		true
	)
*/
	
	var _h_shift = lengthdir_x(bbox_right - bbox_left, CARDINAL_DIR*90);
	var _v_shift = lengthdir_y(bbox_bottom - bbox_top, CARDINAL_DIR*90);
	
	draw_rectangle(
		bbox_left + _h_shift,
		bbox_top + _v_shift,
		bbox_right + _h_shift,
		bbox_bottom + _v_shift,
		true
	)

}