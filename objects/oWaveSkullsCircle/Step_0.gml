/// @desc

n_enemies = array_length(enemies);
radius = max(radius - 1, end_radius);


// Choose a random enemy to fire
var _ready_enemies = [];
for (var i = 0; i < n_enemies; i++) {
	var _skull = enemies[i];
	if (_skull == ENEMY_DOWN) { continue; }
	array_push(_ready_enemies, _skull);
	var _theta = i*360/n_enemies
	_skull.target_x = oBulletBox.target_x + lengthdir_x(radius, _theta + t);
	_skull.target_y = oBulletBox.target_y + lengthdir_y(radius, _theta + t);
}
if (t % (fire_speed_s*FPS) == 0) {
	if (array_length(_ready_enemies) > 0) {
		var _shooting_skull = array_choose(_ready_enemies);
		_shooting_skull.state = _shooting_skull.StateShooting;
	}
}