function PlayerInteract() {
	// Range interaction system
	
	/*
	var _interact_x = x + lengthdir_x(INTERACT_DIST, direction);
	var _interact_y = y + lengthdir_y(INTERACT_DIST, direction);
	var _interact_list = ds_list_create();
	var _interact = noone;
	var _entities_found = collision_rectangle_list(
		_interact_x - INTERACT_RANGE,
		_interact_y - INTERACT_RANGE,
		_interact_x + INTERACT_RANGE,
		_interact_y + INTERACT_RANGE,
		pEntity,
		false,
		true,
		_interact_list,
		true
	);
	*/
	
	// Player collision mask interaction system
	var _h_shift = lengthdir_x(bbox_right - bbox_left, CARDINAL_DIR*90);
	var _v_shift = lengthdir_y(bbox_bottom - bbox_top, CARDINAL_DIR*90);
	var _interact_list = ds_list_create();
	var _interact = noone;
	var _entities_found = collision_rectangle_list(
		bbox_left + _h_shift,
		bbox_top + _v_shift,
		bbox_right + _h_shift,
		bbox_bottom + _v_shift,
		pEntity,
		false,
		true,
		_interact_list,
		true
	);

	// Check in order of closest to rectangle mid
	for (var i = 0; i < _entities_found; i++) {
		_interact = _interact_list[| i];
		
		if (_interact.on_interact != NONE) {
			script_execute_ext(_interact.on_interact, _interact.on_interact_args);
		
			// Facing player
			if (_interact.face_player_on_interact) {
				with (_interact) {
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
			break;
		}
	}
		
	ds_list_destroy(_interact_list);
}
