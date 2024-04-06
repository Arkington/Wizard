/// @desc Executes on entering Bubblegums
function Bubblegums_OnEntry() {
	global.state.BUBBLEGUM_GREETED = true;
	oPlayer.state = PlayerStateCutscene;
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
			Page(spkBubblegum, $"{AXEL} dearie, take a seat."),
		]
	),
}