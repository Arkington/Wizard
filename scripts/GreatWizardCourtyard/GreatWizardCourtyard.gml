function GreatWizardCourtyard_ApproachGeckoWizard() {
	EventPlayerStateCutscene();
	WaitForEvents();
	EventText("textGreatWizardCourtyard", "entrance");
	WaitForEvents();
	EventCode(GreatWizardCourtyard_ApproachGeckoWizard_2);
}

function GreatWizardCourtyard_ApproachGeckoWizard_2() {
	EventStopMusic(true, 0.2);
	EventWait(1);
	EventFace(oGeckoWizard, LEFT);
	EventWait(2);
	EventText("textGreatWizardCourtyard", GetState("GWC_GW_DIALOGUE") + "_2");
	WaitForEvents();
	EventPlayerStateFree();
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

textGreatWizardCourtyard = {
	entrance: TextNode(
	    [
	        Page(spkAxel, "The Great Wizard Tower..."),
	        Page(spkAxel, "...it looks so much cooler this close up!"),
	        Page(spkAxel, "But oh, the entrance is blocked by a lizard lady."),
	        Page(spkAxel, "..."),
	    ],
	    [
	        Choice("Excuse me", "excuse_me", function() { SetState("GWC_GW_DIALOGUE", "excuse_me"); }),
	        Choice("Move please", "move_please", function() { SetState("GWC_GW_DIALOGUE", "move_please"); }),
			Choice("Aaaaa", "aaaaa", function() { SetState("GWC_GW_DIALOGUE", "aaaaa"); }),
	    ]
	),
	excuse_me: TextNode(
	    [
	        Page(spkAxel, "Um, excuse me."),
			PausePage(2),
	        Page(spkAxelInner, "(She seems deep in thought...)"),
			PausePage(),
	        Page(spkAxel, "Um, could you..."),
			Page(spkGeckoWizard, "..."),
	        Page(spkAxel, "|S|Excuse me!/S/"),
		],
	),
	excuse_me_2: TextNode(
		[
			Page(spkGeckoWizard, "|S|Do you mind?/S/"),
	        Page(spkGeckoWizard, "...my deep contemplation... has been broken."),
	        Page(spkGeckoWizard, "I will |S|not/S/ excuse you."),
	        Page(spkAxel, "Eeep!"),
	    ],
	),
	move_please: TextNode(
	    [
	        Page(spkAxel, "Please move."),
			Page(spkGeckoWizard, "..."),
	    ],
	),
	move_please_2: TextNode(
	    [
	        Page(spkGeckoWizard, "|S|Pardon me?/S/"),
	        Page(spkAxel, "I need to get inside the tower."),
	        Page(spkGeckoWizard, "You... Do you know who you're speaking to?"),
	        Page(spkAxel, "I need to get through."),
	        Page(spkGeckoWizard, "Well then..."),
	        Page(spkGeckoWizard, "|S|Get through./S/"),
	        Page(spkAxel, "Eeep!"),
	    ],
	),
	aaaaa: TextNode(
	    [
	        Page(spkAxelInner, "(There's a wizard blocking my way)"),
	        Page(spkAxelInner, "(What do I do what do I do what do I do what do I do what do I do)"),
			PausePage(2, function() {
				EventStopMusic(true, 0.2);
			}),
			Page(
				spkAxel,
				"|S|AAAAAAAAAAAAAHHHHHHHH!!!/S/",
				{shake_intensity_x: TEXT_SHAKE_INTENSITY_HIGH, shake_intensity_y: TEXT_SHAKE_INTENSITY_HIGH}
			),
		],
	),
	aaaaa_2: TextNode(
	    [
			Page(spkAxelInner, "(Wait that was supposed to be internal screaming.)"),
	        Page(spkGeckoWizard, "..."),
	        Page(spkGeckoWizard, "My beautiful train of thought..."),
	        Page(spkGeckoWizard, "Cut short by the abrupt screams of a delusional youth."),
	        Page(spkAxel, "I... I just--"),
	        Page(spkGeckoWizard, "No."),
	        Page(spkGeckoWizard, "|S|I'd much prefer you keep that mouth of yours shut./S/"),
	        Page(spkAxel, "Eeep!"),
	    ],
	),
}