/// @desc UI Debug Draw
if !global.debug { exit; }

with (global.event_handler) {
	image_blend = array_length(event_array) ? c_yellow: c_white;
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