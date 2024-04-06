/// @desc Debug toggle
global.debug = !global.debug;
layer_set_visible(LAYER_WALLS, global.debug);

// Set object visibility
var _make_vis = [oWarpTile, oInteractTile, oTriggerTile];
for (var i = 0; i < array_length(_make_vis); i++) {
	var _obj = _make_vis[i];
	object_set_visible(_obj, global.debug);
	if instance_exists(_obj) { _obj.visible = global.debug; }
}
