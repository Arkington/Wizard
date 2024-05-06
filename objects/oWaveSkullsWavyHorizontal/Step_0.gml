/// @desc

// Create new enemies every (spawn_rate_s) seconds
if (timer % (spawn_rate_s*FPS) == 0) {
	// Alternate left and right, top vs bottom is random
	left = !left;
	var _top = random_range(0, 1);
	var _spawn_x = left ? -8 : RESOLUTION_W + 8;
	var _spawn_y = _top ? random_range(56, 120) : random_range(152, 216);

	var _skull = instance_create_layer(_spawn_x, _spawn_y, LAYER_INSTANCES, oEnemySkull);
	array_push(enemies, _skull);
	with (_skull) {
		if other.left {
			path_start(
				flip_path(pthSkullsHorizontal, false, random_range(0, 1)),
				other.skull_speed + random(0.3),
				path_action_stop,
				false
			);
		} else {
			path_start(
				flip_path(pthSkullsHorizontal, true, random_range(0, 1)),
				other.skull_speed,
				path_action_stop,
				false
			);
		}
	}
}

// Destroy enemies at the end of their path
if (timer % FRAMES_BETWEEN_CLEAN) {
	for (var i = 0; i < array_length(enemies); i++) {
		// if enemy finished path
		// pop from enemies list
		// destroy
	}
}