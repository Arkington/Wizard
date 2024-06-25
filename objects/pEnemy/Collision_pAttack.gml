if (live_call()) return live_result;


/// @desc Hit by attack
if (dead) { exit; }
var _attack = other;


// MANDATORY FOR EVERY ENEMY
// Damage
hp -= _attack.damage;

// Shader
shader_progress = 0;

// Momentum - angle is a weighted average of old and new knockback directions
var _new_p = _attack.knockback;
var _new_p_dir = _attack.direction + random_range(-ENEMY_BUMP_DIR_VAR, ENEMY_BUMP_DIR_VAR);
p_x += clamp(p_x + lengthdir_x(_new_p, _new_p_dir), -ENEMY_MAX_P, ENEMY_MAX_P);
p_y += clamp(p_y + lengthdir_y(_new_p, _new_p_dir), -ENEMY_MAX_P, ENEMY_MAX_P);

// Hurt sprite
if (hp < max_hp/2) { sprite_index = hurt_sprite; }
	
// Attack on-hit
audio_play_sound(_attack.hit_sfx, 0, false);
_attack.on_hit(id);

// Die
if (hp <= 0) {
	state = StateDying;
	ReportEnemyDown(id);
}

// UNIQUE TO EACH ENEMY
on_hit(other);