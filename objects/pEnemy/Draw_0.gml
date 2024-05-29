if (live_call()) return live_result;


/// @desc Damage shader
if (shader_progress <= 1) {
	GetUVs();
	shader_set(shader);
	
	// Set shader variables
	shader_set_uniform_f(shader_progress_handle, shader_progress);
	shader_set_uniform_f_array(shader_sprite_dim_handle, [sprite_get_width(sprite_index), sprite_get_height(sprite_index)]);
	shader_set_uniform_f_array(shader_sprite_scale_handle, [image_xscale, image_yscale]);
	shader_set_uniform_f_array(shader_uv_mid_handle, uv_mid);
	shader_set_uniform_f_array(shader_uv_dim_handle, uv_dim);
	shader_set_uniform_f_array(shader_mid_pt_handle, [OBJ_MID_X, OBJ_MID_Y]);

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