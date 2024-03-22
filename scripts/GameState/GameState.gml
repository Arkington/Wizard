/// @desc Global variables for game state

global.initial_state = {
	// Lower Bizzaire
	GWG_BIRD_INTERACTS : 0,
	GWG_OPEN : 0,
}

global.state = struct_copy(global.initial_state);