/// @desc
if !active { exit; }

// Play sound
if !played {
	audio_play_sound(sound, 0, false);
	played = true;
}

// Complete condition
if !audio_is_playing(sound) {
	complete = true;
}