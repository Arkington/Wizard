event_inherited();

if (!clear and !instance_exists(oEnemySkull)) {
	var _target = instance_create_layer(
		RESOLUTION_W/2 + random_range(-50, 50),
		RESOLUTION_H/2 + random_range(-50, 50),
		LAYER_INSTANCES,
		oEnemySkull
	)
	_target.wave = self;
	array_push(enemies, _target);
}
