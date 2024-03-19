/// Code
function GreatWizardGate_CheckBird() {
	with (global.state) {
		if !variable_instance_exists(id, "gwg_bird_interacts") { gwg_bird_interacts = 1; }
		else { gwg_bird_interacts++; }
	}
	bird_check_count = min(global.state.gwg_bird_interacts, 5);
	show_debug_message(bird_check_count);
	load_textnode("textGreatWizardGate", $"bird_check_{bird_check_count}");
}



// Text
initializeSpeakers();
/*
	key: TextNode(
	    [
	        Page("")
	    ],
	    [
	        Choice("", "key"),
	        Choice("", "key")
	    ]
	),
*/
textGreatWizardGate = {
	gate_check: TextNode(
	    [
	        Page(spkNone, "Locked.")
	    ],
	),
	bird_check_1: TextNode(
	    [
	        Page(spkNone, "Looks like a bird.")
	    ],
	),
	bird_check_2: TextNode(
	    [
	        Page(spkNone, "Looks like a bird.")
	    ],
	),
	bird_check_3: TextNode(
	    [
	        Page(spkNone, "Looks like a bird...")
	    ],
	),
	bird_check_4: TextNode(
	    [
	        Page(spkNone, "Looks like a bird...?")
	    ],
	),
	bird_check_5: TextNode(
	    [
	        Page(spkAxelNeutral, "Hey there little guy."),
			Page(spkNone, "..."),
			Page(spkHCViaBird, "..."),
			Page(spkHCViaBird, "Yes?!"),
			Page(spkHCViaBird, "...Yes?"),
	        Page(spkAxelNeutral, "Oh, I--"),
			Page(spkHCViaBird, "Hold on one second."),
	    ],
	),
}
