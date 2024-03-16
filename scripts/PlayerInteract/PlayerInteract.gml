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