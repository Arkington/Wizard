enum GWC_WISH {
	HEALTH,
	RICHES,
	INNER_STRENGTH
}

function GreatWizardWishingWell_Well() {
	if (global.state.GWC_WISH_MADE == NONE) {
		load_text("textGreatWizardWishingWell", "well");
	} else {
		load_text("textGreatWizardWishingWell", "wish_made");
	}
}


// Text
initializeSpeakers();

textGreatWizardWishingWell = {
	well: [
		Page(spkNone, "It's a wishing well. Make a wish?"),
		ChoicePage(
			Choice("Yes", "well_yes"),
			Choice("No", "well_no")

		),
	],
	well_yes: [
		Page(spkAxel, "What should I wish for...?"),
		ChoicePage(
			Choice("Health", "wish_health"),
			Choice("Riches", "wish_riches"),
			Choice("Inner strength", "wish_inner_strength"),
	    ),
	],
	well_no: [
		Page(spkAxel, "I'm probably not at a high enough level to cash wishing magic, anyway.")
	],
	wish_health: [
		Page(spkAxelInner, "(I'm supposed to wish for something sensible, like good health, right?)"),
		Page(spkAxelInner, "(I wish... to be nice and healthy!)"),
		Page(spkAxelInner, "(Yeah...)"),
		Page(spkAxelInner, $"(Well done {AXEL}, you wished for the smart thing.)"),
		CodePage(function() { global.state.GWC_WISH_MADE = GWC_WISH.HEALTH; }),
	],
	wish_riches: [
		Page(spkAxelInner, "(You're supposed to wish for something sensible.)"),
		Page(spkAxelInner, "(You're not supposed to wish to be rich...)"),
		Page(spkAxelInner, "(...but it's gotta be pretty sweet, right?)"),
		Page(spkAxelInner, "(I wish... to be super rich! Like the noblest of noblemen!)"),
		Page(spkAxelInner, "(...)"),
		Page(spkAxelInner, "(Wouldn't it be cool if it actually worked?)"),
	    CodePage(function() { global.state.GWC_WISH_MADE = GWC_WISH.RICHES; }),
	],
	wish_inner_strength: [
		Page(spkAxelInner, "(I'm supposed to wish for something sensible, like good health, or...)"),
		Page(spkAxelInner, "(...)"),
		Page(spkAxelInner, "(Oh, Mr Wishing Well...)"),
		Page(spkAxelInner, "(Please give me the inner strength to do well at Wizard School.)"),
		Page(spkAxelInner, "(...)"),
		Page(spkAxelInner, "(Thank you.)"),
	    CodePage(function() { global.state.GWC_WISH_MADE = GWC_WISH.INNER_STRENGTH; }),
	],
	wish_made: [
		Page(spkAxel, "Now I KNOW you're not supposed to try and make a second wish."),
	],
}
