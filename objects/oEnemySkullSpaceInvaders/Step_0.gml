/// @desc

state();

// Rumble
var _rumble = 1;
x_adj = (state == StateShooting) ? random_range(-_rumble, _rumble) : 0;
