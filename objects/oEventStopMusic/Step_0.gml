/// @desc
if !active { exit; }

// Begin
if !begun {
	StopMusic(fade, fade_out_s);
	begun = true;
}

// Run code
if (global.music_handler.current_track_instance == NONE) {
	complete = true;
}