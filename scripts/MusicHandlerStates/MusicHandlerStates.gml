/// @desc Music handler awaits incoming songs. It has no duty.
function MusicHandlerStateAwaiting() {
	
	if (incoming_track != NONE) {
		
		// Play the audio
		current_track = incoming_track;
		incoming_track = NONE;
		current_track_instance = audio_play_sound(current_track, 0, true);
		audio_sound_loop_start(current_track_instance, LoopStart(current_track))

		// Fade in if required
		if fade_in {
			audio_sound_gain(current_track_instance, 0, 0);
			audio_sound_gain(current_track_instance, 1, fade_length_s*1000);
		}
		state = MusicHandlerStatePlaying;
	}
}

/// @desc Music handler has been asked to play a song. current_track is not NONE.
function MusicHandlerStatePlaying() {
	
	// Stop the music
	if (current_track == NONE) {
		if fade_out {
			audio_sound_gain(current_track_instance, 0, fade_length_s*1000);
		} else {
			audio_sound_gain(current_track_instance, 0, 0);
		}
		state = MusicHandlerStateStopping;
	}
	
	// Prepare for audio switching
	if (incoming_track != NONE) {
		
		// Can't switch to the same track we're on
		if (incoming_track == current_track) { incoming_track = NONE; }
		else { state = MusicHandlerStateSwitching; }
	}
}

/// @desc Music handler is currently stopping its track using a fade
function MusicHandlerStateStopping() {

	// Kill music when audio has 0 gain
	if (audio_sound_get_gain(current_track_instance) <= 0) {
		audio_stop_sound(current_track_instance);
		current_track_instance = NONE;
		state = MusicHandlerStateAwaiting;
	}
}


/// @desc Music handler has been asked to change songs
function MusicHandlerStateSwitching() {
	
	// Cross fade has its own state
	if cross_fade {
		state = MusicHandlerStateCrossFade;
		return;
	}
	
	// Fade out if required
	if fade_out {
		var _current_gain = audio_sound_get_gain(current_track_instance);
		if (_current_gain >= 1) {
			audio_sound_gain(current_track_instance, 0, fade_length_s*1000);
		} else if (_current_gain <= 0) {
			audio_stop_sound(current_track_instance);
		}
	} else {
		audio_stop_sound(current_track_instance);
	}
			
	// After first song fades out...
	if !audio_is_playing(current_track_instance) {
		current_track_instance = NONE;
		current_track = incoming_track;
		state = MusicHandlerStateAwaiting;
		state(); // Execute to end up in StatePlaying
	}	
}

function MusicHandlerStateCrossFade() {
	// TODO
}
