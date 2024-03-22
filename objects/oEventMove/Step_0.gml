/// @desc Move object towards target
if !active { exit; }

direction = point_direction(obj_to_move.x, obj_to_move.y, target_x, target_y);
dist_remain = point_distance(obj_to_move.x, obj_to_move.y, target_x, target_y);
move_dist = min(move_speed, dist_remain);
obj_to_move.x += lengthdir_x(move_dist, direction);
obj_to_move.y += lengthdir_y(move_dist, direction);
if (obj_to_move.x == target_x) and (obj_to_move.y == target_y) {
	complete = 1;
}