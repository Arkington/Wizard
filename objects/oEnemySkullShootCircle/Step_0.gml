/// @desc

state();

// Rumble
var _rumble = 2;
x_adj = (state == StateShooting) ? random_range(-_rumble, _rumble) : 0;
y_adj = (state == StateShooting) ? random_range(-_rumble, _rumble) : 0;
