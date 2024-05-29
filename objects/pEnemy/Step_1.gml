/// @desc Bumping, momentum

// Friction based on weight
// Weight := the momentum loss in one second
p_x = sign(p_x)*max(abs(p_x) - weight/FPS, 0);
p_y = sign(p_y)*max(abs(p_y) - weight/FPS, 0);