/*
function PlayerInteract() {
	// 3-point interaction system
	var _interact = instance_position(
		x + lengthdir_x(INTERACT_DIST, direction) - 1,
		y + lengthdir_y(INTERACT_DIST, direction),
		pEntity
	);
	if _interact == noone { _interact = instance_position(
		x + lengthdir_x(INTERACT_DIST, direction - INTERACT_ANGLE) - 1,
		y + lengthdir_y(INTERACT_DIST, direction - INTERACT_ANGLE),
		pEntity
	); }
	if _interact == noone { _interact = instance_position(
		x + lengthdir_x(INTERACT_DIST, direction + INTERACT_ANGLE) - 1,
		y + lengthdir_y(INTERACT_DIST, direction + INTERACT_ANGLE),
		pEntity
	); }
		
	if (_interact != noone and _interact.onInteract != NO_INTERACT) {
		script_execute_ext(_interact.onInteract, _interact.onInteractArgs);
		if (_interact.facePlayerOnInteract) {
			with (_interact) {
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}
}
*/

function PlayerInteract() {
	// Range interaction system
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

	// Check in order of closest to rectangle mid
	for (var i = 0; i < _entities_found; i++) {
		_interact = _interact_list[| i];
		if (_interact.on_interact != NO_INTERACT) {
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
