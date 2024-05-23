/// @desc
event_inherited();

SetBulletBox(MID_X, MID_Y_B, 96, 96)


n_enemies = clear_condition.oEnemySkullShootCircle;
radius = 160;
end_radius = 80;
rotate_speed = 1;
fire_speed_s = 1;


// Create enemies
for (var i = 0; i < n_enemies; i++) {
	var _theta = i*360/n_enemies
	var _skull = CreateEnemy(
		oBulletBox.target_x + lengthdir_x(radius, _theta + t),
		oBulletBox.target_y + lengthdir_y(radius, _theta + t),
		oEnemySkullShootCircle
	)
	array_push(enemies, _skull);
}
