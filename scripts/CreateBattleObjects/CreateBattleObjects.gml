/// @desc
function CreateCharge(_x, _y, _charge_time_s) {
	var _charge = instance_create_layer(_x, _y, LAYER_INSTANCES, oCharge);
	with (_charge) {
		charge_time_s = _charge_time_s;
	}
	
	return _charge;
}

function CreateBarrier(_x, _y, _w, _h) {
	var _barrier = instance_create_layer(_x, _y, LAYER_INSTANCES, oBarrier);
	with (_barrier) {
		image_xscale = _w/sprite_get_width(image_index);
		image_yscale = _h/sprite_get_width(image_index);
	}
	
	return _barrier;
}

function CreatePoofCloud(_x, _y) {
	var _poof_cloud = instance_create_layer(_x, _y, LAYER_INSTANCES, oPoofCloud);
	with (_poof_cloud) {
		x = _x;
		y = _y + POOF_CLOUD_Y_ADJ;
		depth -= 1; // Display above other instances
	}
}