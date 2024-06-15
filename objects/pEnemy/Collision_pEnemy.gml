/// @desc Bumping with other enemies

if (!dead and !other.dead) {
	var _bump_dir = point_direction(other.x, other.y, x, y) + random_range(-ENEMY_BUMP_DIR_VAR, ENEMY_BUMP_DIR_VAR);
	p_x = clamp(p_x + lengthdir_x(ENEMY_BUMP_P, _bump_dir), -ENEMY_MAX_P, ENEMY_MAX_P);
	p_y = clamp(p_y + lengthdir_y(ENEMY_BUMP_P, _bump_dir), -ENEMY_MAX_P, ENEMY_MAX_P);
	if !audio_is_playing(sndBump) { audio_play_sound(sndBump, 0, false); }
}
