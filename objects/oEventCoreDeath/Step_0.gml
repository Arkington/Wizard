/// @desc Move object towards target in a parabolic shape
if !active { exit; }


if !begun {
	// oCore must be drawn with DrawUI
	if !instance_exists(oCore) { instance_create_layer(MID_X, MID_Y, LAYER_INSTANCES, oCore); }
	start_x = oCore.x;
	start_y = oCore.y;
	core = oCore;
	dead_player = instance_create_layer(start_x, start_y, LAYER_INSTANCES, oPlayerDead);
	dead_player.persistent = true;
	with (core) { state = CoreStateDead; };
	begun = true;
}

// Increment timer
t++;

// Use a piecewise parabola to do the fall
if (t <= player_arc_time) {
	dead_player.x = start_x + (target_x - start_x)*t/player_arc_time;
	dead_player.y = PiecewiseParabolaY(t, player_arc_time, 16, start_y, target_y);
	core.x = start_x + (target_x - start_x)*t/player_arc_time; // Hat reaches the end sooner
}

if (t <= core_arc_time) {
	core.image_angle = n_spins*360*t/core_arc_time;
	core.y = PiecewiseParabolaY(t, core_arc_time, 200, start_y, target_y - 16);
}

// Animate player
if (t >= animate_point_1) {
	dead_player.image_index = 1;
}
if (t >= animate_point_2) {
	dead_player.image_index = 2;
}
if (t >= player_arc_time) {
	dead_player.image_index = 3;
}
if (t >= core_arc_time and t >= player_arc_time) {
	instance_destroy(core);
	dead_player.image_index = 4;
	complete = true;
}