/// @desc If event is complete, run on_event_complete() then go inactive
if complete {
	if active {
		if on_event_complete != NONE { on_event_complete(); }
		active = false;
	}
}