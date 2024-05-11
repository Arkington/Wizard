/// @desc
event_inherited();


size = 2;
box_size = 128;

SetBulletBox(MID_X, MID_Y + 16, box_size, box_size);

skull = instance_create_layer(
	MID_X,
	-40,
	LAYER_INSTANCES,
	oEnemySkullBigBoy
)
skull.weight *= 1.5;
skull.image_xscale = size;
skull.image_yscale = size;

skull.target_x = MID_X;
skull.target_y = MID_Y + 16;

enemies[0] = skull;