/// @desc Queue an event. Events generated via TextNodes can queue-jump.
function QueueEvent(_event) {
	
	// Text events get priority so then can play during text sequences
	var _priority = 0;
	if (object_index == oTextHandler) { _priority = 1; }
	with _event { priority = _priority; }
	
	with (global.event_handler) {
		
		// No priority
		if (_priority <= 0) {
			array_push(event_array, _event);
			return;
		}
		
		// Priority
		for (var i = 0; i < array_length(event_array); i++) {
			if (_event.priority > event_array[i].priority) {
				array_insert(event_array, i, _event);
				return;
			}
		}
		array_push(event_array, _event);
	}
}

/// @desc Queue a signal to wait for any existing events to complete
function WaitForEvents() {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventWaitForEvents);
	QueueEvent(_event);
}

/// @desc Queue a wait period which blocks following events for some time
function EventWait(_seconds) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventWait);
	_event.timer = _seconds*FPS;
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






// Instant events (a normal function wrapped in an EventCode())


/// @desc Queue a player state change
function EventPlayerState(_state) {
	EventCode(
		function(_state) {
			with oPlayer { state = _state; }
		},
		[_state]
	);
}
function EventPlayerStateFree() { EventPlayerState(PlayerStateFree); }

/// @desc Set player's state to PlayerStateCutscene. Optionally kill existing movement.
function EventPlayerStateCutscene(_halt = true) {
	EventCode(
		function(_halt) {
			with oPlayer {
				state = PlayerStateCutscene;
				if _halt { x_speed = 0; y_speed = 0; }
			}
		},
		[_halt]
	);
}


/// @desc Queue a player state change
function EventCoreState(_state) {
	EventCode(
		function(_state) {
			with oCore { state = _state; }
		},
		[_state]
	);
}

/// @desc Queue an instance_create_layer()
function EventCreate(_x, _y, _layer, _obj) {
	EventCode(instance_create_layer, [_x, _y, _layer, _obj,]);
}

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

/// @desc Queue an object to warp instananeously to a position
function EventWarp(_obj, _x, _y) {
	EventCode(
		function(_obj, _x, _y) {
			_obj.x = _x;
			_obj.y = _y;
		},
	[_obj, _x, _y]);
}

/// @desc Queue adjusting an object's depth
function EventDepthAdj(_obj, _depth_adj) {
	EventCode(
		function(_obj, _depth_adj) { _obj.depth_adj = _depth_adj; },
		[_obj, _depth_adj]
	);
}

/// @desc Play music.
function EventPlayMusic(_mus = NONE, _fade_in = false, _fade_out = true, _cross_fade = false) {
	EventCode(PlayMusic, [_mus, _fade_in, _fade_out, _cross_fade]);
}





// Unique events (which have their own objects)


/// @desc Queue an object to move
function EventMove(_obj_to_move, _x, _y, _move_speed = CUTSCENE_WALK_SPEED, _animate = true) {
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

/// @desc Queue an object to jump
function EventJump(_obj_to_jump, _height = EVENT_JUMP_HEIGHT, _time_s = EVENT_JUMP_TIME_S) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventJump);
	with (_event) {
		obj_to_jump = _obj_to_jump;
		height = _height;
		total_frames = _time_s*FPS;

		// Set up event
		t = 0;
	}
	QueueEvent(_event);
}

/// @desc Queue a textnode
/// @param _text_source {String} The identifier for the text source to be used in the event.
/// @param _key {String|Array<String>} The key or keys associated with the text event. This can be a single string identifier or an array of string identifiers.
function EventText(_text_source, _key) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventText);
	_event.text_source = _text_source;
	_event.key = _key;
	QueueEvent(_event);
}

/// @desc Queue a sound. wait_for_sound specifies whether we should wait for the sound to finish playing before marking the event as 'complete'.
function EventSound(_sound, _wait_for_sound = false) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventSound);
	with (_event) {
		sound = _sound;
		wait_for_sound = _wait_for_sound;
	}
	QueueEvent(_event);
}

/// @desc Stop music. Wait for the music to fade out.
function EventStopMusic(_fade = true, _fade_out_s = SONG_FADE_SECS) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventStopMusic);
	with (_event) {
		fade = _fade;
		fade_out_s = _fade_out_s;
	}
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

/// @desc Queue a transition
function EventTransition(_target_room, _target_x = NONE, _target_y = NONE, _target_face = NONE, _transition_type = oTransitionFade) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventTransition);
	with (_event) {
		target_room = _target_room;
		target_x = _target_x;
		target_y = _target_y;
		target_face = _target_face;
		transition_type = _transition_type;
	}
	QueueEvent(_event);
}

/// @desc Queue an object fade-out
function EventObjectFade(_in_or_out, _obj_to_fade, _fade_rate = EVENT_FADE_OUT_RATE) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventObjectFade);
	with (_event) {
		in_or_out = _in_or_out;
		obj_to_fade = _obj_to_fade;
		fade_rate = _fade_rate;
	}
	QueueEvent(_event);
}


// @desc Shake the camera
function EventShakeCamera(_magnitude, _shake_time_s) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventShakeCamera);
	with (_event) {
		magnitude = _magnitude;
		shake_time_s = _shake_time_s;
	}
	QueueEvent(_event);
}


// @desc Initialize the Core in preparation for a battle
function EventCoreInit(_x, _y) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventCoreInit);
	with (_event) {
		target_x = _x;
		target_y = _y;
	}
	QueueEvent(_event);
}


function EventCoreDeath() {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventCoreDeath);
	with (_event) {}
	QueueEvent(_event);
}

function EventCoreRetry(_x, _y) {
	_event = instance_create_layer(0, 0, LAYER_MECHANICS, oEventCoreRetry);
	with (_event) {
		target_x = _x;
		target_y = _y;
	}
	QueueEvent(_event);
}
