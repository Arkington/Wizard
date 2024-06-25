function LoadGame(_slot) {

	// Remove existing players
	with (oPlayer) { instance_destroy(); }

	var _file = SaveFileName(_slot);
	if (file_exists(_file)) {

		// Reset the handlers
		ClearEventHandler();
		ClearTextHandler();
		BattleEngineReset();
		
		// Load the game data
		var _save_data = LoadJSONFromFile(_file);
		global.state = struct_merge(global.initial_state, _save_data);

		// Position player
		room_goto(_save_data.room);
	
		// Loading player data
		with oPlayer {
			x = _save_data.x;
			y = _save_data.y;
			state = PlayerStateFree;
		}
		
		return true;

	} else {
		show_debug_message($"Save data not found for slot {_slot}.");
		return false;
	}
}

function LoadJSONFromFile(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_parse(_string);
	return _json;
}