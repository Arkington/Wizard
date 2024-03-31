/// @desc Global variables for game state

global.initial_state = {
	// Lower Bizzaire
	CLIFF_THOUGHT_SWIRL : false,
	GWG_BIRD_INTERACTS : 4,
	GWG_OPEN : 0,
}

global.state = struct_copy(global.initial_state);