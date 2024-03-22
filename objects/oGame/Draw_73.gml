/// @descr Debug Draw
if !global.debug { exit; }

with (pEntity) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}

with (oPlayer) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
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
	/*
	draw_circle(
		x + lengthdir_x(INTERACT_DIST, direction) - 1,
		y + lengthdir_y(INTERACT_DIST, direction),
		1,
		false
	);
	draw_circle(
		x + lengthdir_x(INTERACT_DIST, direction - INTERACT_ANGLE) - 1,
		y + lengthdir_y(INTERACT_DIST, direction - INTERACT_ANGLE),
		1,
		false
	);
	draw_circle(
		x + lengthdir_x(INTERACT_DIST, direction + INTERACT_ANGLE) - 1,
		y + lengthdir_y(INTERACT_DIST, direction + INTERACT_ANGLE),
		1,
		false
	);
	*/
}