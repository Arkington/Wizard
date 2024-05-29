/// @desc

// Look at player
image_angle = point_direction(x, y, oCore.x, oCore.y) - 90;
state();

// Rumble
var _rumble = 2;
x_adj = (state == StateShooting) ? random_range(-_rumble, _rumble) : 0;
y_adj = (state == StateShooting) ? random_range(-_rumble, _rumble) : 0;
