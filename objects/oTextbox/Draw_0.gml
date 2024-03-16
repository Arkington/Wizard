x = screenpos_x + camera_get_view_x(view_camera[0]);
y = screenpos_y + camera_get_view_y(view_camera[0]);

var _text_to_draw = string_copy(text, 1, char_count);
draw_set_font(textbox_font);

draw_sprite_stretched(
	textbox_sprite,
	0,
	x + portrait_x_adj,
	y,
	textbox_width - portrait_x_adj,
	textbox_height
);

// Each letter rendered individually
for (var c = 0; c < char_count; c++) {
	
	// Wavy text
	var _wave_adj = 0;
	if char_wave[c] {
		_wave_adj = wave_height_factor * dsin(wave_sep*c - wave_speed*frame);
	}
	
	// Shakey text
	var _shake_adj_x = 0;
	var _shake_adj_y = 0;
	if char_shake[c] && irandom(shake_ave_time - 1) == 0 {
		var _shake_len = random(shake_intensity);
		var _shake_dir = irandom(360);
		_shake_adj_x = lengthdir_x(_shake_len, _shake_dir);
		_shake_adj_y = lengthdir_y(_shake_len, _shake_dir);
	}

	draw_text_colour(
		x + char_x[c] + x_buffer + portrait_x_adj + _shake_adj_x,
		y + char_y[c] + y_buffer + _wave_adj + _shake_adj_y,
		string_char_at(text, c+1),
		char_col[c],
		char_col[c],
		char_col[c],
		char_col[c],
		1
	);
}

if portrait != NO_PORTRAIT {
	draw_sprite_stretched(
		portrait_border_sprite,
		0,
		x - x_buffer/2 - portrait_border_width,
		y + y_buffer - portrait_border_width,
		sprite_get_width(portrait) + 2*portrait_border_width,
		sprite_get_height(portrait) + 2*portrait_border_width
	);
	draw_sprite(
		portrait,
		0,
		x - x_buffer/2,
		y + y_buffer
	);
}
