/// @desc Executes on entering Bubblegums
function Bubblegums_OnEntry() {
	global.state.BUBBLEGUM_GREETED = true;
	oPlayer.state = PlayerStateCutscene;
	EventWait(0.5);
	EventText("textBubblegums", "on_entry_1");
	WaitForEvents();
	EventWait(0.75);
	EventFace(oBubblegum, RIGHT);
	EventWait(0.75);
	EventFace(oBubblegum, DOWN);
	EventWait(0.75);
	EventText("textBubblegums", "on_entry_2");
	WaitForEvents();
	EventPlayerStateFree();
}

function Bubblegums_LeaveWarpTile() {
	
	// If Axel has been invited in but hasn't been comforted...
	if global.state.BUBBLEGUM_GREETED and !global.state.BUBBLEGUM_CHAT_COMPLETE and !global.state.BUBBLEGUM_INVITATION_DECLINED {
		active = false; // Deactivate warp tile
		global.state.BUBBLEGUM_INVITATION_DECLINED = true;
		EventPlayerStateCutscene(true);
		EventObjectFade(OUT, oPlayer);
		EventWait(1.25);
		EventText("textBubblegums", "invitation_declined");
		WaitForEvents();
		// Sneak Axel back in
		EventWarp(oPlayer, LARGE, LARGE);
		EventObjectFade(IN, oPlayer, 1);
		EventWait(0.75);
		EventTransition(target_room, target_x, target_y, target_face, transition_type);
	}
	
	// Default case
	else {
		WarpTileTrigger();
	}
}

function Bubblegums_Stools(_id) {

	StoolInteract(_id);

	// If the gate isn't open and Bubblegum hasn't chatted yet
	if !global.state.GWG_OPEN and !global.state.BUBBLEGUM_CHAT_COMPLETE {
		global.state.BUBBLEGUM_CHAT_COMPLETE = true;
		EventPlayerStateCutscene();
		EventWait(2);
		EventText("textBubblegums", "bubblegum_chat");
		WaitForEvents();
		EventPlayerState(PlayerStateSitting);
	}
	
	// If Axel has chatted to Bubblegum but not opened the gate
	else if !global.state.GWG_OPEN {
		EventPlayerStateCutscene();
		EventWait(1);
		EventText("textBubblegums", "bubblegum_gate_not_open");
		WaitForEvents();
		EventPlayerState(PlayerStateSitting);
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

textBubblegums = {
	on_entry_1: TextNode(
	    [
	        Page(spkAxel, "Hi Bubblegum."),
	    ]
	),
	on_entry_2: TextNode(
		[
			Page(spkBubblegum, "Ooohh how lovely!"),
			Page(spkBubblegum, $"{AXEL} dearie, take a seat."),
		]
	),
	invitation_declined: TextNode(
		[
			Page(spkBubblegum, "Or don't! That's fine too!"),
		]
	),
	bubblegum_chat: TextNode(
		[
			Page(spkAxel, "Hi Bubblegum."),
			Page(spkBubblegum, $"{AXEL} dearest! How are you doing?"),
			Page(spkAxel, "..."),
			Page(spkBubblegum, $"Oh dear... {AXEL}? Are you okay?"),
			PausePage(),
			Page(spkBubblegum, "Isn't today the day you finally go to wizard school?"),
			Page(spkAxel, "..."),
			Page(spkAxel, "Door is locked. I need to find a key or something. I don't know."),
			Page(spkBubblegum, $"Oh {AXEL}. Think about it. Why would you need to have a key?"),
			Page(spkAxel, "Door is locked."),
			Page(spkBubblegum, "The door to the school? Unlocking that door isn't your job."),
			Page(spkAxel, "Maybe it's a test. Maybe I've already failed."),
			Page(spkBubblegum, $"{AXEL}, how can you fail?"),
			Page(spkAxel, "..."),
			PausePage(),
			Page(spkAxel, "I turned around, Bubblegum. I turned around and I came back here."),
			Page(spkAxel, "I left. I did this."),
			Page(spkBubblegum, ". . ."),
			Page(spkBubblegum, $"{AXEL}... I've never been to wizard school. I don't know its tricks."),
			Page(spkBubblegum, "I've never made fire come out of my eyes or whatever it is you kids do."),
			Page(spkBubblegum, "But I do know you. You've wanted this for so long."),
			Page(spkBubblegum, "You told me you were waiting for the right time, and you would know when it was the right time."),
			Page(spkBubblegum, "And then it was! And now you tell me there's a door. Do you know what that means?"),
			Page(spkAxel, "..."),
		],
	    [
	        Choice("It means I failed.", "bubblegum_chat_2"),
	        Choice("It means I need a key.", "bubblegum_chat_2"),
	        Choice("What does it mean?", "bubblegum_chat_2")
	    ]
	),
	bubblegum_chat_2: TextNode(
		[
			Page(spkBubblegum, $"{AXEL}. It means you made it."),
			Page(spkAxel, "..."),
			PausePage(),
			Page(spkAxel, "...Okay."),
			Page(spkAxel, "..."),
			Page(spkAxel, "Thanks Bubblegum."),
			Page(spkBubblegum, "If that door doesn't open, I'll still be here. But I have a feeling it will."),
		]
	),
	bubblegum_gate_not_open: TextNode(
		[
			Page(spkBubblegum, $"Go on dearie, you can do this."),
		]
	),
}