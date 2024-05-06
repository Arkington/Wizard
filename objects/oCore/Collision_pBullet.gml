/// @desc Hit by bullet
var _bullet = other;


// Damage
global.hp -= _bullet.damage;
	
// Attack on-hit
audio_play_sound(_bullet.hit_sfx, 0, false);
_bullet.on_hit();

// Die
if (global.hp <= 0) {
	print("OH NO AXEL HAS DIED.");
}