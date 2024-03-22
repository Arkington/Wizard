/// @desc Queue an event
function QueueEvent(event) {
	array_push(global.event_handler.event_array, event);
}

/// @desc Queue a signal to wait for any existing events to complete
function WaitForEvents() {
	QueueEvent(WAIT_FOR_EVENTS);
}

/// @desc Queue an instant execution of code
function EventCode(_func, _args = NONE) {
	// Instantaneously executes code - event complete immediately after
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventCode);
	_event.to_execute = _func;
	_event.args = _args;
	QueueEvent(_event);
}

/// @desc Queue an instance_destroy()
function EventDestroy(_obj) {
	EventCode(instance_destroy, [_obj]);
}

/// @desc Queue an object to move
function EventMove(_obj_to_move, _x, _y, _move_speed) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventMove);
	_event.obj_to_move = _obj_to_move;
	_event.target_x = _x;
	_event.target_y = _y;
	_event.move_speed = _move_speed;
	QueueEvent(_event);
}

/// @desc Queue a textnode
function EventText(_text_source, _key = DEFAULT_TEXT_KEY) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventText);
	_event.text_source = _text_source;
	_event.key = _key;
	QueueEvent(_event);
}

/// @desc Queue a sound
function EventSound(_sound) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventSound);
	_event.sound = _sound;
	QueueEvent(_event);
}


// I could elliminate all oEventXXX objects by just passing in a custom step function to a regular oEvent
// Keep this in mind if I want to remove all these objects
