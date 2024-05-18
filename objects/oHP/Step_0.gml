/// @desc HP drain effect

// When we're hit, create the HP-drain visual effect
if (global.hp < old_hp) {
	old_hp = global.hp;
	hp_freeze_timer = HP_FREEZE_S*FPS;
}

if (hp_freeze_timer <= 0) {
	draining_hp = max(global.hp, draining_hp - HP_DRAIN_SPEED);
}

hp_freeze_timer--;