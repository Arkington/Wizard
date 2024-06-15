if (live_call()) return live_result;


/// @desc Get wave data, ticking sound
time_remaining = wave.timer;
time_remaining_s = time_remaining/FPS;

// Ticking noise
if (time_remaining_s <= TIME_WARNING_S and !wave.over and time_remaining % (FPS/4) == 0) {
	audio_play_sound(tick_sounds[tick], 0, false);
	tick = (tick + 1) % n_ticks;
}

// Alarm noise
if (wave.over and !over) {
	audio_play_sound(sndTickAlarm, 0, false);
	over = true;
}

// Wave data
 if (!wave.over) {
 	var _enemies = variable_struct_get_names(wave.clear_condition);
	enemy_qty = struct_get(wave.clear_condition_progress, _enemies[0]);
}
