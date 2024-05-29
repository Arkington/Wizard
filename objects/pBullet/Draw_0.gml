/// @desc Fizzle if needed
if (fizzle) {
	
	GetUVs();
	shader_set(shBulletFizzle);
	
	// Set shader variables
	shader_set_uniform_f(shader_x_handle, OBJ_MID_X);
	shader_set_uniform_f(shader_y_handle, OBJ_MID_Y);
	shader_set_uniform_f(shader_progress_handle, shader_progress);
	shader_set_uniform_f_array(shader_uv_mid_handle, uv_mid);
	shader_set_uniform_f_array(shader_uv_dim_handle, uv_dim);

	draw_self();
	shader_reset();
} else {
	draw_self();
}