
text_source = undefined; // Text loaded into the handler
activeTextNode = noone;
activeTextbox = noone;
activeChoiceMenu = noone;
activePauser = noone;
nextTextNode = NO_NEXT_NODE;
page = 0;
page_rendered = false;
final_page = false;

state_name = "Awaiting";

stateAwaiting = function() {
	state_name = "Awaiting";
	if activeTextNode == noone { return; }
	activePauser = instance_create_depth(0, 0, 0, oPauser);
	activeTextbox = create_textbox(activeTextNode.pages[0]);
	nextTextNode = activeTextNode.nextnode;
	state = stateReadingPage;
}

stateReadingPage = function() {
	state_name = "ReadingPage";
	if page_rendered { 
		if final_page && activeTextNode.choices != NO_CHOICES {
			show_debug_message(activeTextNode);
			activeChoiceMenu = create_choice_menu(activeTextNode.choices);
			state = stateAwaitChoice;
		} else {
			state = stateAwaitNextPage;
		}
	}
	
}

stateAwaitNextPage = function() {
	state_name = "AwaitNextPage";
	if keyboard_check_pressed(KEY_INTERACT) {
		if final_page {
			state = stateCleanUp;
		} else {
			page += 1;
			instance_destroy(activeTextbox);
			activeTextbox = create_textbox(activeTextNode.pages[page]);
			state = stateReadingPage;
		}
	}
}

stateAwaitChoice = function() {
	state_name = "AwaitChoice";
	if activeChoiceMenu.choice_made != undefined {
		var choice = activeChoiceMenu.choice_made;
		if choice.nextnode != NO_NEXT_NODE { nextTextNode = choice.nextnode; }
		state = stateCleanUp;
	}
}

stateCleanUp = function() {
	state_name = "CleanUp";

	instance_destroy(activeTextNode);
	instance_destroy(activeTextbox);
	instance_destroy(activeChoiceMenu);
	activeTextNode = noone;
	activeTextbox = noone;
	activeChoiceMenu = noone;
	
	page = 0;

	if nextTextNode != NO_NEXT_NODE {
		activeTextNode = text_source[$nextTextNode];
		nextTextNode = NO_NEXT_NODE;
	}
	
	instance_destroy(activePauser);
	
	state = stateAwaiting;
	state(); // Call again to prevent a frame of lawlessness
}

state = stateAwaiting;