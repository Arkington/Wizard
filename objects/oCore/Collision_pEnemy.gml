/// @desc Contact with enemy
var _enemy = other;
if (_enemy.dead) { exit; }

// Damage
CoreDamage(_enemy.contact_damage);
