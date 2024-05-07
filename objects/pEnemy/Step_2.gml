/// @desc Movement

// Momentum push
x += p_x;
y += p_y;

// Movement to target
var _dir = point_direction(x, y, target_x, target_y);
var _x_move = lengthdir_x(move_speed, _dir);
x += sign(_x_move) * min(abs(_x_move), abs(x - target_x));
var _y_move = lengthdir_y(move_speed, _dir);
y += sign(_y_move) * min(abs(_y_move), abs(y - target_y));
