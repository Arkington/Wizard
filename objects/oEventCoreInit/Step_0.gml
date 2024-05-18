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

// Use a piecewise parabola to do the jump
core.image_angle = n_spins*360*t/total_frames;
core.x = (t > total_frames/2 ? start_x + (target_x - start_x)*power(2*t/total_frames - 1, 2) : start_x);
core.y = PiecewiseParabolaY(t, total_frames, HAT_JUMP_HEIGHT, start_y, target_y);

if (t >= total_frames) {
	complete = true;
}