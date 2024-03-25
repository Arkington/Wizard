/// @desc Fast Forward Music
with (global.music_handler) {
	if (current_track != NONE) {
		var _pos = audio_sound_get_track_position(current_track);
		audio_sound_set_track_position(current_track, _pos + 10);
	}
}
