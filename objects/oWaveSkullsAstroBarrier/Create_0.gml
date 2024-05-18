/// @desc
event_inherited();

SetBulletBox(MID_X, 180, 180, 48)

r = 100;
speed_factor = 1.25;

enemies[0] = CreateEnemy(
	RESOLUTION_W + 8,
	184,
	oEnemySkull
);

barrier = CreateBarrier(MID_X, 96, 40, 40);
