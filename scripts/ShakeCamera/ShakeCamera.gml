/// @arg _magnitude sets the strength of the shake (distance range)
/// @arg _frames sets the length of the shake in frames
function ShakeCamera(_magnitude, _shake_time){
	with (global.camera) {
		if (_magnitude > shake_remain_x) {
			shake_random = true;
			shake_magnitude = _magnitude;
			shake_remain_x = _magnitude;
			shake_remain_y = _magnitude;
			shake_time = _shake_time;
		}
	}
}

/// @arg _magnitude sets the strength of the shake (distance range)
/// @arg _frames sets the length of the shake in frames
/// @arg {Bool} _smooth determines smooth shake or not
function ShakeCameraX(_magnitude, _shake_time, _smooth = true){
	with (global.camera) {
		if (_magnitude > shake_remain_x) {
			shake_random = !_smooth;
			shake_magnitude = _magnitude;
			shakeRemainX = _magnitude;
			shake_time = _shake_time;
		}
	}
}


function ExecuteShake() {
	x += shake_random ? random_range(-shake_remain_x, shake_remain_x) : shake_remain_x * flipper;
	y += shake_random ? random_range(-shake_remain_y, shake_remain_y) : shake_remain_y * flipper;
	shake_remain_x = max(0, shake_remain_x - ((1/shake_time) * shake_magnitude));
	shake_remain_y = max(0, shake_remain_y - ((1/shake_time) * shake_magnitude));
	flipper += 1;
	if flipper >= flip_frames {
		flipper *= -1;
	}
}