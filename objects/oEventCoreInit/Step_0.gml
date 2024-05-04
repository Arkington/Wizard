/// @desc Move object towards target in a parabolic shape
if !active { exit; }


if !begun {
	// oCore must be drawn with DrawUI
	start_x = oPlayer.x - camera_get_view_x(view_camera[0]);
	start_y = oPlayer.y - camera_get_view_y(view_camera[0]);
	core = instance_create_depth(start_x, start_y, TRANSITION_DEPTH - 1, oCore);
	with (core) {
		state = CoreStateInit;
		persistent = true;
	};
	begun = true;
}

// Increment timer
t++;

// First half of time is spent moving up
core.image_angle = n_spins*360*t/total_frames;
if (t < total_frames/2) {
	core.y = start_y - HAT_JUMP_HEIGHT + HAT_JUMP_HEIGHT*power(2*t/total_frames - 1, 2); // Parabola peaking at total_frames/2
} else {
	core.x = start_x + (target_x - start_x)*power(2*t/total_frames - 1, 2);
	core.y = start_y - HAT_JUMP_HEIGHT + (HAT_JUMP_HEIGHT + target_y - start_y)*power(2*t/total_frames - 1, 2); // Finish the parabola by accelerating to target y
}

if (t >= total_frames) {
	complete = true;
}