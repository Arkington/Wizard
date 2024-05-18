/// @desc Hit by bullet
if (global.hp <= 0) { exit; }

var _bullet = other;

// Damage
CoreDamage(_bullet.damage);

// Attack on-hit
audio_play_sound(_bullet.hit_sfx, 0, false);
_bullet.on_hit();