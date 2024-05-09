/// @desc
event_inherited();

SetBulletBox(MID_X, 180, 180, 48)

r = 100;

enemies[0] = instance_create_layer(
	RESOLUTION_W + 8,
	184,
	LAYER_INSTANCES,
	oEnemySkull
);
