/// @desc FIFO event queue

// Ensure the first element is an incomplete event
while (array_length(event_array) > 0) {

	// WaitForEvents completes if it's the first item
	if (event_array[0].object_index == oEventWaitForEvents) { event_array[0].complete = true; }
	
	// Remove completed events
	if (event_array[0].complete) {
		var _complete_event = array_shift(event_array);
		instance_destroy(_complete_event );
	} else {
		break;
	}
}

/*
Two types of waiting events, both block preceding events
	- oEventWaitForEvents: must wait for all events
	- oEventWait(x): must wait x seconds before being complete
*/

// Activate any events before a WaitForEvents event
for (var i = 0; i < array_length(event_array); i++) {
	var _event = event_array[i];
	if (_event.object_index == oEventWaitForEvents) { break; }
	if (!_event.complete) { _event.active = true; }
	if (_event.object_index == oEventWait and !_event.complete) { break; }
}