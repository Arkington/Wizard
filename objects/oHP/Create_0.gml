if (live_call()) return live_result;

/// @desc
old_hp = global.hp;
draining_hp = global.hp;
hp_freeze_timer = 0;
hp_len = HP_LEN;