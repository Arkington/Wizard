/// @desc
function MenuSetup() {
	
	selector_width = sprite_get_width(selector_sprite)*scale;
	selector_height = sprite_get_height(selector_sprite)*scale;
	selector_xoffset = sprite_get_xoffset(selector_sprite)*scale;
	selector_yoffset = sprite_get_yoffset(selector_sprite)*scale;
	line_height = max(string_height(ALPHABET)*scale, selector_height);

	// Initialize variables
	pos = 0;
	up = 0;
	down = 0;
	interact = 0;
	n_options = array_length(options);
	
	// Set width and height
	var _w = min_width;
	for (var i = 0; i < n_options; i++) {
		_w = max(_w, string_width(options[i])*scale);
	}
	width = _w + 2*(selector_width + 2*x_buffer);
	height = max(n_options * (2*y_buffer + line_height), min_height);
	
}