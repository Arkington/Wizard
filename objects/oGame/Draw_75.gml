/// @desc UI Debug Draw
if !global.debug { exit; }

// Event Handler
with (global.event_handler) {
	image_blend = (array_length(event_array) == 0) ? c_white: c_yellow;
	draw_sprite_ext(
		sEventHandler,
		image_index,
		0,
		0,
		1,
		1,
		0,
		image_blend,
		image_alpha
	);
	
	// Roughly draw queued events
	for (var i = 0; i < array_length(event_array); i++) {
		var _col = c_white;
		var _event = event_array[i];
		if (_event.object_index == oEventWaitForEvents) { _col = c_red; }
		else {
			if (_event.active) { _col = c_yellow; }
			if (_event.complete) { _col = c_green; }
			if (_event.object_index == oEventWait) { _col = c_orange; }
		}
		draw_rectangle_color(
			16 + 8*i + 1,
			4,
			16 + 8*i + 7,
			10,
			_col, _col, _col, _col, false
		);
	}
}

// Text Handler
with (global.text_handler) {
	image_blend = (state == TextHandlerStateAwaiting) ? c_white : c_yellow;
	draw_sprite_ext(
		sTextHandler,
		image_index,
		0,
		16,
		1,
		1,
		0,
		image_blend,
		image_alpha
	);
}

// Music Handler
with (global.music_handler) {
	switch state {
		case MusicHandlerStateAwaiting:
			image_blend = c_white;
			break;
			
		case MusicHandlerStateSwitching:
			image_blend = c_blue;
			break;
			
		case MusicHandlerStateStopping:
			image_blend = c_red;
			break;
			
		case MusicHandlerStatePlaying:
			image_blend = c_yellow;
	}
	draw_sprite_ext(
		sMusicHandler,
		image_index,
		0,
		32,
		1,
		1,
		0,
		image_blend,
		image_alpha
	);
	if (current_track != NONE) {
		draw_set_text(fntDebug);
		draw_text(18, 32, $"{audio_get_name(current_track)}")
	}
}

// Battle Engine
with (global.battle_engine) {
	image_blend = (state == BattleEngineStateAwaiting) ? c_white : c_yellow;
	draw_sprite_ext(
		sBattleEngine,
		image_index,
		0,
		48,
		1,
		1,
		0,
		image_blend,
		image_alpha
	);
}