/// @desc Time in state
if (state_prev != state) {
	time_in_state = 0;
	state_prev = state;
}
time_in_state++;