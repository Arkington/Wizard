/// @desc Draw Textbox and Message
x = screenpos_x;
y = screenpos_y;

var _text_to_draw = string_copy(text, 1, char_count);
draw_set_font(textbox_font);

// Textbox
draw_sprite_stretched_ext(
	textbox_sprite,
	0,
	x,
	y,
	(textbox_width) * scale,
	textbox_height * scale,
	c_white,
	alpha
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

	// Draw text
	draw_text_transformed_colour(
		res_round(x + char_x[c]*scale + x_buffer + _shake_adj_x),
		res_round(y + char_y[c]*scale + y_buffer + _wave_adj + _shake_adj_y),
		string_char_at(text, c+1),
		scale,
		scale,
		0,
		char_col[c],
		char_col[c],
		char_col[c],
		char_col[c],
		alpha
	);
}

if portrait != NO_PORTRAIT {
	
	// Portrait border
	draw_sprite_stretched_ext(
		portrait_border_sprite,
		0,
		x - x_buffer - portrait_border_width - portrait_width,
		y + y_buffer - portrait_border_width,
		(portrait_width + 2*portrait_border_width) * scale,
		(portrait_height + 2*portrait_border_width) * scale,
		c_white,
		alpha
	);
	
	// Portrait
	draw_sprite_ext(
		portrait,
		0,
		x - x_buffer - portrait_width,
		y + y_buffer,
		scale,
		scale,
		0,
		c_white,
		alpha
	);
}
