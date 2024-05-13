/// @desc Save/load messaging
draw_set_text(fntText, c_white, fa_center, fa_top);
time_since_save_state = time_since_save_state + 1/FPS;
draw_text_color(
	MID_X,
	0,
	save_state_message,
	c_white, c_white, c_white, c_white,
	max(3 - time_since_save_state, 0)
);
