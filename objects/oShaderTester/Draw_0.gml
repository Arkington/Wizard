/// @desc
if (active and shader_progress > 0) {
	shader_set(TEST_SHADER);
	
	// Get UV info
	var uvs = sprite_get_uvs(sprite_index, image_index);
	var uv_w = uvs[2] - uvs[0];
	var uv_h = uvs[3] - uvs[1];
	var uv_dimensions = [uv_w, uv_h];
	var uv_center = [0.5*uv_w + uvs[0], 0.5*uv_h + uvs[1]];
	
	// Set shader variables
	shader_set_uniform_f(shader_width_handle, sprite_width);
	shader_set_uniform_f(shader_height_handle, sprite_height);
	shader_set_uniform_f(shader_progress_handle, shader_progress);
	shader_set_uniform_f_array(shader_uv_center_handle, uv_center);
	shader_set_uniform_f_array(shader_uv_dimensions_handle, uv_dimensions);

	draw_self();
	shader_reset();
} else {
	draw_self();
}