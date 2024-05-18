/// @desc
t++;

// Create shape
if (t % shapes_per_sec*FPS == 0) and (t <= (charge_time_s - pull_time_s)*FPS) {
	var _shape = {
		type: irandom(SHAPE_TYPE.N),
		angle: random(360),
		size: random_range(size_min, size_max),
		r: random_range(r_min, r_max),
		completion: 0
	}
	array_push(shapes, _shape);
}

// Progress the pull
for (var i = 0; i < array_length(shapes); i++) {
	
	var _shape = shapes[i];
	_shape.completion += 1/(pull_time_s*FPS);
	if (_shape.completion >= 1) {
		// Remove completed shapes
		array_delete(shapes, i, 1);
		i--;
		continue;
	}
}

// Duration
if (t >= charge_time_s*FPS) {
	instance_destroy();
}