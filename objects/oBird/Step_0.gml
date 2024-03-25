/// @desc

// Flap
if (sprite_index == sBirdFly) {
	if (floor(image_index) == 0 and flap == UP) {
		// TODO: FIX THIS
		audio_play_sound_at(sndBirdFlap, x, y, 0, FALLOFF_REF_DIST, FALLOFF_MAX_DIST, 1, 0, false);
		flap = DOWN;
	} else if (floor(image_index) != 0) {
		flap = UP;
	}
}