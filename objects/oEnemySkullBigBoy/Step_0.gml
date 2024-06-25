/// @desc

t++;
state();

// Rumble
var _rumble = 2;
x_adj = (state == StateAsleep) ? 0 : random_range(-_rumble, _rumble);
y_adj = (state == StateAsleep) ? 0 : random_range(-_rumble, _rumble);

// Image angle
image_angle = angle + 90;