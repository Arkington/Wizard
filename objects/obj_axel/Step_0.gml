var _up = keyboard_check(KEY_MOVE_UP);
var _left = keyboard_check(KEY_MOVE_LEFT);
var _down = keyboard_check(KEY_MOVE_DOWN);
var _right = keyboard_check(KEY_MOVE_RIGHT);

// Movement speed
var _move_speed = 2;
if keyboard_check(KEY_RUN) {
	_move_speed = 5;
}

// Speed
x_speed = (_right - _left) * _move_speed;
y_speed = (_down - _up) * _move_speed;

// Pausing
if instance_exists(obj_pauser) {
	x_speed = 0;
	y_speed = 0;
}

// Spriting
mask_index = sprite[DOWN];
if (y_speed == 0 && x_speed != 0) {
    face = (x_speed > 0) ? RIGHT : LEFT;
} else if (x_speed == 0 && y_speed != 0) {
    face = (y_speed > 0) ? DOWN : UP;
}

// Collisions
if place_meeting(x + x_speed, y, obj_wall) {
	x_speed = 0;
}
if place_meeting(x, y + y_speed, obj_wall) {
	y_speed = 0;
}

// Depth
depth = -bbox_bottom;

// Moving
x += x_speed;
y += y_speed;

// Animate
if x_speed == 0 && y_speed == 0 {
	image_index = 0;
}
sprite_index = sprite[face];
