/// @desc
event_inherited();

n_enemies = array_length(enemies);

// Enemy spawn in
if (t/FPS % spawn_rate_s == 0) {
	var _skull = CreateEnemy(
		MID_X - (left ? 1 : -1)*spawn_x_dist + random_range(-spawn_radius, spawn_radius),
		spawn_y + random_range(-spawn_radius, spawn_radius),
		oEnemySkullBouncy,
		{
			vel_x: (left ? 1 : -1)*random_range(vel_x - vel_x_var, vel_x + vel_x_var),
			acc_y: acc_y,
			spin_factor: left ? random_range(0, spin_factor_range) : random_range(-spin_factor_range, 0),
		}
	);
	array_push(enemies, _skull);
	left = irandom(1);
}
// I'm thinking the solution is to build in any field assignments into the CreateEnemy function.



// Enemies bouncing
for (var i = 0; i < n_enemies; i++) {
	var _enemy = enemies[i];
	if (_enemy != ENEMY_DOWN and _enemy.y >= RESOLUTION_H - 4) {
		// Bounce
		_enemy.vel_y = -random_range(vel_y - vel_y_var, vel_y + vel_y_var);
		_enemy.spin_factor = left ? random_range(0, spin_factor_range) : random_range(-spin_factor_range, 0);
	}
}