/// @desc

/*
if (current_track != NONE) {
	
	// Loop as required
	if audio_is_playing(current_track) {
		
		var _pos = audio_sound_get_track_position(current_track);
		if (_pos > LoopPoint(current_track)) {
			audio_sound_set_track_position(current_track, _pos - LoopLength(current_track));
		}
	}
	
}