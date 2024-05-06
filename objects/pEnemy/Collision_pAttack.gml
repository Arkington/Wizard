/// @desc Hit by attack
var _attack = other;


// MANDATORY FOR EVERY ENEMY
// Damage
hp -= _attack.damage;
	
// Hurt sprite
if (hp < max_hp/2) { sprite_index = hurt_sprite; }
	
// Attack on-hit
audio_play_sound(_attack.hit_sfx, 0, false);
_attack.on_hit(id);

// Die
if (hp <= 0) {
	ReportEnemyDefeated(object_index);
	instance_destroy();
}

// UNIQUE TO EACH ENEMY
on_hit(other);