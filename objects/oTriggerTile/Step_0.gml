if place_meeting(x, y, oPlayer) {
	if (on_trigger != NONE) {
		script_execute_ext(on_trigger, on_trigger_args);
		if self_destruct { instance_destroy(); }
	} else {
		show_debug_message("No trigger set!");
	}
}
