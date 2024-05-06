/// @desc Returns a new path based on an old path, where the new path has all x- or y- (or both) coords flipped.
function flip_path(_path, _hoz = false, _vert = false) {
	var _new_path = path_duplicate(_path);
	for (var i = 0; i < path_get_number(_new_path); ++i) {
	    var px = (_hoz ? -1 : 1)*path_get_point_x(_path, i);
	    var py = (_vert ? -1 : 1)*path_get_point_y(_path, i);
		var ps = path_get_speed(_path, i);
	    path_change_point(_new_path, i, px, py, ps);
	}
	return _new_path;
}