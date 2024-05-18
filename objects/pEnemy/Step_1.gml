/// @desc Bumping, momentum

// Bump with other enemies
var _nearby_enemies = ds_list_create();
var _n_nearby = collision_circle_list(
	x,
	y,
	ENEMY_BUMP_RADIUS,
	pEnemy,
	false,
	true,
	_nearby_enemies,
	true
);
if (_n_nearby > 0) {
	var _bump_dir = point_direction(_nearby_enemies[| 0].x, _nearby_enemies[| 0].y, x, y) + random_range(-ENEMY_BUMP_DIR_VAR, ENEMY_BUMP_DIR_VAR);
	p_x = clamp(p_x + lengthdir_x(ENEMY_BUMP_P, _bump_dir), -ENEMY_MAX_P, ENEMY_MAX_P);
	p_y = clamp(p_y + lengthdir_y(ENEMY_BUMP_P, _bump_dir), -ENEMY_MAX_P, ENEMY_MAX_P);
}
ds_list_clear(_nearby_enemies);


// Friction based on weight
// Weight := the momentum loss in one second
p_x = sign(p_x)*max(abs(p_x) - weight/FPS, 0);
p_y = sign(p_y)*max(abs(p_y) - weight/FPS, 0);