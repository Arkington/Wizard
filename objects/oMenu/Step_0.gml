// Battle menus vs regular menus
if instance_exists(oCore) {
	up = keyboard_check_pressed(KEY_AIM_UP);
	down = keyboard_check_pressed(KEY_AIM_DOWN);
	interact = keyboard_check_pressed(KEY_INTERACT);
} else {
	up = keyboard_check_pressed(KEY_MOVE_UP) or keyboard_check_pressed(KEY_AIM_UP);
	down = keyboard_check_pressed(KEY_MOVE_DOWN) or keyboard_check_pressed(KEY_AIM_DOWN);
	interact = keyboard_check_pressed(KEY_INTERACT);
}


n_options = array_length(options);
pos += down - up;
pos = (pos + n_options) % n_options; // Loop around

// SFX
if (down - up != 0) { audio_play_sound(sndMenuMove, 0, false); }
if (interact) { audio_play_sound(sndMenuSelect, 0, false); }