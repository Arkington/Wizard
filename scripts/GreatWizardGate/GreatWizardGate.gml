/// Code
function GreatWizardGate_CheckBird() {
	global.state.GWG_BIRD_INTERACTS++;
	bird_check_count = min(global.state.GWG_BIRD_INTERACTS, 5);
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
