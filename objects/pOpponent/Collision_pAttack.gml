/// @desc Take damage and knockback from attacks
if (!hittable) { exit; }


var _attack = other;

// Shader
shader_progress = 0;

// Momentum - angle is a weighted average of old and new knockback directions
var _new_p = _attack.knockback;
var _new_p_dir = _attack.direction + random_range(-OPPONENT_HIT_DIR_VAR, OPPONENT_HIT_DIR_VAR);
p_x = clamp(p_x + lengthdir_x(_new_p, _new_p_dir), -ENEMY_MAX_P, ENEMY_MAX_P);
p_y = clamp(p_y + lengthdir_y(_new_p, _new_p_dir), -ENEMY_MAX_P, ENEMY_MAX_P);

// Attack on-hit
audio_play_sound(_attack.hit_sfx, 0, false);
_attack.on_hit(id);
