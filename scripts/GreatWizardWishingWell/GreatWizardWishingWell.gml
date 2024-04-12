enum GWC_WISH {
	HEALTH,
	RICHES,
	INNER_STRENGTH
}

function GreatWizardWishingWell_Well() {
	if (global.state.GWC_WISH_MADE == NONE) {
		load_textnode("textGreatWizardWishingWell", "well");
	} else {
		load_textnode("textGreatWizardWishingWell", "wish_made");
	}
}


// Text
initializeSpeakers();
/*
textRoomName = {
	key: TextNode(
	    [
	        Page(spkSpeaker, "")
	    ],
	    [
	        Choice("", "key"),
	        Choice("", "key")
	    ]
	),
}
*/

textGreatWizardWishingWell = {
	well: TextNode(
	    [
	        Page(spkNone, "It's a wishing well. Make a wish?")
	    ],
	    [
	        Choice("Yes", "well_yes"),
	        Choice("No", "well_no")
	    ]
	),
	well_yes: TextNode(
	    [
	        Page(spkAxel, "What should I wish for...?")
	    ],
	    [
	        Choice("Health", "wish_health"),
	        Choice("Riches", "wish_riches"),
	        Choice("Inner strength", "wish_inner_strength"),
	    ]
	),
	well_no: TextNode(
	    [
	        Page(spkAxel, "I'm probably not at a high enough level to cash wishing magic, anyway.")
	    ],
	),
	wish_health: TextNode(
	    [
	        Page(spkAxel, "(I'm supposed to wish for something sensible, like good health, right?)", {voices: NO_VOICE}),
	        Page(spkAxel, "(I wish... to be nice and healthy!)", {voices: NO_VOICE}),
	        Page(spkAxel, "(Yeah...)", {voices: NO_VOICE}),
	        Page(spkAxel, $"(Well done {AXEL}, you wished for the smart thing.)", {voices: NO_VOICE}),
	    ],
		NO_CHOICES,
		NO_NEXT_NODE,
		function() { global.state.GWC_WISH_MADE = GWC_WISH.HEALTH; }
	),
	wish_riches: TextNode(
	    [
	        Page(spkAxel, "(You're supposed to wish for something sensible.)", {voices: NO_VOICE}),
	        Page(spkAxel, "(You're not supposed to wish to be rich...)", {voices: NO_VOICE}),
	        Page(spkAxel, "(...but it's gotta be pretty sweet, right?)", {voices: NO_VOICE}),
	        Page(spkAxel, "(I wish... to be super rich! Like the noblest of noblemen!)", {voices: NO_VOICE}),
	        Page(spkAxel, "(...)", {voices: NO_VOICE}),
	        Page(spkAxel, "(Wouldn't it be cool if it actually worked?)", {voices: NO_VOICE}),
	    ],
		NO_CHOICES,
		NO_NEXT_NODE,
		function() { global.state.GWC_WISH_MADE = GWC_WISH.RICHES; }
	),
	wish_inner_strength: TextNode(
	    [
	        Page(spkAxel, "(I'm supposed to wish for something sensible, like good health, or...)", {voices: NO_VOICE}),
	        Page(spkAxel, "(...)", {voices: NO_VOICE}),
	        Page(spkAxel, "(Oh, Mr Wishing Well...)", {voices: NO_VOICE}),
	        Page(spkAxel, "(Please give me the inner strength to do well at Wizard School.)", {voices: NO_VOICE}),
	        Page(spkAxel, "(...)", {voices: NO_VOICE}),
	        Page(spkAxel, "(Thank you.)", {voices: NO_VOICE}),
	    ],
		NO_CHOICES,
		NO_NEXT_NODE,
		function() { global.state.GWC_WISH_MADE = GWC_WISH.INNER_STRENGTH; }
	),
	wish_made: TextNode(
	    [
	        Page(spkAxel, "Now I KNOW you're not supposed to try and make a second wish."),
	    ],
	),
}
