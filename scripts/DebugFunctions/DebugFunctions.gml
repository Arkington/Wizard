#macro INSTANCE_REPORT_N_PER_LINE 10

function GenerateInstanceReport() {
	var _n_instances = instance_number(all);
	var _inst_dict = {};

	// Iterate through all instances
	for (var i = 0; i < _n_instances; i++) {
	    var _inst = instance_find(all, i);
		var _obj_type = object_get_name(_inst.object_index);
	    // Check if this object type is already in the dict
	    if (struct_exists(_inst_dict, _obj_type)) {
	        struct_set(_inst_dict, _obj_type, struct_get(_inst_dict, _obj_type) + 1);
	    } else {
	        struct_set(_inst_dict, _obj_type, 1);
	    }
	}

	// Construct the formatted report from the map
	var _reports = [];
	var _n_reports = 0;
	var _report = ""
	var _inst_names = struct_get_names(_inst_dict);
	array_sort(_inst_names, true);
	for (var i = 0; i < array_length(_inst_names); i++) {
	    _report += _inst_names[i] + ": " + string(struct_get(_inst_dict, _inst_names[i])) + "\n";
		// Start a new string if too many instances
		if ((i+1) % INSTANCE_REPORT_N_PER_LINE == 0) {
			_reports[_n_reports] = _report;
			_report = "";
			_n_reports++;
		}
	}
	_reports[_n_reports] = _report;

	return _reports;
}