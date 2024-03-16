/// @arg _magnitude sets the strength of the shake (distance range)
/// @arg _frames sets the length of the shake in frames
function ShakeCamera(_magnitude, _frames){
	with (global.camera) {
		if (_magnitude > shakeRemainX) {
			shakeRandom = true;
			shakeMagnitude = _magnitude;
			shakeRemainX = _magnitude;
			shakeRemainY = _magnitude;
			shakeLength = _frames;
		}
	}
}

/// @arg _magnitude sets the strength of the shake (distance range)
/// @arg _frames sets the length of the shake in frames
/// @arg {Bool} _smooth determines smooth shake or not
function ShakeCameraX(_magnitude, _frames, _smooth = true){
	with (global.camera) {
		if (_magnitude > shakeRemainX) {
			shakeRandom = !_smooth;
			shakeMagnitude = _magnitude;
			shakeRemainX = _magnitude;
			shakeLength = _frames;
		}
	}
}


function ExecuteShake() {
	x += shakeRandom ? random_range(-shakeRemainX, shakeRemainX) : shakeRemainX * flipper;
	y += shakeRandom ? random_range(-shakeRemainY, shakeRemainY) : shakeRemainY * flipper;
	shakeRemainX = max(0, shakeRemainX - ((1/shakeLength) * shakeMagnitude));
	shakeRemainY = max(0, shakeRemainY - ((1/shakeLength) * shakeMagnitude));
	flipper += 1;
	if flipper >= flip_frames {
		flipper *= -1;
	}
}