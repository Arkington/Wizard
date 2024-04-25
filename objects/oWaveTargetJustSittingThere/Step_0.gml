if (!clear and !instance_exists(oEnemyTarget)) {
	for (var i = 0; i < 5; i++) {
		var _target = instance_create_layer(
			RESOLUTION_W/2 + random_range(-50, 50),
			RESOLUTION_H/2 + random_range(-50, 50),
			LAYER_INSTANCES,
			oEnemyTarget
		)
	}
	_target.wave = self;
	array_push(enemies, _target);
}
