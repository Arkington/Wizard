/// @desc Movement input (before Inventory)

if (live_call()) return live_result;


// Get movement input
key.up = keyboard_check_pressed(KEY_MOVE_UP) or keyboard_check_pressed(KEY_AIM_UP);
key.left = keyboard_check_pressed(KEY_MOVE_LEFT) or keyboard_check_pressed(KEY_AIM_LEFT);
key.down = keyboard_check_pressed(KEY_MOVE_DOWN) or keyboard_check_pressed(KEY_AIM_DOWN);
key.right = keyboard_check_pressed(KEY_MOVE_RIGHT) or keyboard_check_pressed(KEY_AIM_RIGHT);
key.shift = keyboard_check(vk_shift);
key.interact = keyboard_check_pressed(KEY_INTERACT);

var _up = (key.up - key.down > 0);
var _down = (key.up - key.down < 0);
var _left = (key.left - key.right > 0);
var _right = (key.left - key.right < 0);


if (_up or _down or _left or _right) {
	progress = 0;
	double_tap = false;

	// Double tap checks
	if (keyboard_key == last_key and double_tap_timer > 0) {
		double_tap = true;
	}
	last_key = keyboard_key;
	double_tap_timer = INV_SELECTOR_DOUBLE_TAP_TIMER;

	InvSelectorUpdatePos(_up, _down, _left, _right);


	// SFX
	audio_play_sound(sndMenuMove, 0, false);
}
if (key.interact) {
	audio_play_sound(sndMenuSelect, 0, false);
}

// Double tap timer
double_tap_timer--;