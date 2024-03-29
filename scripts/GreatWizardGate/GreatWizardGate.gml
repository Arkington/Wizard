/// Code
function GreatWizardGate_CheckBird() {
	global.state.GWG_BIRD_INTERACTS++;
	bird_check_count = min(global.state.GWG_BIRD_INTERACTS, 5);
	if bird_check_count < 5 {
		load_textnode("textGreatWizardGate", $"bird_check_{bird_check_count}");
	} else if bird_check_count == 5 {
		// Gate opening cutscene
		global.state.GWG_OPEN = true;
		oPlayer.state = PlayerStateCutscene;
		EventDestroy(oInteractTile);
		EventText("textGreatWizardGate", "bird_check_final");
		WaitForEvents();
		EventSound(sndBirdCry);
		WaitForEvents();
		EventAnimation(oBird, sBirdFly);
		EventMove(oBird, -24, 40, 1);
		EventWait(1);
		EventFace(oPlayer, LEFT);
		WaitForEvents();
		EventDestroy(oBird);
		EventSound(sndGateOpen);
		EventAnimation(oGreatWizardGate, sGreatWizardGate);
		EventWait(1);
		EventFace(oPlayer, UP);
		EventWait(2.5);
		EventMove(oPlayer, NONE, 180, CUTSCENE_WALK_SPEED);
		EventWait(0.4);
		EventMove(oPlayer, 168, NONE, CUTSCENE_WALK_SPEED);
		WaitForEvents();
		EventFace(oPlayer, UP);
		EventWait(0.5);
		EventSound(sndOpen);
		EventAnimation(oGreatWizardGate, sGreatWizardGateOpen);
		EventWait(2.5);
		EventCode(PlayMusic, [musSpacewalk, true]);
		EventPlayerStateFree();
	}
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
	bird_check_final: TextNode(
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
