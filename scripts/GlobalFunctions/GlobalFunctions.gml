function print(t) {
	show_debug_message(t);
}

function res_round(x) {
	return round(VIEWPORT_RATIO*x)/VIEWPORT_RATIO;
}

function cardinal_dir(_dir) {
	return round(_dir/90) % 4;
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

/// @desc Find the first index of a value in an array, or -1 if not found.
function array_index_of(_array, _val) {
    for (var i = 0; i < array_length(_array); i++) {
        if (_array[i] == _val) {
            return i;
        }
    }
	return -1;
}

/// @desc Remove all of a particular value from an array
function array_remove_value(_array, _val) {
	for (var i = 0; i < array_length(_array); i++) {
		if (_array[i] == _val) {
			array_delete(_array, i, 1);
			i--;
		}
	}
	return _array;
}
/// @desc Remove all of several values from an array
function array_remove_values(_array, _vals) {
	var _new_array = _array;
	for (var i = 0; i < array_length(_vals); i++) {
		_new_array = array_remove_value(_new_array, _vals[i]);
	}
	return _new_array;
}

/// @desc choose() but accepting an array as an argument.
function array_choose(_array) {
	return _array[irandom_range(0, array_length(_array) - 1)];
}