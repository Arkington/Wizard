/// @desc State Machine for oTextHandler
function TextHandlerStateAwaiting() {
	if activeTextNode == noone { return; }
	oPlayer.state = PlayerStateCutscene;
	activeTextbox = create_textbox(activeTextNode.pages[0], first_textbox);
	first_textbox = false;
	nextTextNode = activeTextNode.nextnode;
	state = TextHandlerStateReadingPage;
}

function TextHandlerStateReadingPage() {
	if page_rendered { 
		if final_page && activeTextNode.choices != NO_CHOICES {
			activeChoiceMenu = create_choice_menu(activeTextNode.choices);
			state = TextHandlerStateAwaitChoice;
		} else {
			state = TextHandlerStateAwaitNextPage;
		}
	}	
}

function TextHandlerStateAwaitNextPage() {
	if keyboard_check_pressed(KEY_INTERACT) {
		if final_page {
			state = TextHandlerStateCleanUp;
		} else {
			page += 1;
			instance_destroy(activeTextbox);
			activeTextbox = create_textbox(activeTextNode.pages[page], first_textbox);
			state = TextHandlerStateReadingPage;
		}
	}
}

function TextHandlerStateAwaitChoice() {
	if activeChoiceMenu.choice_made != undefined {
		var choice = activeChoiceMenu.choice_made;
		if choice.nextnode != NO_NEXT_NODE { nextTextNode = choice.nextnode; }
		state = TextHandlerStateCleanUp;
	}
}

function TextHandlerStateCleanUp() {

	// Execute textnode code
	script_execute(activeTextNode.code);
	
	instance_destroy(activeTextNode);
	instance_destroy(activeTextbox);
	instance_destroy(activeChoiceMenu);
	activeTextNode = noone;
	activeTextbox = noone;
	activeChoiceMenu = noone;
	
	page = 0;

	// Either continue chain or do not
	if nextTextNode == NO_NEXT_NODE {
		first_textbox = true;
	}
	else {
		activeTextNode = text_source[$nextTextNode];
		nextTextNode = NO_NEXT_NODE;
	}
	
	// Change player state
	oPlayer.state = player_state_prior;
	state = TextHandlerStateAwaiting;
	state(); // Call again to prevent a frame of lawlessness
}
