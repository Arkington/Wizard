/// @desc
if !active { exit; }

// Play sound
if !begun {
	audio_play_sound(sound, 0, false);
	begun = true;
}

// Complete condition
if !wait_for_sound or !audio_is_playing(sound) {
	complete = true;
}