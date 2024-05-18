/// @desc Movement and OOB

// Velocity
x += vel_x;
y += vel_y;

// Acceleration
vel_x += acc_x/FPS;
vel_y += acc_y/FPS;

// Momentum push
x += p_x;
y += p_y;


// Movement to target
if (target_x != NONE) {
	var _x_dir = point_direction(x, 0, target_x, 0);
	var _x_move = lengthdir_x(target_speed, _x_dir);
	x += sign(_x_move) * min(abs(_x_move), abs(x - target_x));
}
if (target_y != NONE) {
	var _y_dir = point_direction(0, y, 0, target_y);
	var _y_move = lengthdir_y(target_speed, _y_dir);
	y += sign(_y_move) * min(abs(_y_move), abs(y - target_y));
}

if (
	(x < -sprite_width - OOB_KILL_DIST) or
	(x > sprite_width + RESOLUTION_W + OOB_KILL_DIST) or
	(y < sprite_height - OOB_KILL_DIST) or
	(y > sprite_height + RESOLUTION_H + OOB_KILL_DIST)
) {
	ReportEnemyDown(id, false);
	instance_destroy();
}