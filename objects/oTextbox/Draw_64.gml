/// @desc Draw Textbox and Message
x = screenpos_x;
y = screenpos_y;

var _text_to_draw = string_copy(text, 1, char_count);
var _fade_factor = fade_in ? min(frame/TEXTBOX_FADE_IN_FRAMES, 1) : 1;

// Textbox
if (textbox_sprite != NONE) {
	draw_sprite_stretched_ext(
		textbox_sprite,
		0,
		x,
		y,
		(textbox_width) * scale,
		textbox_height * scale,
		c_white,
		alpha * _fade_factor
	);
}

// Each letter rendered individually
draw_set_text(textbox_font);
for (var c = 0; c < char_count; c++) {
	
	// Character info
	var _char = string_char_at(text, c+1);
	var _char_w = string_width(_char);
	var _char_h = string_height(_char);
	
	// Wavy text
	var _wave_adj = 0;
	if char_wave[c] {
		_wave_adj = wave_height_factor * dsin(wave_sep*c - wave_speed*frame);
	}
	
	// Pulsey text
	var _pulse_factor = 1;
	var _pulse_adj_x = 0;
	var _pulse_adj_y = 0;
	if char_pulse[c] {
		_pulse_factor = 1 + (pulse_scale_factor - 1)*dsin(pulse_sep*c - pulse_speed*frame);
		_pulse_adj_x = _char_w*(1 - _pulse_factor)/2;
		_pulse_adj_y = _char_h*(1 - _pulse_factor)/2;
	}

	// Shakey text
	var _shake_adj_x = 0;
	var _shake_adj_y = 0;
	if char_shake[c] && irandom(shake_ave_time - 1) == 0 {
		var _shake_dir = irandom(360);
		_shake_adj_x = lengthdir_x(random(shake_intensity_x), _shake_dir);
		_shake_adj_y = lengthdir_y(random(shake_intensity_y), _shake_dir);
	}

	// Draw text
	var _col = (char_rainbow[c] ? ColourGradient(rainbow_sep*c - rainbow_speed*frame) : char_col[c]); // Rainbow wins over other colours
	draw_text_transformed_colour(
		res_round(x + (char_x[c] + x_buffer + _pulse_adj_x + _shake_adj_x + portrait_x_adj)*scale),
		res_round(y + (char_y[c] + y_buffer + _pulse_adj_y + _wave_adj + _shake_adj_y)*scale),
		_char,
		scale * _pulse_factor,
		scale * _pulse_factor,
		0,
		_col, _col, _col, _col,
		alpha * _fade_factor
	);
}

if portrait != NO_PORTRAIT {
	
	// Portrait border
	draw_sprite_stretched_ext(
		portrait_border_sprite,
		0,
		x,
		y,
		(portrait_width + 2*portrait_border_width) * scale,
		(portrait_height + 2*portrait_border_width) * scale,
		c_white,
		alpha * _fade_factor
	);
	
	// Portrait
	draw_sprite_ext(
		portrait,
		0,
		x + portrait_border_width*scale,
		y + portrait_border_width*scale,
		scale,
		scale,
		0,
		c_white,
		alpha * _fade_factor
	);
}
