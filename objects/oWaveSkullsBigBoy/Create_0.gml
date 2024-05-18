/// @desc
event_inherited();


size = 2;
box_size = 128;

SetBulletBox(MID_X, MID_Y + 16, box_size, box_size);

skull = CreateEnemy(
	MID_X,
	-40,
	oEnemySkullBigBoy,
	{
		image_xscale: size,
		image_yscale: size,
		target_x: MID_X,
		target_y: MID_Y_B,
	}
)

enemies[0] = skull;