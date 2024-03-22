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

/// @desc Recursive struct_copy, use cautiously
function struct_copy(_struct) {
	var _new = {};
	var _property_names = variable_struct_get_names(_struct);
	for (var i = 0; i < array_length(_property_names); i ++) {
		var _field = struct_get(_struct, _property_names[i]);
		// Base case
		if is_struct(_field) { struct_set(_new, _property_names[i], struct_copy(_field)); }
		else { struct_set(_new, _property_names[i], _field); }
	}
	return _new;
}

/// @param first
/// @param second
function struct_merge(first, second) {
	// TODO: stop first being modified.
	// Also this doesn't copy sub-structs so this is problematic.
	var _merged = first;
	var _property_names = variable_struct_get_names(second);
	for (var i = 0; i < array_length(_property_names); i ++) {
		struct_set(_merged, _property_names[i], struct_get(second, _property_names[i]));
	}
	return _merged;
}

