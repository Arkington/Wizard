/// @desc Core GUI

// During init, Core drawn on GUI layer
if state == CoreStateInit {
	// Draw Core
	draw_sprite_ext(
	    sprite,
	    image_index,
	    x,
	    y,
	    image_xscale,
	    image_yscale,
	    image_angle,
	    image_blend,
	    image_alpha
	);
}