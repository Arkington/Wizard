/// @desc Queue an event
function QueueEvent(event) {
	array_push(global.event_handler.event_array, event);
}

/// @desc Queue a signal to wait for any existing events to complete
function WaitForEvents() {
	QueueEvent(WAIT_FOR_EVENTS);
}

/// @desc Queue a wait period which blocks following events for some time
function EventWait(_seconds) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventWait);
	_event.timer = _seconds*fps;
	QueueEvent(_event);
}

/// @desc Queue an instant execution of code
function EventCode(_func, _args = NONE) {
	// Instantaneously executes code - event complete immediately after
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventCode);
	_event.to_execute = _func;
	_event.args = _args;
	QueueEvent(_event);
}

/// @desc Queue a player state change
function EventPlayerState(_state) {
	EventCode(
		function(_state) {
			with oPlayer { state = _state; }
		},
		[_state]
	);
}
function EventPlayerStateCutscene() { EventPlayerState(PlayerStateCutscene); }
function EventPlayerStateFree() { EventPlayerState(PlayerStateFree); }

/// @desc Queue an instance_destroy()
function EventDestroy(_obj) {
	EventCode(instance_destroy, [_obj]);
}

/// @desc Queue an object to face a direction
function EventFace(_obj, _face) {
	EventCode(
		function(_obj, _face) {
			_obj.direction = _face*90;
		},
	[_obj, _face]);
}

/// @desc Queue an object to move
function EventMove(_obj_to_move, _x, _y, _move_speed, _animate = true) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventMove);
	with (_event) {
		obj_to_move = _obj_to_move;
		target_x = _x;
		target_y = _y;
		move_speed = _move_speed;
		animate = _animate;
	
		// Set up event
		prev_image_speed = _obj_to_move.image_speed
		ignore_x = (_x == NONE);
		ignore_y = (_y == NONE);
	}
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

enum AFTER_ANIMATION {
	BACK_TO_OLD_SPRITE,
	FREEZE_SPRITE,
	LEAVE_NEW_SPRITE
}
/// @desc Queue an animation
function EventAnimation(
	_obj,
	_sprite,
	_n_plays = 1,
	_start_frame = 0,
	_end_frame = LARGE,
	_after_animation = AFTER_ANIMATION.LEAVE_NEW_SPRITE
) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventAnimation);
	with (_event) {
		obj_to_animate = _obj;
		sprite = _sprite;
		n_plays = _n_plays;
		start_frame = _start_frame;
		end_frame = _end_frame;
		after_animation = _after_animation;
	
		// Set up Event
		n_plays_so_far = 0;
		prev_sprite = _obj.sprite_index;
		sprite_number = sprite_get_number(_sprite);
		sprite_speed = sprite_get_speed(_sprite);
	}
	QueueEvent(_event);
}

// I could elliminate all oEventXXX objects by just passing in a custom step function to a regular oEvent
// Keep this in mind if I want to remove all these objects
