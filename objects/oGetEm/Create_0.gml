/// @desc

box_sprite = sMenubox;
enemy_sprite = NONE;
enemy_qty = NONE;
time_remaining = LARGE;
time_remaining_s = LARGE;
over = false;

tick = 0;
tick_sounds = [
	sndTick1,
	sndTick2,
	sndTick3,
	sndTick4
];
n_ticks = array_length(tick_sounds);