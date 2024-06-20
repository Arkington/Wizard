if (live_call()) return live_result;

// Background colour
oscillator = power(sin(current_time/1000)/5, 64);
colour = HSVColour(250, 100 - 24*oscillator, 16 + 24*oscillator)
// Wave 1 colour/alpha
with (wave_1_left) {
	colour = other.wave_1_colour;
	alpha = other.wave_1_alpha;
}
with (wave_1_right) {
	colour = other.wave_1_colour;
	alpha = other.wave_1_alpha;
}

// Wave 2 colour/alpha
with (wave_2_left) {
	colour = other.wave_2_colour;
	alpha = other.wave_2_alpha;
}
with (wave_2_right) {
	colour = other.wave_2_colour;
	alpha = other.wave_2_alpha;
}