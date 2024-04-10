/// @desc Returns number of events still to process
function EventQtyRemaining() {
	with global.event_handler {
		return array_length(event_array);
	}
}

/// @desc Clear the global event handler of all events
function ClearEventHandler() {
	with global.event_handler {
		// Destroy every event object
		while (array_length(event_array) > 0) {
			var _event = array_shift(event_array);
			if object_is_ancestor(_event.object_index, pEvent) { instance_destroy(_event); }
		}
	}
}