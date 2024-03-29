/// @desc Set music and play if it's not currently playing
function PlayMusic(_mus, _override_current = false) {
	with (global.music_handler) {
		if (current_track == NONE or (_override_current and !audio_is_playing(_mus))) {
			current_track_type = _mus;
			current_track = audio_play_sound(_mus, 0, true);
			audio_sound_loop_start(current_track, LoopStart(_mus));
		}
	}
}