/// @desc

// Create new enemies every (spawn_rate_s) seconds
if (timer % (spawn_rate_s*FPS) == 0) {
	var _skull = CreateEnemy(
		(top and top_left) or (!top and !top_left) ? RESOLUTION_W + 8 : -8,
		top ? 184 : 72,
		oEnemySkullShootUpDown,
		{
			target_speed: (top ? -1 : 1)*(top_left ? 1 : -1)*vel_x,
		}
	);
	array_push(enemies, _skull);
	top = !top;
}
