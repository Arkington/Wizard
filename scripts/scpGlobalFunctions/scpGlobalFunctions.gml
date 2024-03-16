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

/// @param first
/// @param second
function struct_merge(first, second)	{
	var _merged = first;
	var _property_names = variable_struct_get_names(second);
	for (var i = 0; i < array_length(_property_names); i ++) {
		struct_set(_merged, _property_names[i], struct_get(second, _property_names[i]));
	}
	return _merged;
}