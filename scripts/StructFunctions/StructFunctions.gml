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

/// @desc Copies the first struct, adds in elements of the second
function struct_merge(first, second) {
	var _merged = struct_copy(first);
	var _property_names = variable_struct_get_names(second);
	for (var i = 0; i < array_length(_property_names); i ++) {
		struct_set(_merged, _property_names[i], struct_get(second, _property_names[i]));
	}
	return _merged;
}