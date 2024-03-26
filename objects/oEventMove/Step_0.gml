/// @desc Move object towards target
if !active { exit; }

// May only be a move in one direction
if ignore_x { target_x = obj_to_move.x; }
if ignore_y { target_y = obj_to_move.y; }

direction = point_direction(obj_to_move.x, obj_to_move.y, target_x, target_y);

// Change direction
if !begun {
	obj_to_move.direction = direction;
	begun = true;
}

var _dist_remain = point_distance(obj_to_move.x, obj_to_move.y, target_x, target_y);
var _move_dist = min(move_speed, _dist_remain);

// Set speed for animation purposes
if !ignore_x {
	obj_to_move.x_speed = lengthdir_x(_move_dist, direction);
	obj_to_move.x += obj_to_move.x_speed;
}
if !ignore_y {
	obj_to_move.y_speed = lengthdir_y(_move_dist, direction);
	obj_to_move.y += obj_to_move.y_speed;
}

if (obj_to_move.x == target_x) and (obj_to_move.y == target_y) {
	obj_to_move.x_speed = 0;
	obj_to_move.y_speed = 0;
	complete = 1;
}