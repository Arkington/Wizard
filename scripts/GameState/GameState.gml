/// @desc Global variables for game state

global.initial_state = {
	
	// Lower Bizzaire
	BUBBLEGUM_GREETED : false,
	BUBBLEGUM_INVITATION_DECLINED : false,
	BUBBLEGUM_CHAT_COMPLETE : false,
	CLIFF_THOUGHT_SWIRL : false,
	GWG_BIRD_INTERACTS : 4,
	GWG_OPEN : false,
	GWC_WISH_MADE : NONE,
}

global.state = struct_copy(global.initial_state);