/// @desc FIFO event queue

// Ensure the first element is an incomplete event
while (array_length(event_array) > 0) {

	// Remove WAIT_FOR_EVENTS
	if (event_array[0] == WAIT_FOR_EVENTS) { array_shift(event_array); }
	// Remove completed events
	else if (event_array[0].complete) {
		var _complete_event = array_shift(event_array);
		instance_destroy(_complete_event );
	} else {
		break;
	}
}

/*
Two types of waiting events, both block preceding events
	- WAIT_FOR_EVENTS: must wait for all events
	- oEventWait(x): must wait x seconds before being complete
*/

// Activate any events before a WAIT_FOR_EVENTS event
for (var i = 0; i < array_length(event_array); i++) {
	if (event_array[i] == WAIT_FOR_EVENTS) { break; }
	if (!event_array[i].complete) { event_array[i].active = true; }
	if (event_array[i].object_index == oEventWait and !event_array[i].complete) { break; }
}