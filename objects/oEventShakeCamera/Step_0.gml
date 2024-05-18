/// @desc Shake screen
if !active { exit; }

// Change direction
if !begun {
	ShakeCamera(magnitude, shake_time_s*FPS);
	begun = true;
}

if (global.camera.shake_remain_x == 0) and (global.camera.shake_remain_y == 0) {
	complete = true;
}