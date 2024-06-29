/// @desc Smooth movement progress
if (live_call()) return live_result;


// Get movement input
key.up = keyboard_check_pressed(KEY_MOVE_UP) or keyboard_check_pressed(KEY_AIM_UP);
key.left = keyboard_check_pressed(KEY_MOVE_LEFT) or keyboard_check_pressed(KEY_AIM_LEFT);
key.down = keyboard_check_pressed(KEY_MOVE_DOWN) or keyboard_check_pressed(KEY_AIM_DOWN);
key.right = keyboard_check_pressed(KEY_MOVE_RIGHT) or keyboard_check_pressed(KEY_AIM_RIGHT);
key.shift = keyboard_check(vk_shift);
key.interact = keyboard_check_pressed(KEY_INTERACT);


// Progress
progress = min(progress + max((1 - progress)*0.3, 0.1), 1);

// Double tap timer
double_tap_timer--;

var _ignore_wh = (held_item != NONE or swap_in_item != NONE);
InvSelectorSmoothMove(_ignore_wh);
	

// State
state();
