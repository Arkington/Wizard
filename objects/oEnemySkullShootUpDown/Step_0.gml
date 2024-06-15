/// @desc
state();

// Shake
x_adj = (state == StateNoticed) ? random_range(-1, 1) : 0;
