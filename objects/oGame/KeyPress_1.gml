/// @desc Save states - saving and loading

// Determine slot number pressed
var _slot = (round(keyboard_key) >= ord("0") && round(keyboard_key) <= ord("9")) 
	? round(keyboard_key) - ord("0")
	: NONE

if (_slot = NONE) { exit; }


if keyboard_check(vk_shift) {
	// Save mode
	var _save_or_load = "Save";
	var _success = SaveGame(_slot);
} else {
	// Load mode
	var _save_or_load = "Load";
	var _success = LoadGame(_slot);
}

_success = _success ? "Success" : "Failure";
save_state_message = $"Slot {_slot} {_save_or_load} {_success}";
time_since_save_state = 0;
