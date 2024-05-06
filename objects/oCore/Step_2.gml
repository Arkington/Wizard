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
