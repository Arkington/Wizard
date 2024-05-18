/// @desc Default time, n_spins

event_inherited();

// Vars
player_arc_time = 3*FPS;
core_arc_time = 5*FPS;
animate_point_1 = 1*FPS;
animate_point_2 = 2*FPS;
n_spins = 5;

// Inits
core = NONE;
dead_player = NONE;
start_x = 0;
start_y = 0;
target_x = 288;
target_y = RESOLUTION_H;
t = 0;