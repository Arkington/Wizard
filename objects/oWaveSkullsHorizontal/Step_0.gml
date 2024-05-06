/// @desc

// Create new enemies every (spawn_rate_s) seconds
if (timer % (spawn_rate_s*FPS) == 0) {
	if top {
		var _skull = instance_create_layer(-8, 72, LAYER_INSTANCES, oEnemySkullShootUpDown);
		_skull.direction = RIGHT*90;
		array_push(enemies, _skull);
	} else {
		var _skull = instance_create_layer(RESOLUTION_W + 8, 184, LAYER_INSTANCES, oEnemySkullShootUpDown);
		_skull.direction = LEFT*90;
		array_push(enemies, _skull);
	}
	top = !top;
}

// Destroy enemies at the end of their path
if (timer % FRAMES_BETWEEN_CLEAN) {
	for (var i = 0; i < array_length(enemies); i++) {
		// if enemy finished path
		// pop from enemies list
		// destroy
	}
}