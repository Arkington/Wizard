/// @desc Timers/cooldowns


// Time in state
if (state_prev != state) {
	time_in_state = 0;
	state_prev = state;
}
time_in_state++;

// Attack cooldowns
for (var i = 0; i < array_length(attacks); i++) {
	cooldowns[i] = max(cooldowns[i] - 1, 0);
}

// Focus breaker
if (state != CoreStateFocus and audio_is_playing(sndFocusRing)) {
	audio_stop_sound(sndFocusRing);
}