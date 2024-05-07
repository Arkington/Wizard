/// @desc

n_enemies = array_length(enemies);
radius = max(radius - 1, end_radius);

for (var i = 0; i < n_enemies; i++) {
	var _skull = enemies[i];
	var _theta = i*360/n_enemies
	_skull.target_x = oBulletBox.target_x + lengthdir_x(radius, _theta + t);
	_skull.target_y = oBulletBox.target_y + lengthdir_y(radius, _theta + t);
}

if (t % (fire_speed_s*FPS) == 0) {
	var _skull = enemies[random_range(0, n_enemies)];
	_skull.state = _skull.StateShooting;
}