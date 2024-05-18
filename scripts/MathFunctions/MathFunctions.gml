/*
	t: Current time
	T: Total time
	H: Peak height reached
	y1: Starting elevation
	y2: Ending elevation
*/
function PiecewiseParabolaY(t, T, H, y1, y2) {
	if (t < T/2) {
		return y1 - H + H*power(2*t/T - 1, 2); // Parabola peaking at T/2
	} else {
		return y1 - H + (H + y2 - y1)*power(2*t/T - 1, 2); // Finish the parabola by accelerating to target y
	}
}

/// @desc A random normal variable, approximated by summing 12 uniform random variables.
function rnorm(_mean = 0, _var = 1) {
	var X = 0;
	for (var i = 0; i < 12; i++) {
		X += random(1);
	}
	return sqrt(_var)*(X - 6) + _mean;
}

/// @desc Adds a new value to an ARMA sequence
function next_arma_value(_sequence, _noises, _ar_array, _ma_array, _var = 1, _manage_array_size = true) {
	
	var n_seq = array_length(_sequence);
	var n_noise = array_length(_noises);
	var p = array_length(_ar_array);
	var q = array_length(_ma_array);
	var e = rnorm(0, _var);
	
	var Xt = e;
	// AR component
	for (var i = 0; i < min(p, n_seq); i++) {
		Xt += _ar_array[i] * _sequence[min(p, n_seq) - i - 1];
	}
	// MA component
	for (var j = 0; j < min(q, n_noise); j++) {
		Xt += _ma_array[j] * _noises[min(q, n_noise) - j - 1];
	}
	
	array_push(_sequence, Xt);
	array_push(_noises, e);
	
	// Delete elements so that we only keep max(p, q) elements
	if (_manage_array_size) {
		if (n_seq + 1 > max(p, q)) {
			array_delete(_sequence, 0, n_seq + 1 - max(p, q));
		}
		if (n_noise + 1 > max(p, q)) {
			array_delete(_noises, 0, n_noise + 1 - max(p, q));
		}
	}
}
