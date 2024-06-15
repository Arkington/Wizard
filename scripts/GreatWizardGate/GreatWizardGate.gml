/// Code
function GreatWizardGate_CheckGate() {
	if (global.state.BUBBLEGUM_CHAT_COMPLETE) {
		global.state.GWG_BIRD_INTERACTS = max(2, global.state.GWG_BIRD_INTERACTS);
		LoadText("textGreatWizardGate", "gate_check_bubblegum");
	} else {
		LoadText("textGreatWizardGate", "gate_check");
	}
}

function GreatWizardGate_CheckBird() {
	global.state.GWG_BIRD_INTERACTS++;
	bird_check_count = min(global.state.GWG_BIRD_INTERACTS, 5);
	if bird_check_count < 5 {
		LoadText("textGreatWizardGate", $"bird_check_{bird_check_count}");
	} else if bird_check_count == 5 {
		// Gate opening cutscene
		global.state.GWG_OPEN = true;
		oPlayer.state = PlayerStateCutscene;
		EventDestroy(oInteractTile);
		EventText("textGreatWizardGate", "bird_check_final");
		WaitForEvents();
		EventSound(sndBirdCry, true);
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
		EventCode(PlayMusic, [musSpacewalk]);
		EventPlayerStateFree();
	}
}



// Text
initializeSpeakers();

textGreatWizardGate = {
	gate_check: [
		Page(spkNone, "Locked.")
	],
	gate_check_bubblegum: [
		Page(spkAxel, "It's locked, but is there anything else I can do here?")
	],
	bird_check_1: [
		Page(spkNone, "Looks like a bird.")
	],
	bird_check_2: [
		Page(spkNone, "Still looks like a bird.")
	],
	bird_check_3: [
		Page(spkNone, "It looks like... a bird.")
	],
	bird_check_4: [
		Page(spkNone, "Looks like a bird...?")
	],
	bird_check_final: [
		Page(spkAxel, "Hey there little guy."),
		Page(spkNone, "..."),
		Page(spkHCViaBird, "..."),
		Page(spkHCViaBird, "Yes?!"),
		Page(spkHCViaBird, "...Yes?"),
		Page(spkAxel, "Oh, I--"),
		Page(spkHCViaBird, "Hold on one second."),
	],
}
