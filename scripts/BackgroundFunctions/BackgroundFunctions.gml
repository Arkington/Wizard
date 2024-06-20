global.BACKGROUND_SURFACE = -1;


function TargetBackgroundSurface() {
	if !surface_exists(global.BACKGROUND_SURFACE) {
		global.BACKGROUND_SURFACE = surface_create(RESOLUTION_W, RESOLUTION_H);
	}
	surface_set_target(global.BACKGROUND_SURFACE);
}

function DrawBackgroundSurface() {
	if !surface_exists(global.BACKGROUND_SURFACE) {
		global.BACKGROUND_SURFACE = surface_create(RESOLUTION_W, RESOLUTION_H);
	}
	if (live_call()) return live_result;
	shader_set_live(shPixelateScreen, true);
	shader_set(shPixelateScreen);
	draw_surface(global.BACKGROUND_SURFACE, 0, 0);
	shader_reset();
	
	// Clean surface after
	surface_set_target(global.BACKGROUND_SURFACE);
	draw_clear_alpha(c_black,0);
	surface_reset_target();
	
}

function FreeBackgroundSurface() {
	surface_free(global.BACKGROUND_SURFACE);
	global.BACKGROUND_SURFACE = -1;
}
