/// @desc Global variables for game state

global.initial_state = {
	
	// Lower Bizzaire
	AXEL_TREEHOUSE_INT_DRAWERS : false,
	AXEL_TREEHOUSE_INT_BED : false,
	AXEL_TREEHOUSE_INT_APPLE_TAKEN: false,
	AXEL_TREEHOUSE_INT_NECKLACE_TAKEN: false,
	BUBBLEGUM_GREETED : false,
	BUBBLEGUM_INVITATION_DECLINED : false,
	BUBBLEGUM_CHAT_COMPLETE : false,
	CLIFF_THOUGHT_SWIRL : false,
	GWG_BIRD_INTERACTS : 0,
	GWG_OPEN : false,
	GWC_WISH_MADE : NONE,
	GWC_GW_DIALOGUE : NONE,
	GWC_GECKO_FIGHT: false,
}

global.state = struct_copy(global.initial_state);

// Game state getters and setters
function GetState(_field) {
	return struct_get(global.state, _field);
}

function SetState(_field, _val) {
	print($"Setting {_field} to {_val}");
	struct_set(global.state, _field, _val);
}