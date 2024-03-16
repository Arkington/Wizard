x = screenpos_x + camera_get_view_x(view_camera[0]);
y = screenpos_y + camera_get_view_y(view_camera[0]);


draw_set_font(fnt_text);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var _w = min_width;
for (var i = 0; i < n_options; i++) {
	_w = max(_w, string_width(options[i]));
}
width = _w + selector_width + 3*x_offset;
height = n_options * (y_offset + line_height) + y_offset;

// Background
draw_sprite_stretched(menu_sprite, 0, x, y, width, height);

for (var i = 0; i < n_options; i++) {
	draw_text(
		x + selector_width + 2*x_offset,
		y + i * line_height + (i + 1) * y_offset,
		options[i]
	);
	if i == pos {
		draw_sprite(
			selector_sprite,
			0,
			x + x_offset,
			y + i * line_height + (i + 1) * y_offset
		)
	}
}