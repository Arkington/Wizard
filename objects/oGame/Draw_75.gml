/// @desc UI Debug Draw
if !global.debug { exit; }

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
		if (event_array[i] == WAIT_FOR_EVENTS) { _col = c_red; }
		else {
			if (event_array[i].active) { _col = c_yellow; }
			if (event_array[i].complete) { _col = c_green; }
			if (event_array[i].object_index == oEventWait) { _col = c_orange; }
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

with (global.music_handler) {
	image_blend = (current_track == NONE) ? c_white : c_yellow;
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
}