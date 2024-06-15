if (live_call()) return live_result;


/// @desc Damage shader
if (shader_progress <= 1) {
	GetUVs();
	shader_set(shader);
	
	// Set shader variables
	SetShaderUniforms();

	// Draw with adjustments
	draw_sprite_ext(
		sprite_index,
		image_index,
		x + x_adj,
		y + y_adj,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
	shader_reset();
} else {
	draw_sprite_ext(
		sprite_index,
		image_index,
		x + x_adj,
		y + y_adj,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
}