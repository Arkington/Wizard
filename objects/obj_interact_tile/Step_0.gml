if place_meeting(x, y, objAxel) {
	if keyboard_check_pressed(KEY_INTERACT) && !instance_exists(objTextHandler) {
		textbox = instance_create_layer(0, 0, LAYER_TEXT, objTextHandler);
		textbox.text = text;
		textbox.creator = self;
	}
}