/// @desc Default time, n_spins

event_inherited();

// Vars
total_frames = BATTLE_TRANSITION_TIME_S*FPS;
n_spins = BATTLE_TRANSITION_SPINS;

// Inits
core = noone;
start_x = 0;
start_y = 0;
target_x = 0;
target_y = 0;
t = 0;