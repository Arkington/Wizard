/// @desc Fast Forward Music
with (global.music_handler) {
	if (current_track_instance != NONE) {
		var _pos = audio_sound_get_track_position(current_track_instance);
		var _new_pos = min(_pos + 10, audio_sound_length(current_track_instance) - 1);
		audio_sound_set_track_position(current_track_instance, _new_pos);
	}
}
