text_pause_timer--;
text_pause_voice_timer--;
frame++;

// Count up characters, leaving time for spaces
if (char_count < text_length) && (text_pause_timer <= 0) {
	char_count += text_speed;
	var _check_char = string_char_at(text, char_count);

	// Play sound on a delay (don't play for spaces!)
	if (
		(text_pause_voice_timer <= 0) and
		(voices != NO_VOICE) and
		(_check_char != " ") and
		(floor(char_count) != floor(char_count - text_speed)) // This ensures we have, in fact, rendered a new letter this step
	) {
		// Play a random voice clip, alter pitch as specified
		var _voice_clip = voices[irandom(array_length(voices) - 1)];
		audio_play_sound(
			_voice_clip,
			0,
			false,
			1,
			0,
			pitch_factor + (random(1) - 0.5)*pitch_variance
		);
		text_pause_voice_timer = text_pause_voice_length;
	}
	if string_contains(_check_char, TEXT_PAUSE_VOICE_CHARS) { text_pause_timer = text_pause_length; }
}

// Skip text
if keyboard_check_pressed(KEY_SKIP_TEXT) {
	char_count = text_length;
}