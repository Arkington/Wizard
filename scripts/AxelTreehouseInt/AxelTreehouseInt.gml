function AxelTreehouseInt_Drawers() {
	if (!global.state.AXEL_TREEHOUSE_INT_DRAWERS) {
		LoadText("textAxelTreehouseInt", "drawers")
	} else {
		LoadText("textAxelTreehouseInt", "drawers_2")
	}
}

function AxelTreehouseInt_Chest() {
	if (!global.state.GWC_GECKO_FIGHT) {
		LoadText("textAxelTreehouseInt", "chest")
	} else if (!global.state.AXEL_TREEHOUSE_INT_APPLE_TAKEN) {
		LoadText("textAxelTreehouseInt", "chest_2")
	} else {
		LoadText("textAxelTreehouseInt", "chest_3")
	}
}

function AxelTreehouseInt_Pile() {
	if (!global.state.AXEL_TREEHOUSE_INT_NECKLACE_TAKEN) {
		LoadText("textAxelTreehouseInt", "pile")
	} else {
		LoadText("textAxelTreehouseInt", "pile_2")
	}
}

function AxelTreehouseInt_Bed() {
	if (!global.state.AXEL_TREEHOUSE_INT_BED) {
		LoadText("textAxelTreehouseInt", "bed")
	} else {
		LoadText("textAxelTreehouseInt", "bed_2")
	}
}


// Text
initializeSpeakers();

textAxelTreehouseInt = {
	bowl: [
		Page(spkNone, "A bowl of nuts and berries."),
		Page(spkAxel, "Mmmm... maybe I'll snack later."),
	],
	waterskin: [
		Page(spkNone, "A waterskin."),
		Page(spkAxel, "In case I wake up with a case of thirsty."),
	],
	clothes: [
		Page(spkAxel, "I should put those away."),
		Page(spkAxel, "..."),
		Page(spkAxel, "Not now though."),
	],
	drawers: [
		CodePage(function() { SetState("AXEL_TREEHOUSE_INT_DRAWERS", true) }),
		Page(spkAxel, "I mean now that I'm at the drawers I should probably..."),
		Page(spkAxel, "Oh look, my acceptance letter!"),
		Page(spkAxel, "Ah... I can't wait to go to wizard school."),
		Page(spkAxel, "Wait that's today."),
	],
	drawers_2: [
		Page(spkNone, "On the drawers sits your acceptance letter.")
	],
	chest: [
		Page(spkNone, "An oak chest. A fresh apple sits on top."),
		Page(spkAxel, "I've already packed fruit for lunch."),
	],
	chest_2: [
		Page(spkNone, "An oak chest. A fresh apple sits on top."),
		Page(spkAxel, "I've HAD packed fruit for lunch..."),
		Page(spkAxel, "...but that's no good now."),
		Page(spkNone, "Take the apple?"),
		ChoicePage(
			Choice("Yes"),
			Choice("No")
		),
		// TODO: make this work
	],
	chest_3: [
		Page(spkNone, "A solitary oak chest with no nearby fruit to keep it company."),
	],
	blankets: [
		Page(spkNone, "Spare blankets."),
		Page(spkAxel, "It'll get cold soon. Always be prepared!"),
	],
	pile: [
		Page(spkNone, "A big ol' pile. Clothes, leaves, feathers..."),
		Page(spkAxel, "...wait did I leave my necklace in here?"),
		Page(spkNone, "Search the pile?"),
		ChoicePage(
			Choice("Yes"),
			Choice("No")
		),
		// TODO: make this work
	],
	pile_2: [
		Page(spkNone, "Just a big ol' pile of clothes, leaves and feathers."),
	],
	
	bed: [
	    Page(spkAxel, "Well I'm back home."),
	    Page(spkAxel, "..."),
	    Page(spkAxel, "I really should get to the school."),
	    Page(spkAxel, "..."),
	    Page(spkAxel, "But it would be so easy to hop back into bed."),
		Page(spkAxel, "..."),
		ChoicePage(
			Choice("Sit down.", "back_into_bed", function() { SetState("AXEL_TREEHOUSE_INT_BED", true); }),
			Choice("Do not.")
		),
	],
	back_into_bed: [
		Page(spkAxel, "..."),
		Page(spkAxel, "..."),
		Page(spkAxel, "..."),
		Page(spkAxel, "|S|Why is it so easy to go backwards, but so hard to go forwards...?/S/"),
		Page(spkAxel, "..."),
		Page(spkAxel, "|S|My bed is so comfy.../S/"),
		Page(spkAxel, "|S|But.../S/"),
		PausePage(),
		Page(spkAxel, "Today is still the day."),
		Page(spkAxel, "No more waiting around in bed."),
		CodePage()
	],
	bed_2: [
	    Page(spkAxel, "No. I'm not falling for it again."),
	],
}