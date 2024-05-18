/// @desc State Machine for oTextHandler
function TextHandlerStateAwaiting() {
	if page_array == NONE { return; }
	
	// We've received a page_array
	with (oPlayer) { state = PlayerStateCutscene; }
	page = 0;
	state = TextHandlerStateHandleNextPage;
	state();
}

function TextHandlerStateReadPage() {

	if !page_rendered { return; }

	// Choices
	if next_page_choice {
		page++; // Advance to the choice page
		active_choice_menu = CreateChocieMenu(page_array[page].choices);
		state = TextHandlerStateAwaitChoice;
	}
	// Swirl
	else if next_page_swirl {
		page++; // Advance to the swirl page
		active_thought_swirl = CreateBattleSwirl(page_array[page].choices);
		state = TextHandlerStateAwaitThought;
	}
	// No choices
	else {
		state = TextHandlerStateAwaitNextPage;
	}	
}

function TextHandlerStateAwaitNextPage() {

	if keyboard_check_pressed(KEY_INTERACT) {
		// Textbox is over
		instance_destroy(active_textbox);
		active_textbox = noone;
		page++;
		state = TextHandlerStateHandleNextPage;
		state();
	}
}

function TextHandlerStateHandleNextPage() {

	// Last page
	if (page >= array_length(page_array)) {
		
		// Clean up the final page
		page = 0;
		fade_in = true;

		// Change player state
		if instance_exists(oPlayer) { oPlayer.state = player_state_prior; }
		page_array = NONE;
		
		state = TextHandlerStateAwaiting;
		return;
	}

	// Vary our next action depending on type of page
	var _next_page = page_array[page];
	switch (_next_page.type) {
			
		// PausePage
		case PAGE_TYPE.PAUSE:
			pause_page_timer = _next_page.pause_page_s*FPS;
			fade_in = true;
			state = TextHandlerStatePause;
			break;
				
		// CodePage
		case PAGE_TYPE.CODE:
			script_execute(_next_page.code);
			page++;
			break;
				
		// GoToPage
		case PAGE_TYPE.GOTO:
			page_array = struct_get(text_struct, _next_page.goto);
			page = 0;
			state = TextHandlerStateAwaiting;
			state(); // Run again to prevent a frame of lawlessness
			break;
			
		// Normal Page
		default:
			active_textbox = CreateTextbox(_next_page, fade_in);
			fade_in = false;
			state = TextHandlerStateReadPage;
			break;
	}
}

function TextHandlerStatePause() {
	if (pause_page_timer <= 0) {
		page++;
		state = TextHandlerStateHandleNextPage;
	}
}

function TextHandlerStateAwaitChoice() {
	// Choice found
	if active_choice_menu.choice_made == NONE { return; }
	var _next_key = active_choice_menu.choice_made.next_key;
	
	// Clean up
	instance_destroy(active_choice_menu);
	active_choice_menu = noone;
	instance_destroy(active_textbox);
	active_textbox = noone;
	page++;

	// No key brings us to the next page
	if (_next_key == NONE) {
		state = TextHandlerStateHandleNextPage;
		state();
	}
	// A next key brings us to a new page_array
	else {
		page_array = struct_get(text_struct, _next_key);
		state = TextHandlerStateAwaiting;
		state(); // Run again to prevent a frame of lawlessness
	}
}

function TextHandlerStateAwaitThought() {

	// Choice found
	if (active_thought_swirl.thought_picked == NONE) { return; }
	var _next_key = active_thought_swirl.next_keys[active_thought_swirl.thought_picked];
		
	// Clean up
	active_thought_swirl = noone; // Don't destroy the swirl, as it needs to fade out.
	instance_destroy(active_textbox);
	active_textbox = noone;
	page++;

	// No key brings us to the next page
	if (_next_key == NONE) {
		state = TextHandlerStateHandleNextPage;
		state();
	}
	// A next key brings us to a new page_array
	else {
		page_array = struct_get(text_struct, _next_key);
		state = TextHandlerStateAwaiting;
		state(); // Run again to prevent a frame of lawlessness
	}
}
