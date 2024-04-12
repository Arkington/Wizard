x = screenpos_x;
y = screenpos_y;


draw_set_text(fntText, c_white, fa_left, fa_top);

// Background
if !box_per_choice { draw_sprite_stretched(menu_sprite, 0, x, y, width, height); }

// Iterate over options
for (var i = 0; i < n_options; i++) {
	
	// Box-per-choice box
	if box_per_choice {
		draw_sprite_stretched(
			menu_sprite,
			0,
			x,
			y + i*(line_height + 2*y_buffer),
			width,
			line_height + 2*y_buffer
		);
	}

	// Text option
	draw_text_transformed(
		x + selector_width + 2*x_buffer,
		y + i*line_height + (2*i + 1)*y_buffer,
		options[i],
		scale,
		scale,
		0
	);
	
	// Selector
	if i == pos {
		draw_sprite_ext(
			selector_sprite,
			0,
			x + x_buffer + selector_xoffset,
			y + i*line_height + (2*i + 1)*y_buffer + selector_yoffset,
			scale,
			scale,
			0,
			c_white,
			1
		)
	}
	
}