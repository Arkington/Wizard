pause_text_timer--;
pause_sound_timer--;
frame++;

// Count up characters, leaving time for spaces
if (char_count < text_length) && (pause_text_timer <= 0) {
	if char_count <= text_length {
		char_count += text_speed;
		
		// Play sound on a delay
		if (pause_sound_timer <= 0 and voices != NO_VOICE) {
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
			pause_sound_timer = pause_sound_length;
		}
	}
	var _check_char = string_char_at(text, char_count);
	if string_contains(_check_char, ".,!?") { pause_text_timer = pause_text_length; }
}

// Skip text
if keyboard_check_pressed(KEY_SKIP_TEXT) {
	char_count = text_length;
}
