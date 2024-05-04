/// @desc Play music. Auto-overrides current track. Can specify fade in, fade out and cross fade.
function PlayMusic(_mus, _fade_in = false, _fade_out = true, _cross_fade = false) {
	with (global.music_handler) {
		
		fade_in = _fade_in;
		fade_out = _fade_out;
		cross_fade = false;

		incoming_track = _mus;
	}
}

/// @desc Stop currently playing music, with optional fade out.
function StopMusic(_fade = true, _fade_length_s = SONG_FADE_SECS) {
	with (global.music_handler) {
		fade_out = _fade;
		fade_length_s = _fade_length_s;
		current_track = NONE;
	}
}

/// @desc Pause the current track.
function PauseMusic() {
	with (global.music_handler) {
		audio_pause_sound(current_track);
	}
}

/// @desc Unpause the current track.
function UnpauseMusic() {
	with (global.music_handler) {
		audio_resume_sound(current_track);
	}
}
