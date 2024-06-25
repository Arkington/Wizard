/// @desc Format for save file names
function SaveFileName(i) {
	return "wizard_" + string(i) + ".save"
}

/// @desc Saves the game state to a specified file number.
/// @desc oPlayer must be on-screen in order to save.
function SaveGame(_slot) {

	// Saving without oPlayer
	if !instance_exists(oPlayer) {
		show_debug_message("Player is not present, but saving anyway...");
		struct_set(global.state, "x", -1);
		struct_set(global.state, "y", -1);
	} else {
		struct_set(global.state, "x", oPlayer.x);
		struct_set(global.state, "y", oPlayer.y);
	}

	// Adding additional "on-save" data to State
	struct_set(global.state, "room", room);

	// Save state JSON to file selected
	var _string = json_stringify(global.state);
	SaveStringToFile(_string, SaveFileName(_slot));
	show_debug_message($"Saved to file {_slot}: {_string}");
	return true;
}

function SaveStringToFile(_string, _filename) {
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

