function print(t) {
	show_debug_message(t);
}

function res_round(x) {
	return round(VIEWPORT_RATIO*x)/VIEWPORT_RATIO;
}

/// @param _object
function reset_to_noone(_object){
	instance_destroy(_object);
	_object = noone;
}

/// @param _substr
/// @param _str
function string_contains(_substr, _str) {
	return string_pos(_substr, _str) != 0;
}


/// @desc Combo function to set text drawing parameters.
function draw_set_text(_font = fntText, _color = c_white, _halign = fa_left, _valign = fa_top) {
	draw_set_font(_font);
	draw_set_color(_color);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}