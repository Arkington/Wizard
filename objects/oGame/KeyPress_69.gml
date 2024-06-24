if (!instance_exists(oInventory)) {
	instance_create_layer(INV_X, INV_Y, LAYER_TEXT, oInventory);
} else {
	with (oInventory) {
		instance_destroy();
	}
}